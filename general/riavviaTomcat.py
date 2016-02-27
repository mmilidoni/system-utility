#!/usr/bin/python

from subprocess import call, check_output

psout = check_output("ps aux | grep tomcat | grep -v grep", shell=True).split()
if len(psout) > 1:
    pid = psout[1]
    print pid
    call("kill -9 " + pid, shell=True)

call("/opt/tomcat/bin/startup.sh")

