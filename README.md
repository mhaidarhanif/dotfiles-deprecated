M Haidar Hanif dotfiles
=======================

Based on [thoughtbot dotfiles](https://github.com/thoughtbot/dotfiles)

Requirements
------------

Set zsh as your login shell:

    chsh -s $(which zsh)

Install
-------

Clone onto your laptop:

    git clone git://github.com/mhaidarh/dotfiles.git

Install [rcm](https://github.com/thoughtbot/rcm)

Install:

    rcup -d dotfiles -x README.md -x LICENSE -x Brewfile

This will create symlinks for config files in your home directory. The `-x`
options, which exclude the `README.md`, `LICENSE`, and `Brewfile` files, are
needed during installation but can be skipped once the `.rcrc` configuration
file is symlinked in.

You can safely run `rcup` multiple times to update:

    rcup

Make your own customizations
----------------------------

Put your customizations in dotfiles appended with `.local`:

* `~/.aliases.local`
* `~/.gitconfig.local`
* `~/.gvimrc.local`
* `~/.tmux.conf.local`
* `~/.vimrc.local`
* `~/.vimrc.bundles.local`
* `~/.zshrc.local`

For example, your `~/.aliases.local` might look like this:

    # Productivity
    alias todo='$EDITOR ~/.todo'

Your `~/.gitconfig.local` might look like this:

    [alias]
      l = log --pretty=colored
    [pretty]
      colored = format:%Cred%h%Creset %s %Cgreen(%cr) %C(bold blue)%an%Creset
    [user]
      name = First Last
      email = name@domain.com

Your `~/.zshrc.local` might look like this:

    # recommended by brew doctor
    export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

Your `~/.vimrc.bundles.local` might look like this:

    Bundle 'Lokaltog/vim-powerline'
    Bundle 'stephenmckinney/vim-solarized-powerline'

What's in it?
-------------

[vim](http://www.vim.org/) configuration

[tmux](http://robots.thoughtbot.com/a-tmux-crash-course) configuration

[git](http://git-scm.com/) configuration

Shell aliases and scripts:

* `b` for `bundle`.
* `g` with no arguments is `git status` and with arguments acts like `git`.
* `git-churn` to show churn for the files changed in the branch.
* `m` for `rake db:migrate && rake db:rollback && rake db:migrate && rake db:test:prepare`.
* `mcd` to make a directory and change into it.
* `replace foo bar **/*.rb` to find and replace within a given list of files.
* `rk` for `rake`.
* `tat` to attach to tmux session named the same as the current directory.
* `v` for `$VISUAL`.

and much more!

Credits
-------

Thank you, [contributors](https://github.com/thoughtbot/dotfiles/contributors)!
Also, thank you to Corey Haines, Gary Bernhardt, and others for sharing your
dotfiles and other shell scripts from which we derived inspiration for items
in this project.

![thoughtbot](http://thoughtbot.com/images/tm/logo.png)

Dotfiles is maintained by [thoughtbot, inc](http://thoughtbot.com/community)
The names and logos for thoughtbot are trademarks of thoughtbot, inc.

Dotfiles is © 2009-2014 thoughtbot, inc. It is free software and may be
redistributed under the terms specified in the [LICENSE](LICENSE) file.

