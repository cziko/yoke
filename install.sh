#!/bin/sh
install_what=
if [ -n "$1" ] ; then 
	install_what=$1
else
	echo "Choose the version of Yoke to install:"
	read -p "PHP, Python, Ruby, Bash, Node.js, All [hyRbna]? " install_choice
	install_what=${install_choice:-R}
fi
echo "-$1-"
case $install_what in 
	[bB] | --bash )
		#echo 'cp -r -v Services/"Execute as Python code.workflow" ~/Library/Services/'
		echo "Installing (restricted) bash service:"
		cp -r -v Services/"Execute as shell script.workflow" ~/Library/Services/
		echo "Done. You will need to assign a shortcut in:"
		echo "System Preferences... -> Keyboard -> Keyboard Shortcuts -> Services -> Text"
		;;
	[eE] | --perl )
		#echo 'cp -r -v Services/"Execute as Python code.workflow" ~/Library/Services/'
		echo "Installing perl service:"
		cp -r -v Services/"Execute as Perl code.workflow" ~/Library/Services/
		echo "Done. You will need to assign a shortcut in:"
		echo "System Preferences... -> Keyboard -> Keyboard Shortcuts -> Services -> Text"
		;;
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
	[nN] | --node )
		echo "Installing node.js service:"
		# test for node version number - we need 0.5 or later
		NODE_LOC=$(which node)
		if [ -z "$NODE_LOC" ] ; then
			echo "FAILED: Couldn't find node in your path."
		else
			verok=$(node -v | awk -Fv '{print $NF}' | awk -F. '{ if ($1 >= 0 && $2 >= 5) print "OK" }')
			if [ "$verok" == "OK" ] ; then
				cp -r -v Services/"Execute as NodeJS code.workflow" ~/Library/Services/
				echo "s#NODE_LOC=node#NODE_LOC=$NODE_LOC#"
				sed -i -e "s#NODE_LOC=node#NODE_LOC=$NODE_LOC#" ~/Library/Services/"Execute as NodeJS code.workflow"/Contents/document.wflow
				echo "Done. You will need to assign a shortcut in:"
				echo "System Preferences... -> Keyboard -> Keyboard Shortcuts -> Services -> Text"
			else 
				echo "FAILED: need at least v0.5. You have `node -v`."
			fi
		fi
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


