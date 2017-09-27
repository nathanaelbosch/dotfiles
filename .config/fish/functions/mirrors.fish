# Defined in - @ line 0
function mirrors --description 'alias mirrors=sudo pacman-mirrors -g'
	sudo pacman-mirrors -g $argv;
end
