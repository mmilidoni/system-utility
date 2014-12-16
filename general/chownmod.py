from os import stat
from pwd import getpwuid
import sys
import subprocess

def find_owner(filename):
    return getpwuid(stat(filename).st_uid).pw_name

if len(sys.argv) < 2:
	print "Syntax error"

owner = str(stat(sys.argv[1]).st_uid)
group = str(stat(sys.argv[1]).st_gid)


print "Scelta:"
print "-------"
print "1: imposta a "+owner+":"+group+" tutti i file e directory"
print "2: imposta a 644 i permessi dei file"
print "3: imposta a 755 i permessi delle directory"
print "4: fai tutto"

user_input = raw_input("Inserisci: ")

if user_input is 1 or user_input is 4:
	subprocess.call("chown -R "+owner+":"+group+" *", shell=True)
if user_input is 2 or user_input is 4:
	subprocess.call("find . -type f -exec chmod 644 {}\;", shell=True)
if user_input is 3 or user_input is 4:
	subprocess.call("find . -type d -exec chmod 755 {}\;", shell=True)

