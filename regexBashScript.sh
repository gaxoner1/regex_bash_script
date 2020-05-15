echo
echo -n  “Hello, “
usrName=$(grep $USER /etc/passwd | cut -d: -f5 | cut -d, -f1)
echo -n "$usrName!"
echo 
### greped through /etc/passwd dir which has user info, seperated by ":" delimeter
### cut out column 5 that has first name and other info, cut further by "," delimeter
### and output first field of csv which is first name.
echo

clsNum=$(groups | tr ' ' '\n' | grep "^c" | wc -l)
echo "You are in $clsNum class(es) this semester."
### groups returns one line of class info, seperated by space;
### tr replaces space with new line so grep can search line by line for pattern
### grep matches CS classes by filtering for "start with C" then counting lines for total.
echo

host=$(hostname)
echo "The name of your host is $host."
### hostname returns host logeged into.

up=$(uptime | cut -d, -f1 | grep -o "[0-9]\ days*$")
echo -n  "It has been up for $up."
### uptime returns several comma seperated fields including days of uptime. piping cut will return
### field 1 - returning info including time and days. Using grep, on result bash will highlight only
### (x days) by pattern matching starts w/ number, followed by space and includes d-a-y, s is optional
### to include day > 1. Grep returns entire line, but grep -o option only outputs specific match.

numUsers=$(uptime | cut -d, -f3 | xargs)
echo -n " There are $numUsers logged on"
### uptime returns number of users logged in in field three. Cut outputs only field 3 after filtering by
### comma delimiter. _users returns white space in front so xargs piped to trim and handle.

proCount=$(ps aux --no-headers | wc -l)
echo -n " and there are $proCount total processes."
### ps aux returns list of all processes, including header, no header option to remove from count since counting line by line wtih wc -l
echo

cmdDir=$(sed "s/:/\n /g" <<< $PATH)
echo
echo -e  "You search commands in these directories (in order):\n $cmdDir"
### $ PATH list all directories delimited by (:). Sed substitudes (:) with new line. Path content stdin to sed for output.
echo

fileCount=$(find $HOME -type f | wc -l)
echo "There are $fileCount files in your home directory."
### find looks through /home directory. -type f returns all files. Piped with wc to count list line by line for result.
echo
