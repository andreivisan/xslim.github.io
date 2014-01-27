---
layout: post
title: "Fixing TextMate2 TODO bundle"
date: 2012-05-25 13:59
comments: true
tags: [textmate, ruby, todo]
---

Having problems looking your TODO list in TextMate2? Run this script to have a fix.

``` sh
cd ~/Library/Application\ Support/TextMate/Managed/Bundles/TODO.tmbundle/Support/lib && rm -rf settings.rb && curl -O http://ebundles.googlecode.com/svn-history/r216/trunk/Bundles/TODO.tmbundle/Support/lib/settings.rb
```

 