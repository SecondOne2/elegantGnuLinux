#!/usr/bin/env bash

# Script made by TitanHero https://github.com/TitanHero
echo -e "\e[1;3;32;40mEasyTermux\n\e[0;1;4;36mThis Script will install useful stuff to can manage \033[0;1;5;34mTermux\033[0;1;4;36m in a most easy way\e[0m\nTake care of \e[0;1;32mplants\033[0m\n"

# Let's to put a few of vars with the binaries to install

declare -a necessary=(python tmux wget file tar zip dnsutils mlocate nmap python golang man littlecms git binutils proot radare2 nano dropbear cronie bash-completion eg tldr ipython pip3)

options=("List_binaries" "Full_install" "Help" "Exit")



PS3=$(echo -e """\n\e[1;35mLet's make this happen, take care of \e[4;32mplants, persons and planet.
\033[0;1;33mChoose a option number
\e[0;1;3;32;45m>\033[0m """)

main (){
select opt in ${options[*]}; do
    if [[ "$opt" = "${options[0]}" ]]; then
        head -n 72 "$(dirname $(readlink -f $0))/info.txt";main
    elif [[ "$opt" = "${options[1]}" ]]; then
        echo -e "This Script will gonna install this  binaries ${necessary[*]}\n Is all or nothing...LoL\n I don't code for cowards, choose a number\n"
        yesNo="Yes No"
        select topt in $yesNo; do
            if [[ "$topt" = "Yes" ]]; then
                pkg install ${necessary[*]:0:21}; ${necessary[24]} install --upgrade ${necessary[24]:0:3};${necessary[24]} install --upgrade ${necessary[*]:21:3};cp bashrc $HOME/.bashrc; go install github.com/jingweno/ccat@latest; grep -we "alias cat='ccat'" $HOME/.bashrc; [[ $? -ne 0  ]] && echo -e  "PATH+=\":$HOME/go/bin\"\nalias cat='ccat'" >> ~/.bashrc; wget https://raw.githubusercontent.com/trapd00r/LS_COLORS/master/LS_COLORS; mv LS_COLORS $HOME/.LS_COLORS; grep LS_COLORS ~/.bashrc; [[ $? -ne 0 ]] && echo "eval \$( dircolors -b ~/.LS_COLORS )" >> $HOME/.bashrc; source ~/.bashrc ; printf "\n\n Ok ready if do you want exit of this script select the exit option (is the number 4, just put 4, remember is 4), animus,do not do war better do the people smile... \n\033[1mPeace and Love\e[0m\n\n" ;main
            elif [[ $topt = "No" ]]; then
            echo -e "\nOk maybe you aren't ready for this, maybe in the future, anyway ...Animus\nNeverGiveUp\nKeepTrying\nPeaceAndLove\nSaveThePlanet\n"; main
            else
                main
            fi
        done
    elif [[ "$opt" = "${options[2]}" ]]; then
        tail -n 2 "$(dirname $(realpath $0))/info.txt";main
    elif [[ "$opt" = "${options[3]}" ]]; then
        exit;return 0
    else
        main
    fi
done
}

main

