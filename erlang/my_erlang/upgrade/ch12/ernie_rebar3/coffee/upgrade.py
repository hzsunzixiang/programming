import os
import sys

VSN_OLD = "1.0"
VSN_NEW = "1.1"


print("Upgrading from ", VSN_OLD, " to ", VSN_NEW, "(press enter to continue) ", end="")
input()

os.system("cp apps/coffee/src/coffee.appup.src  _build/default/lib/coffee/ebin/coffee.appup")
input()

# build the new release
os.system("rebar3 compile")
os.system("rebar3 release")

# generate relup w.r.t to the previous release
os.system("rebar3 relup -n coffee -v " + VSN_NEW + " -u " + VSN_OLD)

# genereate tar file of the new release
os.system("rebar3 tar -n coffee -v " + VSN_NEW)

# move the generated tar file to destination folder
os.system("mv _build/default/rel/coffee/coffee-" +
          VSN_NEW + ".tar.gz _build/default/rel/coffee/releases/" + VSN_NEW +"/coffee.tar.gz")

# upgrade to the new release
os.system("_build/default/rel/coffee/bin/coffee-" + VSN_OLD + " upgrade " + VSN_NEW)

