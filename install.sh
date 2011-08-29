#!/bin/sh
install_what=
if [ -n "$1" ] ; then 
	install_what=$1
else
	echo "Choose the version of Yoke to install:"
	read -p "PHP, Python, Ruby, All [hyRa]? " install_choice
	install_what=${install_choice:-R}
fi
echo "-$1-"
case $install_what in 
	[hH] | --php )
		#echo 'cp -r -v Services/"Execute as Python code.workflow" ~/Library/Services/'
		echo "Installing PHP service:"
		cp -r -v Services/"Execute as PHP code.workflow" ~/Library/Services/
		echo "Done. You will need to assign a shortcut in:"
		echo "System Preferences... -> Keyboard -> Keyboard Shortcuts -> Services -> Text"
		;;
	[yY] | --python )
		#echo 'cp -r -v Services/"Execute as Python code.workflow" ~/Library/Services/'
		echo "Installing python service:"
		cp -r -v Services/"Execute as Python code.workflow" ~/Library/Services/
		echo "Done. You will need to assign a shortcut in:"
		echo "System Preferences... -> Keyboard -> Keyboard Shortcuts -> Services -> Text"
		;;
	[rR] | --ruby )
		echo "Installing ruby service:"
		#echo "cp -r -v Services/ExecuteRubyInlineV3.workflow ~/Library/Services/"
		cp -r -v Services/ExecuteRubyInlineV3.workflow ~/Library/Services/
		echo "Done. Shortcut is Command + > or Command + Shift + ."
		;;
	[aA] | -a | --all )
		echo "Installing all services:"
		#echo "cp -r -v Services/* ~/Library/Services/"
		cp -r -v Services/* ~/Library/Services/
		echo "Done. You will need to assign a shortcuts in:"
		echo "System Preferences... -> Keyboard -> Keyboard Shortcuts -> Services -> Text"
		;;
	*)
		[[ -n $install_what ]] && echo "I don't know how to handle $install_what."
		echo "Usage:"
		echo -e "$( cat <<USAGE
$0 [-[p|r|a]]
  -p, --python  Install the python service
  -r, --ruby    Install the ruby service
  -a, --all     Install all services
USAGE
)"

esac


