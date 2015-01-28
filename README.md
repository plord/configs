# Configs

Misc configuration files for various unix-y things.
* Fish shell config
    * rbenv functions from Lukasz Niemier
    * grc and docker functions from Justin Mayer's fish "Tacklebox"
* global and local gitignore 
* rbenv config and shims (ignores versions/foo)
* pyenv config and shims (ignores versions/foo)
* nodenv /not/ included - cloned from the repo instead
* Testing - node package config vs iojs package config with nodenv swaps

## To Do:
* Migrate more things from ~/.??* to .config/dotfiles/
* Scrub dotfiles for PII - can't store .fetchmail or .muttrc for example
* Write an install script to safely symlink it all back to ~
* Expand beyond ~/.??* to config files in other standard locations?
  * Homebrew stuff in /use/local
  * certain files in /etc 
    * Permissions issue, would introduce sudo into the mix
