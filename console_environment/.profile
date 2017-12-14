#
# ~/.profile
#
#

[[ "$XDG_CURRENT_DESKTOP" == "KDE" ]] || export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=vim
export PATH="${PATH}:/home/$USER/bin:/home/$USER/.local/bin"
export PATH="${PATH}:/home/$USER/scripts"
export VIRTUAL_ENV_DISABLE_PROMPT=1
[[ -f ~/.extend.profile ]] && . ~/.extend.profile

# add inaugurate environment
LOCAL_BIN_PATH="$HOME/.local/bin"
if [ -d "$LOCAL_BIN_PATH" ]; then
    PATH="$PATH:$LOCAL_BIN_PATH"
fi