


if [[ ${#} -eq 0 ]]; then
        killall dropbear; let lineNumber=$(ifconfig| grep -ne "UP,BROADCAST,RUNNING,MULTICAST"| cut -d ':' -f1)+1;  ipDrop=$(ifconfig| sed -n "${lineNumber}p"| cut -d " " -f10); unset lineNumber; until ! [[ 0 ]]; do portDrop="$(( RANDOM % 64511 + 1025 ))"; lsof -i:$portDrop; [[ $? -ne 0 ]] && break; done; dropbear -sp $ipDrop:$portDrop; echo -e "DropBear config:\nIP: $ipDrop\nPort: $portDrop\n Animus Champion.\n"
fi

help() {
    echo -e """

    \033[1mNAME\e[0m
        ${0%.??} - Configure dropbear by default without be a pain in your ass
    \033[1mSYPNOSIS\e[0m
        ${0%.??} [\e[4mOPTION\033[0m]... [\033[4mARGUMENT\e[0m]...

    \033[1mDESCRIPTION\e[0m
        So easy my friend, this script does nothing..Joke...Ok, this script     help you to run the ssh server in automatic, due you are running a  ssh server in a smartPhone(\e[4mTermux\e[0m), you change or connect     to a lot of networks in all day, so you must re configure the   dropbear server manually again and again, this script does that for   you in automatic, also it have another function, predicts the future,     ok don't just make you smile and set the dropbear key config for    generate a ssh key for use with Openssh(see the manual of dropbearkey  command) client.

        If you run this script without arguments all the dropbear sessions  are close and start a new session setting a random port for the dropbear server.

        \e[1m-a\033[0m
                Access point, when you use you smartphone like WiFi spot, for   share the internet connection you can run dropbear in that    interface for share a ssh session to the devices connected to  your spot, the port of the server is set in a random port    with a range from 1024 at 65535

        \e[1m-b\033[0m \033[4mBANNER PATH\e[0m
                Run the dropbear server with a access banner in a random port   with a range from 1024 at 65535

        \e[1m-c\033[0m
                Configure a new default key for the dropbear server, and make   a ssh key for use with the \033[4mopenssh\e[0m client, the  path which it's created is $HOME/rsa_dropbearkey_openssh

        \e[1m-h\033[0m
                Print the help page of this script....Obviusly

        \e[1m-i\033[0m \e[4mIp address\033[0m
                Run the dropbear server setting a custom ip address with a  random port.

        \e[1m-p\033[0m \e[4mPort\033[0m
                Start to run the dropbear server in the selected port.

        \e[1m-s\033[0m \e[4mIpAddress:Port\033[0m
                Put to run the dropbear server with a custom ip address and a custom port.

        And that is all my friend, I hope that it could help you, relax, just relax and play Mario Bros, or anything that could make you happy...  like me, write code and say stupidities....Lol..lol.


    \033[1mAUTHOR\e[0m
        mmm...Who, who, or yes, me Alex(Z3r0)..Or was not me?...I just know     that I know nothing...my head hurts.

    \033[1mREPORTING BUGS\e[0m
        To me... https://github.com/axelanimux or a pull request always is welcome, or anything that you think for improve this.

    \033[1mCOPYRIGHT\e[0m
        Open Source baby...I hear GPL?...Read the manual, this is almost same   (LoL) that a manual page...Animus Never Give UP....Be Green, Ever  Green, Relax Animus.
"""
}

while getopts ":haci:p:b:s:" opt; do
    case ${opt} in    
        h )
            help
        ;;
        
        a )
            ipDrop=$(echo $(ifconfig)| sed 's/ netmask/\nnetmask/g'| grep -e "UP,BROADCAST,RUNNING,MULTICAST"| cut -d ' ' -f6); until ! [[ 0 ]]; do portDrop="$(( RANDOM % 64511 + 1025 ))"; lsof -i:$portDrop; [[ $? -ne 0 ]] && break; done; dropbear -sp $ipDrop:$portDrop; echo -e "DropBear wifi spot config:\nIP: $ipDrop\nPort: $portDrop\nReady for work, animus"
        ;;

        c ) 
           dropbearkey -y -f $HOME/../usr/etc/dropbear/dropbear_rsa_host_key | grep "^ssh-rsa " >> ~/.ssh/authorized_keys; dropbearconvert dropbear openssh $HOME/../usr/etc/dropbear/dropbear_rsa_host_key $HOME/rsa_dropbearkey_openssh && echo -e "\nThe RSA key for use with your ssh client is ready in your home directory, path:\n$HOME/rsa_dropbearkey_openssh\nAll is ready, for start or countinue your journey in ssh sessions....Read its manual(interesting the syntax of port forwarding), be cool, you are cool, remeber change the permissions of your key with the command\nchmod g-rw,o-r $HOME/rsa_dropbearkey_openssh"
        ;;

        i )
           until ! [[ 0 ]]; do portDrop="$(( RANDOM % 64511 + 1025 ))"; lsof -i:$portDrop; [[ $? -ne 0 ]] && break; done; dropbear -sp ${OPTARG}:$portDrop; echo -e "DropBear config:\nIP: ${OPTARG}\nPort: $portDrop\nLet\'s do it"
        ;;

        p )
            let lineNumber=$(ifconfig| grep -ne "UP,BROADCAST,RUNNING,MULTICAST"| cut -d ':' -f1)+1 ;ipDrop=$(ifconfig| sed -n "${lineNumber}p"| cut -d " " -f10); unset lineNumber; dropbear -sp $ipDrop:${OPTARG}; echo -e "DropBear config:\nIP: $ipDrop\nPort: ${OPTARG}\nPeace && LoVe"
        ;;

        b )
            let lineNumber=$(ifconfig| grep -ne "UP,BROADCAST,RUNNING,MULTICAST"| cut -d ':' -f1)+1 ;ipDrop=$(ifconfig| sed -n "${lineNumber}p"| cut -d " " -f10); unset lineNumber; until ! [[ 0 ]]; do portDrop="$(( RANDOM % 64511 + 1025 ))"; lsof -i:$portDrop; [[ $? -ne 0 ]] && break; done; dropbear -b ${OPTARG} -sp $ipDrop:$portDrop; echo -e "DropBear config:\nIP: $ipDrop\nPort: $portDrop\nYou gonna be the best, keep trying and smile, Peace"
        ;;

        s )
            dropbear -sp ${OPTARG}; declare -a splitValue=(${OPTARG/:/ }); echo -e "DropBear config:\nIP: ${splitValue[0]}\nPort: ${splitValue[1]}\nTrain hard you can, we can."
        ;;

        : )
            echo -e "This option needs an argument, come on, don't be  miserly, nothing cost you put an argument to this option...Smile.\n" 
            exit 1
        ;;

        \? )
            printf "That agurment exist but only in your mind, looks like someone want to do a pull request, welcome any time... Another case, try with a true argument...Animus Never give UP...\e[1;32m Peace\033[0m && \033[1;31mLove\e[0m\n" 1>&2
            exit 2
        ;;
  esac
done

shift $((OPTIND -1))
