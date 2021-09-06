# Contributing

**git-extra-commands** is a collection of helper scripts for git and links to git-related articles.

## Contribution Guidelines

- **To add a helper script:** Submit a pull request.
  - Please use `#!/usr/bin/env interpreter` instead of a direct path to the interpreter, this makes it easier for people to use more recent interpreter versions when the ones packaged with their OS (macOS and CentOS, I'm looking at you) are stale.
  - Please _do not_ include a language file extension in the script name unless they are meant to be sourced and not run standalone. No one should have to know if a script was written in bash, python, ruby or whatever language to use a script. Not including file extensions makes it easier to rewrite the script in another language later without having to change every reference to the previous version.

- **To remove a script:** All of the scripts here were either taken from blog posts or had an Open Source license. That said, if you wrote something included here and want it removed, either open an issue to request the removal or submit a pull request.

For each script you add, please:

- Include an entry in the credits section of `README.md` for any scripts in your PRs so authors get their work credited correctly. Please keep the credits in alphabetical order by script name.
- Add an entry in the `zstyle` (completion) section of `git-extra-commands.plugin.zsh`, so the script gets proper tab completion.
- Include a link to the original source in the comments at the beginning of your script so people can find their other work.
