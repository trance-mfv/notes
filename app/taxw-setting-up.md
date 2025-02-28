# TAX - Setting up tax_adjustment_web

## Run the app with Docker

**Steps to run the application:**

1. First, create the external network that both compose files use:
```bash
$ docker network create traefik_proxy
```

2. Start the dependencies (MySQL and Redis):
```bash
$ docker compose -f docker-compose-env.yml up -d
```

3. Build and start the application:
```bash
# Build the image
$ docker compose build

# Build the image no cache
$ docker-compose build --no-cache --build-arg BUNDLE_GITHUB__COM={personal-access-token}

# Start the services
$ docker compose up -d
```

4. Create the database and run the migrations:

```bash
$ docker exec tax_adjustment_web-app-1 bundle exec rails db:create
$ docker exec tax_adjustment_web-app-1 bundle exec rails db:migrate

# Run the data patches
$ docker exec tax_adjustment_web-app-1 bundle exec rails r data_patch/2022/1212_setup_municipalities_master_data.rb
$ docker exec tax_adjustment_web-app-1 bundle exec rails r data_patch/2022/0512_update_postal_code.rb
```

**NOTES:**
- The application code is mounted as a volume, so any changes you make will be reflected without rebuilding
- The database environment variables in `.env` match the MySQL container setup

```
DATABASE_NAME=tax_adjustment_web
DATABASE_USERNAME=root
DATABASE_PASSWORD=
DATABASE_HOSTNAME=mysqldb
```

- Update the Redis URLs to use the container names instead of `localhost`. Docker's internal DNS will resolve this name to the correct container IP address:
```
# REDIS_URL
REDIS_URL=redis://redis:6379/5

# SIDEKIQ
SIDEKIQ_REDIS_URL=redis://redis:6379/0

#NAVIS_CACHE
TA_CACHING_NAVIS_REDIS_URL=redis://redis:6379/1
```

- Update the MongoDB URLs to use the container names instead of `localhost`. Docker's internal DNS will resolve this name to the correct container IP address:
```
MONGODB_HOSTS_AND_PORT=mongodb://mongo:27017
```

- If you're not sure where Redis is configured in your application, you can search for Redis-related code:

```bash
$ docker exec tax_adjustment_web-app-1 grep -r "Redis" --include="*.rb" config/
```

- Restart your application container to apply the changes if needed:

```bash
$ docker restart tax_adjustment_web-app-1
```

- You can view logs using:
```bash
# All services
$ docker compose logs -f

# Specific service
$ docker compose logs -f tax_adjustment_web-app-1
```

To stop everything:
```bash
# Stop the app
$ docker compose down

# Stop the dependencies
$ docker compose -f docker-compose-env.yml down
```

5. Run `webpack-dev-server` from host machine

- In your `docker-compose.yml`, you need to expose your host machine's `webpack-dev-server` to the Docker container:

```yml
  app:
    # other configs ...
    environment:
      RAILS_ENV: development
      WEBPACKER_DEV_SERVER_HOST: host.docker.internal
      WEBPACKER_DEV_SERVER_PUBLIC: localhost:3035
```

- Run `webpack-dev-server` from host machine

```bash
$ ./bin/webpack-dev-server
```

## Run the app in local machine

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

In Gemfile, add:

```
gem 'nio4r', '~> 2.7', '>= 2.7.1'
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

## Alternative Solutions

If downgrading isn't an option, you have two other choices:

1. **Add the Babel plugin** as suggested in my previous response

  - install Babel plugin
  ```
  npm install --save-dev @babel/plugin-proposal-optional-chaining
  ```

  - update your `babel.config.js` file to include this plugin

  ```javascript
  plugins: [
    '@babel/plugin-proposal-optional-chaining'
  ]
  ```

2. **Selectively import Turbo features** instead of the whole package:

```javascript
// Instead of importing the whole package
// import "@hotwired/turbo-rails"

// Import only the specific parts you need
import { StreamActions, StreamElement } from "@hotwired/turbo"
// Configure what you need
// No need to disable Turbo Drive since you're not importing it
```

The downgrade approach is simplest and most reliable given your current setup.

## Appendix

### Run the app with Docker

#### Overview of the files

1. **docker-compose-env.yml**: Sets up the development dependencies:
   - MySQL database (port 3336)
   - Redis (port 6381)

2. **docker-compose.yml**: Defines two services using the same base configuration:
   - `app`: Rails web server running on port 3000
   - `sidekiq`: Background job processor
   Both services use the same Docker image and share volume mounts for code changes.

3. **Dockerfile-dev**: Builds the development image:
   - Based on Ruby 3.1.4 slim
   - Installs system dependencies, Node.js, Yarn
   - Sets up the Ruby environment and installs gems

4. **.env**: Contains environment variables for various services and configurations

#### Steps to run the application:

1. First, create the external network that both compose files use:
```bash
docker network create traefik_proxy
```

2. Start the dependencies (MySQL and Redis):
```bash
$ docker compose -f docker-compose-env.yml up -d

