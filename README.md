chaplinbootstrap
=================

[![Build Status](https://travis-ci.org/marsch/chaplinbootstrap.png?branch=master)](https://travis-ci.org/marsch/chaplinbootstrap)

just bootstrap for usual chaplin apps, written in coffeescript using
standard libs. this also includes test-harnish for mocha

# Introduction
I've tried to keep the development process as simple as possible. Thats why no processing or build step is needed to edit the
application. I also enabled livereload, which reloads the application after you've modified a file.


# Setup

You will need the following components installed:

 * nodejs (`brew install node`)
 * grunt (`npm install -g grunt-cli`)
 * bower (`npm install -g bower`)

```
git clone git@github.com:marsch/chaplinbootstrap.git
cd chaplinplayground
npm install
grunt prepare
```

# Run it
This starts the server with livereload enabled. So after that you can modify coffee, .mustache, .less files and the page gets reloaded
```
grunt server
```
