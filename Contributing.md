## Contributing

**git-extra-commands** is a collection of helper scripts for git.

# Contribution Guidelines

- **To add a helper script:** Submit a pull request. Please use `#!/usr/bin/env interpreter` instead of a direct path to the interpreter, this makes it easier for people to use more recent versions when the ones packaged with their OS (OS X, I'm looking at you) are stale.
- **To remove a script:** All of the scripts here were either taken from blog posts or had an Open Source license. That said, if you wrote something included here and want it removed, either open an issue to discuss the removal or submit a pull request.

Please include an entry in the credits section of `README.md`, and an entry in the `zstyle` (completion) section of `git-extra-commands.plugin.zsh`, for any scripts in your PRs so authors get their work credited correctly. Add a link to the source in the comments at the beginning of your script so people can find their other work, and please keep the credits in alphabetical order by script name.
