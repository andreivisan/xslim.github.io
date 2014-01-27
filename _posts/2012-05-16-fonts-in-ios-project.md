---
layout: post
title: "Fonts in iOS project"
date: 2012-05-16 16:34
comments: true
tags: [code, obj-c] 
---
Small piece of code that will show you available font names for using in you iOS project

``` objc
NSArray *fonts = [UIFont familyNames];for (NSString *fName in fonts) {    NSLog(@"---> %@ :", fName);    NSLog(@"\n%@", [UIFont fontNamesForFamilyName:fName]);}
```