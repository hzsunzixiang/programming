#!/usr/bin/env python
# encoding: utf8

###################################################
# Copyright (C) 2015, Tencent
# All rights reserved.
#
# Filename   : pkgadmin.py
# Description: PKG admin tools
# Author     : curuwang@tencent.com
# Version    : 1.0
# Date       : 2015-10-12
###################################################
import sys, os
reload(sys)
sys.setdefaultencoding('utf-8')
import glob
import logging
import logging.handlers
import pwd
import re
import string
import tempfile
import time

try:
    import hashlib
except ImportError:
    import md5 as hashlib

from procutil import ProcUtil
import util
tmp_dir = util.lock_dir

scriptDir = os.path.dirname(os.path.abspath(__file__))

class PkgConfig(object):
    def __init__(self, configXml):
        self.logger = logging.getLogger("pkgadmin.conf")
        self.config = {}
        self.baseInfo = {}
        #misc:content which are not between <tag>xxx</tag>
        self.misc = []
        self.xml = open(configXml)
        self.parse()
        self.parseBaseInfo()
        self.parseApps()

    def parse(self):
        reStartTag = re.compile(r'^<(\w+)>$')
        reEndTag = re.compile(r'^</(\w+)>$')
        endTag = startTag = buffer = None
        for line in self.xml:
            lineStripped = line.strip()
            #check if start tag
            match =  reStartTag.match(lineStripped)
            if match:
                startTag = match.group(1)
                buffer = []
                continue
            #check if end tag
            match = reEndTag.match(lineStripped)
            if match:
                endTag = match.group(1)
                if (not startTag) or (startTag != endTag):
                    self.logger.error("Config xml invalid: %s has no matching start tag" % line)
                    return False
                #output content
                self.config[startTag] = "".join(buffer)
                #reset tag
                endTag = startTag = buffer = None
                continue
            if buffer is not None:
                buffer.append(line)
            else:
                #content which are not between <tag>xxx</tag>
                #skip comment
                if (not lineStripped) or lineStripped.startswith("<!--"):
                    continue
                self.misc.append(lineStripped)
        #end of file check
        if startTag:
            self.logger.error("Config xml invalid: <%s> has no matching end tag" % startTag)
            return False
        return True

    def isShell(self):
        return "is_shell=true" in self.misc

    def getConfig(self, tag):
        return self.config.get(tag, "").strip()

    def parseBaseInfo(self):
        baseInfo = {}
        content = self.config.get("base_info")
        if not content:
            self.logger.error("empty base_info")
            return baseInfo
        lines = content.split('\n')
        #parse baseinfo of name="value" format
        kvRe = re.compile(r'(\w+)\s*=\s*"(.*)"$')
        #without quote
        kvRe2 = re.compile(r'(\w+)\s*=\s*(.*)$')
        for line in lines:
            line = line.strip()
            if not line:
                #skip empty line
                continue
            if line.startswith("#"):
                #skip comment
                continue
            match = kvRe.match(line) or kvRe2.match(line)
            if match:
                k,v = match.groups()
                baseInfo[k] = v.strip()
            else:
                self.logger.warning("skip invalid base_info line:%s", line)
                continue
        #set some default value if empty
        baseInfo.setdefault("install_base", "/usr/local/services")
        version = baseInfo.get("version")
        installPath = os.path.join(baseInfo["install_base"], baseInfo["name"])
        pathWithVersion = baseInfo.get("no_version","") != "1" 
        if version and pathWithVersion:
            installPath = "%s-%s" % (installPath, version)
        if not baseInfo.get("install_path"):
            baseInfo["install_path"] = installPath
        #remove extra double quote.., for some bad pkg
        baseInfo["install_path"].replace('"','')
        baseInfo["install_path"] = os.path.normpath(baseInfo["install_path"])
        baseInfo["runing_file"] = os.path.join(
                baseInfo["install_path"],
                "admin/data/runing.tmp")
        #substitute all $xxx and ${xxx} value
        for k,v in baseInfo.items():
            newValue = string.Template(v).safe_substitute(baseInfo)
            baseInfo[k] = newValue
        self.baseInfo = baseInfo

    def parseApps(self):
        if not self.baseInfo:
            self.baseInfo = self.baseInfo
        apps = self.baseInfo.get("app_name", "").strip().split()
        #default min and max instance count
        defaultMin = 1
        defaultMax = 999999999
        appInfo = {}
        for app in apps:
            if app == "null": continue
            appNameNum = app.split(":", 1)
            appName = appNameNum[0]
            try:
                appMinMax = appNameNum[1].split(",", 1)
                if len(appMinMax) == 1:
                    appMinMax.append(defaultMax)
            except IndexError:
                appMinMax = [defaultMin, defaultMax]
            try:
                appMinMax = [ int(i) for i in appMinMax]
            except ValueError:
                self.logger.error("invalid app: %s", app)
            appInfo[appName] = appMinMax
        self.appInfo = appInfo
        self.baseInfo["app_count"] = len(appInfo)
        return self.appInfo

