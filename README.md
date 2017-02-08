# simple-dotfiles

A relatively minimal set of useful aliases, examples for bash_profile but none that we
will use yet, and a sultry vimrc and colors.

Inspiration drawn from dotfiles I received from the instructor
([Hussam Abu-Libdeh](http://0xff.co/)) when I was a student in this class, as well as
from [Adam Stewart's dotfiles](https://github.com/adamjstewart/dotfiles.git).

I have created a minimal version to mirror what we are learning in class, and we will
now and then add more entries in different demos.

Adam's `dotfiles` repository does a lot of really fancy things that I will not cover.
You are welcome to use his instead, but please do note that it affects a lot more and I
will not go through what all of it is doing.

The colors included in this bashrc are **only** amenable to **dark (black)** terminal
background.  If you do not want a black terminal, you could check out
[Sean Bell's Awesome term-tools](https://github.com/seanbell/term-tools); but his setup
is for `zsh` (not `bash`), and it has **a lot more** going on than just a few simple
aliases.

Basically, the directions that follow are for you to learn how to make your own.  Play
around with the `LS_COLORS`, make it your own!  Why do I encourage this?  When you know
what your doing with this level of configuration, you can make *your own git repository*
with an install script etc so that when you get a new computer or need to reinstall
them, just clone your own repo and you are done!  It makes your life much easier than
trying to remember what exactly you did.

## Getting these on your computer

### First, get the files on your computer

```bash
$ cd ~
$ git clone https://github.com/cs2043-sp16/simple-dotfiles.git
$ cd simple-dotfiles/
```

### Make a backup of your original dotfiles

Seriously.  If you do not, recovering the originals will be challenging.

```bash
$ mkdir ~/dotfiles_backup

# make backups of the bash dotfiles
$ mkdir ~/dotfiles_backup/bash_backups
$ cp ~/.bashrc ~/dotfiles_backup/bash_backups/ORIG_BASHRC
$ cp ~/.bash_profile ~/dotfiles_backup/bash_backups/ORIG_BASH_PROFILE

# make backups of the vimrc, if applicable
$ mkdir ~/dotfiles_backup/vim
$ cp ~/.vimrc ~/dotfiles_backup/vim/ORIG_VIMRC

# make a backup of the ~/.profile if it exists
$ cp ~/.profile ~/dotfiles_backup/profile
```

Note that if you did not already have a `~/.bashrc`, then `cp` will tell you so.  Don't
worry, this is not there on OSX.  Similarly, unless you already had a `~/.vimrc` there
is nothing to backup.

### Replace the contents of the dotfiles, assuming you are in the simple-dotfiles directory

1. Replace the contents of the bashrc file:

    ```bash
    $ cat bash_addons/bashrc > ~/.bashrc
    ```

2. Replace the contents of the bash_profile file:

    ```bash
    $ cat bash_addons/bash_profile > ~/.bash_profile
    ```

3. Replace the vimrc contents, and create the colors directory for vim to behave
   correctly with the provided vimrc.

    ```bash
    # make the vimrc have the right contents
    $ cat vim_addons/vimrc > ~/.vimrc

    # create the appropriate directory structure for colors, put the monokai theme there
    $ mkdir -p ~/.vim/colors/
    $ cp vim_addons/colors/monokai.vim ~/.vim/colors/
    ```


### The ominous .profile

Because we are using `bash` in this class, we want to source our `.bash_profile` from
the `.profile`.  This is the appropriate way to do it, even though you often see people
sourcing it from the `bashrc`.  You can accomplish this by simply doing

```bash
$ cp profile ~/.profile
```

### I don't like these, how do I go back?

Assuming you have made the backups, simply `cat` the backup file you made from your
desktop and redirect that to the designated file.  For example, if I wanted to restore
the original `bashrc`, then I would just do

```bash
$ cp ~/dotfiles_backup/bash_backups/ORIG_BASHRC ~/.bashrc
```

to restore it to the original.  This is particularly meaningful with the Ubuntu virtual
machine, as they had different `ls` aliases (and colors) than I do.

## Bash configurations

Inside the `bash_addons` directory are a bashrc and a bash_profile, that contain some
useful shortcuts as well as the terminal colors that I use.  These colors are best used
on a dark background, but you are more than welcome to choose your own!

### Color choosing

To include your own, you need to determine what they will be first.  This website is
great for helping you do that:

[http://geoff.greer.fm/lscolors/](http://geoff.greer.fm/lscolors/)

It will help you get a reasonable idea of what they will look like.  When you look
inside of the `bash_addons/bashrc`, you will see something similar to

```
OS=$(uname)
case "$OS" in
    'Darwin')
        export LSCOLORS='FxFxBxDxCxegedabagacad'
        ;;
    'Linux')
        export LS_COLORS='di=1;35;40:ln=1;35;40:so=1;31;40:pi=1;33;40:ex=1;32;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
        ;;
    *)
        echo "Unknown OS: $OS"
        ;;
esac
```

You will need to change the `LSCOLORS` for `Darwin` (Mac) and `LS_COLORS` for `Linux`,
noting that the format (including the variable name) is quite different for the two.
The website linked above gives you both formats!  But it doesn't always get it perfect.
If you have this in your `~/.bashrc`, your terminal will complain if the value in
`LS_COLORS` is not formatted properly.

### Customize your terminal background (e.g. to a dark theme)

The colors presented in the example `bashrc` are only appealing on a dark background
(mine is a semi-transparent monokai black).  You will need to change the background of
your terminal now.

#### Linux Users:

- Open your terminal, and choose Terminal -> Preferences (top-left corner is where it
  likely is)
- Go to the Profiles tab
- Edit the current one (will likely say "Unnamed")
- My settings:
    - General Tab:
        - Cursor shape: I-Beam
        - Uncheck "Terminal Bell", unfortunately without significant effort only an
          "audible bell" is setup.  Which is rather annoying.
        - Allow bold text
            - Rewrap on resize
            - I have my font size at 15, using Monospace Regular.
    - Colors Tab:
        - Fedora: should be able to use "Use colors from system theme", I already made
          these dark for you.
        - Ubuntu: may want to try a different if you don't want that purple, but the
          Ubuntu colors are already quite nice.  To use these colors, since we are going
          to change our prompt text color anyway, you should be able to choose
          "Green on Black" to get the dark background. Alternatively, create your own!
        - Check the "Use transparent background" and slide it to where you want.  Mine
          is at maybe 11%, just enough to see the items behind but not so much that the
          prompt is hard to read.

#### OSX Users:
- Open a browser and go to here: [https://github.com/stephenway/monokai.terminal](https://github.com/stephenway/monokai.terminal)
- In a terminal, go to ~ and clone the url.
- I am showing you how to use Terminal at the moment, not iTerm!  If you opened
  Terminal.app, then you should be importing the `Monokai.terminal` file.
    - The steps to configure iTerm (e.g. if you `brew cask install iterm2`) are nearly
      identical, just use the `Monokai.itermcolors` file instead.
- From terminal, choose Terminal -> Preferences (if you hit `cmd`+`,` (command and comma
  at same time), this will open the preferences for you, same shortcut works for
  **many** OSX applications.)
- Go to the "Profiles" tab, and near the bottom middle of the left column that lists all
  of the options, click on the little Cog Wheel between (-) and (Default), and choose
  Import
- Navigate to the "Monokai.terminal" file you just cloned in the beginning.
- Customize the Monokai terminal theme a little more:
    - Select Monokai in the list on the left.  Now on the right
        - Text tab:
            - Change font size if needed.  Mine is Menlo Regular 14pt.
            - Cursor:
                - Vertical Bar
                - Blink cursor
        - Window tab:
            - Background: click on the little box next to "Colors and Effects"
                - Drag the opacity slider to where you want.  Mine is at 88.
        - Advanced tab:
            - This should already be set, but make sure "xterm-256color" is slected in
              "Declare terminal as"
            - Bell:
                - Check Visual bell
                    - Uncheck "Only when sound is muted"
                - Uncheck Audible bell

## VIM Configurations

There are many different configurations you can use, but since I very much approve of
what Adam has done, I just stole his.  The original version (including comment styling)
came from the dotfiles I received when I was a student, but Adam added a lot of really
excellent features.  It will set some pretty incredible features such as code folding,
better syntax highlighting, and much much more.  Read the vimrc file to see what is
there.
