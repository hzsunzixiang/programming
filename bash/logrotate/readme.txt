https://www.techwalla.com/articles/how-to-unzip-a-gz-file-in-linux

解压压缩之后的文件
gunzip test.log.1.gz

# 压缩和解压缩
gzip test.log.1 
gunzip test.log.1.gz 


StephenSun@debian-1:~/programming/bash/logrotate$ cat /etc/cron.daily/logrotate 
#!/bin/sh

test -x /usr/sbin/logrotate || exit 0
/usr/sbin/logrotate /etc/logrotate.conf
/usr/sbin/logrotate /etc/logrotate.d/test.conf


http://xmodulo.com/logrotate-manage-log-files-linux.html
How to use logrotate to manage log files in Linux
http://blog.csdn.net/zhoubangding/article/details/54287168
https://www.cyberciti.biz/faq/how-do-i-rotate-log-files/


sudo anacron -f cron.weekly

http://linux.vbird.org/linux_basic/0430cron.php#anacron_1

我們拿 /etc/cron.daily/ 那一行的設定來說明好了。那四個欄位的意義分別是：

天數：anacron 執行當下與時間戳記 (/var/spool/anacron/ 內的時間紀錄檔) 相差的天數，若超過此天數，就準備開始執行，若沒有超過此天數，則不予執行後續的指令。
延遲時間：若確定超過天數導致要執行排程工作了，那麼請延遲執行的時間，因為擔心立即啟動會有其他資源衝突的問題吧！
工作名稱定義：這個沒啥意義，就只是會在 /var/log/cron 裡頭記載該項任務的名稱這樣！通常與後續的目錄資源名稱相同即可。
實際要進行的指令串：有沒有跟 0hourly 很像啊！沒錯！相同的作法啊！透過 run-parts 來處理的！
根據上面的設定檔內容，我們大概知道 anacron 的執行流程應該是這樣的 (以 cron.daily 為例)：


也就是說，如果你每個週日的需要執行的動作是放置於 /etc/crontab 的話，那麼該動作只要過期了就過期了，並不會被抓回來重新執行。但如果是放置在 /etc/cron.weekly/ 目錄下，那麼該工作就會定期，幾乎一定會在一週內執行一次～如果你關機超過一週，那麼一開機後的數個小時內，該工作就會主動的被執行喔！ 真的嗎？對啦！因為 /etc/anacrontab 的定義啦！


copytruncate 这个选项会导致文件拷贝

copytruncate instruct logrotate to creates the copy of the original file (i.e rotate the original log file) and truncates the original file to zero byte size. This helps the respective service that belongs to that log file can write to the proper file.


copytruncate
         Truncate  the  original  log  file  to  zero size in place after
         creating a  copy,  instead  of  moving  the  old  log  file  and
         optionally creating a new one.  It can be used when some program
         cannot be told to close its  logfile  and  thus  might  continue
         writing (appending) to the previous log file forever.  Note that
         there is a very small time slice between copying  the  file  and
         truncating  it,  so  some logging data might be lost.  When this
         option is used, the create option will have no  effect,  as  the
         old log file stays in place.






