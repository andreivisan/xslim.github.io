---
layout: post
published: false
title: "Let's make a Web-service with Node.js"
comments: true
description: null
tags: 
  - nodejs
  - javascript
  - coffeescript
  - heroku
  - proxy
  - redis
  - flickr
  - mapbox
---

I'll make a short walk thru how I've built a simple Web-service (proxy) with Node.js that might be usefull for developers who are started playing with it.

The source code for the app is available on [xslim/img.mrt.io](https://github.com/xslim/img.mrt.io)

## Hello world? No, dump Readme

First, check that your `package.json` contains `express` as a dependency in `dependencies` section and install them with `npm install`. Second, create `README.md` file with some content. Next,  create an `app.js` and fill with usefull code:

``` js
var express = require('express'),
    app = express(),
    http = require('http'),
    fs = require('fs');
    
app.get("/", function(req, res, next) {
  fs.readFile('README.md', function(err, data) {
    res.writeHead(200, {"Content-Type": "text/plain"});
    res.end(data);
  });
});

app.listen(process.env.PORT || 3000);
```

Now after running `node app.js` and visiting the `http://localhost:3000/` will give you a dump of your `README.md` file. Cool, huh?

<!-- more -->

## Coffeescript

I prefer having a simpler and cleaner code. Thus, I use [Coffee script](http://coffeescript.org). To use it, add `coffee-script` `npm` dependency. The filenames should be changed from `.js` to `.coffee`, and the code should be changed as well. You can use [js2coffee.org](http://js2coffee.org) for converting the code. So our `app.coffee` will be changed to this:

``` coffee
express = require('express')
app = express()
http = require('http')
fs = require('fs')

app.get "/", (req, res, next) ->
  fs.readFile 'README.md', (err, data) ->
    res.writeHead 200, "Content-Type": "text/plain"
    res.end data
    
app.listen process.env.PORT or 3000
```

To run it, use `coffee app.coffee`.

## Watch it!

It might be quite boring to restart the Node every time you make a change to a file. We can automate this using [Grunt](http://gruntjs.com) and [nodemon](http://nodemon.io).

Create a section `devDependencies` in `package.json` and add `grunt`, `grunt-contrib-watch`, `load-grunt-tasks` and `grunt-nodemon`. Create `Gruntfile.js` with contents:

``` js
module.exports = function (grunt) {
    require('load-grunt-tasks')(grunt);
    grunt.initConfig({
        nodemon: {
          dev: {
            script: 'app.coffee'
          }
        }
      });
};
```

Now the only thing you need to run is `grunt nodemon` and enjoy. For a more crazy automation, ther's an awesome blog post [Continuous Development in Node.js](http://blog.ponyfoo.com/2013/09/26/continuous-development-in-nodejs).

## Let's make a proxy

Say we want to show our avatar calling `/avatar.jpg` by streaming the actual data from Gravatar. Can be done!

First, create a `proxy` method

``` coffee
proxyTo = (url, response) ->
  try
    http.get url, (res) ->
      res.pipe response

  catch _error
    response.writeHead 500, "Content-Type": "text/html"
    response.end url, _error.message
```

And the endpoint:

``` coffee
app.get "/avatar.jpg", (req, res) ->
  proxyTo "http://gravatar.com/avatar/4374a44a5a6642a24ac2975b9aa2dfe7", res
```

## Deploy to Heroku

Well, Heroku have a nice [write-up](https://devcenter.heroku.com/articles/getting-started-with-nodejs) on how to do this. The only thing to know is that we'r using Coffee script, so we need to change `Procfile` to this:

```
web: coffee app.coffee
```