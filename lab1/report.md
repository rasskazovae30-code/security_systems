Рассказова Ектаерина Б24-502 Лабораторная работа 1

2.1.2 ekaterinarasskazova@ubuntu:~$ (домашний каталог)
2.1.3 cd /
перейти выше нельзя так как коневой каталог это начальный, мы также 
возвращаемся к корневому
2.1.4 ls
history_hardlink  lab1  passwd  passwd_link
2.1.5 cd /
ls /etc
ekaterinarasskazova@ubuntu:/$ ls /etc
X11                            host.conf            python3
adduser.conf                   hostname             python3.14
alternatives                   hosts                rc0.d
apparmor.d                     init.d               rc1.d
apt                            inputrc              rc2.d
bash.bashrc                    issue                rc3.d
bash_completion                issue.net            rc4.d
bash_completion.d              kernel               rc5.d
bindresvport.blacklist         ld.so.cache          rc6.d
binfmt.d                       ld.so.conf           rcS.d
ca-certificates                ld.so.conf.d         resolv.conf
ca-certificates.conf           ldap                 rmt
ca-certificates.conf.dpkg-old  legal                rpc
chrony                         libaudit.conf        rsyslog.conf
console-setup                  locale.conf          rsyslog.d
credstore                      locale.gen           security
credstore.encrypted            localtime            selinux
cron.d                         logcheck             services
cron.daily                     login.defs           shadow
cron.hourly                    logrotate.conf       shadow-
cron.monthly                   logrotate.d          shells
cron.weekly                    lsb-release          skel
cron.yearly                    machine-id           ssh
crontab                        mime.types           ssl
dbus-1                         mke2fs.conf          subgid
debconf.conf                   modprobe.d           subgid-
debian_version                 modules              subuid
debuginfod                     modules-load.d       subuid-
default                        mtab                 sudo.conf
deluser.conf                   nanorc               sudo_logsrvd.conf
depmod.d                       netconfig            sudoers
dhcp                           netplan              sudoers.d
dhcpcd.conf                    network              supercat
dpkg                           networkd-dispatcher  sysctl.d
e2scrub.conf                   networks             systemd
environment                    newt                 terminfo
ethertypes                     nsswitch.conf        tmpfiles.d
fstab                          opt                  ubuntu-advantage
fuse.conf                      os-release           ucf.conf
gai.conf                       pam.conf             udev
gdb                            pam.d                update-manager
gnutls                         passwd               update-motd.d
gprofng.rc                     passwd-              vconsole.conf
group                          perl                 vim
group-                         ppp                  vtrgb
gshadow                        profile              xattr.conf
gshadow-                       profile.d            xdg
gss                            protocols

2.1.6. cd ~
2.1.7 ls 
ekaterinarasskazova@ubuntu:~/lab1$ cd ~
ekaterinarasskazova@ubuntu:~$ ls
history_hardlink  lab1  passwd  passwd_link

2.1.8 ls -l -a
total 28
drwxr-x--- 1 ekaterinarasskazova ekaterinarasskaz  166 Sep 25 22:45 .
drwxr-xr-x 1 root                root               38 Sep 11 23:07 ..
-rw------- 2 ekaterinarasskazova ekaterinarasskaz  641 Sep 17 17:43 .bash_history
-rw-r--r-- 1 ekaterinarasskazova ekaterinarasskaz  220 Feb 13  2026 .bash_logout
-rw-r--r-- 1 ekaterinarasskazova ekaterinarasskaz 3771 Feb 13  2026 .bashrc
drwx------ 1 ekaterinarasskazova ekaterinarasskaz   10 Sep 25 18:45 .local
-rw-r--r-- 1 ekaterinarasskazova ekaterinarasskaz  807 Feb 13  2026 .profile
-rw------- 2 ekaterinarasskazova ekaterinarasskaz  641 Sep 17 17:43 history_hardlink
drwxr-xr-x 1 ekaterinarasskazova ekaterinarasskaz   18 Sep 25 22:49 lab1
-rw-r--r-- 1 ekaterinarasskazova ekaterinarasskaz 1367 Sep 25 18:52 passwd
lrwxrwxrwx 1 ekaterinarasskazova ekaterinarasskaz   32 Sep 25 18:52 passwd_link -> /home/ekaterinarasskazova/passwd

2.2.1 mkdir fruits
2.2.2 cd /
mkdir ~/animals

2.2.3 touch /tmp/temp

2.2.4 echo "Hello" > /tmp/temp
echo "world" >> /tmp/temp
nano /tmp/temp

2.2.5 cd ~/fruits && touch apple banana pineaple lion

2.2.6 touch ~/animals/cat.txt ~/animals/dog.txt ~/animals/elephant.txt

2.2.7 ls a*
apple

2.2.8. ls *e
apple  pineaple

2.2.9 ls | grep 'a' | grep 'n'