class PkgCron(object):
    def __init__(self, pkgConfig):
        self.pkgConfig = pkgConfig
        self.logger = logging.getLogger("pkgadmin.cron")
        self.procUtil = ProcUtil()
        self.checkUniqClient()
        self.reslash = re.compile(r'(\w)/+(\w)')

    def slashStrip(self, s):
        """strip extra continious slash / and head/tail blank"""
        return self.reslash.sub(r'\1/\2', s).strip()

    def checkUniqClient(self):
        """check if uniq client is installed"""
        uniqDir = "/usr/local/services/uniq_client-1.0/plugins/pkgMonitor"
        uniqMonitorFile = os.path.join(uniqDir, "uniq_monitor")
        uniqClearFile = os.path.join(uniqDir, "uniq_clear.sh")
        self.hasUniqMonitor = os.path.exists(uniqMonitorFile)
        self.hasUniqClear = os.path.exists(uniqClearFile)

    def dumpCron(self):
        """dump user crontab to string"""
        (returncode, output) = self.procUtil.run("crontab -l")
        if returncode != 0:
            if output.startswith("no crontab for"):
                return ""
            self.logger.error("failed to dump user crontab:%s" , output)
            return False
        self.logger.debug("user cron:\n%s", output)
        return output

    def circumventCronBug(self):
        """
        There was a bug in crond:
        see: https://bugzilla.redhat.com//show_bug.cgi?id=1343280
        if user crontab modified at the same second when crond load old change,
        change would never get load by crond.
        we update it's mtime to circumvent it
        """
        userName = pwd.getpwuid(os.getuid())[0]
        spoolDir = '/var/spool/cron'
        cronfile = os.path.join(spoolDir, userName)
        try:
            stat = os.stat(cronfile)
            if int(stat.st_mtime) % 60 == 1:
                self.logger.warning("circumvent cron bug and sleep 1s")
                #sleep 1 more second, so that the next change is after the 1st second
                time.sleep(1)
                #update mtime to next second
                os.utime(cronfile, (stat.st_mtime+1 ,stat.st_mtime+1))
        except OSError:
            pass

    def loadCron(self, content):
        """load crontab from string content"""
        if not content:
            self.logger.error("empty cron content, abort")
            return False
        self.logger.debug("new cron:\n%s", content)
        self.logger.debug("squeeze newline")
        content = re.sub(r'\n{2,}', '\n\n', content) 
        if not content.endswith("\n"):
            content += "\n"
        result = True
        try:
            (tmpfd, tmpfile) = tempfile.mkstemp(dir=tmp_dir)
            os.write(tmpfd, content)
            os.close(tmpfd)
            (returncode, output) = self.procUtil.run(["crontab", tmpfile], shell=False)
            if returncode != 0:
                self.logger.error("failed to load user crontab:%s" , output)
                result = False
        except Exception, e:
            self.logger.error("loadCron: Exception occurred", exc_info=True)
            result = False
        os.unlink(tmpfile)
        self.circumventCronBug()
        return result


    def backupCron(self, content):
        installPath = self.pkgConfig.baseInfo["install_path"]
        backupDir = os.path.join(installPath, "admin/data/backup")
        if not os.path.exists(backupDir):
            try:
                os.makedirs(backupDir)
            except OSError, e:
                self.logger.error("failed to create backupdir '%s':%s",
                        backupDir, e)
                return False
        now = time.time()
        ms = int(now * 1000)%1000
        fileName = time.strftime("cron.bak.%Y%m%d%H%M%S",time.localtime(now))
        fileName += "%03d" % ms
        backupFile = os.path.join(backupDir, fileName)
        fh = open(backupFile, "w")
        fh.write(content)
        fh.close()
        return True

    @util.lock("pkgadmin.cron", timeout=10, mode=0666)
    def deletePkgCron(self):
        self.logger.info("delete pkg cron")
        pkgCron = self.pkgConfig.getConfig("crontab")
        if not pkgCron:
            self.logger.warning("pkg has no cron")
            return True
        userCron = self.dumpCron()
        if False == userCron:
            self.logger.error("failed to dump user cron")
            return False
        userCronLines = userCron.split('\n')
        installPath = self.pkgConfig.baseInfo["install_path"]
        for line in pkgCron.split('\n'):
            line = line.replace("#INSTALL_PATH",installPath)
            line = self.slashStrip(line)
            #delete matching line
            userCronLines = filter(lambda x: self.slashStrip(x)!=line, userCronLines)
        #write new cron
        newCron = "\n".join(userCronLines)
        if newCron != userCron:
            self.backupCron(userCron)
            return self.loadCron(newCron)
        else:
            self.logger.info("crontab already deleted")
            return True


    @util.lock("pkgadmin.cron", timeout=10, mode=0666)
    def addPkgCron(self):
        self.logger.info("add pkg cron")
        pkgCron = self.pkgConfig.getConfig("crontab")
        baseInfo = self.pkgConfig.baseInfo
        uniqMonitorDisabled = baseInfo.get("disable_uniq_monitor", "0")
        if not pkgCron:
            self.logger.warning("pkg has no cron")
            return True
        userCron = self.dumpCron()
        if False == userCron:
            self.logger.error("failed to dump user cron")
            return False
        userCronLines = userCron.split('\n')
        installPath = self.pkgConfig.baseInfo["install_path"]
        for line in pkgCron.split('\n'):
            line = line.replace("#INSTALL_PATH",installPath)
            line = self.slashStrip(line)
            #skip if already added
            if filter(lambda x: self.slashStrip(x)==line, userCronLines):
                continue
            if line.startswith("##SYS"):
                continue
            #skip monitor.sh if uniq_client installed
            if "admin/monitor.sh" in line and self.hasUniqMonitor:
                if uniqMonitorDisabled != "1": continue
            #skip clear.sh if uniq_client installed
            if "admin/clear.sh" in line and self.hasUniqClear:
                if uniqMonitorDisabled != "1": continue
            userCronLines.append(line)
        #write new cron
        newCron = "\n".join(userCronLines)
        if newCron != userCron:
            self.backupCron(userCron)
            return self.loadCron(newCron)
        else:
            self.logger.info("crontab already added")
            return True

                
