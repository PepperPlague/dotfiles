# update dotfiles automatically
if [ -f "${HOME}/.config/zsh/dotfiles-autoupdate.zsh" ]; then
	source "${HOME}/.config/zsh/dotfiles-autoupdate.zsh"
fi

# add ~/.local/bin to path
mkdir -p $HOME/.local/bin
export PATH="$HOME/.local/bin:$PATH"

ZGEN_RESET_ON_CHANGE=(${HOME}/.zshrc)

# fix for slow git completion
# must come before loading plugins
__git_files () {
    _wanted files expl 'local files' _files
}

# run before loading oh-my-zsh compleat
# https://github.com/robbyrussell/oh-my-zsh/issues/3234
autoload -Uz compinit
compinit

# clone zgen if not present
[ ! -d "${HOME}/.zgen" ] && git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

# sanity check for above failing:
# source zgen only if it exists
if [ -f "${HOME}/.zgen/zgen.zsh" ]; then
	source "${HOME}/.zgen/zgen.zsh"

	if ! zgen saved; then
		# specify plugins here
		zgen oh-my-zsh

		zgen oh-my-zsh
		zgen oh-my-zsh plugins/aliases
		zgen oh-my-zsh plugins/command-not-found
		zgen oh-my-zsh plugins/compleat
		zgen oh-my-zsh plugins/cp
		zgen oh-my-zsh plugins/dirhistory
		zgen oh-my-zsh plugins/dotenv
		zgen oh-my-zsh plugins/eza
		zgen oh-my-zsh plugins/genpass
		zgen oh-my-zsh plugins/git
		zgen oh-my-zsh plugins/git
		zgen oh-my-zsh plugins/gitfast
		zgen oh-my-zsh plugins/grc
		zgen oh-my-zsh plugins/last-working-dir
		zgen oh-my-zsh plugins/macos
		zgen oh-my-zsh plugins/pass
		zgen oh-my-zsh plugins/rsync
		zgen oh-my-zsh plugins/sublime
		zgen oh-my-zsh plugins/sublime-merge
		zgen oh-my-zsh plugins/sudo
		zgen oh-my-zsh plugins/tailscale
		zgen oh-my-zsh plugins/ufw
		zgen oh-my-zsh plugins/wd
		zgen oh-my-zsh plugins/z
		zgen oh-my-zsh plugins/zsh-autosuggestions
		zgen oh-my-zsh plugins/zsh-interactive-cd
		zgen oh-my-zsh plugins/zsh-syntax-highlighting
		zgen load MichaelAquilina/zsh-you-should-use
		zgen load supercrabtree/k
		zgen load zlsun/solarized-man
		zgen load $HOME/.config/zsh/alias.zsh
		zgen load $HOME/.config/zsh/colors.zsh
		zgen load $HOME/.config/zsh/find-missing-cmds.zsh
		zgen load $HOME/.config/zsh/fortune.zsh
		zgen load $HOME/.config/zsh/functions.zsh
		zgen load $HOME/.config/zsh/prompt.zsh
		zgen load $HOME/.config/zsh/remind.zsh
		# generate the init script from plugins above
		zgen save
	fi
fi

# reset frozen terminals by misbehaving applications
ttyctl -f

# typing a dir's name, cd's into it
setopt auto_cd cdable_vars

# history settings
setopt histignorealldups sharehistory
HISTSIZE=50
SAVEHIST=50
HISTFILE=~/.bash_history

# set default editor
export EDITOR=hx

case "$TERM" in
    xterm*) TERM=xterm-256color
esac


# auto ls when cd'ing
chpwd() { ls }

show_prompt

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Homebrew / macOS stuff
if uname -a | grep Darwin > /dev/null; then
	eval $(/opt/homebrew/bin/brew shellenv)
	export HOMEBREW_UPGRADE_GREEDY=1
fi

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/timothy/.lmstudio/bin"
# End of LM Studio CLI section

eval "$(starship init zsh)"

show_remind
show_fortune
