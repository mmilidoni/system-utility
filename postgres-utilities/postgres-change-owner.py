import sys

if sys.version_info < (2, 7):
    print "Python 2.7 or greater needed"
    exit(1)

from subprocess import check_output, call

if len(sys.argv) < 3:
    print "Usage: " + sys.argv[0] + " db " + "owner"
    exit(1)

db = sys.argv[1]
owner = sys.argv[2]

tabelle = check_output(["psql -Upostgres -qAt -c \"select tablename from pg_tables where schemaname = 'public';\" " + db], shell=True).strip().split("\n");
sequenze = check_output(["psql -Upostgres -qAt -c \"select sequence_name from information_schema.sequences where sequence_schema = 'public';\" " + db], shell=True).strip().split("\n");
viste = check_output(["psql -Upostgres -qAt -c \"select table_name from information_schema.views where table_schema = 'public';\" " + db], shell=True).strip().split("\n");

print "Changing database"
check_output("psql -Upostgres -c \"ALTER DATABASE " + db + " OWNER TO "+ owner +"\" ", shell=True)

print "Changing schema"
check_output("psql -Upostgres -c \"ALTER SCHEMA public OWNER TO "+ owner +"\" " + db, shell=True)

print "Changing tables"
for tbl in tabelle:
    if tbl:
        check_output("psql -Upostgres -c \"alter table " + tbl + " owner to " + owner + "\" " + db + ";", shell=True)

print "Changing sequences"
for tbl in sequenze:
    if tbl:
        check_output("psql -Upostgres -c \"alter table " + tbl + " owner to " + owner + "\" " + db + ";", shell=True)

print "Changing views"
for tbl in viste:
    if tbl:
        check_output("psql -Upostgres -c 'alter table \"" + tbl + "\" owner to " + owner + "' " + db + ";", shell=True)


