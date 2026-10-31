

### 2.1.1
```bash
mkdir ~/test
cd ~/test
touch file
ls -l file
```

### 2.1.2
```bash
chmod 000 file
ls -l file
echo "hello" > file
cat file
```

### 2.1.3
```bash
chmod 200 file
echo "hello" > file
cat file
```

### 2.1.4
```bash
chmod g+r file
ls -l file
cat file
```

### 2.1.5
```bash
chmod u+r file
cat file
```

### 2.1.6
```bash
mkdir dir
echo "text" > dir/new_file
ls -l dir
```

### 2.1.7
```bash
chmod a-x dir
ls -ld dir
ls dir
cat dir/new_file
rm dir/new_file
chmod 755 dir
```

### 2.1.8
```bash
chown root file
```

### 2.1.9
```bash
umask
umask 077
touch file9
ls -l file9
```

### 2.1.10
```bash
umask 000
touch file10
ls -l file10
umask 022
```

### 2.1.11
```bash
# во втором окне терминала
su -
cd /home/ЛОГИН/test
chown root file
chmod 400 file
exit
```

### 2.1.12
```bash
cat file
su -
chmod g+r /home/ЛОГИН/test/file
exit
cat file
```

## 2.2. Управление пользователями и группами

### 2.2.1
```bash
whoami
id -u
id -g
id -Gn
id
```

### 2.2.2
```bash
getent passwd $USER
getent group $(id -g)
```

### 2.2.3
```bash
sudo groupadd labgroup
getent group labgroup
```

### 2.2.4
```bash
sudo useradd -m -s /bin/bash labuser
getent passwd labuser
id labuser
ls -ld /home/labuser
```

### 2.2.5
```bash
sudo passwd labuser
su - labuser
whoami
id
pwd
exit
```

### 2.2.6
```bash
su - labuser
touch ~/myfile
ls -l ~/myfile
exit
```

### 2.2.7
```bash
sudo usermod -aG labgroup labuser
id labuser
su - labuser -c id
```

### 2.2.8
```bash
sudo useradd -m -s /bin/bash labuser2
sudo passwd labuser2
sudo usermod -aG labgroup labuser2
getent group labgroup
id labuser
id labuser2
```

### 2.2.9
```bash
sudo mkdir /tmp/lab_shared
sudo chgrp labgroup /tmp/lab_shared
sudo chmod 770 /tmp/lab_shared
ls -ld /tmp/lab_shared
sudo -u labuser touch /tmp/lab_shared/f_labuser
sudo -u labuser2 touch /tmp/lab_shared/f_labuser2
ls -l /tmp/lab_shared
```

### 2.2.10
```bash
sudo -u labuser sh -c 'echo secret > /tmp/lab_shared/doc.txt'
ls -l /tmp/lab_shared/doc.txt
sudo -u labuser2 cat /tmp/lab_shared/doc.txt
sudo -u labuser2 sh -c 'echo x >> /tmp/lab_shared/doc.txt'
sudo -u labuser2 rm /tmp/lab_shared/doc.txt
```

### 2.2.11
```bash
sudo -u labuser touch /tmp/lab_shared/before1
sudo -u labuser2 touch /tmp/lab_shared/before2
ls -l /tmp/lab_shared/before*
sudo chmod g+s /tmp/lab_shared
ls -ld /tmp/lab_shared
sudo -u labuser touch /tmp/lab_shared/after1
sudo -u labuser2 touch /tmp/lab_shared/after2
ls -l /tmp/lab_shared/after*
```

### 2.2.12
```bash
sudo mkdir /tmp/sticky_dir
sudo chmod 1777 /tmp/sticky_dir
ls -ld /tmp/sticky_dir
sudo -u labuser touch /tmp/sticky_dir/a
sudo -u labuser2 touch /tmp/sticky_dir/b
sudo -u labuser2 rm -f /tmp/sticky_dir/a
sudo -u labuser2 rm -f /tmp/sticky_dir/b
```

### 2.2.13
```bash
sudo usermod -L labuser
sudo passwd -S labuser
su - labuser
sudo usermod -U labuser
sudo passwd -S labuser
su - labuser
```

### 2.2.14
```bash
sudo chage -l labuser
sudo chage -d 0 labuser
sudo chage -l labuser
su - labuser
```

### 2.2.15
```bash
cat /etc/shells
sudo chsh -s /bin/sh labuser
getent passwd labuser
sudo chsh -s /bin/bash labuser
getent passwd labuser
```

### 2.2.16
```bash
sudo touch /home/labuser2/proof
sudo chown labuser2: /home/labuser2/proof
sudo userdel labuser2
ls -ld /home/labuser2
sudo ls -l /home/labuser2
```

### 2.2.17
```bash
cat /etc/passwd
grep -E '^(daemon|www-data|sshd|nobody):' /etc/passwd
getent passwd $USER
```

### 2.2.18
```bash
grep -E '^(UID_MIN|UID_MAX|SYS_UID_MIN|SYS_UID_MAX)' /etc/login.defs
awk -F: '{print $1, $3}' /etc/passwd | sort -k2 -n
```

### 2.2.19
```bash
sudo useradd -m -s /bin/bash testuser
sudo passwd testuser
sudo useradd -r testsystem
getent passwd testuser testsystem
id testuser
id testsystem
ls -ld /home/testuser /home/testsystem
```

### 2.2.20
```bash
sudo userdel testsystem
sudo useradd -r -m testsystem
getent passwd testsystem
ls -ld /home/testsystem
```

### 2.2.21
```bash
grep -E 'nologin|false' /etc/passwd
command -v nologin
command -v false
ls -l /usr/sbin/nologin /bin/false
```

### 2.2.22
```bash
sudo usermod -s /usr/sbin/nologin testuser
su - testuser
su -c id testuser
sudo -u testuser id
```

