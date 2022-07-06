# Sample microblog application

This is the sample microblog application developed using Ruby on Rails and fourth edition of the [*Ruby on Rails Tutorial: Learn Web Development with Rails*](https://www.railstutorial.org/) by [Michael Hartl](https://www.michaelhartl.com/).

Initially the app was written using Ruby 2.2 and Rails 4. Based on that code was optimized and below is snapshot of major upgrades and improvements, not counting minor tweaks:

    Ruby 2.2 > 2.4 > 2.6 > 3.1
    Rails 4 > 5 > 6 > 7
    sprockets, sass-rails, bootstrap-sass > webpacker, npm >> esbuild, css/jsbundling, propshaft
    carrierwave > active_storage
    mini_magick > vips
    turbolinks > turbo-rails
    will_paginate > pagy
    bootstrap 3 > bootstrap 5

## License
All source code is available under the MIT License. See [LICENSE.MD](https://github.com/msuliq/rails-microblog/blob/master/LICENSE.MD) for details.

## Getting started
To get started with the app, clone the repo and then install the needed gems. You can clone the repo as follows:

```
$ git clone https://github.com/msuliq/rails-microblog.git 
$ cd rails-microblog/
```

To install the gems, you will need the same versions of Ruby and Bundler used to build the sample app, which you can find using the cat and tail commands as follows:

```
$ cat .ruby-version
<Ruby version number>
$ tail -n1 Gemfile.lock
   <Bundler version number>
```

Next, install the versions of ruby and the bundler gem from the above commands. The Ruby installation is system-dependent. If you are using rvm you can type following commands in the terminal:

```
$ rvm get stable
$ rvm install <Ruby version number>
$ rvm --default use <Ruby version number>
```

See the section ["Up and running" of the Rails Tutorial](https://www.learnenough.com/ruby-on-rails-7th-edition-tutorial#sec-up_and_running) for more details. Once Ruby is installed, the bundler gem can be installed using the gem command:

```
$ gem install bundler -v <version number>
```

Then the rest of the necessary gems can be installed with bundle (taking care to skip any production gems in the development environment):

```
$ bundle _<version number>_ config set --local without 'production'
$ bundle _<version number>_ install
```

Here you should replace `<version number>` with the actual version number. For example, if `<version number>` is `2.3.11`, then the commands should look like this:

```
$ gem install bundler -v 2.3.11
$ bundle _2.3.11_ config set --local without 'production'
$ bundle _2.3.11_ install
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you’ll be ready to seed the database with sample users and run the app in a local server:

```
$ rails db:seed
$ bin/dev
```

Follow the instructions in terminal to view the app. The http address might look like `http://127.0.0.1:3000`.

## Deployment
This sample microblog app is deployed to Heroku at [*rails-microblogg*](https://rails-microblogg.herokuapp.com).

The full production app includes several advanced features, including sending email through SMTP and storing uploaded images with AWS S3.

Visiting the URL above should show you the sample app running in production. There you can register as a new user or log in as non-admin user with the email `example@railstutorial.org` and password `foobaz`.
