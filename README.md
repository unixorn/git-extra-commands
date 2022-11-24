# git-extra-commands

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Build Status](https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2Funixorn%2Fgit-extra-commands%2Fbadge%3Fref%3Dmain&style=plastic)](https://actions-badge.atrox.dev/unixorn/git-extra-commands/goto?ref=main)
![Awesomebot](https://github.com/unixorn/git-extra-commands/actions/workflows/awesomebot.yml/badge.svg)
![Megalinter](https://github.com/unixorn/git-extra-commands/actions/workflows/mega-linter.yml/badge.svg)
[![Code Climate](https://codeclimate.com/github/unixorn/git-extra-commands/badges/gpa.svg)](https://codeclimate.com/github/unixorn/git-extra-commands)
[![Issue Count](https://codeclimate.com/github/unixorn/git-extra-commands/badges/issue_count.svg)](https://codeclimate.com/github/unixorn/git-extra-commands)
[![GitHub stars](https://img.shields.io/github/stars/unixorn/git-extra-commands.svg)](https://github.com/unixorn/git-extra-commands/stargazers)

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents

- [Included Scripts](#included-scripts)
- [Useful git aliases](#useful-git-aliases)
- [Installing](#installing)
  - [Pre-requisites](#pre-requisites)
  - [Zgenom](#zgenom)
  - [Antigen](#antigen)
  - [Fig](#fig)
  - [oh-my-zsh](#oh-my-zsh)
  - [Bash / Manual Installation](#bash--manual-installation)
- [Other useful git stuff](#other-useful-git-stuff)
  - [Articles / Blog posts / Books](#articles--blog-posts--books)
  - [External Git Utilities](#external-git-utilities)
- [Miscellaneous Tips](#miscellaneous-tips)
  - [Make it easier to check out default branch](#make-it-easier-to-check-out-default-branch)
  - [Have git cope with typos](#have-git-cope-with-typos)
  - [Rewrite git:// with https://](#rewrite-git-with-https)
  - [or replace with `ssh`](#or-replace-with-ssh)
- [Contributing](#contributing)
- [Thanks](#thanks)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

**git-extra-commands** is a ZSH plugin that packages some extra `git` helper scripts I've found. This collection (and the scripts that I wrote in it) is licensed with the Apache Version 2 license.

However, some of the scripts in this collection came from other sources and may have different licensing - if they do, their license information is included inline in the script source.

This collection doesn't actually require ZSH, but packaging it as a ZSH plugin makes it more convenient for people using a ZSH framework to use this collection.

If you wrote one of these scripts and want it removed from this collection, please either make a PR and/or file an issue against the repository and I will remove it.

## Included Scripts

| Script | Original Source | Description |
| ------ | --------------- | ----------- |
| `git-add-username-remote` | Ryan Tomayko's dotfiles | Adds a remote for the current repository for the given GitHub username. |
| `git-age` | Kristoffer Gronlund's [wiki](https://github.com/krig/git-age/wiki) | A git-blame viewer, written using PyGTK.|
| `git-amend-all` | John Wiegley's [git scripts](https://github.com/jwiegley/git-scripts) | Adds all modified and deleted files, except the new files and adds them to the recent commit by amending it |
| `git-attic` | Leah Neukirchen's [blog](https://leahneukirchen.org/blog/archive/2013/01/a-grab-bag-of-git-tricks.html) | Displays a list of deleted files in your repository. The output is designed to be copy and pasted: Pass the second field to `git show` to display the file contents, or just select the hash without ^ to see the commit where removal happened. |
| `git-authors` | Michael Markert's [dotfiles](https://github.com/cofi/dotfiles) (as `git-changes`) | List authors in the repository in descending commit-count order. |
| `git-big-file` | Mislav Marohnić's [dotfiles](https://github.com/mislav/dotfiles) | Show files in the repository larger than a threshold size. |
| `git-branch-date` | Joe Block <jpb@unixorn.net> | List branches in commit-date order |
| `git-branch-diff` | Joe Block <jpb@unixorn.net> | Diffs your current HEAD with the default branch of the origin remote |
| `git-branch-name` | Joe Block <jpb@unixorn.net> | Prints the current branch name in automation-friendly format. |
| `git-branch-rebaser` | Vengada Rangaraju <krangaraju@castlighthealth.com> | Kicks off an interactive rebase of all the commits on your branch. _Including pushed commits_, so be careful. |
| `git-branch-status` | John Wiegley's [git scripts](https://github.com/jwiegley/git-scripts) | Colorized status report on all branches in your repository |
| `git-branches-that-touch` | Mislav Marohnić's [dotfiles](https://github.com/mislav/dotfiles) | Shows which branches touch files under a path that are remote, unmerged, have a commit in the last six months and whose name doesn't start with 'enterprise-' |
| `git-change-author` | Michael Demmer in [jut-io/git-scripts](https://github.com/jut-io/git-scripts/blob/master/bin/git-change-author) | Change one author/email in the history to another. |
| `git-change-log` | John Wiegley's [git-scripts](https://github.com/jwiegley/git-scripts) | Transform `git log` output into a complete Changelog for projects that haven't been maintaining one. |
| `git-changes` | Michael Markert's [dotfiles](https://github.com/cofi/dotfiles) | Symlink to `git-authors`. List authors in the repository in descending commit-count order. |
| `git-checkout-branches` | John Wiegley's [git scripts](https://github.com/jwiegley/git-scripts) | Checks out all remote branches |
| `git-checkout-by-date` | ? | Lets you checkout several files at once at the version specified by a date. |
| `git-checkout-commit` |From the [fzf wiki](https://github.com/junegunn/fzf/wiki/examples) | Uses [fzf](https://github.com/junegunn/fzf) to checkout a commit, showing the commit diff as preview. |
| `git-checkout-default-branch` | I got tired of keeping track of which repositories use `main`, `master` or something else as default branch | Checks out the default branch of the `origin` remote so you don't have to remember which repositories use `master`, `main` or whatever. |
| `git-checkout-pr` | Based on [gist.github.com/gnarf/5406589](https://gist.github.com/gnarf/5406589) | Check out a PR locally |
| `git-checkout-preview` | From the [fzf wiki](https://github.com/junegunn/fzf/wiki/examples) | Uses [fzf](https://github.com/junegunn/fzf) to checkout a branch, showing what commits diverge between the branches. |
| `git-checkout-tag` | Joe Block <jpb@unixorn.net> | Check out a tag into a branch named after the tag. |
| `git-children-of` | John Wiegley's [git-scripts](https://github.com/jwiegley/git-scripts) | Shows the children of a given `git` commit |
| `git-churn` | Gary Bernhardt's [dotfiles](https://github.com/garybernhardt/dotfiles/blob/master/bin/git-churn) | Show which files are getting changed most often in the repository. |
| `git-clone-subset` | Rodrigo Silva (MestreLion) <linux@rodrigosilva.com> | Uses `git clone` and `git filter-branch` to remove from the clone all files but the ones requested, along with their associated commit history. |
| `git-comma` | Leah Neukirchen's [blog](https://leahneukirchen.org/blog/archive/2013/01/a-grab-bag-of-git-tricks.html) | Adds and commits a file in one command |
| `git-commit-browser` | From the [fzf wiki](https://github.com/junegunn/fzf/wiki/examples) | Uses [fzf](https://github.com/junegunn/fzf) to browse commit history. |
| `git-conflicts` | Seth Messer's [bits and bobs](https://github.com/megalithic/bits-and-bobs/) repository | Show files with conflicts |
| `git-copy-branch-name` | Zach Holman's [dotfiles](https://github.com/holman/dotfiles) | Copy the current branch's name to the clipboard (macOS Only). |
| `git-credit` | `git-credit-author` | Zach Holman's [dotfiles](https://github.com/holman/dotfiles) | Quicker way to assign credit to another author on the latest commit. |
| `git-current-branch` | Joe Block <jpb@unixorn.net> | Prints the name of the current branch with no odd characters or formatting, mainly useful in automation scripts. |
| `git-current-commit` | Joe Block <jpb@unixorn.net> | Prints the hash of the current commit with no odd characters or formatting, mainly useful in automation scripts. |
| `git-cut-branch` | Ryan Tomayko's dotfiles | Create a new branch pointed at **HEAD** and reset the current branch to the head of its tracking branch |
| `git-delete-dangling-commits` | [Stack Overflow](http://stackoverflow.com/questions/3765234/listing-and-deleting-git-commits-that-are-under-no-branch-dangling) | Clean up dangling commits that are not on any branch |
| `git-delete-local-merged` | From a deleted post by @tekkub | Delete all local branches that have been merged into **HEAD**. |
| `git-delete-merged-branches` | ? | Purges all branches that have been merged to a target branch (defaults to branches merged to master). |
| `git-delete-remote-branch` | Joe Block <jpb@unixorn.net> | Delete a branch from a specified remote. |
| `git-delete-squashed-and-merged-branches` | Paul Irish's [dotfiles](https://github.com/paulirish/dotfiles) | Purges all branches that have been squashed and merged to a target branch (defaults to branches merged to master). Requires `pygithub`. |
| `git-delete-tag` | Joe Block <jpb@unixorn.net> | Delete a tag, both locally and from the origin remote. |
| `git-diff-last` | [Sebastian Schuberth](https://github.com/sschuberth) | Show the last change made to a file in the repository. |
| `git-divergence` | Gary Bernhardt's [dotfiles](https://github.com/garybernhardt/dotfiles/blob/master/bin/git-churn) | Shows differences between local branch and its tracking branch. |
| `git-edit-conflicts` | Joe Block <jpb@unixorn.net> | Edit the files that are marked as conflicted during a merge/rebase in your `$EDITOR/$VISUAL`. |
| `git-fetch-prs` | Pretty sure I saw this on slack, but can't recall which one | Get all Pull Request branches from a given remote by refspec |
| `git-files` | Jake Zimmerman's [blog](https://blog.jez.io/cli-code-review/) | List the files different between the current branch and `$REVIEW_BRANCH`, which if unset defaults to the repository's default branch |
| `git-find-dirty` | Matthew McCullough's [scripts](https://github.com/matthewmccullough/scripts/) repository | |
| `git-flush` | John Wiegley's [git-scripts](https://github.com/jwiegley/git-scripts) | Compact your repository by dropping all reflogs, stashes, and other cruft that may be bloating your pack files. |
| `git-force-mtimes` | John Wiegley's [git-scripts](https://github.com/jwiegley/git-scripts) | Sets modification times of all files in the repository their last change date based on `git`'s log. Useful to avoid too new dates after a checkout confusing `make` or `rake`. |
| `git-forest` | Jan Engelhardt | Prints a text-based tree visualisation of your repository. Requires [Git.pm](https://metacpan.org/release/Git) |
| `git-functionlog` | Joe Block <jpb@unixorn.net> | Allows you to get a `git log` of a particular function, not a file |
| `git-fzf-add` | [Fuzzy Finding in Bash with fzf](https://bluz71.github.io/2018/11/26/fuzzy-finding-in-bash-with-fzf.html) | Use [fzf](https://github.com/junegunn/fzf) to select files to add to `git` |
| `git-fzf-log-browser` | [Fuzzy Finding in Bash with fzf](https://bluz71.github.io/2018/11/26/fuzzy-finding-in-bash-with-fzf.html) | Use [fzf](https://github.com/junegunn/fzf) to browse the repository's `git` log |
| `git-fzf-pickaxe-browser` | [Fuzzy Finding in Bash with fzf](https://bluz71.github.io/2018/11/26/fuzzy-finding-in-bash-with-fzf.html) | Use [fzf](https://github.com/junegunn/fzf) to display a `git log` list that has been filtered with [pickaxe](http://www.philandstuff.com/2014/02/09/git-pickaxe.html) for a search term. |
| `git-fzf-reflog-browser` | [Fuzzy Finding in Bash with fzf](https://bluz71.github.io/2018/11/26/fuzzy-finding-in-bash-with-fzf.html) | Use [fzf](https://github.com/junegunn/fzf) to browse the repository's `git` reflog list that can be filtered by entering a fuzzy term at the prompt. Navigation up and down the hash list will preview the changes of each hash. |
| `git-git` | Joe Block <jpb@unixorn.net> | Typing `git git foo` will make `git` do a `git foo` instead of complaining. |
| `git-github-open` | ? | Open GitHub file/blob page for FILE on LINE. |
| `git-gitlab-mr` | Noel Cower's [gist](https://gist.github.com/nilium/ac808ee3729cdce01ec0f3c0a499f099) | Open a merge request on GitLab |
| `git-history-graph` | ? | Pretty `git` log, single line per commit, with branch graphing |
| `git-ignored` | ? | Show files being ignored by `git` in the repository. |
| `git-improved-merge` | Mislav Marohnić's [dotfiles](https://github.com/mislav/dotfiles) | Sophisticated `git merge` with integrated CI check and automatic cleanup. |
| `git-incoming` | Michael Markert's [dotfiles](https://github.com/cofi/dotfiles) | Show commits in the tracking branch that are not in the local branch. |
| `git-jump` | Cowboy's [dotfiles](https://github.com/cowboy/dotfiles/blob/master/bin/git-jump) | Replays `git` commits by moving forward / backward through a branch's history |
| `git-latest-tag` | Joe Block <jpb@unixorn.net> | Fetch tags from all remotes and show the most recent tag name. |
| `git-lines` | [Neil Killeen](https://github.com/kiLLeen) <nkilleen@castlighthealth.com> | Gives you a list of author names with the number of lines last updated by that user in files in the current directory tree with the extension specified. |
| `git-log-single-file` | Joe Block <jpb@unixorn.net> | Show the log for a single file |
| `git-ls-branch-files` | Joe Block | List files changed between a specified branch and the current branch |
| `git-ls-object-refs` | Ryan Tomayko's dotfiles | Find references to an object with SHA1 in refs, commits, and trees. All of them. |
| `git-maildiff` | Sanjeev Kumar's blogpost | A simple `git` command to email diff in color to reviewer/ co-worker. |
| `git-make-gitignore` | #commandline-fu on coffeeops | Prints a language-specific `.gitignore` file using [gitignore.io](https://gitignore.io) |
| `git-maxpack` | John Wiegley's [git-scripts](https://github.com/jwiegley/git-scripts) | Compress a repository's pack files as much as possible. |
| `git-merged-branches` | Sergei Boiko's [Git housekeeping tutorial: clean-up outdated branches in local and remote repositories](https://railsware.com/blog/git-housekeeping-tutorial-clean-up-outdated-branches-in-local-and-remote-repositories/) article | Lists all branches that have been merged |
| `git-move-commits` | Corey Oordt's [git-scripts](https://github.com/coordt/git-scripts/blob/master/git-move-commits) | `git move-commits num-commits correct-branch` moves the last n commits to correct-branch (creating it if necessary). |
| `git-neck` | Leah Neukirchen's [blog](https://leahneukirchen.org/blog/archive/2013/01/a-grab-bag-of-git-tricks.html) | Show commits from the HEAD until the first branching point. Companion script for `git-trail`. |
| `git-nuke` | Zach Holman's [dotfiles](https://github.com/holman/dotfiles) | Nukes a branch locally and on the origin remote. |
| `git-object-deflate` | Ryan Tomayko's dotfiles | Deflate an loose object file and write to standard output. |
| `git-oldest-common-ancestor` | Lee Dohm's [dotfiles](https://github.com/lee-dohm/dotfiles/blob/main/bin/git-oldest-ancestor) | Finds the oldest common ancestor commit between two branches. |
| `git-open-jira` | If the branch name starts with `JIRAPROJECT-NNNN`, will open that issue in jira. Assumes that your JIRA server location is in `~/.jira-server` or in the `$JIRA_SERVER` environment variable. |
| `git-origin-head` | Don't recall, maybe twitter | Prints the name of the origin remote's default branch. Not every repository uses `main` or `master`. |
| `git-outgoing` | Michael Markert's [dotfiles](https://github.com/cofi/dotfiles) | Show commits that are on the local branch that have not been pushed to the tracking branch. |
| `git-overwritten` | Mislav Marohnić's [dotfiles](https://github.com/mislav/dotfiles) | Aggregates `git blame` information about original owners of lines changed or removed in the '<base>...<head>' diff. |
| `git-pie-ify` | JeeBak Kim's [gist](https://gist.github.com/jeebak/f9088cede18d31f2d3a0) | `git pie-ify pattern replacement` |
| `git-plotrepo` | Matthew McCullogh's [scripts collection](https://github.com/matthewmccullough/scripts/blob/master/git-plotrepo.rb) | Uses dot to draw a graph of the repository. |
| `git-pr-fetch` | Joe Block <jpb@unixorn.net> | Fetch PR branches by refspec from one of a repository's remotes. |
| `git-pr-list` | Joe Block <jpb@unixorn.net> | Lists pull requests. Requires `gh` |
| `git-promote` | Trevor's **Improving My git Workflow** blog post (404 now) | Promotes a local topic branch to a remote tracking branch of the same name. |
| `git-prune-branches` | Michael Demmer in [jut-io/git-scripts](https://github.com/jut-io/git-scripts/blob/master/bin/git-prune-branches) | Deletes each fully merged branch after prompting for confirmation, than asks if you want the deleted branches deleted from your upstream remotes. |
| `git-pruneall` | Ryan Tomayko's dotfiles | Prune branches from specified remotes, or all remotes when no remote is specified. |
| `git-publish` | Michael Markert's [dotfiles](https://github.com/cofi/dotfiles) | `git publish remote [remote-branch]` |
| `git-purge-from-history` | David Underhill’s blog | Permanently delete files or folders from your `git` repository. |
| `git-pylint` | Joe Block <jpb@unixorn.net> | Runs pylint on any .py files modified or added in the `git status` output. |
| `git-rank-contributors` | William Morgan <wmorgan-git-wt-add@masanjin.net> | Rummages through the changelog and orders contributors by the size of the diffs they're responsible for. |
| `git-rebase-authors` | Mislav Marohnić's [dotfiles](https://github.com/mislav/dotfiles) | Adds authorship info to interactive `git rebase` output |
| `git-rebase-theirs` | Rodrigo Silva (MestreLion) <linux@rodrigosilva.com> | Resolve rebase conflicts by favoring 'theirs' version. |
| `git-recent` | Mine | Shows information about most recent commit on all local branches |
| `git-recently-checkedout-branches` | Mislav Marohnić's [dotfiles](https://github.com/mislav/dotfiles) | Shows timestamp and name of recently checked-out branches in reverse chronological order. |
| `git-ref-recent` | [Y combinator article](https://news.ycombinator.com/item?id=22796640) | Shows the date, branch name, commit hash, and commit subject of branches, from most recently modified to oldest branches. |
| `git-rel` | Ryan Tomayko's dotfiles | Shows the relationship between the current branch and _ref_. With no _ref_, the current branch's remote tracking branch is used. |
| `git-related` | Mislav Marohnić's [dotfiles](https://github.com/mislav/dotfiles) | Show other files that often get changed in commits that touch `<file>`. |
| `git-release-tag` | Mislav Marohnić's [dotfiles](https://github.com/mislav/dotfiles) | Create a GitHub release for a specified tag. The release notes are automatically populated with the contents of git log since the last tagged version |
| `git-remote-default-branch` | Mine | Shows the default branch for a specified remote, defaults to origin when no remote is specified. |
| `git-remove-conflicts ours or theirs FILES...` | John Wiegley's [git scripts](https://github.com/jwiegley/git-scripts) | Automatically resolves conflicts by applying the changes from current branch (ours) or remote branch (theirs) |
| `git-rename-branches` | Rodrigo Silva (MestreLion) <linux@rodrigosilva.com> | Rename multiple branches that start with a given name. |
| `git-replace-author` | ? | Uses `git-filter-branch` to rewrite all commits with one name to use another name and email. |
| `git-reset-with-fire` | Joe Block <jpb@unixorn.net> | Hard reset the working directory, then zap any files not known to `git`. |
| `git-restore-mtime` | Rodrigo Silva (MestreLion) <linux@rodrigosilva.com> | Change mtime of files based on commit date of last change. |
| `git-reup` | Zach Holman's [dotfiles](https://github.com/holman/dotfiles) | Like `git pull` but show a short and sexy log of changes after merging or rebasing. |
| `git-rm-deleted-from-repo` | Joe Block <jpb@unixorn.net> | Removes files you deleted with `rm` from the repository for you. |
| `git-root-directory` | Joe Block <jpb@unixorn.net> | Prints the path to the root of the `git` repository you're in. |
| `git-run-command-on-revisions` | Gary Bernhardt's [dotfiles](https://github.com/garybernhardt/dotfiles) | Runs a given command over a range of `git` revisions. |
| `git-shamend` | Danielle Sucher's [git-shamend](http://www.daniellesucher.com/2014/05/08/git-shamend/) blog post | Amends your staged changes as a fixup (keeping the pre-existing commit message) to the specified commit, or HEAD if no revision is specified. |
| `git-show-overwritten` | Mislav Marohnić's [dotfiles](https://github.com/mislav/dotfiles) | Aggregates `git blame` information about the original owners of lines changed or removed in the '<base>...<head>' diff. |
| `git-shrink-repo` | Based on [gimbo/gimbo-git.zsh](https://github.com/gimbo/gimbo-git.zsh/blob/master/gimbo-git.zsh) | Shrinks your clone of a `git` repository. |
| `git-side-by-side` | Greg V's [vmware-archive/git_scripts](https://github.com/vmware-archive/git_scripts) | @hefeweizen on the coffeeops slack | Does a side-by-side diff similar to GitHub PRs |
| `git-sp` | A. Schwarz's [git-sp](https://github.com/Schwarzy1/git-sp) | "Simple push", single short command to commit, and push. Use `-a` flag to add all files to commit. |
| `git-sr` | Noel Cower's [git-sr](https://gist.github.com/nilium/2829f6690ad888c25660c15ba3a7c59c) | Use `fzf` to switch to a different `git` ref. |
| `git-stats` | Jake Zimmerman's [blog](https://blog.jez.io/cli-code-review/) | Displays stats for the files different between the current branch and `$REVIEW_BRANCH`, which if unset defaults to the repository's default branch |
| `git-submodule-rm` | Greg V's [dotfiles](https://github.com/myfreeweb/dotfiles) & [Pascal Sommer](https://github.com/pascal-so/) | Allows you to remove a submodule easily with `git submodule-rm path/to/submodule`. |
| `git-superpull` | Greg V's [vmware-archive/git_scripts](https://github.com/vmware-archive/git_scripts) | Pulls, then does a `git submodule init` and `git submodule update` |
| `git-switch-branch` | Andrew Steele's [dotfiles](https://github.com/Andrew565/dotfiles) | Make it easier to switch to a branch by a substring of its name. More useful if you are good about deleting branches which have been merged upstream and if your branch names include unique identifiers like ticket/issue numbers or feature names. |
| `git-tag-and-sign` | ? | Create and sign a new tag |
| `git-tag-diff` | John Wiegley's [git-scripts](https://github.com/jwiegley/git-scripts)  | Show the differences between local tags and ones on the remote, if any |
| `git-thanks` | Mislav Marohnić's [dotfiles](https://github.com/mislav/dotfiles) | List the contributors to a repository in descending commit order, even if their contribution has been completely replaced. |
| `git-track` | Zach Holman's [dotfiles](https://github.com/holman/dotfiles) | Sets up your branch to track a remote branch. Assumes you mean _origin/localbranchname_. |
| `git-trail` | Leah Neukirchen's [blog](http://leahneukirchen.org/blog/archive/2013/01/a-grab-bag-of-git-tricks.html) | Show all branching points in the repository's `git` history so you can see how to reach commits in the current branch from other branches. |
| `git-undelete` | ? | Undeletes a file. |
| `git-undo-push` | ? | Undoes your last push to branch **$1** of origin |
| `git-undo` | ? | Undoes your last commit but keeps the changes in place. |
| `git-unpushed` | Zach Holman's [dotfiles](https://github.com/holman/dotfiles) | Show the diff of everything you haven't pushed to the origin remote yet |
| `git-unreleased` | Mislav Marohnić's [dotfiles](https://github.com/mislav/dotfiles) | Shows `git` commits since the last tagged version. |
| `git-up` | Zach Holman's [dotfiles](https://github.com/holman/dotfiles) | Like `git pull` but show a short and sexy log of changes after merging or rebasing. |
| `git-upstream-name` | Joe Block <jpb@unixorn.net> | Print the name of the current branch's upstream. |
| `git-upstream-sync` | Joe Block <jpb@unixorn.net> | Fetches _upstream/yourforkname_ and rebases it into your local fork, then pushes to your origin remote. |
| `git-what-the-hell-just-happened` | Gary Bernhardt's [dotfiles](https://github.com/garybernhardt/dotfiles/blob/master/bin/git-what-the-hell-just-happened) | Show what just happened. |
| `git-when-merged` | Michael Haggerty [git-when-merged](https://github.com/mhagger/git-when-merged) | Find when a commit was merged into one or more branches. |
| `git-where-pr` | Mislav Marohnić's [dotfiles](https://github.com/mislav/dotfiles) | Opens the Pull Request on GitHub where a specified commit originated |
| `git-where` | Mislav Marohnić's [dotfiles](https://github.com/mislav/dotfiles) | Shows where a particular commit falls between releases. |
| `git-whoami` | Peter Eisentraut | Shows what username & email you have configured for the repository you're in |
| `git-winner` | Garry Dolley [https://github.com/up_the_irons/git-winner](https://github.com/up_the_irons/git-winner) | Shows what authors have made the most commits, both by number of commits and by number of lines changed. |
| `git-wordiness` | Noel Cower | Shows how wordy people's commit messages are. Useful for shaming the folks who commit atrocities like `git commit -m fixup` |
| `git-wtf` | William Morgan <wmorgan-git-wt-add@masanjin.net> | `git-wtf` displays the state of your repository in a readable, easy-to-scan format. It's useful for getting a summary of how a branch relates to a remote server, and for wrangling many topic branches. |

## Useful git aliases

Here are some helpful aliases for your `~/.gitconfig`

| alias | Description |
| ----- | ----------- |
| `ahead-of-master = log --oneline origin/master..HEAD` | Show commits that haven't made it to master yet. |
| `fetch-pull-requests = fetch origin '+refs/pull/*/head:refs/remotes/origin/pull/*'` | Fetch pull requests from GitHub so you can `git checkout pull/123` and test them locally. |
| `roots = log --all --oneline --decorate --max-parents=0` | Show the root commits. |
| `unpushed = log @{u}..` | Show which commits have not been pushed to the tracking branch and are safe to amend/rebase. |
| `work-in-progress = rebase -i @{u}` | Starts an interactive rebase of all the commits you haven't pushed yet. Handy for collapsing a bunch of work-in-progress snapshots into logical commits before pushing, without having to worry about accidentally squashing a commit someone else has already referred to. |

## Installing

### Pre-requisites

- A relatively recent version of `git`. The version of `git` Apple includes in macOS is very stale. You should really `brew install git` to get the current version if you're on macOS - if not for features, for security updates.
- Python 3+
- Ruby 2.2+

### Zgenom

If you're using [Zgenom](https://github.com/jandamm/zgenom):

1. Add `zgenom load unixorn/git-extra-commands` to your `.zshrc` along with your other `zgenom load` commands.
2. `zgenom reset && zgenom save`

### Antigen

If you're using [Antigen](https://github.com/zsh-users/antigen):

1. Add `antigen bundle unixorn/git-extra-commands@main` to your `.zshrc` where you've listed your other plugins.
2. Close and reopen your Terminal/iTerm window to **refresh context** and use the plugin. Alternatively, you can run `antigen bundle unixorn/git-extra-commands` in a running shell to have `antigen` load the new plugin.

### Fig

[Fig](https://fig.io) adds apps, shortcuts, and autocomplete to your existing terminal.

Install `git-extra-commands` in just one click.

<a href="https://fig.io/plugins/other/git-extra-commands_unixorn" target="_blank"><img src="https://fig.io/badges/install-with-fig.svg" /></a>

### oh-my-zsh

If you're using [oh-my-zsh](https://ohmyz.sh):

1. Clone the repository into a new `git-extra-commands` directory in oh-my-zsh's plugin folder:

  `git clone https://github.com/unixorn/git-extra-commands.git $ZSH_CUSTOM/plugins/git-extra-commands`

2. Edit your `~/.zshrc` and add `git-extra-commands` – same as clone directory – to the list of plugins to enable:

  `plugins=( ... git-extra-commands )`

3. Then, restart your terminal application to **refresh context** and use the plugin. Alternatively, you can source your current shell configuration:

  `source ~/.zshrc`

### Bash / Manual Installation

Nothing here actually requires you to use ZSH or zgen, that's just a convenient distribution method for anyone using a ZSH framework.

If you aren't using any ZSH frameworks, or if you're using `bash`, `fish` or another shell, do the following steps:

1. `git clone` this repository
2. Add `cloneDirectory/bin` to your `$PATH` in your shell's startup file.

## Other useful git stuff

### Articles / Blog posts / Books

- [A Grab Bag of Git Tricks](https://leahneukirchen.org/blog/archive/2013/01/a-grab-bag-of-git-tricks.html) by Leah Neukirchen is a great blog post on `git` that is the source for several scripts in this collection.
- [4 Branching Workflows for git](https://medium.com/@patrickporto/4-branching-workflows-for-git-30d0aaee7bf) by Patrick Porto discusses the pros and cons of four of the more popular `git` workflows.
- [5 types of Git workflows that will help you deliver better code](https://buddy.works/blog/5-types-of-git-workflows) explains five different Git workflows and the way they tackle various aspects of code collaboration: introducing changes, solving conflicts, using branches, and more.
- [A Git Walkthrough](http://www.mutuallyhuman.com/blog/2012/06/22/a-git-walkthrough/) by Zach Dennis is a great blog post
- [A Thorough Introduction to Git's Interactive Patch Mode](https://dev.to/krnsk0/a-thorough-introduction-to-git-s-interactive-patch-mode-4bl6) is an introduction on how to stage just parts of your changes to a commit.
- [A Tidy, Linear Git History](http://www.bitsnbites.eu/a-tidy-linear-git-history/) by Marcus Geelnard is a blog post about the value of a linear commit history.
- [Conditional .gitconfig](https://utf9k.net/blog/conditional-gitconfig/) by Marcus Crane explains how to have different `.gitconfig` settings based on where the checkout is located. This makes it easy to have a work directory with work settings applied to all repositories in it, and a personal one with different settings.
- [Fuzzy Finding in Bash with fzf](https://bluz71.github.io/2018/11/26/fuzzy-finding-in-bash-with-fzf.html) is a great article about using [fzf](https://github.com/junegunn/fzf) with some `git` helper scripts.
- [Fuzzy Git Checkout](https://polothy.github.io/post/2019-08-19-fzf-git-checkout/) by Mark Nielsen explains how to use [fzf](https://github.com/junegunn/fzf) for `git` checkouts.
- [Git Exercises](https://jvns.ca/blog/2019/08/30/git-exercises--navigate-a-repository/) is a great blog post by Julia Evans.
- [Git From the Inside Out](https://maryrosecook.com/blog/post/git-from-the-inside-out) explains how `git` works, focusing on the graph structure underpinnings of `git` and how they affect its behavior.
- [Git Koans](http://stevelosh.com/blog/2013/04/git-koans/) - Inspired by the [Vim Koans](http://blog.sanctum.geek.nz/vim-koans/)
- [Git Rebase in Depth](https://git-rebase.io/) is a good tutorial on `git rebase` that covers the common use cases for rebasing.
- [Git Submodules Revisted](https://dev.to/dwd/git-submodules-revisited-1p54) is a good article by Dave Cridland on using submodules in your code.
- [GitHub Cheat Sheet](https://github.com/tiimgreen/github-cheat-sheet) is an excellent collection of tips and aliases maintained by Tim Green.
- [How to Review a Merge Commit](https://haacked.com/archive/2014/02/21/reviewing-merge-commits/) is a good article on dealing with reviewing the changes made during a merge.
- [Learn Git Branching](https://learngitbranching.js.org/) is the most visual and interactive way to learn `git` on the web; you'll be challenged with exciting levels, given step-by-step demonstrations of powerful features, and maybe even have a bit of fun along the way.
- [More Productive Git](https://increment.com/open-source/more-productive-git/) by James Turnbull is a quick tutorial for beginning `git` users.
- [Oh Shit, Git!](http://ohshitgit.com/) has a collection of bad situations explained in plain English and how to get yourself out of them . When you manage to get your `git` working directory in a sad state, you can run into the chicken-egg problem where if you just knew what command to `man`, you could dig yourself out of the hole, but if you knew that, you wouldn't be in the bad place anyway.
- [Platform Specific Gitconfigs and the Wonderful includeif](https://medium.com/doing-things-right/platform-specific-gitconfigs-and-the-wonderful-includeif-7376cd44994d) by Mike Mackintosh explains how to have different gitconfig settings based on what platform you're on or what directory you're in. Makes it easier to have personal and work repos on the same machine.
- [Pro Git](http://git-scm.com/book) by Scott Chacon is a great resource for getting more out of `git`.
- [The Git Pickaxe](http://www.philandstuff.com/2014/02/09/git-pickaxe.html) explains how you can use the `git` pickaxe to search easily for strings in commit messages - write good commit messages and it'll be easier to find the commits that actually implement changes.
- [Top ten pull request review mistakes](https://blog.scottnonnenberg.com/top-ten-pull-request-review-mistakes/) is a great article by Scott Nonnenberg on how to do better code reviews on PRs.
- [Tracking diffs by scoping to file, range, function, method, or class changes in Git](https://susanpotter.net/software/tracking-diffs-by-scoping-to-file-range-function-method-or-class-changes-in-git/) is a great article by Susan Potter about making `git` show file-specific diffs, or even function-specific diffs in a language-aware way.
- [awesome-github](https://github.com/fffaraz/awesome-github) - Faraz Fallahi maintains a curated list of GitHub & Git resources.
- [firstaidgit.io](http://firstaidgit.io/) is a searchable selection of the most frequently asked `git` questions
- [git flight rules](https://github.com/k88hudson/git-flight-rules) by Kate Hudson is a collection of useful `git` usage tips.
- [git, the simple guide](https://rogerdudler.github.io/git-guide/) by Roger Dudler is a good introduction to `git`.
- [git-tips/tips](https://github.com/git-tips/tips) is a collection of `git` tips.
- [git-tips](http://mislav.net/2010/07/git-tips/) by Mislav Marohnić is a good article on `git` tips. Several of his `git` scripts are in this collection.
- [gitimmersion.com/](http://gitimmersion.com/) is a guided tour that walks through the fundamentals of Git, inspired by the premise that to know a thing is to do it.
- [gitready.com/](http://gitready.com/) is a great reference which has been collecting information and tips for `git` since 2009.
- [learnenough.com](http://www.learnenough.com/git-tutorial) has a more detailed `git` tutorial on
- [“Git” it together: Some tips on commit etiquette and best practices for junior developers](https://hackernoon.com/git-it-together-some-tips-on-commit-etiquette-and-best-practices-for-junior-developers-1f147b8dfd56) is a good article explaining some best practices on how to write a _good_ commit message, no matter what source control system you're using.
-[Introduction to git](https://learnxinyminutes.com/docs/git/) on [learnxinyminutes.com](https://learnxinyminutes.com) is a quick intro.

### External Git Utilities

- [bfg repo-cleaner](https://rtyley.github.io/bfg-repo-cleaner/) - Removes large or troublesome blobs like `git filter-branch` does, but faster.
- [bitbucket-git-helpers](https://github.com/unixorn/bitbucket-git-helpers.plugin.zsh) - Helper scripts to allow you to create bitbucket PRs from a shell session.
- [blackbox](https://github.com/StackExchange/blackbox) - Tom Limoncelli open sourced the tool they use at Stack Exchange to use GPG to store secrets in a `git` repository.
- [branch-manager](https://github.com/elstgav/branch-manager) - ZSH plugin for branch management
- [commit-helper](https://github.com/andre-filho/commit-helper) - A python script that helps you write commits following commit conventions.
- [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) - Better looking `git` diffs
- [gig](https://dev.to/shihanng/gig-a-gitignore-generator-opc) - a CLI `.gitignore` generator
- [git ZSH plugin](https://github.com/davidde/git) - A replacement for the stock oh-my-zsh `git` plugin. Provides quite a few useful aliases and functions that are more consistent in their naming that the relatively unintuitive ones in the stock plugin.
- [git-activity](https://github.com/aaossa/git-activity) - Displays an activity graph (like the contribution graph on GitHub) for the current git repository and branch.
- [git-aliases.zsh](https://github.com/peterhurford/git-aliases.zsh) - Peter Hurford's `git` plugin which you may prefer to the `git` plugin from oh-my-zsh.
- [git-also](https://github.com/anvaka/git-also) - Shows what files are most often committed with a given file in the repository.
- [git-amend](https://github.com/colinodell/git-amend-old) - Bash script to amend older commits with staged changes.
- [git-branch-status](https://github.com/dmcgowan/git-branch-status) - A `git` utility to make managing large number of branches either across many remotes easier. Branch status allows comparing all branches against their upstream or any arbitrary branch to show the number of commit differences.
- [git-branches](https://github.com/shurcooL/git-branches) - Prints the commit behind/ahead counts for branches.
- [git-bump](https://github.com/arrdem/git-bump) - Hook scripts to automatically bump the version file in a repository
- [git-chart](https://github.com/flashcode/gitchart) - A python script that builds charts from a `git` repository
- [git-clean-branch](https://github.com/gobriansteele/git-clean-branch) - Cleans up dead `git` branches.
- [git-cliff](https://github.com/orhun/git-cliff) - git-cliff can generate changelog files from the Git history by utilizing conventional commits as well as regex-powered custom parsers. The changelog template can be customized with a configuration file to match the desired format.
- [git-complete-urls](https://github.com/rapgenic/zsh-git-complete-urls) - ZSH plugin to enhance `git` tab completion to include in the remotes completion (e.g. from `git clone`) any URL in the clipboard.
- [git-crypt](https://www.agwa.name/projects/git-crypt/) - Enables transparent encryption and decryption of files in a `git` repository. Files which you choose to protect are encrypted when committed, and decrypted when checked out.
- [git-deploy-s3](https://github.com/bradt/git-deploy-s3) - Keeps your `git` repository's assets in sync with Amazon S3.
- [git-diffall](https://github.com/thenigan/git-diffall) - Provides a directory based diff mechanism for `git`.
- [git-extend](https://github.com/nickolasburr/git-extend) - Extend `git` builtins with command wrappers.
- [git-fastclone](https://github.com/square/git-fastclone) - Think `git clone --recursive` on steroids. If you're doing repeated checkouts of a given repository on a machine (like a ci box), `git-fastclone` will speed things up considerably.
- [git-flow-completion](https://github.com/bobthecow/git-flow-completion) - Bash, Fish and ZSH completion support for [git-flow](http://github.com/nvie/gitflow)
- [git-follow](https://github.com/nickolasburr/git-follow) - Follow lifetime changes of a pathspec.
- [git-fuzzy](https://github.com/bigH/git-fuzzy) - A CLI interface to `git` that relies heavily on [`fzf`](https://github.com/junegunn/fzf).
- [git-graph](https://github.com/jerith666/git-graph) - creates a [Graphviz](https://graphviz.org/) graph showing the high-level structure of a repository's history.
- [git-gutter](https://github.com/jisaacks/GitGutter) - Plugin for [Sublime Text](https://www.sublimetext.com/) 2/3 to display the `git` diff in the edit window gutter.
- [git-it-on.zsh](https://github.com/peterhurford/git-it-on.zsh) - Another plugin by Peter Hurford that adds a `gitit` command that will open your current directory on github, in your current branch. Also works with private GitHub servers.
- [git-lint](https://github.com/bkuhlmann/git-lint) - Enforces `git` rebase workflow with consistent commits for a clean and easy to read/debug project history.
- [git-prompt-kit](https://github.com/olets/git-prompt-kit) - A configurable set of components for creating feature rich, high performance Git-aware zsh prompts (aka themes) with minimal coding.
- [git-quick-stats](https://github.com/arzzen/git-quick-stats) - A simple and efficient way to access various statistics in a `git` repository.
- [git-repo-updater](https://github.com/earwig/git-repo-updater) - Allows you to easily update multiple `git` repositories at once.
- [git-secrets](https://github.com/awslabs/git-secrets) - Prevents you from committing secrets and credentials into `git` repositories.
- [git-standup](https://github.com/kamranahmedse/git-standup) - Recall what you did on the last working day. Can work in a directory full of `git` repositories to see a consolidated view of all work in all the repositories.
- [git-stashd](https://github.com/nickolasburr/git-stashd) - Autostashing daemon for dirty worktrees.
- [git-submodule-tools](https://github.com/kollerma/git-submodule-tools) - A collection of scripts that should help make life with `git` submodules easier.
- [git-sweep](https://github.com/arc90/git-sweep) - A utility script to remove branches that have been merged to master.
- [git-todo](https://github.com/ibolmo/git-todo/blob/master/git-todo) - helper script to show all the todo entries in your repository.
- [git-up (gem)](https://github.com/aanand/git-up) - Fetch and rebase all locally-tracked remote branches.
- [git-up (python)](https://pypi.python.org/pypi/git-up) - Python implementation of Aanand's original ruby gem
- [git-wayback-machine](https://github.com/MadRabbit/git-wayback-machine) - A simple script to quickly navigate a project's state through it's `git` history
- [git-worktree](https://github.com/alexiszamanidis/zsh-git-worktree/) - ZSH plugin that wraps `git worktree` for ease of use.
- [git_history_visualizer](https://github.com/kidpixo/git_history_visualizer) - python script to visualize the history of files in a `git` repository
- [gitgo](https://github.com/ltj/gitgo) - Open a GitHub/Gitlab hosted repository in your browser via the command-line (macOS only).
- [gitsh](https://github.com/thoughtbot/gitsh) - An interactive shell for `git`. From within gitsh you can issue any `git` command, even using your local aliases and configuration.
- [gunstage](https://github.com/LucasLarson/gunstage) - There are at least eight ways to unstage files in a `git` repository. This is a command-line shell plugin for undoing `git add`.
- [hitch](https://github.com/therubymug/hitch) - Allows developers to be properly credited when Pair Programming and using `git`.
- [hub](https://github.com/github/hub) - A command-line tool that wraps `git` in order to extend it with extra features and commands that make working with GitHub easier.
- [igit](https://github.com/ytakahashi/igit) - Interactively construct `git` commands using [fzf](https://github.com/junegunn/fzf).
- [joe](https://github.com/karan/joe) - Generates `.gitignore` files from the command-line for you.
- [mergepbx](https://github.com/simonwagner/mergepbx) - Helper script for merging XCode project files.
- [more-hooks-for-git](https://github.com/capsulescodes/more-hooks-for-git) - Adds extra hooks for `git add`, `git diff` and `git status`.
- [switch-git](https://github.com/robin-mbg/switch-git) - Easy switching between `git` repositories. Just type `sgr <some part of you repo's name>`, press enter and you're there.
- [ugit](https://github.com/Bhupesh-V/ugit) - Lets you undo your last `git` operation.
- [worktree](https://github.com/jspears/worktree) - Adds functions that wrap `git worktree`.
- [xcode-build-scripts](https://github.com/indirect/xcode-git-build-scripts) - Helper scripts to use with XCode projects.

## Miscellaneous Tips

### Make it easier to check out default branch

Many repositories are switching away from using **master** as the default branch name. You can do `git config --global alias.co-default '!'"git checkout \$(git branch -r | awk -F/ '/HEAD/ {print \$NF}')"` to add a co-default alias that will determine what the repository's default branch is for you.

Alternatively, add the following aliases from a [tweet by @jnesselr](https://twitter.com/jnesselr/status/1334586152691625985) to your `.gitconfig` file:

```sh
cdef = "!git checkout $(git originhead)"
originhead = "!git remote show origin | grep 'HEAD branch' | cut -d ' ' -f5"
```

This queries the remote to get the current up to date default branch, so it will work even if the remote's default branch changes after you did your initial checkout.

### Have git cope with typos

Do `git config --global help.autocorrect 1`

git will now try to figure out what you meant, for example:

```sh
$ git commt
WARNING: You called a Git command named 'commt', which does not exist.
Continuing in 0.1 seconds, assuming that you meant 'commit'.
```

### Rewrite git:// with https://

```sh
git config --global url."https://github".insteadOf git://github
```

### or replace with `ssh`

 Use `ssh` instead of `https://`

 ```sh
 git config --global url."git@github.com:".insteadOf "https://github.com/"
 ```

**Credit:** [@grawity](https://gist.github.com/grawity/4392747) & [@hansdg1](https://github.com/hansdg1) by way of [Kovrinic](https://gist.github.com/Kovrinic/ea5e7123ab5c97d451804ea222ecd78a)

## Contributing

- Please include an entry both in the credits section of README.md for any scripts and a credit comment in the script itself in your PRs so authors get their work credited correctly.
- Please use `#!/usr/bin/env interpreter` instead of a direct path to the interpreter, this makes it easier for people to use more recent versions when the ones packaged with their OS (macOS and CentOS, I'm looking at you!) are stale.

## Thanks

Many thanks to all the contributors over the years.

<a href="https://github.com/unixorn/git-extra-commands/graphs/contributors">
  <img src="https://contributors-img.web.app/image?repo=unixorn/git-extra-commands" />
</a>

Made with [contributors-img](https://contributors-img.web.app).