2.2.10 cp /etc/passwd ~/
wc -l ~/passwd
26 /home/ekaterinarasskazova/passwd
ln -s ~/passwd ~/passwd_link
ls -i ~/passwd_link
37874 passwd_link

2.2.11 cat /etc/issue
Ubuntu 26.04.1 LTS \n \l

2.2.12 cp /etc/issue ~/fruits/apple
cat ~/fruits/apple
Ubuntu 26.04.1 LTS \n \l

2.2.13 mv ~/fruits/lion ~/animals/

2.2. 14 mv ~/fruits/pineaple ~/fruits/pineapple

2.2.15 ln ~/.bash_history ~/history_hardlink
stat "%h" ~/history_hardlink
2

2.2.16. cat var/log/bootstrap.log
(слишком много строк....)

2.3.1 cut -d: -f1 /etc/passwd | sort
_apt
_chrony
backup
bin
daemon
dhcpcd
ekaterinarasskazova
games
irc
list
lp
mail
man
messagebus
news
nobody
proxy
root
sync
sys
syslog
systemd-network
systemd-resolve
systemd- timesync
uucp
www-data

2.3.2 grep "/bin/bash" /etc/passwd | wc -l
2

2.3.3 grep "/bin/bash" /etc/passwd | cut -d: -f1 | sort -r
root
ekaterinarasskazova

2.3.4
awk -F: '{printf "%-20s %s\n", $1, $7}' /etc/passwd
  root /bin/bash
              daemon /usr/sbin/nologin
                 bin /usr/sbin/nologin
                 sys /usr/sbin/nologin
                sync /bin/sync
               games /usr/sbin/nologin
                 man /usr/sbin/nologin
                  lp /usr/sbin/nologin
                mail /usr/sbin/nologin
                news /usr/sbin/nologin
                uucp /usr/sbin/nologin
               proxy /usr/sbin/nologin
            www-data /usr/sbin/nologin
              backup /usr/sbin/nologin
                list /usr/sbin/nologin
                 irc /usr/sbin/nologin
                _apt /usr/sbin/nologin
              nobody /usr/sbin/nologin
     systemd-network /usr/sbin/nologin
              dhcpcd /bin/false
          messagebus /usr/sbin/nologin
              syslog /usr/sbin/nologin
     systemd-resolve /usr/sbin/nologin
             _chrony /usr/sbin/nologin
    systemd-timesync /usr/sbin/nologin
 ekaterinarasskazova /bin/bash

2.4.1 cat /etc/shadow
cat: /etc/shadow: Permission denied

2.4.2 groups
ekaterinarasskaz adm uucp dialout sudo audio video plugdev staff input orbstack

2.4.3 sudo cat /etc/shadow
root:*:20707:0:99999:7:::
daemon:*:20707:0:99999:7:::
bin:*:20707:0:99999:7:::
sys:*:20707:0:99999:7:::
sync:*:20707:0:99999:7:::
games:*:20707:0:99999:7:::
man:*:20707:0:99999:7:::
lp:*:20707:0:99999:7:::
mail:*:20707:0:99999:7:::
news:*:20707:0:99999:7:::
uucp:*:20707:0:99999:7:::
proxy:*:20707:0:99999:7:::
www-data:*:20707:0:99999:7:::
backup:*:20707:0:99999:7:::
list:*:20707:0:99999:7:::
irc:*:20707:0:99999:7:::
_apt:*:20707:0:99999:7:::
nobody:*:20707:0:99999:7:::
systemd-network:!*:20707:::::1:
dhcpcd:!*:20707:::::1:
messagebus:!*:20707::::::
syslog:!:20707::::::
systemd-resolve:!*:20707:::::1:
_chrony:!*:20707::::::
systemd-timesync:!*:20707:::::1:
ekaterinarasskazova:!:20707:0:99999:7:::

2.4.4 getent group sudo
sudo:x:27:ekaterinarasskazova

2.4.5 sudo apt update && sudo apt install -y build-essential
Hit:1 http://ports.ubuntu.com/ubuntu-ports resolute InRelease
Get:2 http://ports.ubuntu.com/ubuntu-ports resolute-updates InRelease [137 kB]
Get:3 http://ports.ubuntu.com/ubuntu-ports resolute-security InRelease [137 kB]
Get:4 http://ports.ubuntu.com/ubuntu-ports resolute-updates/main arm64 Packages [692 kB]
Get:5 http://ports.ubuntu.com/ubuntu-ports resolute-updates/universe arm64 Packages [294 kB]
Fetched 1260 kB in 2s (738 kB/s)  

2.4.6 gcc --version
gcc (Ubuntu 15.2.0-16ubuntu1) 15.2.0
Copyright (C) 2025 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
make --version
GNU Make 4.4.1
Built for aarch64-unknown-linux-gnu
Copyright (C) 1988-2023 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <https://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

