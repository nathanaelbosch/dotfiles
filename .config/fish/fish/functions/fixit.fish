# Defined in - @ line 0
function fixit --description 'alias fixit=sudo rm -f /var/lib/pacman/db.lck'
	sudo rm -f /var/lib/pacman/db.lck $argv;
end
