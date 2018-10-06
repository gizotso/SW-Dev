https://stackoverflow.com/questions/18338908/determining-proxy-server-port
ipconfig  /all | find /i "Dns Suffix"
ping
netsh winhttp show proxy


https://help.github.com/enterprise/2.10/admin/guides/installation/network-ports-to-open/

https://curl.haxx.se/docs/manpage.html
http_proxy=
HTTPS_PROXY=
R
Sys.setenv(http_proxy = "http://proxy.example.com")

# URL Rewriting
git config --global url."https://".insteadOf git://
git config --global url.https://github.com/.insteadOf git://github.com/

git config --global url."ssh://git@github.com".insteadOf git://github.com

git config --global --add core.gitProxy git-proxy

https://stackoverflow.com/questions/4891527/git-protocol-blocked-by-company-how-can-i-get-around-that
nmap github.com -p http,git
```
# Using nmap
# A state of "filtered" against port 9418 (git) means
#   that traffic is being filtered by a firewall
$ nmap github.com -p http,git

Starting Nmap 5.21 ( http://nmap.org ) at 2015-01-21 10:55 ACDT
Nmap scan report for github.com (192.30.252.131)
Host is up (0.24s latency).
PORT     STATE    SERVICE
80/tcp   open     http
9418/tcp filtered git

# Using Netcat:
# Returns 0 if the git protocol port IS NOT blocked
# Returns 1 if the git protocol port IS blocked
$ nc github.com 9418 < /dev/null; echo $?
1

# Using CURL
# Returns an exit code of (7) if the git protocol port IS blocked
# Returns no output if the git protocol port IS NOT blocked
$ curl  http://github.com:9418
curl: (7) couldn't connect to host
```