class PkgAdmin(object):
    def __init__(self, pkgConfig, procUtil=None):
        if not isinstance(pkgConfig, PkgConfig):
            raise TypeError("pkgConfig shoud be instance of PkgConfig")
        self.pkgConfig = pkgConfig
        self.logger = logging.getLogger("pkgadmin.admin")
        if not procUtil:
            self.procUtil = ProcUtil()
        else:
            assert isinstance(procUtil, ProcUtil)
            self.procUtil = procUtil
        self.lockTimeout = 300
        self.dfltKillTimeout=10
        self.dfltStopTimeout=60
        self.dfltStartCheckTimeout=1
        self.dfltStartCheckDelay=2
        #framework default code md5 list, check svn doc for
        #the actual orignal code
        self.defaultCode = {
            "monitor" : [ 
                "84be47a133b98ba504d70a8573c44402",
                "24c4a23425f280afd2ab9b7e4c268038",
                "93aa70bf121c76b4659bd96a88ff9266",
                "b93dddfc6101363fff647636bd100d3c",
                "f811293f5105280d8ee31d44f1af53ef",
                ],
            "resolve" : [
                "92058c129ed5407880d05fa6a5c00d9f",
                ],
            "stop" : [
                "967d4baed6a2ff0feedade5d94ee1de0",
                "7719b4992029d75498277723626fe227",
                ],
        }
        self.scriptEnv = self.populateScriptEnv()

    def getIntConf(self, key, default):
        try:
            return int(self.pkgConfig.baseInfo[key])
        except Exception, e:
            self.logger.debug("getIntConf error:%s", e)
            return default

    def populateScriptEnv(self):
        self.logger.debug("populateScriptEnv")
        env = {}
        #append /sbin and /usr/sbin to PATH
        extraPath = ['/sbin', '/usr/sbin']
        path = os.environ['PATH'].split(":")
        for p in extraPath:
            if p not in path: path.append(p)
        env['PATH'] = ":".join(path) 
        env['ip_inner'] = util.getIP('eth1')
        if not env['ip_inner']:
            #try other way to get lan ip
            env['ip_inner'] = util.getLanIP()
        env['ip_outer'] = util.getIP('eth0')
        env['vip'] = util.getIP('eth1:1')
        #set bind_ip for custom <monitor> code
        ipType = self.pkgConfig.baseInfo.get("ip_type", "0")
        if ipType == "0":
            env['bind_ip'] = env['ip_inner']
        elif ipType == "1":
            env['bind_ip'] = env['ip_outer']
        elif ipType == "2":
            env['bind_ip'] = "0.0.0.0"
        elif ipType == "3":
            env['bind_ip'] = env['vip']
        elif ipType == "4":
            env['bind_ip'] = "127.0.0.1"
        else:
            #self.logger.warn("unknow ip_type:%s", ipType)
            env['bind_ip'] = ""
        self.logger.debug("script env:%s", env)
        return env

    def runScript(self, script, precode=None, postcode=None, usePty=True):
        """
        run <script> and return its exit code.
        <script> is wrapped in a pkgrun function
        <precode>, if any, is executed before <script>
        <postcode>, if any, is executed after <script>

        the generated code looks like:

        function pkgrun(){
            <script>
        }
        <precode>
        pkgrun
        _pkgrun_ret=$?
        <postcode>
        exit $_pkgrun_ret
        """
        self.logger.debug("run script:\n%s", script)
        commonScript = os.path.join(scriptDir, "common2.sh")
        baseInfo = self.pkgConfig.baseInfo
        if not baseInfo:
            error = "failed to parse base_info"
            self.logger.error(error)
            return [1, error]
        try:
            tmpScript = tempfile.mkstemp(dir=tmp_dir)
        except IOError, e:
            error = "runScript failed to create tmp file:%s" % e
            self.logger.error(error)
            return [1, error]
        tmpFh = os.fdopen(tmpScript[0], "w+")
        #write base info as shell variables
        for key,value in baseInfo.items():
            tmpFh.write('%s="%s"\n' % (key, value))
        #write script env as shell variables
        for key,value in self.scriptEnv.items():
            tmpFh.write('%s="%s"\n' % (key, value))
        #load common function
        if os.path.exists(commonScript):
            tmpFh.write(open(commonScript).read())
        #wrap script in shell 'pkgrun' function
        tmpFh.write("function pkgrun(){\n")
        #add a null command to prevent function empty body error
        tmpFh.write(":\n")
        tmpFh.write(script)
        tmpFh.write("\n}\n")
        if precode:
            tmpFh.write(precode + "\n")
        tmpFh.write("pkgrun\n")
        tmpFh.write("_pkgrun_ret=$?\n")
        if postcode:
            tmpFh.write(postcode + "\n")
        tmpFh.write("exit $_pkgrun_ret\n")
        tmpFh.close()
        try:
            if usePty:
                self.logger.debug("ptyRun")
                (exitcode, output) = self.procUtil.ptyRun(['bash', tmpScript[1]], shell=False, maxBytes=1048576)
            else:
                #yes, we also use pty, but with a very small poll interval
                self.logger.debug("default run mode with small poll interval")
                (exitcode, output) = self.procUtil.ptyRun(['bash', tmpScript[1]], shell=False, 
                        maxBytes=1048576, pollInterval=0.004, maxDaemonPollTime=0)
        except Exception, e:
            (exitcode, output) = (1, "Exception occurred:%s" % e)
        if exitcode != 0:
            self.logger.error("run script failed")
            #os.sytem("cat -n %s" % tmpScript[1])
            self.logger.error("exitcode:%s output:\n%s", exitcode, output)
        else:
            self.logger.info("run script succeeded")
            self.logger.info("output:\n%s", output)
        os.unlink(tmpScript[1])

        return (exitcode, output)

    def runConfigCode(self, name, precode=None, postcode=None, usePty=False):
        """run code in config element <name> and return (returncode, output)
        see also runScript
        """
        code = self.pkgConfig.getConfig(name) 
        if not code:
            return [0, "OK"]
        self.logger.info("runConfigCode <%s>" % name)
        return self.runScript(code, precode, postcode, usePty)

    def checkUser(self, quiet=False):
        """check if current user is pkg user"""
        baseInfo = self.pkgConfig.baseInfo
        pkgUser = baseInfo["user"]
        myName = pwd.getpwuid(os.getuid())[0]
        if pkgUser != myName:
            if not quiet:
                self.logger.error("%s is not allowed to run this script, valid user:%s",
                    myName, pkgUser)
            return False
        return True


    def _startApp(self, appName):
        baseInfo = self.pkgConfig.baseInfo
        if appName == "graceful":
            self.logger.info("legacy graceful start")
            running = set()
        else:
            self.logger.info("startApp %s", appName)
            try:
                running = self.markRunning(appName, stop=False)
            except Exception, e:
                self.logger.error("markRunning failed")
                return False
        #add pkg crontab when the first app started
        if appName == "all" or len(running) == 1:
            pkgCron = PkgCron(self.pkgConfig)
            pkgCron.addPkgCron()
        if not self.checkDependency():
            self.logger.error("dependent package not ready, abort")
            return False
        #run pre-start code
        (exitcode, output) = self.runConfigCode("start_init")
        if exitcode != 0:
            self.logger.warning("<start_init> failed")
        #environment setup
        ldPath = os.environ.get("LD_LIBRARY_PATH","")
        ldPathAdd = os.path.join(baseInfo["install_path"], "lib")
        if ldPath:
            ldPath = ldPathAdd + ":" + ldPath
        else:
            ldPath = ldPathAdd
        os.environ["LD_LIBRARY_PATH"] = ldPath
        #run start code
        precode = "[[ -d $install_path/bin ]] && cd $install_path/bin"
        precode += "\napp_to_start=%s" % appName
        (exitcode, output) = self.runConfigCode("start", precode, usePty=True)
        if exitcode != 0:
            self.logger.error("<start> failed")
            return False
        #run after-start code
        (exitcode, output) = self.runConfigCode("start_on_started")
        if exitcode != 0:
            self.logger.error("<start_on_started> failed")
            return False
        if appName == "graceful":
            self.logger.warn("legacy graceful start always return True")
            return True

        #check if process started successfully
        if self.pkgConfig.isShell():
            return True
        
        ok = True
        errDetails = {}
        #delay awhile before check
        #some process may start then quit if failed to initialize
        delay = self.getIntConf("start_check_delay", self.dfltStartCheckDelay)
        self.logger.info("sleep %d seconds and check" % delay)
        time.sleep(delay)
        if self.isDefaultCheck():
            startCheckTimeout = self.getIntConf("start_check_timeout", self.dfltStartCheckTimeout)
            startTime = time.time()
            while True:
                self.logger.debug("default check")
                errDetails = self.checkApp(appName)
                errApps = errDetails.keys()
                ok = not errApps
                if ok or (time.time() - startTime > startCheckTimeout):
                    break
                else:
                    for errDetail in errDetails.values():
                        self.logger.warn("%s, ps snapshot:\n%s", 
                                errDetail["msg"],
                                errDetail["snapshot"])
                    time.sleep(0.5)#delay awhile
            if ok:
                self.logger.info("start %s successfully", appName)
            else:
                for errDetail in errDetails.values():
                    self.logger.error("%s, ps snapshot:\n%s", 
                            errDetail["msg"],
                            errDetail["snapshot"])
                self.logger.error("start %s failed", appName)
        else:
            self.logger.info("do custom check")
            (errApps, errPorts) = self.doCustomCheck()
            ok = (not errApps and not errPorts)
            if ok:
                self.logger.info("start %s successfully", appName)
            else:
                self.logger.error("start %s failed: err_app=%s, err_port=%s", 
                        appName, errApps, errPorts)
        return ok

    def startApp(self, appName):
        #do not accquire lock when called from monitor logic
        if os.environ.get("PKGADMIN_FROM_MONITOR"):
            self.logger.warning("start on monitor exception")
            del os.environ["PKGADMIN_FROM_MONITOR"]
            return self._startApp(appName)
        else:
            return self.lockedCall(self._startApp, appName)

    def defaultStop(self, appName):
        """default app stop logic:
        return True if successfully killed target appName
        """
        allApps = set(self.pkgConfig.appInfo.keys())
        killSig = self.pkgConfig.baseInfo.get("kill_sig", "KILL")
        killTimeout = self.getIntConf("kill_timeout", self.dfltKillTimeout)
        stopTimeout = self.getIntConf("stop_timeout", self.dfltStopTimeout)
        forceKill = killTimeout
        signum = self.procUtil._sigNumber(killSig)

        sleepInterval = 0.01
        timeStart = time.time()
        if appName == "all":
            toKill = list(allApps)
        else:
            toKill = [appName]
        while True:
            self.procUtil.takePsSnapshot()
            #take shadow copy of toKill so that it's safe  
            #to delete item
            for app in toKill[:]:
                if not self.procUtil.getProcNum(app):
                    self.logger.info("%s already dead", app)
                    toKill.remove(app)
                else:
                    if time.time() - timeStart >= forceKill and signum != 9:
                        self.logger.warning("force kill %s with SIGKILL", app)
                        (killed, error) = self.procUtil.killProc(app, "KILL")
                    else:
                        self.logger.info("kill %s with %s", app, killSig)
                        (killed, error) = self.procUtil.killProc(app, killSig, killTimeout=killTimeout)
                        if not killed:
                            self.logger.warn("%s not killed: %s", app, error)
                            self.logger.warn("please change kill_sig, "\
                                    + "or increase kill_timeout, "\
                                    + "or check user permission to kill")
                            #fast fail if encounter fatal error
                            if error.startswith("FATAL"):
                                return
            if not toKill:
                #all killed
                return True
            else:
                if time.time() - timeStart >= stopTimeout:
                    self.logger.warning("timed out")
                    break
                time.sleep(sleepInterval)

    def _stopApp(self, appName, clearRunning=True):
        if appName == "graceful":
            self.logger.info("legacy graceful stop, do nothing")
            return True
        self.logger.info("stopApp %s", appName)
        baseInfo = self.pkgConfig.baseInfo
        if clearRunning:
            try:
                running = self.markRunning(appName, stop=True)
            except Exception, e:
                self.logger.error("markRunning failed")
                return False
        #run stop code
        #run defaultStop if no custom stop code
        stopCode = self.customizedCode("stop")
        stopped = False
        if not stopCode:
            self.logger.debug("use default stop logic")
            stopped = self.defaultStop(appName)
        else:
            self.logger.debug("use custom stop logic")
            precode = '[[ -d "$install_path/bin" ]] && cd $install_path/bin'
            precode += "\napp_to_stop=%s" % appName
            (exitcode, output) = self.runConfigCode("stop", precode=precode)
            if exitcode != 0:
                self.logger.warning("run custom <stop> code failed")
        #check result
        ok = True
        #only check wether process stoped when use default monitor code
        if not self.customizedCode("monitor"):
            if stopped:
                #defaultStop already stopped app, no err_apps.
                err_apps = {}
            else:
                #for custom stop, check if really stopped
                err_apps = self.checkApp(appName, stop=True)
            ok = not err_apps
            if err_apps:
                    for err in err_apps.values():
                       self.logger.error("%s,snapshot:\n%s", err['msg'], err['snapshot']) 
        #run custom after-stop code
        (exitcode, output) = self.runConfigCode("stop_on_stoped")
        if exitcode != 0:
            self.logger.warning("run custom after-stop code failed")
        if ok:
            self.logger.info("stop %s successfully", appName)
        else:
            self.logger.error("stop %s failed", appName)
        #clear pkg crontab if no apps running
        if clearRunning and (not running):
            pkgCron = PkgCron(self.pkgConfig)
            pkgCron.deletePkgCron()
        return ok

    def stopApp(self, appName):
        #do not accquire lock when called from monitor logic
        if os.environ.get("PKGADMIN_FROM_MONITOR"):
            self.logger.warning("stop on monitor exception")
            del os.environ["PKGADMIN_FROM_MONITOR"]
            return self._stopApp(appName)
        else:
            return self.lockedCall(self._stopApp, appName)

    def _restartApp(self, appName):
        self.logger.info("restarting %s", appName)
        ok = self._stopApp(appName, clearRunning=False)
        if not ok:
            self.logger.error("stop failed, abort")
            return False
        ok = self._startApp(appName)
        if ok:
            self.logger.info("restart %s successfully", appName)
            return True
        else: 
            self.logger.error("restart %s failed", appName)
            return False

    def restartApp(self, appName):
        #do not accquire lock when called from monitor logic
        if os.environ.get("PKGADMIN_FROM_MONITOR"):
            self.logger.warning("restart on monitor exception")
            del os.environ["PKGADMIN_FROM_MONITOR"]
            return self._restartApp(appName)
        else:
            return self.lockedCall(self._restartApp, appName)

    def _reloadApp(self, appName):
        self.logger.info("reloadApp %s", appName)
        baseInfo = self.pkgConfig.baseInfo
        precode = '[[ -d "$install_path/bin" ]] && cd $install_path/bin'
        precode += "\napp_to_reload=%s" % appName
        (exitcode, output) = self.runConfigCode("reload", precode=precode)
        if exitcode == 0:
            result = True
            self.logger.info("reload %s successfully", appName)
        else:
            result = False
            self.logger.error("run <reload> code failed")
            self.logger.info("reload %s failed", appName)
        return result

    def reloadApp(self, appName):
        return self.lockedCall(self._reloadApp, appName)

    def lockedCall(self, func, *args, **kwargs):
        """run func with lock protected
        lock timeout may be specified as 'timeout' keyword argument
        default to self.lockTimeout
        """
        pkgName = self.pkgConfig.baseInfo["name"]
        lockName = "pkgadmin.%s" % pkgName
        if self.pkgConfig.isShell() and \
                "spp_" in self.pkgConfig.baseInfo.get("install_path"):
            #spp plugin pkg (is_shell=true) use different lock
            #to prevent dead lock of spp framework
            lockName = lockName + ".plugin"
        #take a shadow copy for safe change
        kwargs = kwargs.copy()
        if "timeout" in kwargs:
            timeout = kwargs["timeout"]
            del kwargs["timeout"]
        else:
            timeout = self.lockTimeout
        try:
            func = util.lock(lockName, timeout, mode=0666)(func)
            self.logger.info("acquire pkg lock '%s'", lockName)
            return func(*args, **kwargs)
        except util.LockException, le:
            self.logger.error("failed to acquire lock '%s'", le)
            return False
        except Exception, e:
            self.logger.error("operation failed: %s", e)
            return False

    def codeStrip(self, code):
        lines = code.split('\n')
        codeStripped = []
        comment = re.compile(r'^\s*#')
        for line in lines:
            #skip extra space
            line = line.strip()
            #skip empty line
            if not line: continue
            #skip comment
            if comment.match(line):
                continue
            codeStripped.append(line)
        #add new line at the end
        if codeStripped:
            codeStripped.append('')
        return "\n".join(codeStripped)


    def _filterStopCode(self, code):
        """remove useless code generated by zhiyun pkg conversion
        """
        if not code: return code
        lines = code.split('\n')
        dropRe = re.compile(r'^(tmp=|cd |tmpproc=)')
        lines = filter(lambda line: not dropRe.match(line), lines)
        return "\n".join(lines)

    def customizedCode(self, codeType):
        """check if pkg has custom monitor/stop/resolve code"""
        if codeType not in self.defaultCode:
            raise ValueError("invalid codeType:%s" % codeType)
        code = self.pkgConfig.getConfig(codeType)
        if not code:
            return False
        md5 = hashlib.md5()
        strippedCode = self.codeStrip(code)
        if codeType == "stop":
            #remove extra useless code in stop
            strippedCode = self._filterStopCode(strippedCode)
        self.logger.debug("<%s>strippedCode:\n%s", codeType, strippedCode)
        md5.update(strippedCode)
        md5hex = md5.hexdigest()
        self.logger.debug("%s code md5: %s", codeType, md5hex)
        if md5hex in self.defaultCode[codeType]:
            return False
        return code

    def _monitor(self):
        """monitor all app, restart when error
           only monitor app in running file
        """
        allApps = set(self.pkgConfig.appInfo.keys())
        if not allApps:
            self.logger.debug("no app defined")
            return True
        if self.isDefaultCheck():
            self.logger.debug("use default monitor&resolve logic")
            errDetails = self.checkApp("all-running", alert=True)
            errApps = errDetails.keys()
            if errApps:
                for errDetail in errDetails.values():
                    self.logger.error("%s, ps snapshot:\n%s", errDetail["msg"],
                            errDetail["snapshot"])
                self.logger.warning("restart %s on monitor exception", errApps)
                #change log level to info when restart
                self.logger.setLevel(logging.INFO)
            if set(errApps) == allApps:
                return self._restartApp("all")
            else:
                ok = True
                for app in errApps:
                    if not self._restartApp(app):
                        ok = False
                return ok
        else:
            #use custom monitor and resolve logic
            self.logger.debug("use custom monitor and resolve logic")
            (errApps, errPorts) = self.doCustomCheck()
            if not errApps and not errPorts:
                return True
            self.logger.warning("resolve on monitor exception:err_app=%s, err_port=%s", errApps, errPorts)
            #need to tell restart do not accquire lock to prevent dead lock
            os.environ["PKGADMIN_FROM_MONITOR"] = "1"
            precode='err_app="%s"; err_port="%s"' % (errApps, errPorts)
            (returncode, output) = self.runConfigCode("resolve", precode=precode, usePty=True)
            if returncode != 0:
                self.logger.error("resolve failed")
                return False
            else:
                return True

    def monitor(self, timeout=0):
        #if monitor can't acquire lock immediately, quick fail
        #this is to prevent many monitor.sh process waiting
        return self.lockedCall(self._monitor, timeout=timeout)

    def hasMonitor(self):
        """return True if uncommented monitor.sh in pkg crontab"""
        crontab = self.pkgConfig.getConfig("crontab")
        #remove extra slash(eg: /home/oicq//cmlb_client)
        crontab = re.sub(r'/+', '/', crontab)
        cronLines = crontab.split('\n')
        monitorShell = os.path.join(self.pkgConfig.baseInfo['install_path'], '/admin/monitor.sh')
        for line in cronLines:
            line = line.strip()
            #skip comment
            if line.startswith("#"): continue
            if monitorShell in line:
                return True
        return False

    def isDefaultCheck(self):
        """
        return True if both pkg's <monitor> and <resolve> are zhiyun default code
        """
        if self.customizedCode("monitor") or self.customizedCode("resolve"):
            return False
        else:
            return True

    def doCustomCheck(self):
        """
        run custom <monitor> code and return (err_app, err_port) in tuple
        """
        checkCode = self.pkgConfig.getConfig("monitor")
        echoErrApp='echo "ERROR_APP=$err_app|ERROR_PORT=$err_port"'
        (returncode, output) = self.runScript(checkCode, postcode=echoErrApp)
        lastLine = output.strip().split("\n")[-1]

        errAppsPorts = ("", "")
        if not lastLine.startswith("ERROR_APP="):
            self.logger.error("customCheck failed to read err_app")
            self.logger.error("Did you write 'exit' in <monitor>?")
            return errAppsPorts
        errAppsPorts = lastLine.split("|")
        errApps = errAppsPorts[0].replace("ERROR_APP=", "")
        errPorts = errAppsPorts[1].replace("ERROR_PORT=", "")
        if errApps:
            self.logger.error("customCheck got err_app: %s", errApps)
        if errPorts:
            self.logger.error("customCheck got err_port: %s", errPorts)
        return (errApps, errPorts)

    def checkApp(self, appName, stop=False, alert=False, refreshSnapshot=True):
        """check app with ps and return err app in a dict like
        { 'app1' : { "msg" : "error msg xxx", "snapshot" : "xxxx" }}
           params:
           appName: appName to check, special value:
               'all': all app in this pkg
               'all-running': all app in running mark file
           stop:  check stopped?
               set to True to check if app stopped
           alert: should alert when some app is not ok?
           quiet: if set to True, no log msg when error
        """
        appInfo = self.pkgConfig.appInfo
        errApps = {}
        if appName == "all":
            apps = appInfo.keys()
        elif appName == "all-running":
            apps = self.getRunning()
        elif appName not in appInfo:
            self.logger.error("unknown app %s", appName)
            return errApps
        else:
            apps = [appName]
        if refreshSnapshot:
            self.procUtil.takePsSnapshot()
        for app in apps:
            (procNum, snapshot) = self.procUtil.getProcNumEx(app)
            if stop:
                if procNum != 0:
                    errDetail = { 
                        "msg" : "app %s proc num %d" %( app, procNum),
                        "snapshot" : snapshot
                        }
                    errApps[app] = errDetail
            else:
                installPath = self.pkgConfig.baseInfo.get('install_path')
                if procNum < appInfo[app][0] or procNum > appInfo[app][1]:
                    msg = "[%s][%s] current process num %d, should be [%d,%d], restart!" % \
                        (installPath, app, procNum, appInfo[app][0], appInfo[app][1])
                    errApps[app] = { "msg" : msg, "snapshot" : snapshot}
                    if alert: util.alert(msg)
        return errApps

    def checkDependency(self):
        """check if all dependency is OK
           try to restart dep pkg if stopped
        """
        baseInfo = self.pkgConfig.baseInfo
        depList = baseInfo.get("dependency","")
        if not depList:
            return True
        depList = depList.split(";")
        self.logger.info("checking dependency...")
        self.logger.info("dependency list:%s", depList)
        pkgUtil = PkgUtil()
        allPkg = pkgUtil.getAllPkg()
        for dep in depList:
            self.logger.info("check dep pkg %s", dep)
            if dep not in allPkg:
                self.logger.error("dep pkg %s not installed", dep)
                return False
            pkgPath = allPkg[dep]
            pkgconf = PkgConfig(pkgPath + "/init.xml")
            pkgAdmin = PkgAdmin(pkgconf)
            pkgUser = pkgconf.baseInfo["user"]
            monitorCmd = os.path.join(pkgPath,"admin/monitor.sh")
            #if same user, call API to monitor for better performance
            if pkgAdmin.checkUser(quiet=True):
                if not pkgAdmin.monitor(timeout=60):
                    self.logger.error("dep pkg %s failed", dep)
                    return False
            else:
                #if I am root,su to target user and run monitor.sh
                if os.getuid() == 0:
                    self.logger.info("su to run %s", monitorCmd)
                    monitorCmd = "su %s -c '%s'" % (pkgUser, monitorCmd)
                    (exitcode, output) = self.procUtil.run(monitorCmd)
                    self.logger.info("output:\n%s", output)
                    if exitcode != 0:
                        self.logger.error("dep pkg %s failed", dep)
                        return False
                else:
                    #try to check if process exits.
                    #because we are not root, atempt to su must fail
                    errApps = pkgAdmin.checkApp("all").keys()
                    if errApps:
                        self.logger.error("dep %s failed and no privilege to restart", dep)
                        self.logger.error("error apps: %s", errApps)
                        return False
        return True

    def getRunning(self):
        baseInfo = self.pkgConfig.baseInfo
        allapps = set(self.pkgConfig.appInfo.keys())
        markFile = baseInfo["runing_file"]
        if os.path.exists(markFile):
            lines = util.readFile(markFile).strip().split()
            running = set([ line for line in lines if line ])
        else:
            running = set()
        #discard dirty invalid content in running file
        for app in list(running):
            if app not in allapps:
                running.discard(app)
                self.logger.warning("discard invalid app '%s' from running file %s",
                       app, markFile)
        return running

    def markRunning(self, appName, stop=False):
        baseInfo = self.pkgConfig.baseInfo
        markFile = baseInfo["runing_file"]
        running = self.getRunning()
        oldRunning = running.copy()

        if stop:
            #when stop apps, remove from running file
            if appName == "all":
                running = set()
            else:
                running.discard(appName)
        else:
            #when start apps, add to running file
            if appName == "all":
                running = set(self.pkgConfig.appInfo.keys())
            else:
                running.add(appName)
        if oldRunning == running:
            #no modification, skip write
            return running
        #delete running file if no app running
        if not running:
            if os.path.exists(markFile): os.unlink(markFile)
            return running
        try:
            fh = open(markFile, "w")
            running = [ r + "\n" for r in running ]
            fh.writelines(running)
            fh.close()
        except IOError, e:
            self.logger.error("failed to write running file '%s': %s",
                    markFile, e)
            raise Exception("mark running failed")
        return running