# To verify `redis` and `mysqldb` are connected to the traefix network:

$ docker network inspect traefik_proxy
# you should see them listed in the output under the "Containers" section
```

To verify services, `redis` and `mysqldb` are running:

```bash
# To connect to the MySQL container:
$ docker exec -it tax_adjustment_web-mysqldb-1 mysql -u root

# OR to connect to the MySQL container from the host machine
$ mysql -h 127.0.0.1 -u root -P 3336

# To connect to the Redis container:
$ docker exec -it tax_adjustment_web-redis-1 redis-cli      

# OR to connect to the Redis container from the host machine
$ redis-cli -h 127.0.0.1 -p 6381

```

3. Build and start the application:
```bash
# Build the image
docker compose build

# Start the services
docker compose up -d
```

After running these commands:
- MySQL will be available on `localhost:3336` in host machine 
- Redis will be available on `localhost:6381` in host machine
- The Rails application will be available on `localhost:3000` in host machine

### Webpacker Error

- TBD

### Docker Component Breakdown

#### 1. Dockerfile-dev Explanation:
```Dockerfile
# Base image using Ruby 3.1.4 slim version (Debian Buster-based)
FROM ruby:3.1.4-slim-buster AS base

# Install system dependencies
RUN apt update && apt upgrade -y && apt install -y --no-install-recommends \
    git \                    # For version control
    jq \                     # JSON processor
    curl \                   # For downloading files
    g++ \                    # C++ compiler
    openssh-client \         # SSH support
    make gcc \              # Build tools
    default-libmysqlclient-dev \ # MySQL client library
    libxrender1 libfontconfig1 libxext6 \ # Font rendering
    fonts-ipafont-gothic fonts-ipafont-mincho \ # Japanese fonts
    fonts-vlgothic fonts-wqy-zenhei \     # More fonts
    libjemalloc2            # Memory allocator

# Install Node.js (for JavaScript runtime)
RUN apt update && apt install -y gnupg apt-transport-https
RUN curl --silent --show-error --location https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
RUN echo "deb https://deb.nodesource.com/node_12.x/ stretch main" > /etc/apt/sources.list.d/nodesource.list
RUN apt update && apt install -y nodejs

# Install Yarn (package manager)
RUN curl --silent --show-error --location https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt update && apt install -y yarn

# Install ImageMagick for image processing
RUN apt update && apt install -y --no-install-recommends imagemagick

# Configure bundler
RUN bundle config set force_ruby_platform true

# Set working directory
WORKDIR /app

# Copy Gemfile and install dependencies
COPY ./Gemfile /app/Gemfile
COPY ./Gemfile.lock /app/Gemfile.lock

# Set bundler version and GitHub token
ARG BUNDLE_GITHUB__COM
ENV BUNDLER_VERSION 2.1.4
ENV BUNDLE_GITHUB__COM=$BUNDLE_GITHUB__COM

# Install Ruby dependencies
RUN bundle install

# Copy application code
COPY . /app

# Expose port 3000
EXPOSE 3000
```

#### 2. docker-compose.yml Explanation:
```yaml
version: '3.9'

# Define common configuration for app containers
x-app_container: &app_container
  image: 'tax_adjustment_web:3.1.4'    # Image name and tag
  build:
    context: .                         # Build context is current directory
    dockerfile: Dockerfile-dev         # Use development Dockerfile
  tty: true                           # Allocate a pseudo-TTY
  stdin_open: true                    # Keep STDIN open
  volumes:                            # Mount these directories
    - ./:/app                         # Mount current directory to /app
    - ./Gemfile:/app/Gemfile         # Mount Gemfile
    - ./Gemfile.lock:/app/Gemfile.lock
  env_file:
    - .env                           # Load environment variables
  networks:
    - traefik                        # Use traefik network

services:
  # Web application service
  app:
    <<: *app_container              # Use common configuration
    command: bash -c "rm -f tmp/pids/server.pid && bundle exec rails s -p 3000 -b '0.0.0.0'"
    ports:
      - "3000:3000"                # Map host port to container port

  # Background job processor
  sidekiq:
    <<: *app_container             # Use common configuration
    command: 'bundle exec sidekiq -C config/sidekiq.yml'

