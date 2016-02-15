#!/bin/bash
# Install virtualbox-tray

which yad &>/dev/null || {
							echo -e "you need to install 'yad'\n\t'sudo apt-get install yad' on debian/ubuntu based systems"; 
							echo -e "\t'yum install yad' on Red-Hat/Fedora based systems"; exit 1;
						 }
echo -n "Copy icons to $HOME/.local/share/icons  "
mkdir -p $HOME/.local/share/icons \
	&& cp ./icons/* $HOME/.local/share/icons/ &>/dev/null \
	&& echo "OK" || echo "FAIL"

echo -n "Copy virtualbox-tray to $HOME/bin "
mkdir -p $HOME/bin \
	&& cp virtualbox-tray $HOME/bin &>/dev/null \
	&& chmod +x $HOME/bin/virtualbox-tray &>/dev/null \
	&& echo "OK" || echo "FAIL"

echo "Do you want to launch virtualbox-tray ? [Y/n] "
read -n 1 r
[[ $r == "n" ]] && exit 0
$HOME/bin/virtualbox-tray -p
