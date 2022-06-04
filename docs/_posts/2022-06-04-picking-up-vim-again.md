---
layout: post
title:  "Trying vim again"
categories: Set up!
---
# Introduction
I've tried vim before in my first week, of my first job: it was a bad decision. There were already so much to learn as a first time programmer; you don't want to add to that cognitive load. Now that things have changed in my life; I'm no longer trying to learn multiple things at once, I can once again try to pick up vim!

The allures of vim is very obvious: never having to raise your hand and reach for the mouse again! What they don't say: it's hard as hell to set up, learn and master. I don't know yet if this attempt will be successful or be utterly fruitless, but I shall endeavour to journey my process here.

# Set up - Settling in
- [x] Set up repository for `.vimrc` and `.zshrc` files so I'll never lose them
- [x] Install plug ins that I like and need.
- 	* see `.vimrc` for list
- [x] Install Language Server Protocol for `Go` in vim
- [x] Change font to fira code and enable ligatures in vim because I like them
- 	* turns out to be a iterm2 thing
- [ ] ~Get nice auto completers for `(), [], {}, "", ''`~ Maybe I don't need this in vim, considering you'll have to exit insert mode to get out of the closing delimiter...
- [x] Set up gofmt so that the white spaces is automatically fixed when I save and that I don't get into a whole bunch of linting errors (it was **so** bad with python)
- [ ] Set up highlight for same variable in the page
 
# Requirements - Setting some goals
Some things that I cannnot live without that I had in VS Code.
* `cmd-d` - Variable multiselect
	* seems to be a different way of doing things in vim; using search and `n` to go next and repeat action
* `cmd-p` - File search within project
	* use `:e though i don't think it's good enough; maybe a plugin`
* split pane - to look at multiple files at once for comparison
	* `:vsp` is the easiest way.
* View implementations of `interfaces` _because Go..._
	* using `:GoImplements` where the cursor is works, will remap to ctrl-i or something
* View references of `function/method`
	* `gd` `g`oes to `d`eclaration

# The Basics - Learning to even start working
I recall some stuff from before so it is not hard: I shall break them up into bigger categories

## Basic navigation 
* arrow keys are substituted with `hjkl`
* `b`ack and for`w`ard by `w`ord

## Basic editing
* `A`ppend stuff to the end of the line
* `o` to add a line below in insert mode use `O` for adding a line above
* `c`hange command deletes and goes into insert mode for whatever noun is provided after e.g. `cw` changes word and `cp` changes paragraph.
* `>>` indents the line and conversely, `<<` de-indents

## Pane control
* ctrl-w to enter window mode and navigation to choose the screen you want
* `<` and `>` to adjust pane size
* ctrl-y and ctrl-e helps to move the viewport up and down respectively  
* `zz` centers the view port to your cursor position

# Walking - Becoming as fast as my old setup

## Access file trees
* `:e` uses vim file trees to search, throw in `**` if you cannot remember which parent folders they are in
* I have the ctrl-P plug in which is pretty much the same as that of vs-code, just used ctrl-k/j to select the wanted file

# Flying - Becoming faster than my old setup
