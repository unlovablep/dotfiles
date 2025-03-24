#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/lily/.opam/opam-init/init.sh' && . '/home/lily/.opam/opam-init/init.sh' > /dev/null 2> /dev/null || true
# END opam configuration

# Added by `rbenv init` on Thu Jan 16 01:11:12 AM UTC 2025
eval "$(rbenv init - --no-rehash bash)"
