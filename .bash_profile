# .bash_profile
#    read by Bash on start, regardless of interactivity. should not include
#    anything that outputs to stdin.
#
#    Recommended reading:
#    https://superuser.com/questions/183870/difference-between-bashrc-and-bash-profile/183980#183980

# if we're running interactively
case "$-" in
    *i*)
		# if '~/.bashrc' exists, source it
        if [[ -f ~/.bashrc ]]; then
            . ~/.bashrc
        fi
		;;
esac
PATH="/usr/local/bin:$PATH"
test -e ~/.iterm2_shell_integration.bash && source ~/.iterm2_shell_integration.bash || true

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/timothy/.lmstudio/bin"
# End of LM Studio CLI section

