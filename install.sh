#!/bin/bash

cd "$HOME" || exit

mkdir temp_____

cd temp_____ || exit
rm -rf print_news

# download github
git clone --recursive https://github.com/Thib1708/print_news.git

if [ "$(uname)" != "Darwin" ]; then
	echo "Admin permissions needed to install C compilers, python, and upgrade current packages"
	case $(lsb_release -is) in
		"Ubuntu")
			sudo apt update
			sudo apt upgrade
			sudo apt install gcc clang libpq-dev libbsd-dev libncurses-dev valgrind -y
			sudo apt install python-dev python3-pip -y
			sudo apt install python3-dev python3-venv python3-wheel -y
			pip3 install wheel
			;;
		"Arch")
			sudo pacman -Syu
			sudo pacman -S gcc clang postgresql libbsd ncurses valgrind --noconfirm
			sudo pacman -S python-pip --noconfirm
			pip3 install wheel
			;;
	esac
fi

cp -r print_news "$HOME"

cd "$HOME" || exit
rm -rf temp_____

cd "$HOME"/print_news || make || exit

# start a venv inside francinette
if ! python3 -m venv venv ; then
	echo "Please make sure than you can create a python virtual environment"
	exit 1
fi

# activate venv
. venv/bin/activate

RC_FILE="$HOME/.zshrc"

if [ "$(uname)" != "Darwin" ]; then
	RC_FILE="$HOME/.bashrc"
	if [[ -f "$HOME/.zshrc" ]]; then
		RC_FILE="$HOME/.zshrc"
	fi
fi

echo "try to add alias in file: $RC_FILE"

# set up the alias
if ! grep "SUBJECT=" "$RC_FILE" &> /dev/null; then
	echo "cmds not present"
	printf "\nexport SUBJECT="Apple"\n\
export COUNTRY="fr"\n\
export API_KEY="8290029380e4428bb679cc65052bcfc4"\n\
export CITY="Lyon"\n\n\
curl -s fr.wttr.in/$CITY\?tpq > ~/todays_news\n\n\
curl https://newsapi.org/v2/everything -G\n\
\t-d q=$SUBJECT\n\
\t-d sortBy=popularity\n\
\t-d apiKey=$API_KEY> ~/$SUBJECT\n\n\
curl https://newsapi.org/v2/top-headlines -G\n\
\t-d country=$COUNTRY\n\
\t-d sortBy=popularity\n\
\t-d apiKey=$API_KEY > ~/$COUNTRY\n\
cd ~\n\
./print_news/print_news ~/$SUBJECT ~/$COUNTRY >> ~/todays_news\n\
cat ~/todays_news |& less" "$HOME" >> "$RC_FILE"
fi

# automatically replace current shell with new one.
exec "$SHELL"

printf "\033[33m... and don't forget, \033[1;37mpaco\033[0;33m is not a replacement for your own tests! \033[0m\n"

