# ~/.bashrc: executed by bash(1) for non-login shells.

#-------------------------------------___# ~/.bashrc: executed by bash(1) for 
#non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc) for 
# examples

#*******************************************************************#		      
#                        SimpleBashrc
#      Change this planet I trust and belive of that you can do it
#
#
#
####   Sorry for my grammar and spelling mistakes, my english sucks

# The comments made by me always gonna have before start and at the end a comment 
# line with a lot of asterisks like this:

#********************************************************************#

##########################################################>


# # If not running interactively, don't do anything
# case $- in
#     *i*) ;;
#       *) return;; 
# esac
# don't put duplicate lines or lines starting with space in the history. See 
# bash(1) for more options


HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it

shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)


#*******************************************************************#
# I always add more history length to the history log, it is your own log of you 
# work with the shell, because that in the history log you always find a lot of help 
# is like your own man page/tldr and library of commands made by yourself for you, 
# due that if you can lodge more information, is better. 
#*******************************************************************#

HISTSIZE=12000 HISTFILESIZE=15000

# check the window size after each command and, if necessary, update the values of 
# LINES and COLUMNS.

shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will match all 
#files and zero or more directories and subdirectories. 

# shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot) 
fi

# set a fancy prompt (non-color, unless we know we "want" color)

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;; 
esac

# uncomment for a colored prompt, if the terminal has the capability; turned off by 
# default to not distract the user: the focus in a terminal window should be on the 
# output of commands, not on the prompt

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48 (ISO/IEC-6429). 
        # (Lack of such support is extremely rare, and such a case would tend to 
        # support setf rather than setaf.)
        color_prompt=yes 
    else 
        color_prompt=yes
    fi 
fi

##########################################################
#>>>>>>>>>>>    PROMPT by DEFAULT <<<---- (★╭╮★)
##########################################################

