#Summary
##file
Determine file type according to file structure. It even accepts wildcard filenames.
##find
Find files with given properties. Useful options are `-size`, `-type`, `-executable`, `-user` and `-group`. Use `\!` before an option if you want to exclude files with such property.
##grep
Show lines containing given keyword.
##sort
Sort lines of text files.
##uniq
Report or filter out repeated lines in a file. A very useful option is `-u`.
##strings
Find the printable strings in a object, or other binary, file.
##base64
Use `base64 -d` to decode base64-encoded data. Note that you have to use `-D` instead of `-d` on OS X.
##tr
Translate characters. A useful example is `tr 'A-Za-z' 'N-ZA-Mn-za-m'`, which does ROT13 encoding/decoding.
##xxd
Make a hexdump or do the reverse. A useful example is `xxd -r data.txt > data`.
##gunzip
Unzip gzip files. Note that the file extension have to be `.gz`.
##bunzip2
Unzip bzip2 files.
##tar
Unpack POSIX tar archive files. A useful example is `tar -xvf <file>`.
##ssh
Use `ssh user@hostname -i sshkey.private` to login with a private key. The `-t` option can be used to execute arbitrary screen-based programs on a remote machine. A useful example is `ssh bandit18@bandit.labs.overthewire.org -t 'cat readme'`.
##nc
Arbitrary TCP and UDP connections and listens. The `-l` option can be used to listen on a designated port.
##openssl s_client
It can be thought of as the SSL version of nc client. A useful example is `openssl s_client -connect localhost:30001 -quiet`.
##nmap
A network exploration tool. You can use it to discover open ports. A useful example is `nmap -p 31000-32000 localhost -sV`, which is to scan ports in the given range and detect the services running on the ports.
##diff
Compare files line by line. 
##/etc/cron.d
This directory contains all cron jobs.
##/etc/passwd
This file contains Linux users' information. You can see which program is invoked for a certain login user.
##more
A file browser. Press `v` to start an editor at current line.
##vi
`:r /file/to/copy` can be used to introduce the content of another file to the current file.
