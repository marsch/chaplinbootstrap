chaplinplayground
=================

just a repo where i try my things out before using it in real projects


# Introduction
I've tried to keep the development process as simple as possible. Thats why no processing or build step is needed to edit the
application. I also enabled livereload, which reloads the application after you've modified a file.


# Setup

You will need the following components installed:

 * nodejs (`brew install node`)
 * grunt (`npm install -g grunt-cli`)
 * bower (`npm install -g bower`)

```
git clone git@github.com:marsch/chaplinplayground.git
cd chaplinplayground
npm install
grunt prepare
```

# Run it
This starts the server with livereload enabled. So after that you can modify coffee, .mustache, .less files and the page gets reloaded
```
grunt server
```
