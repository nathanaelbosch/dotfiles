#
# ~/.profile
#
#

[[ "$XDG_CURRENT_DESKTOP" == "KDE" ]] || export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=vim
export PATH="${PATH}:/home/$USER/bin:/home/$USER/.local/bin"
[[ -f ~/.extend.profile ]] && . ~/.extend.profile
