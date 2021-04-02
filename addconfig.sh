GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'


SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"



echo -e "${CYAN}add${NC} configuration for vim/emacs/bash ..."
#echo $SCRIPTPATH

git submodule init
git submodule update

for opt in "$@"
do
	case "${opt}" in 
		vim) 
			echo -e "${GREEN}copy${NC} " $SCRIPTPATH"/vim/.vimrc" to ~/.vimrc;
			cp $SCRIPTPATH"/vim/.vimrc" ~;;
		bash)
			echo "${GREEN}copy${NC} " $SCRIPTATH"/bash/.bashrc" to ~/.bashrc;
			cp $SCRIPTPATH"/bash/.bashrc" ~;;
		emacs)
			echo "${GREEN}copy${NC} " $SCRIPTATH"/emacs/.emacs" to ~/.emacs;
			cp $SCRIPTPATH"/emacs/.emcas" ~;;

		esac
			
done