class PkgUtil(object):
    def __init__(self, extraDirs=None):
        """
        params:
          extraDirs: 
            list of package directory which is not under any basedir
        """
        self.logger = logging.getLogger("pkgadmin.util")
        self.baseDirs = [ 
                "/home/oicq",
                "/usr/local",
                "/usr/local/app",
                "/usr/local/services",
            ]
        self.extraDirs = extraDirs

    def _uniq(self, seq):
        seen = set()
        return filter(lambda x: not (x in seen or seen.add(x)), seq)
        
    def getAllPkgPath(self):
        """
        return installed path of every package in a list
        eg: 
        ["/home/oicq/cmlb_client", "/usr/local/services/spp_xxx-2.0"]
        """
        pkgDirs = []
        for baseDir in self.baseDirs:
            pkgDirs += glob.glob(baseDir + "/*")
        if self.extraDirs:
            pkgDirs += self.extraDirs
        validPath = filter(self.isValidPkg, pkgDirs)
        #resolve symlink
        realPaths = map(os.path.realpath, validPath)
        #remove duplicates
        realPaths = self._uniq(realPaths)
        #if baseDir link to other dir, eg: /usr/locac/services -> /data/services
        #map real path back to baseDir
        baseDirMap = {}
        for baseDir in self.baseDirs:
            if os.path.islink(baseDir):
                baseDirMap[os.path.realpath(baseDir)] = baseDir
        if not baseDirMap:
            return realPaths
        pkgPaths = []
        for pkgDir in realPaths:
            realBaseDir = os.path.dirname(pkgDir)
            dirName = os.path.basename(pkgDir)
            pkgPath = os.path.join(baseDirMap.get(realBaseDir, realBaseDir), dirName)
            pkgPaths.append(pkgPath)
        return pkgPaths



    def getSppPluginDir(self, path):
        """
        get plugin dir of spp package.
        return empty string if not found
        """
        clientDir = os.path.join(path, "client") 
        if os.path.islink(clientDir):
            #plugin path is spp_xxx/client
            pluginDir = clientDir
        elif os.path.isdir(clientDir):
            #plugin path is spp_xxx/client/xxx
            #find the first sub directory with init.xml
            adminDirs = glob.glob(clientDir + '/*/init.xml')
            if adminDirs:
                # sorted to be compatible with the situation of qzone's creating plugin's soft link under client
                pluginDir = os.path.dirname(sorted(adminDirs)[0])
            else:
                pluginDir = ""
        else:
            #spp dir may be invalid, assume /client dir
            pluginDir = clientDir
            
        return pluginDir

    def getAllPkg(self):
        """return all pkg in a dict
            with pkg source as key, pkg install path as value
        eg:
            { "/IM/cmlb_client" : "/home/oicq/cmlb_client",
            "/IM_DB/oidb_session" : "/home/oicq/spp_oidb_session" }
        """
        pkgs = {}
        sourceFile = "admin/data/source.ini"
        pkgDirs = self.getAllPkgPath()
        for dir in pkgDirs:
            if os.path.basename(dir).startswith("spp_"):
                pluginDir = self.getSppPluginDir(dir)
                if self.isValidPkg(pluginDir):
                    source = os.path.join(pluginDir,
                        sourceFile)
                    #is valid spp pkg
                    pkgSource = util.readFile(source).strip()
                else:
                    self.logger.warning("skip invalid spp dir '%s'", dir)
                    continue
            else:
                source =  os.path.join(dir, sourceFile)
                pkgSource = util.readFile(source).strip()
            pkgs[pkgSource] = dir
        return pkgs

    def checkAllPkg(self, showAll=False):
        pkgs = self.getAllPkg()
        procUtil = ProcUtil()
        if not pkgs:
            self.logger.warning("no pkg detected")
            return True
        result = True
        for source, path in pkgs.items():
            self.logger.info("checking pkg %s at %s ...", 
                    source, path)
            initXml = os.path.join(path, "init.xml")
            pkgConfig = PkgConfig(initXml)
            name = pkgConfig.baseInfo.get("name")
            pkgAdmin = PkgAdmin(pkgConfig, procUtil)
            if pkgConfig.isShell():
                self.logger.info("skip shell pkg '%s'", source)
                continue
            if not pkgAdmin.hasMonitor():
                self.logger.info("skip no monitor pkg '%s'", source)
                continue
            errPorts = ""
            try:
                if pkgAdmin.isDefaultCheck():
                    self.logger.debug("use default check")
                    errApps = pkgAdmin.checkApp("all", refreshSnapshot=False).keys()
                else:
                    self.logger.debug("use custom check")
                    errApps, errPorts = pkgAdmin.doCustomCheck()
                    errApps = errApps.strip().split()
                    errPorts = errPorts.strip().split()
                if errApps or errPorts:
                    result = False
                    print "%s(%s) FAIL error_apps:%s|error_ports:%s" % (name, path, ";".join(errApps), ";".join(errPorts))
                else:
                    if showAll:
                        print "%s(%s) OK" % (name, path)
            except Exception, e:
                self.logger.error("Exception: %s", e, exc_info=True)
                result = False
        return result

    def isValidPkg(self, path):
        initFile = "init.xml"
        sourceFile = "admin/data/source.ini"
        if os.path.isdir(path) \
            and os.path.isfile(os.path.join(path, initFile)) \
            and os.path.isfile(os.path.join(path, sourceFile)):
                return True
        return False
            