2.5.1 find --help
Usage: find [-H] [-L] [-P] [-Olevel] [-D debugopts] [path...] [expression]

Default path is the current directory; default expression is -print.
Expression may consist of: operators, options, tests, and actions.

Operators (decreasing precedence; -and is implicit where no others are given):
      ( EXPR )   ! EXPR   -not EXPR   EXPR1 -a EXPR2   EXPR1 -and EXPR2
      EXPR1 -o EXPR2   EXPR1 -or EXPR2   EXPR1 , EXPR2

Positional options (always true):
      -daystart -follow -nowarn -regextype -warn

Normal options (always true, specified before other expressions):
      -depth -files0-from FILE -maxdepth LEVELS -mindepth LEVELS
      -mount -noleaf -xdev -ignore_readdir_race -noignore_readdir_race

Tests (N can be +N or -N or N):
      -amin N -anewer FILE -atime N -cmin N -cnewer FILE -context CONTEXT
      -ctime N -empty -false -fstype TYPE -gid N -group NAME -ilname PATTERN
      -iname PATTERN -inum N -iwholename PATTERN -iregex PATTERN
      -links N -lname PATTERN -mmin N -mtime N -name PATTERN -newer FILE
      -nouser -nogroup -path PATTERN -perm [-/]MODE -regex PATTERN
      -readable -writable -executable
      -wholename PATTERN -size N[bcwkMG] -true -type [bcdpflsD] -uid N
      -used N -user NAME -xtype [bcdpfls]

Actions:
      -delete -print0 -printf FORMAT -fprintf FILE FORMAT -print 
      -fprint0 FILE -fprint FILE -ls -fls FILE -prune -quit
      -exec COMMAND ; -exec COMMAND {} + -ok COMMAND ;
      -execdir COMMAND ; -execdir COMMAND {} + -okdir COMMAND ;

Other common options:
      --help                   display this help and exit
      --version                output version information and exit

Valid arguments for -D:
exec, opt, rates, search, stat, time, tree, all, help
Use '-D help' for a description of the options, or see find(1)

Please see also the documentation at https://www.gnu.org/software/findutils/.
You can report (and track progress on fixing) bugs in the "find"
program via the GNU findutils bug-reporting page at
https://savannah.gnu.org/bugs/?group=findutils or, if
you have no web access, by sending email to <bug-findutils@gnu.org>.

2.5.2 find . -name "*pass*"
ничего не вывелось

2.5.3 find . -iname "*pass*"
ничего не вывелось

2.5.4 find / -maxdepth 1 -name "*pass*"
ничего не вывелось

2.5.5 find /home -name "*.bin"
очень много строк

2.5.6 find . -type f -name "*.bak" -delete
много вывклось но ничего не удалилось

2.5.7 find . -type f \( -name "*.txt" -o -name "*.sh" \)
ничего

2.5.8 find . -type f -printf "%f\t%u\t%g\t%n\t%s bytes\n"
много вывелось вот парочку 
\items_assets_7673.bundle	ekaterinarasskazova	ekaterinarasskaz	7309 bytes
clothingcolors_assets_cat_dress_grayclothingsprites.bundle	ekaterinarasskazova	ekaterinarasskaz	1	28548 bytes
clothingcolors_assets_amarifish_custom_fix_hair10_blueclothingsprites.bundle	ekaterinarasskazova	ekaterinarasskaz	1	10908 bytes
otherassets_assets_watercolortigerwallscroll.bundle	ekaterinarasskazova	ekaterinarasskaz	1	5537 bytes
items_assets_7395.bundle	ekaterinarasskazova	ekaterinarasskaz	7604 bytes

2.5.9 find . -mindepth 1 -type d -empty
./.local/share/nano

2.5.10 find . -mindepth 1 -type d -empty -delete

2.5.11 find . -type f -empty -delete

2.5.12 find . -type f -links +1
./.bash_history
./history_hardlink

2.5.13 find /etc ! -user root
find: ‘/etc/credstore’: Permission denied
find: ‘/etc/credstore.encrypted’: Permission denied
find: ‘/etc/ssl/private’: Permission denied

2.5.14 find . -type f ! -name "*.sh"
\./.bash_logout
./.bashrc
./.profile
./.bash_history
./lab1/report.md
./passwd
./history_hardlink

2.5.15 find . -type f -links +2
ничего не вывелось

2.5.16 find /usr/bin -type f -atime +90
/usr/bin/apt
/usr/bin/apt-cache
/usr/bin/apt-cdrom
/usr/bin/apt-config
/usr/bin/apt-get
/usr/bin/apt-mark
/usr/bin/bash
/usr/bin/bashbug
/usr/bin/chage

2.5.17 find /usr/bin /usr/share -type f -mtime -10
ничего не вывелось

2.5.18 find /tmp -type f -mtime +14 -delete
