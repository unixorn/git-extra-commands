# git-extra-commands

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Build Status](https://travis-ci.org/unixorn/git-extra-commands.svg?branch=master)](https://travis-ci.org/unixorn/git-extra-commands)
[![Code Climate](https://codeclimate.com/github/unixorn/git-extra-commands/badges/gpa.svg)](https://codeclimate.com/github/unixorn/git-extra-commands)
[![Issue Count](https://codeclimate.com/github/unixorn/git-extra-commands/badges/issue_count.svg)](https://codeclimate.com/github/unixorn/git-extra-commands)
[![GitHub stars](https://img.shields.io/github/stars/unixorn/git-extra-commands.svg)](https://github.com/unixorn/git-extra-commands/stargazers)

A zsh plugin that packages some extra git helper scripts I've found. I only wrote a few of these scripts, and the ones I didn't each have whatever licensing is included in the file.

This collection doesn't actually require zsh, but packaging it as a ZSH plugin makes it more convenient for people using a ZSH framework to use this collection.

If you wrote one of these scripts and want it removed from this collection, please either make a PR and/or file an issue against the repo and I will remove it.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Installing](#installing)
  - [Pre-requisites](#pre-requisites)
  - [Antigen](#antigen)
  - [oh-my-zsh](#oh-my-zsh)
  - [zgen](#zgen)
  - [Bash / Manual Installation](#bash--manual-installation)
- [Included Scripts](#included-scripts)
- [Useful git aliases](#useful-git-aliases)
- [Other useful git stuff](#other-useful-git-stuff)
  - [Articles / Blog posts / Books](#articles--blog-posts--books)
  - [External Git Utilities](#external-git-utilities)
- [Contributing](#contributing)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Installing

### Pre-requisites

A relatively recent version of git. The version of git Apple includes in macOS is stale. `brew install git` if you're on macOS.

### Antigen

If you're using [Antigen](https://github.com/zsh-users/antigen):

1. Add `antigen bundle unixorn/git-extra-commands` to your `.zshrc` where you've listed your other plugins.
2. Close and reopen your Terminal/iTerm window to **refresh context** and use the plugin. Alternatively, you can run `antigen bundle unixorn/git-extra-commands` in a running shell to have antigen load the new plugin.

### oh-my-zsh

If you're using [oh-my-zsh](github.com/robbyrussell/oh-my-zsh):

1. In the command line, change to _oh-my-zsh_'s custom plugin directory :

    `cd ~/.oh-my-zsh/custom/plugins/`

2. Clone the repository into a new `git-extra-commands` directory:

    `git clone https://github.com/unixorn/git-extra-commands.git git-extra-commands`

3. Edit your `~/.zshrc` and add `git-extra-commands` – same as clone directory – to the list of plugins to enable:

    `plugins=( ... git-extra-commands )`

4. Then, restart your terminal application to **refresh context** and use the plugin. Alternatively, you can source your current shell configuration:

    `source ~/.zshrc`

### zgen

If you're using [zgen](https://github.com/tarjoilija/zgen):

1. Add `zgen load unixorn/git-extra-commands` to your `.zshrc` along with your other `zgen load` commands.
2. `zgen reset && zgen save`

### Bash / Manual Installation

Nothing here actually requires you to use ZSH or zgen, that's just a convenient distribution method for anyone using a ZSH framework.

If you aren't using any zsh frameworks, or if you're a bash user, do the following steps:

1. git clone this repository
2. Add `cloneDirectory/bin` to your `$PATH`.

## Included Scripts

| Script | Original Source | Description |
| ------ | --------------- | ----------- |
| `git-attic` | Christian Neukirchen's [blog](http://chneukirchen.org/blog/archive/2013/01/a-grab-bag-of-git-tricks.html) | Displays a list of deleted files in your repo. The output is designed to be copy and pasted: Pass the second field to `git show` to display the file contents, or just select the hash without ^ to see the commit where removal happened. |
| `git-big-file` | Mislav Marohnić's [dotfiles](https://github.com/mislav/dotfiles) | Show files in the repo larger than a threshold size. |
| `git-change-author` | Michael Demmer in [jut-io/git-scripts](https://github.com/jut-io/git-scripts/blob/master/bin/git-change-author) | Change one author/email in the history to another. |
| `git-change-log` | John Wiegley's [git-scripts](https://github.com/jwiegley/git-scripts) | Transform `git log` output into a complete Changelog for projects that haven't been maintaining one. |
| `git-changes` | Michael Markert's [dotfiles](https://github.com/cofi/dotfiles) | List authors in the repo in descending commit-count order. |
| `git-churn` | Gary Bernhardt's [dotfiles](https://github.com/garybernhardt/dotfiles/blob/master/bin/git-churn) | Show which files are getting changed most often in the repository. |
| `git-clone-subset` | Rodrigo Silva (MestreLion) <linux@rodrigosilva.com> | Uses `git clone` and `git filter-branch` to remove from the clone all files but the ones requested, along with their associated commit history. |
| `git-comma` | Christian Neukirchen's [blog](http://chneukirchen.org/blog/archive/2013/01/a-grab-bag-of-git-tricks.html) | Adds and commits a file in one command |
| `git-conflicts` | Seth Messer's [bits and bobs](https://github.com/megalithic/bits-and-bobs/) repo | Show files with conflicts |
| `git-copy-branch-name` | Zach Holman's [dotfiles](https://github.com/holman/dotfiles) | Copy the current branch's name to the clipboard (macOS Only). |
| `git-credit` | Zach Holman's [dotfiles](https://github.com/holman/dotfiles) | Quicker way to assign credit to another author on the latest commit. |
| `git-cut-branch` | Ryan Tomayko's [dotfiles](https://github.com/rtomayko/dotfiles) | Create a new branch pointed at **HEAD** and reset the current branch to the head of its tracking branch |
| `git-delete-local-merged` | From a deleted post by @tekkub | Delete all local branches that have been merged into **HEAD**. |
| `git-delete-merged-branches` | ? | Purges all branches that have been merged to a target branch (defaults to branches merged to master). |
| `git-delete-tag` | Joe Block <jpb@unixorn.net> | Delete a tag, both locally and from the origin remote. |
| `git-diff-last` | [Sebastian Schuberth](https://github.com/sschuberth) | Show the last change made to a file in the repository. |
| `git-divergence` | Gary Bernhardt's [dotfiles](https://github.com/garybernhardt/dotfiles/blob/master/bin/git-churn) | Shows differences between local branch and its tracking branch. |
| `git-edit-conflicts` | Joe Block <jpb@unixorn.net> | Edit the files that are marked as conflicted during a merge/rebase in your `$EDITOR/$VISUAL`. |
| `git-find-dirty` | Matthew McCullough's [scripts](https://github.com/matthewmccullough/scripts/) repository | |
| `git-flush` | John Wiegley's [git-scripts](https://github.com/jwiegley/git-scripts) | Compact your reposistory by dropping all reflogs, stashes, and other cruft that may be bloating your pack files. |
| `git-force-mtimes` | John Wiegley's [git-scripts](https://github.com/jwiegley/git-scripts) | Sets mtimes of all files in the reprository their last change date based on git's log. Useful to avoid too new dates after a checkout confusing `make` or `rake`. |
| `git-forest` | Jan Engelhardt | Prints a text-based tree visualisation of your repository. |
| `git-git` | Joe Block <jpb@unixorn.net> | Typing `git git foo` will make git do a `git foo` instead of complaining. |
| `git-github-open` | ? | Open GitHub file/blob page for FILE on LINE. |
| `git-ignored` | ? | Show files being ignored by git in the repo. |
| `git-improved-merge` | Mislav Marohnić's [dotfiles](https://github.com/mislav/dotfiles) | Sophisticated git merge with integrated CI check and automatic cleanup. |
| `git-incoming-commits` | Ryan Tomayko's [dotfiles](https://github.com/rtomayko/dotfiles) | Adds a remote for the current repository for the given github username. |
| `git-incoming` | Michael Markert's [dotfiles](https://github.com/cofi/dotfiles) | Show commits in the tracking branch that are not in the local branch. |
| `git-ls-object-refs` | Ryan Tomayko's [dotfiles](https://github.com/rtomayko/dotfiles) | Find references to an object with SHA1 in refs, commits, and trees. All of them. |
| `git-maxpack` | John Wiegley's [git-scripts](https://github.com/jwiegley/git-scripts) | Compress a repo's pack files as much as possible. |
| `git-move-commits` | Corey Oordt's [git-scripts](https://github.com/coordt/git-scripts/blob/master/git-move-commits) | `git move-commits num-commits correct-branch` moves the last n commits to correct-branch (creating it if necessary). |
| `git-neck` | Christian Neukirchen's [blog](http://chneukirchen.org/blog/archive/2013/01/a-grab-bag-of-git-tricks.html) | Show commits from the HEAD until the first branching point. Companion script for `git-trail`. |
| `git-nuke` | Zach Holman's [dotfiles](https://github.com/holman/dotfiles) | Nukes a branch locally and on the origin remote. |
| `git-object-deflate` | Ryan Tomayko's [dotfiles](https://github.com/rtomayko/dotfiles) | Deflate an loose object file and write to standard output. |
| `git-outgoing` | Michael Markert's [dotfiles](https://github.com/cofi/dotfiles) | Show commits that are on the local branch that have not been pushed to the tracking branch. |
| `git-overwritten` | Mislav Marohnić's [dotfiles](https://github.com/mislav/dotfiles) | Aggregates git blame information about original owners of lines changed or removed in the '<base>...<head>' diff. |
| `git-pie-ify` | JeeBak Kim's [gist](https://gist.github.com/jeebak/f9088cede18d31f2d3a0) | `git pie-ify pattern replacement` |
| `git-plotrepo` | Matthew McCullogh's [scripts collection](https://github.com/matthewmccullough/scripts/blob/master/git-plotrepo.rb) | Uses dot to draw a graph of the repository. |
| `git-promote` | Trevor's **Improving My git Workflow** blog post (404 now) | Promotes a local topic branch to a remote tracking branch of the same name. |
| `git-prune-branches` | Michael Demmer in [jut-io/git-scripts](https://github.com/jut-io/git-scripts/blob/master/bin/git-prune-branches) | Deletes each fully merged branch after prompting for confirmation, than asks if you want the deleted branches deleted from your upstream remotes. |
| `git-pruneall` | Ryan Tomayko's [dotfiles](https://github.com/rtomayko/dotfiles) | Prune branches from specified remotes, or all remotes when no remote is specified. |
| `git-publish` | Michael Markert's [dotfiles](https://github.com/cofi/dotfiles) | `git publish remote [remote-branch]` |
| `git-purge-from-history` | David Underhill’s blog | Permanently delete files or folders from your git repository. |
| `git-pylint` | Joe Block <jpb@unixorn.net> | Runs pylint on any .py files modified or added in the `git status` output. |
| `git-rank-contributors` | William Morgan <wmorgan-git-wt-add@masanjin.net> | Rummages through the changelog and orders contributors by the size of the diffs they're responsible for. |
| `git-rebase-authors` | Mislav Marohnić's [dotfiles](https://github.com/mislav/dotfiles) | Adds authorship info to interactive `git rebase` output |
| `git-rebase-theirs` | Rodrigo Silva (MestreLion) <linux@rodrigosilva.com> | Resolve rebase conflicts by favoring 'theirs' version. |
| `git-recently-checkedout-branches` | Mislav Marohnić's [dotfiles](https://github.com/mislav/dotfiles) | Shows timestamp and name of recently checked-out branches in reverse chronological order. |
| `git-rel` | Ryan Tomayko's [dotfiles](http://github.com/rtomayko/dotfiles) | Shows the relationship between the current branch and *ref*>*. With no *ref*, the current branch's remote tracking branch is used. |
| `git-related` | Mislav Marohnić's [dotfiles](https://github.com/mislav/dotfiles) | Show other files that often get changed in commits that touch `<file>`. |
| `git-rename-branches` | Rodrigo Silva (MestreLion) <linux@rodrigosilva.com> | Rename multiple branches that start with a given name. |
| `git-reset-with-fire` | Joe Block <jpb@unixorn.net> | Hard reset the working directory, then zap any files not known to git. |
| `git-restore-mtime` | Rodrigo Silva (MestreLion) <linux@rodrigosilva.com> | Change mtime of files based on commit date of last change. |
| `git-rm-deleted-from-repo` | Joe Block <jpb@unixorn.net> | Removes files you deleted with `rm` from the repo for you. |
| `git-root-directory` | Joe Block <jpb@unixorn.net> | Prints the path to the root of the git repository you're in. |
| `git-run-command-on-revisions` | Gary Bernhardt's [dotfiles](https://github.com/garybernhardt/dotfiles) | Runs a given command over a range of Git revisions. |
| `git-shamend` | Danielle Sucher's [git-shamend](http://www.daniellesucher.com/2014/05/08/git-shamend/) blog post | Amends your staged changes as a fixup (keeping the pre-existing commit message) to the specified commit, or HEAD if no revision is specified. |
| `git-show-overwritten` | Mislav Marohnić's [dotfiles](https://github.com/mislav/dotfiles) | Aggregates `git blame` information about the original owners of lines changed or removed in the '<base>...<head>' diff. |
| `git-sp` | A. Schwarz's [git-sp](https://github.com/Schwarzy1/git-sp) | "Simple push", single short command to commit, and push. Use -a flag to add all files to commit. |
| `git-switch` | Andrew Steele's [dotfiles](https://github.com/Andrew565/dotfiles) | Make it easier to switch to a branch by a substring of its name. More useful if you are good about deleting branches which have been merged upstream and if your branch names include unique identifiers like ticket/issue numbers. |
| `git-submodule-rm` | Greg V's [dotfiles](https://github.com/myfreeweb/dotfiles) | Allows you to remove a submodule easily with `git submodule-rm path/to/submodule`. |
| `git-thanks` | Mislav Marohnić's [dotfiles](https://github.com/mislav/dotfiles) | List the contributors to a repository in descending commit order, even if their contribution has been completely replaced. |
| `git-track` | Zach Holman's [dotfiles](https://github.com/holman/dotfiles) | Sets up your branch to track a remote branch. Assumes you mean *origin/localbranchname*. |
| `git-trail` | Christian Neukirchen's [blog](http://chneukirchen.org/blog/archive/2013/01/a-grab-bag-of-git-tricks.html) | Show all branching points in the repo's Git history so you can see how to reach commits in the current branch from other branches. |
| `git-undelete` | ? | Undeletes a file. |
| `git-undo-push` | ? | Undoes your last push to branch **$1** of origin |
| `git-unpushed` | Zach Holman's [dotfiles](https://github.com/holman/dotfiles) | Show the diff of everything you haven't pushed to the origin remote yet |
| `git-unreleased` | Mislav Marohnić's [dotfiles](https://github.com/mislav/dotfiles) | Shows git commits since the last tagged version. |
| `git-up` | Ryan Tomayko's [dotfiles](http://github.com/rtomayko/dotfiles) | |
| `git-upstream-sync` | Joe Block <jpb@unixorn.net> | Fetches *upstream/yourforkname* and rebases it into your local fork, then pushes to your origin remote. |
| `git-what-the-hell-just-happened` | Gary Bernhardt's [dotfiles](https://github.com/garybernhardt/dotfiles/blob/master/bin/git-what-the-hell-just-happened) | Show what just happened. |
| `git-when-merged` | Michael Haggerty [git-when-merged](https://github.com/mhagger/git-when-merged) | Find when a commit was merged into one or more branches. |
| `git-where` | Mislav Marohnić's [dotfiles](https://github.com/mislav/dotfiles) | Shows where a particular commit falls between releases. |
| `git-winner` | Garry Dolley [https://github.com/up_the_irons/git-winner](https://github.com/up_the_irons/git-winner) | Shows what authors have made the most commits, both by number of commits and by number of lines changed. |
| `git-wtf` | William Morgan <wmorgan-git-wt-add@masanjin.net> | `git-wtf` displays the state of your repository in a readable, easy-to-scan format. It's useful for getting a summary of how a branch relates to a remote server, and for wrangling many topic branches. |
| `github-open` | Ryan Tomayko's [dotfiles](http://github.com/rtomayko/dotfiles) | |

## Useful git aliases

Here are some helpful aliases for your `~/.gitconfig`

| alias | Description |
| ----- | ----------- |
| `ahead-of-master = log --oneline origin/master..HEAD` | Show commits that haven't made it to master yet. |
| `fetch-pull-requests = fetch origin '+refs/pull/*/head:refs/remotes/origin/pull/*'` | Fetch pull requests from github so you can `git checkout pull/123` and test them locally. |
| `roots = log --all --oneline --decorate --max-parents=0` | Show the root commits. |
| `unpushed = log @{u}..` | Show which commits have not been pushed to the tracking branch and are safe to amend/rebase. |
| `wip = rebase -i @{u}` | Starts an interactive rebase of all the commits you haven't pushed yet. Handy for collapsing a bunch of WIP snapshots into logical commits before pushing, without having to worry about accidentally squashing a commit someone else has already referred to. |

## Other useful git stuff

### Articles / Blog posts / Books

* [awesome-github](https://github.com/fffaraz/awesome-github) - Faraz Fallahi maintains a curated list of Github & Git resources.

* Scott Chacon's [Pro Git](http://git-scm.com/book) book is a great resource for getting more out of git.

* Zach Dennis has a great [blog post](http://www.mutuallyhuman.com/blog/2012/06/22/a-git-walkthrough/) - it's worth reading on it's own, but here are a couple of good sites I found through it:
    * [gitready.com/](http://gitready.com/) is another great reference which has been collecting information and tips for git since 2009.
    * [gitimmersion.com/](http://gitimmersion.com/)

* There’s a quick [Introduction to git](http://learnxinyminutes.com/docs/git/) on learnxinyminutes.com

* There's a more detailed git tutorial on [learnenough.com](http://www.learnenough.com/git-tutorial)

* Kate Hudson maintains the [git flight rules](https://github.com/k88hudson/git-flight-rules) collection of useful git usage tips.

* [git-tips/tips](https://github.com/git-tips/tips) is a collection of git tips

* Christian Neukirchen wrote a great [blog post](http://chneukirchen.org/blog/archive/2013/01/a-grab-bag-of-git-tricks.html) on git that is the source for several scripts in this collection.

* Mislav Marohnić has a good article on git tips on his [blog](http://mislav.net/2010/07/git-tips/). Several of his git scripts are in this collection.

* And when you manage to get your git working directory in a sad state, you can run into the chicken-egg problem where if you just knew what command to `man`, you could dig yourself out of the hole, but if you knew that, you wouldn't be in the bad place anyway. [Oh Shit, Git!](http://ohshitgit.com/) has a collection of bad situations explained in plain English and how to get yourself out of them.

* Steve Lorek has a blog post explaining [how to shrink a repository](http://stevelorek.com/how-to-shrink-a-git-repository.html).

* Tim Green maintains the excellent [Github Cheat Sheet](https://github.com/tiimgreen/github-cheat-sheet) collection of tips and aliases.

* [firstaidgit.io](http://firstaidgit.io/) is a searchable selection of the most frequently asked Git questions

* [Git From the Inside Out](https://maryrosecook.com/blog/post/git-from-the-inside-out) - A good essay that explains how git works, focusing on the graph structure underpinnings of git and how they affect its behavior.

* [“Git” it together: Some tips on commit etiquette and best practices for junior developers](https://hackernoon.com/git-it-together-some-tips-on-commit-etiquette-and-best-practices-for-junior-developers-1f147b8dfd56) is a good article explaining some best practices on how to write a _good_ commit message.

### External Git Utilities

* [bfg repo-cleaner](https://rtyley.github.io/bfg-repo-cleaner/) - Removes large or troublesome blobs like git-filter-branch does, but faster.
* [bitbucket-git-helpers](https://github.com/unixorn/bitbucket-git-helpers.plugin.zsh) - Helper scripts to allow you to create bitbucket PRs from a shell session.
* [blackbox](https://github.com/StackExchange/blackbox) - Tom Limoncelli open sourced the tool they use at Stack Exchange to use GPG to store secrets in a git repository.
* [branch-manager](https://github.com/elstgav/branch-manager) - ZSH plugin for branch management
* [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) - Better looking git diffs
* [git-aliases.zsh](https://github.com/peterhurford/git-aliases.zsh) - Peter Hurford's git plugin which you may prefer to the git plugin from oh-my-zsh.
* [git-also](https://github.com/anvaka/git-also) - Shows what files are most often committed with a given file in the repository.
* [git-amend](https://github.com/colinodell/git-amend-old) - Bash script to amend older commits with staged changes.
* [git-branch-status](https://github.com/dmcgowan/git-branch-status) - A git utility to make managing large number of branches either across many remotes easier. Branch status allows comparing all branches against their upstream or any arbitrary branch to show the number of commit differences.
* [git-branches](https://github.com/shurcooL/git-branches) - Prints the commit behind/ahead counts for branches.
* [git-bump](https://github.com/arrdem/git-bump) - Hook scripts to automatically bump the version file in a repository
* [git-chart](https://github.com/flashcode/gitchart) - A python script that builds charts from a git repository
* [git-crypt](https://www.agwa.name/projects/git-crypt/) - Enables transparent encryption and decryption of files in a git repository. Files which you choose to protect are encrypted when committed, and decrypted when checked out.
* [git-deploy-s3](https://github.com/bradt/git-deploy-s3) - Keeps your git repo's assets in sync with Amazon S3.
* [git-diffall](https://github.com/thenigan/git-diffall) - Provides a directory based diff mechanism for git.
* [git-extend](https://github.com/nickolasburr/git-extend) - Extend Git builtins with command wrappers.
* [git-fastclone](https://github.com/square/git-fastclone) - Think `git clone --recursive` on steroids. If you're doing repeated checkouts of a given repo on a machine (like a ci box), **git-fastclone** will speed things up considerably.
* [git-follow](https://github.com/nickolasburr/git-follow) - Follow lifetime changes of a pathspec.
* [git-flow-completion](https://github.com/bobthecow/git-flow-completion) - Bash, Fish and Zsh completion support for [git-flow](http://github.com/nvie/gitflow)
* [git-graph](https://github.com/jerith666/git-graph) - creates a Graphviz graph showing the high-level structure of a repository's history.
* [git-gutter](https://github.com/jisaacks/GitGutter) - Plugin for Sublime Text 2/3 to display the git diff in the edit window gutter.
* [git-it-on.zsh](https://github.com/peterhurford/git-it-on.zsh) - Another plugin by Peter Hurford that adds a gitit command that will open your current directory on github, in your current branch.
* [git-quick-stats](https://github.com/arzzen/git-quick-stats) - A simple and efficient way to access various statistics in git repository.
* [git-repo-updater](https://github.com/earwig/git-repo-updater) - Allows you to easily update multiple git repositories at once.
* [git-secrets](https://github.com/awslabs/git-secrets) - Prevents you from committing secrets and credentials into git repositories.
* [git-standup](https://github.com/kamranahmedse/git-standup) - Recall what you did on the last working day. Can work in a directory full of git repos to see a consolidated view of all work in all the repos.
* [git-stashd](https://github.com/nickolasburr/git-stashd) - Autostashing daemon for dirty worktrees.
* [git-submodule-tools](https://github.com/kollerma/git-submodule-tools) - A collection of scripts that should help make life with git submodules easier.
* [git-sweep](https://github.com/arc90/git-sweep) - A utility script to remove branches that have been merged to master.
* [git-todo](https://github.com/ibolmo/git-todo/blob/master/git-todo) - helper script to show all the todo entries in your repo.
* [git-up (python)](https://pypi.python.org/pypi/git-up) - Python implementation of Aanand's original ruby gem
* [git-up](https://github.com/aanand/git-up) - Fetch and rebase all locally-tracked remote branches.
* [git-wayback-machine](https://github.com/MadRabbit/git-wayback-machine) - A simple script to quickly navigate a project's state through it's GIT history
* [git_history_visualizer](https://github.com/kidpixo/git_history_visualizer) - python script to visualize the history of files in a git repository
* [gitbaby](https://github.com/lordadamson/gitbaby) - Helper scripts to manage your git repositories
* [gitsh](https://github.com/thoughtbot/gitsh) - An interactive shell for git. From within gitsh you can issue any git command, even using your local aliases and configuration.
* [hub](https://github.com/github/hub) - A command line tool that wraps git in order to extend it with extra features and commands that make working with GitHub easier.
* [mergepbx](https://github.com/simonwagner/mergepbx) - Helper script for merging XCode project files.
* [xcode-build-scripts](https://github.com/indirect/xcode-git-build-scripts) - Helper scripts to use with XCode projects

## Contributing

* Please include an entry in the credits section of README.md for any scripts in your PRs so authors get their work credited correctly.
* Please use `#!/usr/bin/env interpreter` instead of a direct path to the interpreter, this makes it easier for people to use more recent versions when the ones packaged with their OS (macOS and CentOS, I'm looking at you) are stale.