def initLogger(logfile, level, console=False):
    #do not show procutil log
    logging.getLogger("procutil").setLevel(logging.CRITICAL)
    logger = logging.getLogger("pkgadmin")
    logger.setLevel(level)
    formatter = logging.Formatter("[%(asctime)-15s] %(levelname)s: %(message)s")
    #log to console ?
    if console:
        ch = logging.StreamHandler()
        ch.setFormatter(formatter)
        logger.addHandler(ch)
    try:
        logDir = os.path.dirname(logfile)
        if not os.path.isdir(logDir):
            os.makedirs(logDir)
        handler = logging.handlers.TimedRotatingFileHandler(logfile, when="D", backupCount=30)
        handler.setFormatter(formatter)
        logger.addHandler(handler)
    except Exception, e:
        logger.warn("log file init failed:%s", e)
    return logger

def myexit(value):
    if value:
        sys.exit(0)
    else:
        sys.exit(1)

def printUsage(prog):
    print >>sys.stderr, "Usage: "
    print >>sys.stderr, "\t%s start|stop|restart|reload all|app args ..." % prog
    print >>sys.stderr, "\t%s monitor" % prog
    print >>sys.stderr, "\t%s addcron|delcron" % prog
    print >>sys.stderr, "\t%s check-all-pkg" % prog
    print >>sys.stderr, "\t%s check-show-all-pkg" % prog

