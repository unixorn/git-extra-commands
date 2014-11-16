# git-extra-commands
==================

An [Antigen](https://github.com/zsh-users/antigen) plugin that packages so extra git commands I've found. I didn't write these, and they each have whatever licensing is included in the file. This doesn't actually require zsh, but a plugin makes it more convenient for me when I'm dealing with multiple machines.

If you wrote one of these and want it removed from this repository, please file an issue against the repo and I will remove it.

## Installing

### Pre-requisites
Some of these scripts use dash. `brew install dash` if you're on OS X.

### Antigen

add `antigen bundle unixorn/git-extra-commands` to your .zshrc

### Without using any frameworks, or if you're a bash user

git clone this repository, then add it to your $PATH. Nothing here actually requires you to use ZSH and antigen, that's just a convenient distribution method for me. I use many instances, and having them automatically load the tooling scripts I expect makes life easier.

## Credits

* git-big-file - Mislav Marohnić's [dotfiles](https://github.com/mislav/dotfiles)
* git-changes - Michael Markert's [dotfiles](https://github.com/cofi/dotfiles)
* git-churn - Gary Bernhardt's [dotfiles](https://github.com/garybernhardt/dotfiles/blob/master/bin/git-churn)
* git-copy-branch-name - Zach Holman's [dotfiles](https://github.com/holman/dotfiles)
* git-credit - Zach Holman's [dotfiles](https://github.com/holman/dotfiles)
* git-cut-branch - Ryan Tomayko's [dotfiles](https://github.com/rtomayko/dotfiles)
* git-delete-local-merged - [https://plus.google.com/115587336092124934674/posts/dXsagsvLakJ](https://plus.google.com/115587336092124934674/posts/dXsagsvLakJ)
* git-divergence - Gary Bernhardt's [dotfiles](https://github.com/garybernhardt/dotfiles/blob/master/bin/git-churn)
* git-grab - Ryan Tomayko's [dotfiles](https://github.com/rtomayko/dotfiles)
* git-improved-merge - Mislav Marohnić's [dotfiles](https://github.com/mislav/dotfiles)
* git-incoming - Michael Markert's [dotfiles](https://github.com/cofi/dotfiles)
* git-incoming-commits - Ryan Tomayko's [dotfiles](https://github.com/rtomayko/dotfiles)
* git-ls-object-refs - Ryan Tomayko's [dotfiles](https://github.com/rtomayko/dotfiles)
* git-nuke - Zach Holman's [dotfiles](https://github.com/holman/dotfiles)
* git-object-deflate - Ryan Tomayko's [dotfiles](https://github.com/rtomayko/dotfiles)
* git-outgoing - Michael Markert's [dotfiles](https://github.com/cofi/dotfiles)
* git-promote - Trevor's [Improving My git Workflow](http://hoth.entp.com/2008/11/10/improving-my-git-workflow) blog post
* git-publish - Michael Markert's [dotfiles](https://github.com/cofi/dotfiles)
* git-rank-contributors - William Morgan <wmorgan-git-wt-add@masanjin.net>
* git-rebase-authors - Mislav Marohnić's [dotfiles](https://github.com/mislav/dotfiles)
* git-rel - Ryan Tomayko's [dotfiles](http://github.com/rtomayko/dotfiles)
* git-run-command-on-revisions - Gary Bernhardt's [dotfiles](https://github.com/garybernhardt/dotfiles)
* git-shamend - Danielle Sucher's [git-shamend](http://www.daniellesucher.com/2014/05/08/git-shamend/) blog post
* git-show-overwritten - Mislav Marohnić's [dotfiles](https://github.com/mislav/dotfiles)
* git-submodule-rm - Greg V's [dotfiles](https://github.com/myfreeweb/dotfiles)
* git-thanks - Mislav Marohnić's [dotfiles](https://github.com/mislav/dotfiles)
* git-track - Zach Holman's [dotfiles](https://github.com/holman/dotfiles)
* git-trail - Daniel Hahler's [dotfiles](https://github.com/blueyed/dotfiles/blob/master/usr/bin/git-trail)
* git-undo-push - 
* git-unpushed - Zach Holman's [dotfiles](https://github.com/holman/dotfiles)
* git-unreleased - Mislav Marohnić's [dotfiles](https://github.com/mislav/dotfiles)
* git-up - Ryan Tomayko's [dotfiles](http://github.com/rtomayko/dotfiles)
* git-when-merged - Michael Haggerty [git-when-merged](https://github.com/mhagger/git-when-merged)
* git-where - Mislav Marohnić's [dotfiles](https://github.com/mislav/dotfiles)
* git-winner - Garry Dolley [https://github.com/up_the_irons/git-winner](https://github.com/up_the_irons/git-winner)
* git-wtf - William Morgan <wmorgan at the masanjin dot nets>
* github-open - Ryan Tomayko's [dotfiles](http://github.com/rtomayko/dotfiles)

## Contributing

Please include an entry in the credits section of README.md for any scripts in your PRs so authors get their work credited correctly.
