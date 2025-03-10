# TAX - Setting up tax_adjustment_web in local machine

## Table of Contents

- [Installation](#installation)
  - [Using puma-dev with MFID staing on local](#using-puma-dev-with-mfid-staing-on-local)
  - [References](#references)
- [Errors](#errors)
  - [installing mysql2](#installing-mysql2)
  - [installing nio4r](#installing-nio4r)
  - [Can't connect to local MySQL server through socket '/tmp/mysql.sock'](#can-t-connect-to-local-mysql-server-through-socket-tmp-mysql-sock)
  - [installing old version of nodejs 14.21.3](#installing-old-version-of-nodejs-14213)
  - [Error with webpack-dev-server](#error-with-webpack-dev-server)

## INSTALLATION

### Using puma-dev with MFID staing on local

[Link](https://moneyforwardvietnam.atlassian.net/wiki/spaces/TA/pages/2437513217/Using+puma-dev+with+MFID+staging+on+local)

#### Start your puma-dev and access with http://ta.mfvn.test

SITE_DOMAIN: host_name

example: ta.mfvn.test

Note: Run puma-dev with rails server

```bash
cd ~/.puma-dev 

rm ta.mfvn 

echo 3000 > ~/.puma-dev/ta.mfvn 

pkill -USR1 puma-dev 

cd /rails-app/ rails s
```

### References

- [Puma-dev And Using It With Rails Applications](https://blog.saeloun.com/2024/07/12/rails-puma-dev/)
- [puma-dev](https://github.com/puma/puma-dev)

## ERRORS

### installing mysql2

```bash
-----
Using --with-openssl-dir=/Users/nguyen.tung.trang/.asdf/installs/ruby/3.1.4/openssl
-----

...

-----
Using mysql_config at /opt/homebrew/bin/mysql_config
-----

-----
Don't know how to set rpath on your system, if MySQL libraries are not in path mysql2 may not load
-----

...

linking shared-object mysql2/mysql2.bundle
ld: warning: ignoring duplicate libraries: '-lruby.3.1'
ld: library 'zstd' not found
clang: error: linker command failed with exit code 1 (use -v to see invocation)
make: *** [mysql2.bundle] Error 1

make failed, exit code 2
```

**Reason:**

The error occurred because on macOS ARM64 (Apple Silicon), the default build process couldn't locate these dependencies automatically, especially the zstd library which MySQL uses for compression.

**Solution:**

Link: https://github.com/brianmario/mysql2/issues/1335#issuecomment-2054191556

```bash
bundle config --local build.mysql2 -- \
  --with-mysql-config=$(brew --prefix mysql)/bin/mysql_config \
  --with-ldflags="-L$(brew --prefix zstd)/lib -L$(brew --prefix openssl)/lib" \
  --with-cppflags=-I$(brew --prefix openssl)/include \
  --with-cflags="-Wno-error=implicit-function-declaration"
```

1. `bundle config --local build.mysql2`: This sets local configuration for building the mysql2 gem

2. `--with-mysql-config=$(brew --prefix mysql)/bin/mysql_config`:
   - Tells the build process where to find MySQL configuration
   - `$(brew --prefix mysql)` gets the Homebrew installation path for MySQL

3. `--with-ldflags="-L$(brew --prefix zstd)/lib -L$(brew --prefix openssl)/lib"`:
   - `-L` flags tell the linker where to look for libraries
   - Adds paths to both the zstd and openssl libraries
   - This specifically fixes the `library 'zstd' not found` error by pointing to the correct location

4. `--with-cppflags=-I$(brew --prefix openssl)/include`:
   - Adds the OpenSSL include path for C++ preprocessing
   - Ensures the compiler can find OpenSSL headers

5. `--with-cflags="-Wno-error=implicit-function-declaration"`:
   - Disables errors for implicit function declarations
   - Helps prevent compilation failures due to stricter C standards in newer compilers

This command works because it:
1. Properly links all required libraries (MySQL, zstd, OpenSSL)
2. Provides correct paths for includes and libraries
3. Adjusts compiler flags to be more permissive with older code


### installing nio4r

```bash
An error occurred while installing nio4r (2.5.8), and Bundler cannot continue.
```

**Reason:**

The error occurs while trying to install the nio4r gem (version 2.5.8) on macOS ARM64 (Apple Silicon). The key error is:

```selector.c:301:26: error: incompatible function pointer types passing 'VALUE (*)(VALUE *)' (aka 'unsigned long (*)(unsigned long *)') to parameter of type 'VALUE (*)(VALUE)' (aka 'unsigned long (*)(unsigned long)') [-Wincompatible-function-pointer-types]```

**Solution:**

This is a known issue with nio4r on newer versions of macOS/Ruby. 

Run this command:

```
bundle config build.nio4r --with-cflags="-Wno-incompatible-pointer-types"
```

### Can't connect to local MySQL server through socket '/tmp/mysql.sock'

**Description:**

```bash
$ bin/rails db:create

/Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/config/initializers/constants.rb:218: warning: character class has '-' without escape: /\A[a-zA-Z0-9-\/]+\z/
/Users/nguyen.tung.trang/.asdf/installs/ruby/3.1.4/lib/ruby/gems/3.1.0/gems/bootsnap-1.11.1/lib/bootsnap/compile_cache/iseq.rb:49: warning: character class has '-' without escape: /\A[a-zA-Z0-9-\/]+\z/
WARNING: MYSQL_OPT_RECONNECT is deprecated and will be removed in a future version.
Can't connect to local MySQL server through socket 'hoge/hoge' (2)
Couldn't create 'tax_adjustment_web' database. Please check your configuration.
rails aborted!
ActiveRecord::ConnectionNotEstablished: Can't connect to local MySQL server through socket 'hoge/hoge' (2)


Caused by:
Mysql2::Error::ConnectionError: Can't connect to local MySQL server through socket 'hoge/hoge' (2)
```

**Reason:**

The error `Can't connect to local MySQL server through socket 'hoge/hoge'` means that MySQL can't find the socket file at the specified location (`hoge/hoge`).

**Solution:**

A MySQL socket is a file-based method for connecting to MySQL on Unix-like systems (including macOS). Instead of connecting through TCP/IP networking, it uses a socket file for communication between the MySQL client and server when they're on the same machine. This is generally faster and more secure than TCP/IP connections since it's local-only.

The error `Can't connect to local MySQL server through socket 'hoge/hoge'` means that MySQL can't find the socket file at the specified location (`hoge/hoge`).

To fix this:

1. First, find your actual MySQL socket location. On macOS with Homebrew, you can find it by running:
```bash
$ mysql_config --socket
/tmp/mysql.sock

# or
$ brew info mysql
```
The socket is typically located at:
- `/tmp/mysql.sock`
- `/var/run/mysqld/mysqld.sock`
- For Homebrew installations: `/opt/homebrew/var/mysql/mysql.sock`

2. Then update your `.env` file with the correct socket path:
```env:/.env
# database
DATABASE_USERNAME=nguyen.tung.trang
DATABASE_PASSWORD=Qw3r
DATABASE_SOCKET=/opt/homebrew/var/mysql/mysql.sock  # Update this line
```

Alternatively, if you don't need socket-based connection, you can:

1. Use host-based connection instead by removing the socket configuration and using:
```env:/.env
# database
DATABASE_USERNAME=<username>
DATABASE_PASSWORD=<password>
DATABASE_HOST=127.0.0.1  # or localhost
DATABASE_PORT=3306       # default MySQL port
```

Benefits of using sockets:
- Faster performance for local connections
- More secure (no network exposure)
- No TCP/IP overhead

Benefits of using TCP/IP (host-based):
- Works across different machines
- More flexible for different configurations
- Easier to set up in some cases

#### installing old version of nodejs 14.21.3

I got stuck with some errors when using `asdf` to install nodejs 14.21.3. So use `nvm`!

** Install nvm **

1. Before proceeding to the next step I needed to manually install Rosetta 2 in order run apps not built for Apple silicon.

```bash
$ softwareupdate --install-rosetta
```

2. Install nvm

```bash
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
```

This last command will update your .zshrc file to look like the following:

```bash   
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

3. Install nodejs 14.21.3

```bash
# Start a new zsh shell with x86_64 architecture before installing the nodejs.
$ arch -x86_64 zsh

$ nvm install 14.21.3
```

4. Set the installed version as the default

```bash
$ nvm use 14.21.3
```

#### install yarn

After installing node, install yarn globally using npm.

```bash
$ npm -v
6.14.18

$ npm install --global yarn

$ yarn -v
1.22.22
```

### Error with webpack-dev-server

```bash
ERROR in ./node_modules/@hotwired/turbo/dist/turbo.es2017-esm.js 74:19
Module parse failed: Unexpected token (74:19)
File was processed with these loaders:
 * ./node_modules/babel-loader/lib/index.js
You may need an additional loader to handle the result of these loaders.
|   const element = target instanceof Element ? target : target instanceof Node ? target.parentElement : null;
|   const candidate = element ? element.closest("input, button") : null;
>   return candidate?.type == "submit" ? candidate : null;
| }
| function clickCaptured(event) {
ℹ ｢wdm｣: Failed to compile.
```

**Solution: Downgrade Turbo Rails**

The error occurs because you're using Turbo Rails 8.0.4, which uses modern JavaScript features that your current Babel configuration doesn't support.

Here's how to downgrade to a compatible version:

1. Update your `package.json` to use an older version of Turbo Rails:

```json
{
  "dependencies": {
    "@hotwired/turbo-rails": "^7.3.0",
    // other dependencies remain the same
  }
}
```

2. Run npm or yarn to update the package:

```bash
npm install
# or if you use yarn
yarn install
```

3. Keep your current application.js setup:

```javascript
import "@hotwired/turbo-rails"
// disable Turbo Drive on whole application
Turbo.session.drive = false
```

**Why This Works**

- Turbo Rails 7.x versions use JavaScript syntax that's compatible with your current Babel configuration
- You'll still have access to Turbo Streams which your application is using
- You won't need to modify your Babel configuration