#*******************************************************************#
# Here start the code that manage how looks your prompt, this snippet of code is 
# the config by default, if you want to change the design by default just
# type helpme and the help commands for the functions of this .bashrc
# file will be show, I have to say that this works better and more cool having
# installed all the binaries necesaries for the experimental config.
#*******************************************************************#

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\e[36m\]@\[\e[0;1;32m\]\h\[\033[1;37m\]:[\[\033[0;7;34m\]\!\[\e[1;32;42m\]\#\[\033[0;1;37m\]]\[\033[0;1;34m\]\w\[\033[0m\]\$ ' 
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ ' 
fi

unset color_prompt force_color_prompt
        
# If this is an xterm set the title to user@host:dir
case "$TERM" in xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1" ;; *) ;; 
esac

#*******************************************************************#
# The next config helps you to improve the performance of some binaries in lest 
# words it enables the coloritation of the output of some commands
#
#     ___ __ __ __ _ _ / _ \__ __/ /_ ___ _/ /____ ___ / /_(_)__ ___ (_)__ / ___/ 
#    // / __/ / _ `/ __/ -_) _ \/ __/ / _ \/ _ \ / / _ \ /_/ \_,_/\__/ 
#    \_,_/\__/\__/_//_/\__/_/\___/_//_/ /_/_//_/
#
#                       __ / / ___ _______ / _ \/ -_) __/ -_) /_//_/\__/_/ \__/
#
#      
#          This is important little padawan, so focus in here
#                                                                                    
# Maybe the next config of aliases, do not take effect in your shell, like in 
# mine,this is because this config to be enable first test some conditions, if the 
# result of any of them is false, the aliases do not are put to work, we can solve 
# this in many easy ways, but first I gonna explain how works this tests, lol maybe 
# you already knows how it work, if that is the case you only make me lost my time 
# you little Nikola Tesla (LoL is a joke) So to enable this alias config first is 
# tested if the binary dircolors exist, if the result of this condition is true, 
# another test is done,the second test prove if the directory .dircolors exist, so 
# if any of this conditions is not satisfy the aliases will not be configured, so 
# for avoid this you can comment the lines with the evaluations or like me, put the 
# aliases directly at the end of this archive, I do not comment this because I want
# to let you this resolution at your discretion and for last I put always in the argument
# "--color", by default is automatic but nowadays mostly terminal have color support
# a least that you have the lucky of have a very old pc, that's so cool for colection
# (I love that kind of pc)but you gonna have more advantage using a pc more new, also
# it manage the energy so much better and this is the better for our world
# because we are very close of make shit our enviroment so because we need to take care 
# of our planet a very lot, due all this the value of the argument always is the best
# in any case, even if you wanna disable the color support or put in automatic, type
# helpme in your terminal for that you see with which command of experimental config and functions of this
# .bashrc file you can change all this values in automatic without have to edit this archive
# directly....(-‿◕)
#*******************************************************************#


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)" 
    alias ls='ls --color=always'
    alias dir='dir --color=always' 
    alias vdir='vdir --color=always'
    alias grep='grep --color=always'
    alias fgrep='fgrep --color=always' 
    alias egrep='egrep --color=always' 
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'; alias la='ls -A'; alias l='ls -CF'


# Alias definitions. You may want to put all your additions into a separate file 
# like ~/.bash_aliases, instead of adding them here directly. See 
# /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases 
fi

# enable programmable completion features (you don't need to enable this, if it's 
# already enabled in /etc/bash.bashrc and /etc/profile sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion 
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion 
  fi 
fi






#######################################################################>
#                         CUSTOM CONFIG
#######################################################################>

#*******************************************************************#
# Here must be your custom config(at the end of file) to avoid have a mess
# This is my standard config nowadays, feel free of coment, modify or remove all 
# you want, this don't affect nothing of this .bashrc archive
# due all is comented (LoL obviusly) or almost all because is enable(uncomented)
# the line of unmask config with the value in octal 027 I explain you how works
# all this in the next hints I don't gonna say you in which because I'm a bad person
# LoL joke, rather to force you to read all the hints, remember knowledge is power
# so if you read this hints maybe you learn anything new by more insifnificant
# that it could be, it gonna improvement your SuperPowers oh sure
# if we see the power that give you the knowledge how an extra added to yours superpowers
# that you already have, yeah we all have super powers how I, my super power of made shit
# the things in automatic, maybe could be a course for you, but for me is a bless (sometimes
# only when I have free time LOL) due it force me to repair and made
# the things again so I practice and learn more, so which are your superPowers?? take 
# advantage of they, and using it with the power of knowledge you can do amazing things  
#*******************************************************************#


#######################################################################>
#######################################################################>

#*******************************************************************#
# I have a good new and another bad, so first the good.... 
# In the next colum is all the music that for me is a very cool
# you will find a url of youtube of a playlist(Lazarus) of music to get motivation
# for code, that playlist has  been saved me  a lot the times when
# I'm very tired and I feel that can't more, also you have a long url list
# of music to work or study, and all this work in conjunt with your prompt, y
# yeah in my plans of how this should work, the prompt must to show the name of playing
# song in youtube also should be posible change the song to another from your shell,
# but here goes the really bad news, yeah rather was a good new and a
# very bad new, and is that this was only plans, Lol, I never planned 
# more concise in technical things of hows make that this happen
# also is easy make the functions yesterday I was doing that, the problem
# here is that because none link have a song tittle, the tittle must be get of the
# same you web pag of youtube when is played the song, this is easy of get,
# if you have a minimal knowledge of web develoment the song tittle is showed
# using the label h1, so with a wget and a sed command you can get it 
# easily and more cool if you use the var sustitution, you can get the name
# store in a var to print, but making tests, this is a little slow due
# wget must to download the pag, and it will be do it every time that you change 
# of song so that for me is unviable due this must work fast
# so I though maybe use cmus to do this more eficient but all the songs
# must be download with youtube-dl and this generate a additional
# dependency, so by the moment I don't gonna add this function for 
# can work in finished this repo, due this isn't vital by the moment 
# and with more time I do this more slow to take a cool choice
# so you can ignore the declare command that is at the end of this columm
# or better yet you can do and add the function already I told you how goes all this
# could be a cool task to training, also for set the songs or the playlist you 
# must run the web browser configure by default
# (at least in xfce4 using the xserver lightdm) using the binaries , x-www-browser
# or xdg-open and the setting like argument the url, any of both binaries 
# do the work
#*******************************************************************#

#######################################################################
#  __  __         _      _                      _                     _
# |  \/  |_  _ __(_)__  | |____ __   __ ___ _ _| |__     __ _ _ _  __| |
# | |\/| | || (_-< / _| | _/ _ \\ V V  / _ \ '_| / /    / _` | ' \/ _` |
# |_|  |_|\_,_/__/_\__| \__\___/ \_/\_/\___/_| |_\_\    \__,_|_||_\__,_|
#
#
#
# 
#                                    _ _           
#                         __ ___  __| (_)_ _  __ _ 
#                        / _/ _ \/ _` | | ' \/ _` |
#                        \__\___/\__,_|_|_||_\__, |
#                                            |___/ 
                                
################### Here is Lazarus, the bestplaylist of electro,minimal, progress, 
################### house, techno, bass, psy trance, hitech, etc, etc.....

####                    This list was made for inyect to you a lot of energy and 
####                    motivation.... do not abuse of it to make partys, use it 
####                    like a tool to help you to give the best you....

###########################                     HERE IS THE PLAYLIST:

##########                                          LAZARUS.........
#
###################    https://www.youtube.com/playlist?list=PL6v_pTizzCASVh6kyzCk_WcAnAYLPHnQs
#
#
#
#                       THIS IS MUSIC COOL MUSIC TO STAY FOCUS:
# 
############--> https://www.youtube.com/watch?v=4yKhCYlyyzA <--############
#             https://www.youtube.com/watch?v=n0N0iOxY0UY 
#             https://youtu.be/YPuqXLa1wuU
#			  https://www.youtube.com/watch?v=6gScEA4dcBE 
#			  https://www.youtube.com/watch?v=sy1dYFGkPUE
#             https://www.youtube.com/watch?v=lWvIQjz2cCY 
#             https://www.youtube.com/watch?v=f8IbpBm1OLE 
#             https://youtu.be/0yBnIUX0QAE
#             https://youtu.be/orc9nAiEG_8
#		      https://www.youtube.com/watch?v=kVbGFw5u880 
#		      https://www.youtube.com/watch?v=b2M7qgPJdkI 
#		      https://youtu.be/hLhN__oEHaw https://youtu.be/N3eb5g9NH30 
#		      https://www.youtube.com/watch?v=KqpJFAm0r_c 
#		      https://youtu.be/Sv6dMFF_yts 
#		      https://www.youtube.com/watch?v=J1Rd7zrvW7k 
#		      https://www.youtube.com/watch?v=4JkIs37a2JE 
#		      https://www.youtube.com/watch?v=NI6aOFI7hms 
#		      https://youtu.be/OcaPu9JPenU 
#		      https://www.youtube.com/watch?v=0zZ2bifb338 
#		      https://www.youtube.com/watch?v=RvuVFHTvdaY 
#		      https://www.youtube.com/watch?v=0WxDrVUrSvI 
#		      https://youtu.be/5y_EjC3uUMg 
#		      https://www.youtube.com/watch?v=0N9SEnTJRaw 
#		      https://youtu.be/QBbJCGYKr_8 https://youtu.be/O0lf_fE3HwA 
#		      https://www.youtube.com/watch?v=k8f4lcwKz6g 
#		      https://www.youtube.com/watch?v=S2Cti12XBw4 
#		      https://www.youtube.com/watch?v=YRgmFr1Q0X4 
#		      https://www.youtube.com/watch?v=H_pRyMShJ0k 
#		      https://youtu.be/AN0Cu8G4k_8 
#		      https://www.youtube.com/watch?v=oBDtRwU33rk 
#		      https://youtu.be/Q7hzQ7FOW6E  
#		      https://youtu.be/2A2XBoxtcUA  
#		      https://youtu.be/WuMDYi0-CxA  
#		      https://youtu.be/dne7tscdVls  
#		      https://youtu.be/WCtUCW1sDqs  
#		      https://youtu.be/2WrIN7xhEks  
#		      https://youtu.be/QuFb2iRhM7M  
#		      https://youtu.be/ma9I9VBKPiw  
#		      https://youtu.be/gH476CxJxfg  
#		      https://youtu.be/w8KQmps-Sog  
#		      https://youtu.be/wYkHPkTy0WA  
#		      https://youtu.be/Y-h98hFYusc  
#		      https://youtu.be/ubvV498pyIM  
#		      https://youtu.be/xxhET61yB1A  
#		      https://youtu.be/a8vGaBm9Y_4  
#		      https://youtu.be/rJD5bTcYBpQ 
#	   	      https://youtu.be/v_zZmsFZDaM 
#		      https://youtu.be/KgJzb_c2iiM  
#		      https://youtu.be/Usl993HxnzU  
#		      https://youtu.be/DkFJE8ZdeG8  
#		      https://youtu.be/Ttc_M0yR3SY  
#		      https://youtu.be/qBy1_LIB2OQ  
#		      https://youtu.be/4qv96L2cqa4  
#		      https://youtu.be/oExYK58k0xo  
#		      https://youtu.be/U5JOSn716iw  
#		      https://youtu.be/BPidLpADlaM  
#		      https://youtu.be/UTgzbX7SF5E  
#		      https://youtu.be/Q_7r2T0vO1I  
#		      https://youtu.be/x6ajmEAyWEg  
#		      https://youtu.be/Djh3xFfA6-k
#             https://youtu.be/lu9tUEVQzqo  
#             https://youtu.be/WOxE7IRizjI  
#             https://youtu.be/eKQuwAmIVKA  
#             https://youtu.be/iD2xL3qqV7o  
#             https://youtu.be/PCkT4K-hppE  
#             https://youtu.be/84no_HITKFo  
#             https://youtu.be/3dIuyu1FP7o  
#             https://youtu.be/Tq7Ovshz1UI  
#             https://youtu.be/3a8q_SL9RRE  
#             https://youtu.be/OZc11vc27f8  
#             https://youtu.be/eRuV0VKINto  
#             https://youtu.be/izTXFfU32iY  
#             https://youtu.be/7-a3dTzQsDw  
#             https://youtu.be/73L-91N1Fh8  
#             https://youtu.be/-JhwxTen6yA  
#             https://youtu.be/H3T1wVewVmQ  
#             https://youtu.be/nqWZqQXk_Ao  
#             https://youtu.be/c6tB98vZ1PE 
#             https://youtu.be/s8mjqR_8lUk
#             https://youtu.be/GNTnIZtj89k
#             https://youtu.be/AvSsCo7mtk8
#             https://youtu.be/_DGm4J6DdKY
#             https://youtu.be/QraBtD-KEQg
#             https://youtu.be/S6N-s67b5jg
#             https://youtu.be/1vbZMpRTT5M
#             https://youtu.be/JAfpp-F71-Y
#             https://youtu.be/YGIzrWOuyE8
#             https://youtu.be/Lp1fQ51YZMM
#             https://youtu.be/EqkBRVukQmE
#             https://youtu.be/xrHoJ5bYqA0
#             https://youtu.be/PeQAZsyucbQ
#             https://youtu.be/CUGzWETn1HQ
#             https://youtu.be/9OCEh6g6whc
#             https://youtu.be/HKLnmMacEB4
#             https://youtu.be/dvgZkm1xWPE
#             https://youtu.be/Oextk-If8HQ
#             https://youtu.be/-aco1xqWTIw
#             https://youtu.be/qGBohd0V2Mo
#             https://youtu.be/7bK5EPjGri4
#             https://youtu.be/7siu5MQ_8s0
#             https://youtu.be/E8o5zX5dMCs
#             https://youtu.be/VRrCXECRwu4
#             https://youtu.be/XkcyIElmOxg
#             https://youtu.be/ia_Nocs7Nr4
#             https://youtu.be/WxfXzywKzYs
#             https://youtu.be/jmKNmxBYex0
#             https://youtu.be/k_OwCasz23E
#             https://youtu.be/OTluo0QId6g
#             https://youtu.be/PZjKVi7uUzM
#             https://youtu.be/zWjXipKSjdg
#             https://youtu.be/32DOcN9A0TQ
#             https://youtu.be/W7DUFLa0UUI
#             https://youtu.be/mKVEeCwdc9w
#             https://youtu.be/df2K91QSqJE
#             https://youtu.be/_9UauaXTXUI
#             https://youtu.be/OczRpuGKTfY
#             https://youtu.be/X61BVv6pLtw
#             https://youtu.be/SWSz_PAfgNc
#             https://youtu.be/TOypSnKFHrE
#             https://youtu.be/pK7egZaT3hs
#             https://youtu.be/cLnkQAeMbIM
#             https://youtu.be/4kSuJwYoxkw
#             https://youtu.be/zE7woxcB35s
#             https://youtu.be/mMfxI3r_LyA
#             https://youtu.be/CF4gibe8VAo
#             https://youtu.be/bojBxTg6Z-g
#             https://youtu.be/gtlGGw-PCtI
#             https://youtu.be/WbJNkH-pDd8
#             https://youtu.be/oKlb_0TmIxU
#             https://youtu.be/UcPyNBTkzGE
#             https://youtu.be/9FwrfWcSqyA
#             https://youtu.be/elq7Z0_UpW8
#             https://youtu.be/JAfpp-F71-Y
#             https://youtu.be/PDJkgrovDPk
#             https://youtu.be/-Uv5cV67x4A
#             https://youtu.be/zJCuMcItXvQ
#################################################>



## declare -a song  |~+>~=_/sONGzZ\_-->> 

##########################################################################
############# sHEL1 0p71oNz --Here Start the experimental configs
##########################################################################


##########################################################>

#
#                                            _ _ _ _ _ _
#    | || |___ _ _ ___ __ _ ___ ___ ___ __ _| | | | |_| |_ ___
#    | __ / -_) '_/ -_) / _` / _ \/ -_|_-< / _` | | | | _| ' \/ -_) _||_\___|_| 
#    |\___| \__, \___/\___/__/ \__,_|_|_| \__|_||_\___|
#                       |___/
#                                  _
#     __ ___ _ __ _ __ __ _ _ _ __| |___ ___ _ _ ___ _ _ ___ / _/ _ \ ' \| ' \/ _`
#    | ' \/ _` (_-< / _ \ '_| / _ \ ' \/ -_) \__\___/_|_|_|_|_|_\__,_|_||_\__,_/__/
#    \___/_| \___/_||_\___|
                                                               
#     _ _
#    | (_)_ _ ___ _ _ ___
#    | | | ' \/ -_) '_(_-<
#    |_|_|_||_\___|_| /__/

#                                  IMPORTANT All commands, alias or one liners that I will 
#    added always gonna are commented (inactivated) it's up to you if you activate 
#    them by uncomment, only a very important commands will be added enabled by 
#    default (uncommented) and the active commands always gonna are in the begin of 
#    this section.


# Ok here goes all commands or one liners that you want that being run when you 
# open your shell, by the way is optional the place where you put the commands in 
# this archive (.bashrc) you can put them all in place that be the best for you, in 
# my case I put almost all my custom config at the end (EOF lol) of the document, 
# this with the idea of have all sorted and keep easy find anything, even your 
# custom config also must keep sorted, in my case first I have all the aliases and 
# then the commands to be run, so in less words !! KEEP SORTED ALL ALWAYS !! maybe 
# your day is a disorder, maybe your Gnu/Linux home is a chaos, maybe the life is a 
# clutter, even your own life is a mess, maybe your room is a muddle, maybe you 
# finds order in the disorder, maybe the disorder is beneficial in some cases even 
# in the computation (entropy), but in the archive .bashrc the disorder is the dead, 
# I think that I limited myself in the last sentence, so I will correct it,have a 
# mess in the .bashrc file it is the nonstop path to an absolute and inevitable 
# death (from your .bashrc file and everything that depends on it in your system, 
# and your pc can exploit in some cases (all about your pc exploting in thousand of 
# litle pieces is a joke..smile a some)), no matters the structure or gerarchy that 
# you use for sort, the important is that it is sorted, so in this way you 
# improvement the way to find anything, and by last and more important; maybe you 
# already knows this concept, and you have many years working in this way, and you 
# use it always in all the aspects of your life, maybe you borned to sort 
# everything, maybe and that is the only purpose of your life, and if that is the 
# case, why you are reading this? This hint is for helping to the begginers, you 
# should are working, due to this, your code always have bugs... Hahahahajajajajja 
# lol is a joke, to ended this hint in a cool way, but really, get to work now and 
# change this planet for better. 
#*******************************************************************#

#*******************************************************************#
# This umask config is the best to keep a good control over the permises of use of 
# archives.
#*******************************************************************#

umask 027




############################################################################>

#*******************************************************************#
# Imperial dependences
#*******************************************************************#

#*******************************************************************#
# Imperial Liner
#*******************************************************************#



#*******************************************************************#
# The next command is for set the config of enviroment variable of $PATH this var is a very lot useful
# and important, the function of this var is save the paths where our system gonna search for the binaries for 
# can run them only putting the name of the binary, to do this more easy of understand here a example:
# in this folder /bin there's the binaries to manage your system like touch, with this binary you can set
# the last time that was use a file, also you can create new files, so we gonna create the archive 
# hola.txt so to run it, only putting touch like this
# $ touch hola.txt
# you need to have set in the var $PATH, the absolute path of the folder(directory) in which our binary touch
# is stored, in this case the folder /bin (remember absolute paths) so one of the values of $PATH must be
# /bin in another case you must to put the absolute path of the binary every time that you wish run it, example
# $ /bin/touch hola.txt
#  every path in the var $PATH must be separate by ":" you can add the paths that you want so in the 
# next command I add a directory in which I have all 
# my custom installed binaries or executables and this is put in here when I loggin in my acount all them be load
# in $PATH, and for last to set this (to set any var enviroment) you use the command "export" how 
# this command is part of the builtin commands(run help in your terminal to see all the builtin commands), 
# you can use it without have to set their folder path, yeah all the builtin commands can be 
# run with only their names, uff I finished by now to don't confuse you but this is a lot of things to explain 
# like use ln to make a dinamyc link and linked to a folder specified in $PATH, for me is more cool set it its
# path in the var $PATH due you need super user permissions to write in some folder like /bin, anyway is just my
# way of think...animus
#*******************************************************************#


#*******************************************************************#
# Here are my aliases to enable color output and use lsd (very cool and not only by 
# the name) I recomend lsd in raves or when you go out of trip and #LoL joke,
# I can't let this oportunity pass so I recommend lsd like a cool and fancy alternative to 
# binaries for list files and directories, but in my case I found some bugs that 
# make a little dificult work with it, at first it was that it don't list the directories
# that own to root when binaries like ls, dir or vdir does, according to that because I 
# made the install using snap and I didn't  set
# or add the flag --classic, this is some very cool 
# of snap that puts a limit to the installed binaries to
# avoid that they can have access to sensible info of the system 
# but when I reinstalled it with the flag --classic, the binary stops of work it
# wasn't found in the folder snap, looks like when it is run in simple way just using
# the name of binary, it is execute than before, yeah with the same limits, but if you 
# execute it using the absolute path that was /snap/lsd/51/bin/lsd it works so I think 
# that this bug is due to the config by defaul of the binary snap because you run $ which lsd 
# it return you the path /snap/bin/lsd that is a dinamyc link to the binary snap located 
# in the path /usr/bin/snap but due I didn't debugged it more by the time,so only 
# I use the solution more fast that passed for my mind, and it was make a dinamyc link of the binary 
# /snap/lsd/51/bin/lsd to the folder $HOME/bin/lsd and with this I solve that bug without use super user permisses
# this only works until the next update due is change the name (number) of the folder in which is locate the binary
# to a to a larger number, and the dinamyc link is cuted LoL, so that is all, about how do temp solution if you 
# have the same bug that me, right now it run it with the deafult mode when it is installed that is the with the
# jail mode that is force to set with the argument --jail, anyway for me it work so cool so I recommend it to use
# due it looks so cool and for last right now I'm setted the next alias for lsd the before worked is cool 
# for the colors but without it is more useful for due in a terminal with a window size of less size is show a big 
# so much number of files so it that let you to view in many cases, all the files listed with don't need to scrooll
# down and losing your focus making this, and the argument --icon-theme set a icon theme to show you with 
# icons the type of archive listed, due without it the aparence of the icons is on a kind of error.
#                           for install it type this
#                           snap install (--classic or --jail or anything) lsd
#                           https://github.com/Peltoche/lsd 
#*******************************************************************#

# alias lsd='lsd --icon always --icon-theme unicode'

#*******************************************************************#
# This alias for nano adds the line number and soft wrap ...animus...Peace && Love
#*******************************************************************#

alias nano='nano -l$'


#*******************************************************************#
# Ok in this alias I put this to make the remove task more fast, wihout the binary 
# still question you if you want to remove these file, this is dangerous in some 
# cases, so take this with care 
#*******************************************************************#

# alias rm='rm --interactive=never'


#*******************************************************************#
# Ok in this alias I only add the arguments for that the output of diff prints the 
# compariton of the two archives and tells you if both are equals or not, and add 
# the support for colorized output 
#*******************************************************************#

# alias diff='diff -sy --color=always'


#*******************************************************************#
# Ok the next alias just set by default the colorized for the output dmesg (you 
# need read the man page) also you should see the command journalctl 
#*******************************************************************#

# alias dmesg='dmesg --color=always'


alias catn='ccat -G String=darkgray -G Keyword=turquoise -G Comment=bold -G Type=green -G Plaintext=blue -G Punctuation=fuchsia -G Decimal=bold -G Tag=turquoise -G Literal=darkred'


alias catd='ccat -G Keyword=fuscia -G Type=blue -G Literal=green -G Keyword=darkgreen -G Plaintext=bold -G Punctuation=darkred -G Decimal=darkgray  -G String=red -G Tag=yellow'


alias catf='ccat -G Comment=fuscia -G Keyword=*darkgreen* -G Plaintext=blue -G Punctuation=darkgreen -G Decimal=_white_ -G String=black -G Tag=yellow -G Type=darkblue -G Literal=*fuscia*'

#*******************************************************************#
# Alias for testing, without hints, here goes alias for commands that 
# (important commands to manage the system) I think that could be useful
# but due to my limited time I can't put hints, but it will have, someday
#*******************************************************************#
# alias impmnt='findmnt|ccatdark'
# alias lsusb='lsusb|ccatmev'
# alias env='env|ccatnight'


#*******************************************************************#
# This command help us when you open your terminal, it prints the options
# of the shell that is enable
#*******************************************************************#

#shopt


##########################################################
#>>>>>>>>>>>          In this part goes the all related to the prompts ☠☠☠☠☠ (-‿◕)
#>>>>>>>>>>>          I need to say that here is only a few number of prompts this due
#>>>>>>>>>>>          the mostly prompts that I made are for the repo LittleScript  
#>>>>>>>>>>>          and so much prompts don't show info is only the desing
#>>>>>>>>>>>          this works very cool for LittleScript due to the way in the which I
#>>>>>>>>>>>          have planned how must to work LittleScript, but relax, I gonna add
#>>>>>>>>>>>          all these and all that I will be invent in this repo https://github.com/TitanHero/ImperialOrder
#>>>>>>>>>>>          but right now this repo only have a lot of bragging and nothig of code, 
#>>>>>>>>>>>          LoL  this is only by right now, maybe I'm  a faker so let's will see   
#>>>>>>>>>>>          how much bluff is when be its turn to work in it, due right now I change my way
#>>>>>>>>>>>          way of work to get results fastly yeah I'm working in a repo until finished
#>>>>>>>>>>>          Anyway we need to have faith and patience...just remember.....
#>>>>>>>>>>>          the world is made of LOVE && PEACE....lol, I don't know why but I feel wants to say and put this in here lol
##########################################################


#Here stop the modification

#*******************************************************************#
# In the prompt basics you must to have installed taskbook, to make work that the prompt show you, yours statistics of tasks,
# you can install with the next command:
#           snap install taskbook
#*******************************************************************#

declare deprompt="$PS1"


declare terprompt=" \[\e[4;9m\] ┌\[\e[0;2;36m\]                       \n\[\033[0;4;34m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;1;7;31m\]\342\234\227\342\234\227 \[\e[0;33m\]Last Command error \[\e[1;7;9m\]\$?\[\033[0;1;34m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]root\[\033[01;33m\]@\[\033[01;96m\]\h'; else echo '\[\033[0;1;4;36;45m\]\w\[\e[0;1;34m\]─╼\[\033[0;1;36m\]\u\[\033[0;01;35m\]@\[\033[01;31m\]\h\[\e[0;1;4;32m\]~-~{\[\e[0;7;35m\]UId\[\e[0;4;7;36m\]$UID]\[\e[0m\]'; fi)\[\033[0;33m\]>\[\033[0;35m\]\!\[\033[0;9;36m\]}\n\[\e[0;1;4;9;35m\]  └─\[\e[0;1;36m\]\$\[\e[0;1;32m\]"

alias impt='export PS1=$terprompt'

alias impb='export PS1=$deprompt'


#*******************************************************************#
# The next command expand your ram memory in 8 gb...lol joke, really the next alias
# open tmux by default every time that you open a shell, if you have a tmux session
# , attach the session, another way open a new session, by default is comment (unset)  
#*******************************************************************#

# tmux a; [[ $? -ne 0 ]] && tmux

alias grep='grep --colour=always '

#*******************************************************************#
# This alias are for show info of help about interesting commands,
# or useful OneLiners for work with Bash in GnuLinux ✌️😉😁👍, so
# animus here you have so much help when you will need, remember
# "Read the manual first"
#*******************************************************************#


#*******************************************************************#
# The next alias print the file with the OneLiners colorized
# to make more easy of read and understand the syntax and text
# reading the file from your Terminal, so, animus, you can do it 
# champiom....
#*******************************************************************#

