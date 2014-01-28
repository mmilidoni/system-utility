Automated Backup System for Websites
====================================

Abs is a configurable, automated backup system for websites on FTP hosts. At the moment, MySQL and PostgreSQL are supported for databases backup. Sysadmin must only set a configuration file for each domain. Script can invoked with command line:

<pre>
./abs database|website|all domain.cfg
</pre>

It recommend to use *crontab* to automate backup activities, for example:

<pre>
# crontab -e

0 2 * * * /path/to/abs/abs database example.com.cfg
0 3 12,27 * * /path/to/abs/abs website example.com.cfg
</pre>


It uses configuration files to get backup informations. Configuration files must be located in config/ folder and named as *websitedomain.com.cfg*

<pre>
[General]
domain=example.com
# to protect zip files with password
zip_password=changeit 
# website location
site_location=/var/www/example.com/web 

# database credentials
db_type=mysql|postgresql
db_name=c1example
db_username=c1userex
# Database user password: Leave blank if dbms is PostgreSQL and there is .pgpass file on your home directory
# For details see http://www.postgresql.org/docs/current/static/libpq-pgpass.html
db_password=password

# Max number of website backup files on FTP host
n_max_files_site=10 
# Max number of database backup files on FTP host
n_max_files_db=30 
# Email address of the person who receive report
email_report=info@example.com 
# 0=receive mail report only when backup was wrong; 1=also receive mail report when backup completed
success_send_email=1 

# FTP credentials
[FTP]
ftp_server=ftp.ftpexample.com
ftp_user=userex
ftp_password=passwordex
</pre>

Finally, must set smtp credentials on *config.cfg* file.

<pre>
[SMTP]
smtp_server=
smtp_name=
smtp_email=
smtp_password=
</pre>

<br />
You can signal issues and requests on https://github.com/mmilidoni/system-utility/issues/
