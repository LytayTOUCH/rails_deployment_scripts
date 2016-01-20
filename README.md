# Script to Setting Up RAILS Server on Ubuntu Server 15.10

#### Usage

* Run script: change file mode into execution
* Command: $ sudo chmod +x setup-rails-environment.sh

#### Setup command

* Command: $ ./setup-rails-environment.sh

#### Issue Notes
* Change user from `www-data` to `vagrant`;
* Uncomment line in `/etc/nginx/nginx.conf`
  ```html
  passenger_root /usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini;
  ```
* Add this script to default
  ```html
  passenger_ruby /home/vagrant/.rvm/gems/ruby-2.2.3/wrappers/ruby;
  server{
          listen 80 default_server;
          listen [::]:80 default_server ipv6only=on;
          client_max_body_size 20M;
          server_name localhost;
          passenger_enabled on;
          rails_env    production;
          root /home/vagrant/rails_apps/test_app/public;
          # redirect server error pages to the static page /50x.html
          error_page   500 502 503 504  /50x.html;
          location = /50x.html {
              root   html;
          }
  }
  ```
* Need to install gem therubyracer and bundle it into Gemfile