networks:
  traefik:
    external: true                 # Use existing external network
    name: traefik_proxy
```

#### 3. Step-by-step Running Process:

1. **Setup Network:**
```bash
# Create the network that containers will use to communicate
docker network create traefik_proxy
```

2. **Build the Image:**
```bash
# Build the Docker image
docker compose build

# You can see the built image with
docker images
```

3. **Start the Services:**
```bash
# Start dependencies (if using docker-compose-env.yml)
docker compose -f docker-compose-env.yml up -d

# Start all services in detached mode
docker compose up -d

# Check running containers
docker compose ps

# Check logs
docker compose logs -f
```

4. **Useful Commands During Development:**
```bash
# Execute commands in the running container
docker compose exec app bash
docker compose exec app bundle exec rails c

# View logs of specific service
docker compose logs -f app
docker compose logs -f sidekiq

# Restart services
docker compose restart app
docker compose restart sidekiq

# Stop all services
docker compose down
```

5. **Database Operations:**
```bash
# Create database
docker compose exec app bundle exec rails db:create

# Run migrations
docker compose exec app bundle exec rails db:migrate

# Seed data
docker compose exec app bundle exec rails db:seed
```

The setup uses Docker's best practices:
- Uses multi-stage builds
- Minimizes layer size
- Mounts volumes for development
- Uses environment variables for configuration
- Separates services (web and background jobs)

### Why `traefik_proxy` runs separately

The `traefik_proxy` network is defined as `external: true` in the docker-compose.yml, which means Docker expects this network to exist before running the services. Here's why:

1. **Reverse Proxy Purpose:**
   - Traefik is commonly used as a reverse proxy/load balancer
   - It routes incoming requests to appropriate containers
   - Having a separate network allows multiple Docker Compose projects to share the same proxy

2. **Network Isolation:**
   ```yaml
   networks:
     traefik:
       external: true
       name: traefik_proxy
   ```
   - This setup allows containers to be isolated but still communicate when needed
   - Services in different docker-compose files can communicate if they're on the same network
   - Provides better security by controlling which services can talk to each other

3. **Alternative Approach:**
If you don't need the external network, you could modify the docker-compose.yml to use a local network:

```yaml:docker-compose.yml
networks:
  traefik:
    name: traefik_proxy
    # Remove the external: true line
```

Then you wouldn't need to create the network separately. The network would be created automatically when running `docker-compose up`.

4. **Current Setup Benefits:**
   - Multiple applications can share the same proxy
   - Services can be deployed independently
   - Better organization for microservices architecture
   - Easier SSL/TLS termination at the proxy level

If you're just running this application locally and don't need to connect it with other services, you could simplify the networking setup by removing the external network requirement.

### Run the database and cache services in local machine

If you're using locally installed MySQL and Redis, you don't actually need the `traefik` network! The network is only necessary for container-to-container communication.

For locally installed services, you'll need to modify the `.env` file to point to your local installations. Here's how:

```yaml:docker-compose.yml
version: '3.9'

x-app_container: &app_container
  image: 'tax_adjustment_web:3.1.4'
  build:
    context: .
    dockerfile: Dockerfile-dev
  tty: true
  stdin_open: true
  volumes:
    - ./:/app
    - ./Gemfile:/app/Gemfile
    - ./Gemfile.lock:/app/Gemfile.lock
  env_file:
    - .env
  # Remove or comment out the networks section since we're using host services
  # networks:
  #   - traefik
  # Add network_mode: "host" to allow container to access host services
  network_mode: "host"

services:
  app:
    <<: *app_container
    command: bash -c "rm -f tmp/pids/server.pid && bundle exec rails s -p 3000 -b '0.0.0.0'"
    ports:
      - "3000:3000"

  sidekiq:
    <<: *app_container
    command: 'bundle exec sidekiq -C config/sidekiq.yml'

# Remove the networks section since we're not using it
# networks:
#   traefik:
#     external: true
#     name: traefik_proxy
```

And update your `.env` file to point to your local services:
```env:.env
# database
DATABASE_USERNAME=root
DATABASE_PASSWORD=your_mysql_password
# Remove DATABASE_SOCKET if you're using TCP connection
# DATABASE_SOCKET=hoge/hoge

# REDIS
REDIS_URL=redis://localhost:6379
```

Now you can simply run:
```bash
# Build and start the application
docker compose build
docker compose up -d
```

The containers will be able to access your local MySQL and Redis through `localhost` because we're using `network_mode: "host"`. This means the containers will share the host's network stack, making it easier to connect to locally installed services.

Make sure your local MySQL and Redis are running:
```bash
# Check MySQL status (on Ubuntu/Debian)
sudo service mysql status