### 2.2.23
```bash
sudo usermod -s /bin/false testuser
su - testuser
echo $?
```

### 2.2.24
```bash
sudo usermod -s /bin/bash testuser
su - testuser
exit
```

### 2.2.25
```bash
sudo usermod -s /bin/ls testuser
getent passwd testuser
su - testuser
sudo usermod -s /bin/bash testuser
getent passwd testuser
```

### 2.2.26
```bash
sudo groupadd -r testsystemgroup
sudo groupadd testgroup
getent group testsystemgroup testgroup
```

### 2.2.27
```bash
grep -E '^(GID_MIN|GID_MAX|SYS_GID_MIN|SYS_GID_MAX)' /etc/login.defs
```

### 2.2.28
```bash
sudo useradd -r -g testsystemgroup -M -s /usr/sbin/nologin serviceuser
grep serviceuser /etc/passwd
```

### 2.2.29
```bash
su - testuser
sudo id
exit
```

### 2.2.30
```bash
command -v id
sudo visudo -f /etc/sudoers.d/testuser
# добавить строку: testuser ALL=(root) /usr/bin/id
su - testuser
sudo id
sudo whoami
sudo -l
exit
```

### 2.2.31
```bash
sudo visudo -f /etc/sudoers.d/testuser
# заменить строку на: testuser ALL=(root) /usr/bin/id, /usr/bin/whoami
su - testuser
sudo id
sudo whoami
sudo cat /etc/shadow
exit
```

### 2.2.32
```bash
sudo rm /etc/sudoers.d/testuser
sudo groupadd testadmins
sudo visudo -f /etc/sudoers.d/testadmins
# добавить строку: %testadmins ALL=(root) /usr/bin/id
sudo usermod -aG testadmins testuser
su - testuser -c 'sudo id'
sudo gpasswd -d testuser testadmins
```

### Резервные копии (перед 2.2.33)
```bash
sudo cp -a /etc/login.defs /etc/login.defs.orig
sudo cp -a /etc/default/useradd /etc/default/useradd.orig
```

### 2.2.33
```bash
grep -vE '^\s*#|^\s*$' /etc/login.defs
man login.defs
```

### 2.2.34
```bash
awk -F: '{print $3}' /etc/passwd | sort -n | tail
setdef UID_MIN 5000
sudo useradd -m configuser1
id configuser1
sudo userdel -r configuser1
sudo cp -a /etc/login.defs.orig /etc/login.defs
```

### 2.2.35
```bash
setdef SYS_UID_MIN 800
setdef SYS_UID_MAX 850
sudo useradd -r sysconfig1
sudo useradd -r sysconfig2
sudo useradd -r sysconfig3
id sysconfig1
id sysconfig2
id sysconfig3
sudo userdel sysconfig1
sudo userdel sysconfig2
sudo userdel sysconfig3
sudo cp -a /etc/login.defs.orig /etc/login.defs
```

### 2.2.36
```bash
setdef GID_MIN 6000
sudo groupadd configgroup1
getent group configgroup1
sudo groupdel configgroup1
sudo cp -a /etc/login.defs.orig /etc/login.defs
```

### 2.2.37
```bash
setdef SYS_GID_MIN 700
setdef SYS_GID_MAX 750
sudo groupadd -r sysgroup1
sudo groupadd -r sysgroup2
sudo groupadd -r sysgroup3
getent group sysgroup1 sysgroup2 sysgroup3
sudo groupdel sysgroup1
sudo groupdel sysgroup2
sudo groupdel sysgroup3
sudo cp -a /etc/login.defs.orig /etc/login.defs
```

### 2.2.38
```bash
grep CREATE_HOME /etc/login.defs
setdef CREATE_HOME yes
sudo useradd homeuser1
ls -ld /home/homeuser1
setdef CREATE_HOME no
sudo useradd homeuser2
ls -ld /home/homeuser2
sudo userdel -r homeuser1
sudo userdel homeuser2
sudo cp -a /etc/login.defs.orig /etc/login.defs
```

### 2.2.39
```bash
setdef CREATE_HOME yes
sudo useradd -r syshome1
ls -ld /home/syshome1
sudo useradd -r -m syshome2
ls -ld /home/syshome2
sudo userdel syshome1
sudo userdel -r syshome2
sudo cp -a /etc/login.defs.orig /etc/login.defs
```

### 2.2.40
```bash
grep -E '^(UMASK|HOME_MODE)' /etc/login.defs
sudo useradd -m umaskuser1
stat -c '%a %n' /home/umaskuser1
setdef HOME_MODE 0700
sudo useradd -m umaskuser2
stat -c '%a %n' /home/umaskuser2
sudo userdel -r umaskuser1
sudo userdel -r umaskuser2
sudo cp -a /etc/login.defs.orig /etc/login.defs
```

### 2.2.41
```bash
grep USERGROUPS_ENAB /etc/login.defs
sudo useradd -m ugroup1
id ugroup1
getent group ugroup1
setdef USERGROUPS_ENAB no
sudo useradd -m ugroup2
id ugroup2
getent group ugroup2
sudo cp -a /etc/login.defs.orig /etc/login.defs
sudo userdel -r ugroup1
sudo userdel -r ugroup2
```

### 2.2.42
```bash
sudo useradd -D
sudo useradd -D -s /bin/bash
sudo useradd -m defaultuser1
grep defaultuser1 /etc/passwd
sudo useradd -D -s /bin/sh
```

### 2.2.43
```bash
sudo mkdir -p /opt/users
sudo useradd -D -b /opt/users
sudo useradd -m defaultuser2
getent passwd defaultuser2
sudo useradd -D -b /home
sudo userdel -r defaultuser1
sudo userdel -r defaultuser2
```
