# MySQL Installation

## Install MySQL

```bash 
# install latest version
$ brew install mysql

# install specific version
$ brew install mysql@9.2
```

## Check if MySQL installed

```bash
$ mysql --version
mysql  Ver 9.2.0 for macos14.7 on arm64 (Homebrew)
```

## Check MySQL status

- Check MySQL running or not

```bash
$ mysql.server status
 ERROR! MySQL is not running

$ mysql.server status
 SUCCESS! MySQL running (47692)
```

- Look for MySQL process

```bash
$ ps aux | grep mysql
```

- Check with Homebrew

```bash
$ brew services list | grep mysql
mysql none                 

$ brew services list
Name  Status  User              File
mysql started nguyen.tung.trang ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
```

## Start MySQL

```bash
$ brew services start mysql
```

Or, if you don't want/need a background service you can just run:

```bash
$ /opt/homebrew/opt/mysql/bin/mysqld_safe --datadir\=/opt/homebrew/var/mysql
```

MySQL is configured to only allow connections from localhost by default

## Connect to MySQL

```bash
# with `root` user
$ mysql -u root

# with a user
$ mysql -u newuser -p
# Then enter password when prompted
```

## Create user-specific config file

```bash
$ touch ~/.my.cnf
$ vi ~/.my.cnf
```

```ini
[client]
user=newuser
password=password

[mysqldump]
user=backup_user
password=backup_password
```

## Connect with env var

```bash
$ export MYSQL_USER=newuser
$ export MYSQL_PASSWORD=your_password

$ mysql
```

### Find locations of config file my.cnf 

```bash
$ mysql --help | grep my.cnf
                      order of preference, my.cnf, $MYSQL_TCP_PORT,
/etc/my.cnf /etc/mysql/my.cnf /opt/homebrew/etc/my.cnf ~/.my.cnf 
```

### Check which my.cnf is being used -- this command didn't work for me, it kept waiting...

```bash
$ sudo fs_usage | grep my.cnf
```

### Use custom config file

```bash
$ mysql --defaults-file=~/custom_config/.my.cnf
```

## List users in mysql

```bash
mysql> SELECT user, host FROM mysql.user;
+------------------+-----------+
| user             | host      |
+------------------+-----------+
| mysql.infoschema | localhost |
| mysql.session    | localhost |
| mysql.sys        | localhost |
| root             | localhost |
+------------------+-----------+
5 rows in set (0.01 sec)
```

Or with more details

```
mysql> SELECT user, host, authentication_string, plugin FROM mysql.user;
```

## Create a new user

- should create user with system username, check:

```bash
$ whoami
nguyen.tung.trang
```

```
-- Create user with password
mysql> CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';
mysql> GRANT ALL PRIVILEGES ON *.* TO 'newuser'@'localhost' WITH GRANT OPTION;
mysql> FLUSH PRIVILEGES;
```

## Drop user

```
mysql> DROP USER 'user_to_drop'@'localhost';
Query OK, 0 rows affected (0.00 sec)
```

## Show privileges for a specific user

```
mysql> SHOW GRANTS FOR 'nguyen.tung.trang'@'localhost';
```

## See who's logged in

```
mysql> SELECT CURRENT_USER();
+----------------+
| CURRENT_USER() |
+----------------+
| root@localhost |
+----------------+
1 row in set (0.00 sec)
```

## References

- How to install MySQL on Mac: https://medium.com/@rodolfovmartins/how-to-install-mysql-on-mac-959df86a5319
- How to check if MySQL is installed on Mac: https://medium.com/@binda19870000/how-to-check-if-mysql-is-installed-on-mac-86556b6c5fa7
