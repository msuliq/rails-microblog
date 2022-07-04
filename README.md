<h1>Sample microblog application.</h1>

<p>This is the sample microblog application developed using Ruby on Rails and fourth edition of the <a href="https://www.railstutorial.org/">Ruby on Rails Tutorial: Learn Web Development with Rails</a> by <a href="http://www.michaelhartl.com/">Michael Hartl.</a></p>

<p>Initially the app was written using Ruby 2.2 and Rails 4, afterwards the following upgrades were done:</p>

<ul>
<li>Ruby 2.2 > 2.4 > 2.6 > 3.1</li>
<li>Rails 4 > 5 > 6 > 7</li>
<li>sprockets, sass-rails, bootstrap-sass > webpacker, npm >> esbuild, css/jsbundling, propshaft</li>
<li>carrierwave > active_storage</li>
<li>mini_magick > vips</li>
<li>turbolinks > turbo-rails</li>
<li>will_paginate > pagy</li>
<li>bootstrap 3 > bootstrap 5</li>
</ul>

<h1>License</h1>
<p>All source code is available jointly under the MIT License. See <a href="https://github.com/msuliq/rails-microblog/blob/master/LICENSE.MD">LICENSE.MD</a> for details.</p>

<h1>Getting started</h1>
<p>To get started with the app, clone the repo and then install the needed gems. You can clone the repo as follows:</p>

<code>
$ git clone https://github.com/msuliq/rails-microblog.git</br> 
$ cd rails-microblog/
</code>

<p>To install the gems, you will need the same versions of Ruby and Bundler used to build the sample app, which you can find using the cat and tail commands as follows:</p>

<code>
$ cat .ruby-version</br>
<Ruby version number></br>
$ tail -n1 Gemfile.lock</br>
   <Bundler version number>
</code>

<p> Next, install the versions of ruby and the bundler gem from the above commands. The Ruby installation is system-dependent. If you are using rvm you can type following commands in the terminal:</p>

<code>
$ rvm get stable</br>
$ rvm install <Ruby version number></br>
$ rvm --default use <Ruby version number>
</code>

<p>See the section Up and running for more details. Once Ruby is installed, the bundler gem can be installed using the gem command:</p>
<code>
$ gem install bundler -v <version number>
</code>

<p>Then the rest of the necessary gems can be installed with bundle (taking care to skip any production gems in the development environment):</p>
<code>
$ bundle _<version number>_ config set --local without 'production'</br>
$ bundle _<version number>_ install
</code>

<p>Here you should replace <version number> with the actual version number. For example, if <version number> is 2.3.11, then the commands should look like this:</p>
<code>
$ gem install bundler -v 2.3.11</br>
$ bundle _2.3.11_ config set --local without 'production'</br>
$ bundle _2.3.11_ install
</code>

<p>Next, migrate the database:</p>
<code>
$ rails db:migrate
</code>

<p>Finally, run the test suite to verify that everything is working correctly:</p>
<code>
$ rails test
</code>

<p>If the test suite passes, you’ll be ready to seed the database with sample users and run the app in a local server:</p>

<code>
$ rails db:seed</br>
$ bin/dev
</code>

<p>Follow the instructions in terminal to view the app. The http address might look like <text>http://127.0.0.1:3000</text>.</p>

<h1>Deployment</h1>
<p>This sample app is deployed to Heroku at <a href=https://rails-microblogg.herokuapp.com>https://rails-microblogg.herokuapp.com/</a>
<p>The full production app includes several advanced features, including sending email with Twilio SendGrid and storing uploaded images with AWS S3.</p> 

<p>Visiting the URL above should show you the sample app running in production. As with the local version, you can then register a new user or log in as the sample non-admin user with the email <text>example@railstutorial.org</text> and password foobaz.</p>