# Check Redis status
sudo service redis status
```

This approach is simpler for local development since you don't need to manage the network configuration or run additional containers for the database and cache.

### docker network

1. **Command Explanation:**
```bash
docker network create traefik_proxy
```
- `docker network`: manages Docker networks
- `create`: creates a new network
- `traefik_proxy`: the name of the network

2. **Verify the network creation:**
```bash
# List all networks
docker network ls

# You should see something like:
# NETWORK ID     NAME            DRIVER    SCOPE
# 4a1234bf8a1f   traefik_proxy   bridge    local
```

3. **Inspect the network details:**
```bash
docker network inspect traefik_proxy
```
This will show you detailed information about the network, including:
- Network configuration
- IPAM (IP Address Management) settings
- Connected containers
- Network driver type

Now that the network is created, you can proceed with running your containers that need to communicate through this network. The long hexadecimal string (network ID) is used internally by Docker to uniquely identify this network.

### What is `<none>:<none>` image?

```bash
$ docker images           
REPOSITORY           TAG       IMAGE ID       CREATED              SIZE
<none>               <none>    395b17cd290e   About a minute ago   2.13GB
tax_adjustment_web   3.1.4     06e5b0c2ca1f   About a minute ago   2.13GB
```

The `<none>:<none>` image (also known as a "dangling image") is a leftover intermediate image from the build process. It's created during the multi-stage build process or when you rebuild an image with the same tag.

You can safely remove dangling images using either of these commands:

```bash
# Remove only dangling images
docker image prune

# Or specifically remove the dangling image by ID
docker rmi 395b17cd290e
```

In your case:
- `tax_adjustment_web:3.1.4` is your actual application image
- The `<none>:<none>` image with ID `395b17cd290e` is a build artifact that can be safely removed

It's good practice to periodically clean up these dangling images to free up disk space. You can also use:

```bash
# To see how much space Docker is using
docker system df

# For a more aggressive cleanup (removes unused containers, networks, images)
docker system prune
```

The dangling image in this case was likely created because you rebuilt the `tax_adjustment_web:3.1.4` image, and the old image became untagged (hence showing as `<none>`).

### To check if the services from docker-compose.yml are running

To check if the services from docker-compose.yml are running using these commands:

```bash
# List all running containers
docker ps

# List all containers (including stopped ones)
docker ps -a

# This will show container names containing 'mysql' or 'redis'
docker ps -a | grep -E 'mysql|redis'
```

You should see something like this if the services are running:
```
CONTAINER ID   IMAGE       COMMAND                  STATUS         PORTS                    NAMES
abc123...      mysql:5.7   "docker-entrypoint.s…"   Up 2 hours    0.0.0.0:3306->3306/tcp   project_mysql_1
def456...      redis:6     "docker-entrypoint.s…"   Up 2 hours    0.0.0.0:6379->6379/tcp   project_redis_1
```

### View logs of all services

You can view the logs using the `docker-compose logs` command. Here are the different ways:

```bash
# View logs of all services
docker-compose logs

# View logs of specific service (app or sidekiq)
docker-compose logs app
docker-compose logs sidekiq

# Follow the logs in real-time (like tail -f)
docker-compose logs -f app
docker-compose logs -f sidekiq

# View last N lines of logs
docker-compose logs --tail=100 app
docker-compose logs --tail=100 sidekiq

# View logs since a specific time
docker-compose logs --since 10m app    # Last 10 minutes
docker-compose logs --since 1h sidekiq # Last hour
```


Useful combinations:
```bash
# Follow both services simultaneously
docker-compose logs -f app sidekiq

# View last 50 lines and follow both services
docker-compose logs --tail=50 -f app sidekiq
```


The `-f` (or `--follow`) flag is particularly useful during development as it shows logs in real-time as they're generated.

### docker-compose-env.yml - MongoDB Permission Issues

```bash
$ docker-compose -f docker-compose-env.yml logs mongo
mongo-1  | chown: changing ownership of '/data/db': Permission denied
```

**Solution:**

[Link](https://stackoverflow.com/questions/67498836/docker-chown-changing-ownership-of-data-db-operation-not-permitted)

For Mac user running Colima.

I had the same problem on Mac and it turns out it was a problem when using the default Colima settings. 
Changing the `vmType` to `vz` and `mountType` to `virtiofs`.

To fix this run:

```bash
colima delete
colima start --edit # and update vmType and mountType
```

### Run the app locally

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