if __name__ == "__main__":
    #logging.basicConfig(format='[%(asctime)-15s] %(levelname)s %(message)s', level=logging.INFO)

    if len(sys.argv) < 2:
        printUsage(sys.argv[0])
        sys.exit(1)
    
    logfile = os.path.join(scriptDir, "../log/pkgadmin.log")
    logger = initLogger(logfile, logging.INFO, console=True)

    #build command action function
    cmdAction = {
        "start" : lambda app: pkgAdmin.startApp(app),
        "stop" : lambda app: pkgAdmin.stopApp(app),
        "restart" : lambda app: pkgAdmin.restartApp(app),
        "reload" : lambda app: pkgAdmin.reloadApp(app),
        "addcron" : lambda : pkgCron.addPkgCron(),
        "delcron" : lambda : pkgCron.deletePkgCron(),
        "monitor" : lambda : pkgAdmin.monitor(),
        "check-all-pkg" : lambda : PkgUtil().checkAllPkg(),
        "check-show-all-pkg" : lambda : PkgUtil().checkAllPkg(True),
    }


    command = sys.argv[1]
    if command not in cmdAction:
        print >>sys.stderr, "unknow command '%s'" % command
        printUsage(sys.argv[0])
        sys.exit(1)

    if command in ("check-all-pkg", "check-show-all-pkg"):
        logger.setLevel(logging.ERROR)
        myexit(cmdAction[command]())

    conf = PkgConfig(scriptDir + "/../init.xml")
    pkgCron = PkgCron(conf)
    pkgAdmin = PkgAdmin(conf)

    #check user
    if not pkgAdmin.checkUser():
        sys.exit(1)

    if command in ("start", "stop", "restart", "reload"):
        try:
            app = sys.argv[2]
        except IndexError:
            print >>sys.stderr, "Usage: %s start|stop|restart|reload all|app args ..." % sys.argv[0]
        if (app not in ("all","graceful")) and (app not in conf.appInfo):
            print >>sys.stderr, "unknow app '%s'" % app
            sys.exit(1)

        if command == "start":
            #abort when process with the same name is running.
            #we do this safe check only for pkg with default check.
            if pkgAdmin.isDefaultCheck():
                errapps = pkgAdmin.checkApp(app, stop=True).keys()
                if errapps:
                    #write running file before abort
                    pkgAdmin.markRunning(app, stop=False)
                    pkgAdmin.logger.error("ERROR: '%s' is already started" % errapps)
                    pkgAdmin.logger.error("run restart if you insist!")
                    sys.exit(1)
        result = cmdAction[command](app)
        myexit(result)
            
    if command in ( "monitor",):
        #monitor should run quietly
        logger.setLevel(logging.WARNING)
    #run command action
    myexit(cmdAction[command]())

