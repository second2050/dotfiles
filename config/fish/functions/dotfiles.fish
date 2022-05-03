function dotfiles --description="manage the dotfile repo"
	set DOTFILES_DIR "$HOME/.dotfiles"
	switch $argv[1]
		case 'add'
			if test (pwd) != "$HOME/.config"
				echo "Not in correct directory ($HOME/.config), you are in" (pwd)
				return 1 # exit if not in ~/.config
			end
			if set -q argv[2]
				echo "Adding $argv[2] to dotfiles repository"
				mv $argv[2] "$DOTFILES_DIR"/config/"$argv[2]"
				ln -sfv "$DOTFILES_DIR"/config/"$argv[2]" $argv[2]
			else
				echo "File/Directory name needed."
				return 2
			end

		case 'remove'
			if test (pwd) != "$HOME/.config"
				echo "Not in correct directory ($HOME/.config), you are in" (pwd)
				return 1 # exit if not in ~/.config
			end
			if set -q argv[2]
				if test -e "$DOTFILES_DIR"/config/"$argv[2]"
					echo "Removing $argv[2] from dotfiles repository"
					rm $argv[2]
					mv "$DOTFILES_DIR"/config/"$argv[2]" $argv[2]
				else
					echo "$argv[2] not found in dotfiles repository"
					return 3
				end
			else
				echo "File/Directory name needed."
				return 2
			end

		case 'deploy'
			echo "Redeploying dotfiles"
			cd $DOTFILES_DIR
			$DOTFILES_DIR/setup_symlinks.sh
			return $status

		case 'status'
			cd $DOTFILES_DIR
			git status -sbv
			return $status

		case 'commit'
			cd $DOTFILES_DIR
			git add .
			if set -q argv[2]
				git commit -m "$argv[2]"	
			else
				git commit -m "Update from $(date +"%Y-%m-%d %T")"
			end
			return $status

		case 'pull'
			cd $DOTFILES_DIR
			git pull
			dotfiles deploy
			return $status
		case 'push'
			cd $DOTFILES_DIR
			git push
			return $status

		case '*'
			echo "Available subcommands: add, remove, deploy, commit, pull, push"

	end
end
