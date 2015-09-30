Yet Another %100 Working iCloud Bruteforce PoC..

Tested on Ubuntu, Linux Mint, Windows 7 and OSX Yosemite


Disclaimer: Do whatever you want with this code as long as you give me credit (@Pr0x13) 
Check and make sure its legal in your country to use this tool before doing so.
I'm not responsible for any damage done whatsoever to anyones iCloud account or iDevice.
I Didn't exploit any accounts while writing this.

This version is (hopefully) more robust- 

Features:
Word-Mangling thanks to JTR

True Bruteforce (if you have a few years to wait)

Automatic Rate Limiter Sensing Feature (Hopefully won’t DDoS apple servers this time) =]

Ability to Bruteforce Apple Web Objects Server backends

Multi-Curl - huge timing performance boost 

CLI

Dependencies:
php5-cli
php5-curl

The included wordlist is taken from 6 actual database leaks, duplicates removed and sanitized to more suit apple password requirements. Wordlist.lst I made by sorting only passwords with more than 8 characters, removed all numeric passes, removed consecutive characters (3 characters or more), removed all lowercase passwords, passwords without a capital letter and also a number. 
Mangle.lst is slightly different, it consists of passwords 7 characters or more,  and numeric passwords removed. Depending on the charset you use for mangling you can really make use of it. Both are far from perfect and need more cleaning most likely. They are only provided as a starting point, you should really get a different wordlist. Make sure it satisfies Apple’s password requirements here https://support.apple.com/en-us/HT201303

Linux Note: If you don't already have them
"sudo apt-get install php5-cli php5-curl"

Mac Note:Brew needs to be installed from here http://brew.sh/ then from terminal "brew install wget"
or just compile it from source

Windows Note: Cygwin needs to be installed, and these packages added "php-curl,php-jsonc,wget" (if you get a stat error and john wont compile it will still work but without mangling), 

OR manually build directory from install.sh, download external module, install curl for windows and john pre-compiled for win32/64,should be invoked like this: 

C:\PHP5\php.exe -f "C:\PHP Scripts\iBrutr" -- -arg1 -arg2 -arg3


Usage:

./install.sh

(if it hangs on downloading, don’t exit just give it some time)

Choose SYSTEM to compile on the left hand side

php iBrutr

OR(while you can until a server is patched)

php MultiBrutr

example:$ php iBrutr -u username@icloud.com

example:$ php iBrutr -u username@icloud.com -t 10

example:$ php iBrutr -u username@icloud.com -r 10 
(note about RandomTime) -r has preset default of minimum 3 seconds, argument sets maximum time 

example:$ php iBrutr -u username@icloud.com -m

example:$ php iBrutr -u username@icloud.com -m -w wordlist.lst

example:$ php iBrutr -u username@icloud.com -w wordlist.lst


Included in tools is configmake, use that to update config file with your own server info.



This uses John the Ripper and Crunch both available under GNU Public License.

MultiBrutr is an example i wrote of abusing multi curl  to brute force two different servers. 
Use it until one of the servers are fixed..

clean and add are some hacky pipe apps i wrote to clean a collection of wordlists utilizing pipes for 
the best performance. it contains a couple regex that (hopefully) satisfies Apple ID Password Requirements. Pipe it through JTRs Unique with 3 parallel pipes like this 

name your wordlists 0-*.dic


Usage:
-c (number of wordlists)

-m (mangle ready)

:$ php add -c 5 | php clean | ./unique wordlist.lst

:$ php add -c 5 -m | php clean | ./unique mangle.lst



                        Until Next Time-    @Pr0x13
