# CFG

These are my dotfiles.

##  Tools I Use

- i3-Gaps WM
- ZSH
- Polybar
- Terminator
- VIM - Lots of Vim.
- A couple of useful scripts


## This Setup

I found an [Awesome tutorial](https://medium.hackinrio.com/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b) a few months ago that showed me an easy way 
to create a nice dotfiles repository without the hassle of scripts copying
everything into place. It essentially uses a bare git repo at my root directory
under a "cfg.git" folder. 

If you look at my .zshrc you'll see an alias for config. Essentially, 
it lets me manage that bare repository from anywhere. So replacing git
with config lets me use things like 

```
config add ~/.config/i3/config
```

just like a normal git command.  

## Getting Started

The following script will pull down the directory, and back up your 
current .config folder. It will overwrite files that aren't backed up. 

Use at your own risk!


### Startup Script

```bash
git clone --bare https://github.com/teevans/cfg.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
```

### Bash/ZSH alias
```bash
alias config='/usr/bin/git  --git-dir=$HOME/.cfg/ --work-tree=$HOME' # Config uses git in the config directory
```
