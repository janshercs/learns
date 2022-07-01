#!/bin/bash

today=$(date '+%Y-%m-%d')
postName="$today"-"$1".md
touch _posts/"$postName"

echo "---
layout: post
title:  "title goes here"
tags: tags here
---" > _posts/"$postName"

echo "$postName created" 
