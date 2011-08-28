#!/bin/sh
install_what=
if [ -n "$1" ] ; then 
	install_what=$1
else
	echo "Choose the version of Yoke to install:"
	read -p "Python, Ruby, All [pRa]? " install_choice
	install_what=${install_choice:-R}
fi
echo "-$1-"
case $install_what in 
	[pP] | -p | --python )
		echo 'cp -r -v Services/"Execute as Python code.workflow" ~/Library/Services/'
		#cp -r -v Services/"Execute as Python code.workflow" ~/Library/Services/
		;;
	[rR] | -r | --ruby )
		echo "cp -r -v Services/ExecuteRubyInlineV3.workflow ~/Library/Services/"
		#cp -r -v Services/ExecuteRubyInlineV3.workflow ~/Library/Services/
		;;
	[aA] | -a | --all )
		echo "cp -r -v Services/* ~/Library/Services/"
		#cp -r -v Services/* ~/Library/Services/
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


