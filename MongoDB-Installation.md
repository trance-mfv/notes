# MongoDB Installation

## Download the official Homebrew formula for MongoDB

```bash
$ brew tap mongodb/brew
```

## Update Homebrew and all existing formulae

```bash
$ brew update
```

## Install MongoDB and the Database Tools

```bash
$ brew install mongodb-community@8.0
```

The installation includes:

- The mongod server
- The mongos sharded cluster query router
- The MongoDB Shell, mongosh

## Location of config files:

| File Type | Intel Processor | Apple Silicon Processor |
|-----------|----------------|------------------------|
| Config | /usr/local/etc/mongod.conf | /opt/homebrew/etc/mongod.conf |
| Log Directory | /usr/local/var/log/mongodb | /opt/homebrew/var/log/mongodb |
| Data Directory | /usr/local/var/mongodb | /opt/homebrew/var/mongodb |

## Run MongoDB (i.e. the mongod process) as a macOS service

```bash
$ brew services start mongodb-community@8.0
```

## Stop a mongod running as a macOS service

```bash
$ brew services stop mongodb-community@8.0
```

## Check MongoDB is running

```bash
$ brew services list
```

Or 

```bash
$ ps aux | grep -v grep | grep mongod
```

## Connect and Use MongoDB

```bash
$ mongosh
```

## MongoDB Database Tools

https://www.mongodb.com/docs/database-tools/

## Diagnostic Tools

```bash
$ mongostat
$ mongotop
```

## References

- MongoDB Installation: https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-os-x/
- MongoDB Homebrew Formulae: https://github.com/mongodb/homebrew-brew
