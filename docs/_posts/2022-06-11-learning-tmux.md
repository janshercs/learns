---
layout: post
title: "tmux commands commonly used"
tags: setup
---

Learning how to set up sessions in tmux.

### Session stuff

creating new session: `tmux new -s session name`

exiting session while leaving it running: `ctrl-b d`

- this allows you to go back to your usual terminal!
  previewing open sessions: `ctrl-b w`

### Window stuff

creating new window within session: `ctrl-b c`

going to next window within session: `ctrl-b n`

### Pane stuff

creating pane to the right (vsplit): `ctrl-b %`

creating pane to the bottom (hsplit): `ctrl-b ;`

switching panes: `ctrl-b + arrow keys`

killing panes: `ctrl-b + x`
