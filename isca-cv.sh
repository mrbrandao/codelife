#!/bin/bash
#########################################################
# Copyright disclaimer
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
# Isca disclaims all copyright interest in the program “isca-cv.sh” 
# (which show Igor S. Brandao Curriculum Vitae) is written by Igot Brandao.
###########################################################
# 
# ---- ISCA CV CODE ----
#
# This is a simple script to diplay my Curriculum Vitae
#
#   What it must do?
#   * build a ascii board in pure born again shell
#   * display text arrays formatted as a block
#   * show the page number at botton
#   * paginate pressing numbers
#
#   - Why do not you, just make an echo to everything?
#   > What would be the fun?
#
#   - Why not use dialogs?
#   > I don't want any external dependencies just bash3+ and binutils.
#   > And btw, ascii is nice classic hack style, which is more fun...
#   
#   You need bash3+ to run this script, i'm using nested "for" loops and arrays
#   will not work on bash2- 
#   To make math calcs more compatible with bash3, i'm using expr insted $((+))
#
# By: igorsca at protonmail dot com
##########################################################

################
#Colors
red="\033[1;31;40m"
green="\033[1;32;40m"
yellow="\033[1;33;40m"
blue="\033[1;34;40m"
pink="\033[1;35;40m"
cyan="\033[1;36;40m"
white="\033[1;37;40m"
clean="\033[0m"


cols_lines_chk(){

  if [ $(tput cols) -lt "100" ] || [ $(tput lines) -lt "34" ];then
    echo -e ""$red"I need a minimal 100cols x 34lines to run... ;(
Try to expand your terminal emulator, and run again"$clean""
    exit 0
  fi
}

head(){
  if [ $(tput cols) -gt "80" ];then
    tput cup 0 10
    printf '▄%.0s' {1..80}
    tput cup 1 8 
    printf '██'
    tput cup 1 90
    printf '██'
    curve=("2 7" "2 92" "3 6" "3 93" "4 6" "4 93")
    curvelen=${#curve[@]}
      for (( i=0; i< "$curvelen"; i++ ));do
        tput cup ${curve["$i"]}
        printf '█▌'
      done
  fi

}

foot(){
  if [ $(tput cols) -gt "80" ];then
    tput cup 25 10
    printf '▄%.0s' {1..80}
    tput cup 25 8 
    printf '██'
    tput cup 25 90
    printf '██'
    curve=("24 7" "24 92" "23 6" "23 93" "22 6" "22 93")
    curvelen=${#curve[@]}
      for (( i=0; i< "$curvelen"; i++ ));do
        tput cup ${curve["$i"]}
        printf '█▌'
      done
  fi

}

body(){
for i in `seq 5 21`;do
  tput cup "$i" 6
  printf '▐▌'
  tput cup "$i" 93
  printf '▐▌'
done
}

style(){

  blocklen=${#block}
  for ((len=0; len< $blocklen; len++));do

    if [ "$len" == "0" ];then
      middleword=$(expr "${#block["$len"]}" / 2 )
      center=$(expr 49 - "$middleword" )
      tput cup 2 "$center"
      tput bold
      echo ${block["$len"]}
      tput sgr0
      continue
    fi

    if [ "$len" == "1" ] && [[ ${block[1]} == *"+" ]];then
      tput cup 4 12
      echo -e ${block[1]}|awk -F'+' '{print $1}'
      continue
    fi
      
    tput cup $(expr "$len" + 4) 12
    echo -e ${block[$len]}
  

  done
  
}

pages(){
  tput cup 24 54
  echo -e "Use "$yellow"numbers"$clean" for pages or "$green"x"$clean" to "$red"exit"$clean""
  tput cup 22 47
  color="\033[32;42m"
  cursor_pos="\033[9D"
  if [ "$menu" == "2" ];then
    cursor_pos="\033[7D"
  elif [ "$menu" == "3" ];then
    cursor_pos="\033[5D"
  elif [ "$menu" == "4" ];then
    cursor_pos="\033[3D"
  elif [ "$menu" == "5" ];then
    cursor_pos="\033[1D"
  fi

  echo -ne "0 1 2 3 4 5"$cursor_pos"" 
    
}

all(){
  head
  style
  body
  foot
  pages
}

screen0(){
  
  clear
  tput cup 8 0
  echo -e ""$blue"                                                               
                      ____  ____   _____  _____  _____  ___  _   _   ____  ____  
                     / ___||  _ \ | ____|| ____||_   _||_ _|| \ | | / ___|/ ___| 
                    | |  _ | |_) ||  _|  |  _|    | |   | | |  \| || |  _ \___ \ 
                    | |_| ||  _ < | |___ | |___   | |   | | | |\  || |_| | ___) |
                     \____||_| \_\|_____||_____|  |_|  |___||_| \_| \____||____/ 
                                                               
"$clean""

  head
  body
  foot

}


screen1(){
  clear
  declare -a block=("-- PRESENTATION --" "Hi, +" 
"My name is Igor Brandão, I'm a 34 years old guy, who is immersed" 
"in networks, computers, unix'es and all kind of eletronic devices..." 
"I grew up using command line tools and started using my first linux flavors" 
"in 1998 whith Slackware 3.5 with old kernel 2.0... Good Times ;)" 
"I have a degree in computer science, but i'm also is a skilled self-taught"
"and continuing learning person."
"I love clever challenges, and work with any kind of clomplexity datacenters."
"Maybe one of my, best skill is solve problems, in unix"
"philosophy style... ;p" "\n"
"Currently i live in Curitiba, South Brazil".)

  all

}

screen2(){
  clear
  declare -a block=("-- FOR WORK --" ""$green"SKILL"$clean" +" 
"At moment i work as Senior SysAdmin, at a company who cares of all"
"comunications, like: EMAIL/VOIP/TextMessages for Banking Institutions." 
"My main activities includes, administrate Geographic Clusters, manage"
"public/private cloud's orquestrating/automating datacenters as a code." 
"Bring SecOps/Devops culture, care with TDD and CI/CD and maitainence of"
"ISO IEC 27001." "\n"
""$green"WHERE AM I?"$clean"" "\n" 
""$pink"*"$clean" WORK AT     ==> http://www.maisresultado.com.br"
""$pink"*"$clean" SUPPORT FOR  ==> https://itau.com.br"
""$pink"*"$clean" SUPPORT FOR  ==> https://santander.com.br"
) 

  all
}

screen3(){
  clear
  declare -a block=("-- KNOWLEDGE & EXPERIENCE --" ""$green"TOOLS"$clean" +" 
"As long i work with computers here are some tools i use and have" 
"a good experience:" "\n"
""$pink"*"$clean" Virtualization (Xen Citrix/VMWare VSphere/KVM).\n"
""$pink"*"$clean" OS (All Kind of GNU/Linux Flavors/BSDs/Windows - At moment CoreOS a Lot ;-))\n"
""$pink"*"$clean" Programing & Scripting (C/C++/Php/Python/JavaScript/Ruby/GO/Ksh/Csh/Bash).\n"
""$pink"*"$clean" InfraAsCode Tools (Ansible is my favorite, i use Puppet for confs and Cheff).\n"
""$pink"*"$clean" Orquestrators (Kubernetes and docker containers everywhere)\n"
""$pink"*"$clean" Clustering (CARP+HAST/PACEMAKER+COROSYNC/HEARTBEAT+DRDB/DockerSwarm/Etcd2)\n"
""$pink"*"$clean" DataCenterAsCode (I just started to use TerraForm but i study OpenStack too)\n"
""$pink"*"$clean" PubClouds (In Amazon i have experience with EC2, i also have hosts on"
"IBM Bluemix and GCP too.)\n"
)
  all
}

screen4(){
  clear
  declare -a block=("-- FOR FUN --" ""$green"HACKING & NERDING"$clean" +" 
"I'm also to the founder of the first hackerspace on the State I live in, Paraná"
"which is also the only one in our city. The hackerspace is called GaragemHacker,"
"is the place that houses me most Friday's nights."
"There me and my friends take part on hacker movement and maker movement."
"We develop, build and play with stuff like drones, UAV's, 3d printers," 
"cnc routers,hardware manufactoring and this and that and all others... ;)"
"More about can be found at "$blue"garagemhacker.org"$clean""
)
  tput cup 12 0
  echo -e "$white
                                                                            |_|0|_|
                                                                            |_|_|0|
                                                                            |0|0|0|
"$clean""
  all
}

screen5(){
  clear
  declare -a block=("-- FOLLOW THE WHITE RABBIT --" ""$green"CONTACT"$clean" +"
"It whill be amazing to work there, if you read this please let me know,"
"and send me a hello to "$pink"igorsca at protonmail dot com"$clean.""
"or Telegram "$pink"@iscacsi"$clean"" "\n"
"Ow... I can't forget... you request cv as a PDF format, if this really matters"
"you can just press "$white"\"P\""$clean" to take a copy..."
)

  tput cup 13 15
  echo -e ""$white"
                                                         Powered by:"$green"
                                                                   ██╗   ██╗██╗███╗   ███╗
                                                                   ██║   ██║██║████╗ ████║
                                                                   ██║   ██║██║██╔████╔██║
                                                                   ╚██╗ ██╔╝██║██║╚██╔╝██║
                                                                    ╚████╔╝ ██║██║ ╚═╝ ██║
                                                                     ╚═══╝  ╚═╝╚═╝     ╚═╝
"$clean""

  all

}


screen6(){
  #some wird thinks ahead... 
  clear
  all
  pdfcv="igorsca-cv.pdf"
  tput cup 10 25
  echo -e "$white"Building pdf on "$green"$PWD/"$pdfcv""$clean"
  tmpfile=$(mktemp)
  (tail -n 20 "$0" > "$tmpfile";sed -i '20,$d' "$tmpfile"; \
  $(which openssl) base64 -d < "$tmpfile" > "$PWD"/"$pdfcv";rm -rf "$tmpfile")
  sleep 2
  clear
  all
  tput cup 10 47
  echo -e "$green"DONE!"$clean"
  sleep 1
  screen5

}

cols_lines_chk
screen0
sleep 1
screen1
while : ;do
  read -n 1 menu
  case "$menu"
  in
    0)
      screen0
    ;;
    1)
      screen1
    ;;
    2)
      screen2
    ;;
    3)
      screen3
    ;;
    4)
      screen4
    ;;
    5)
      screen5
    ;;
    p|P)
      screen6
    ;;
    x|X|q|Q)
      clear
      break
    ;;
    *)
    tput cup 20 25
    echo -e ""$red"ups... there is no "$menu" option""$clean"
    ;;
  esac
done

#tput cup 28 0
pdfbase64="
JVBERi0xLjMKJcTl8uXrp/Og0MTGCjQgMCBvYmoKPDwgL0xlbmd0aCA1IDAgUiAvRmlsdGVyIC9G
bGF0ZURlY29kZSA+PgpzdHJlYW0KeAGtnMuW28YRhvd4CmQTYU5GHIIEb8kmukUZ27LG4UTOOZEX
Dm3FtkTZIm15xq+Q5/B7pgD0/1UDDXIoJ0cLQo3u6qq/rn3BvMs/y9/lY/s3W81Gk2W+rMrRcpXv
vs4/z9/mF4/2Zb7Z52Xzb7+xfqHD1gbM9Z839X+y++NROV6tlrMqf2MdO//9Jn/VzDSbjqZVOZ3l
IDAgUiAvTW9kRGF0ZSA1MSAwIFIgPj4KZW5kb2JqCnhyZWYKMCA1MgowMDAwMDAwMDAwIDY1NTM1
MDAwIG4gCjAwMDAwMDAwMjIgMDAwMDAgbiAKMDAwMDAwNDQzNiAwMDAwMCBuIAowMDAwMDA0NTgx
IDAwMDAwIG4gCjAwMDAwMDc1MDQgMDAwMDAgbiAKMDAwMDAxMzQwNSAwMDAwMCBuIAowMDAwMDEw
OTgyIDAwMDAwIG4gCjAwMDAwMzk1ODQgMDAwMDAgbiAKMDAwMDAwMDAwMCAwMDAwMCBuIAowMDAw
MCBuIAowMDAwMDA3NTQwIDAwMDAwIG4gCjAwMDAwMTA5NjEgMDAwMDAgbiAKMDAwMDAxMTkyOSAw
MDAwMCBuIAowMDAwMDExMDE4IDAwMDAwIG4gCjAwMDAwMTE5MDkgMDAwMDAgbiAKMDAwMDAxMjA0
MDAxMjg2NiAwMDAwMCBuIAowMDAwMDEyOTIyIDAwMDAwIG4gCjAwMDAwMTMwODEgMDAwMDAgbiAK
MDAwMDAxMzEzNyAwMDAwMCBuIAowMDAwMDEzMzAxIDAwMDAwIG4gCjAwMDAwMTMzNTcgMDAwMDAg
biAKMDAwMDAxMzk4OSAwMDAwMCBuIAowMDAwMDE0MjM4IDAwMDAwIG4gCjAwMDAwMzk1NjIgMDAw
MDAgbiAKMDAwMDA0MDAwMSAwMDAwMCBuIAowMDAwMDQwMjU1IDAwMDAwIG4gCjAwMDAwNTQzMjYg
MDAwMDAgbiAKMDAwMDA1NDgzNCAwMDAwMCBuIAowMDAwMDU0NTE0IDAwMDAwIG4gCjAwMDAwNTQ4
MTQgMDAwMDAgbiAKMDAwMDA1NTA3NyAwMDAwMCBuIAowMDAwMDU5OTMxIDAwMDAwIG4gCjAwMDAw
NTk5NTIgMDAwMDAgbiAKMDAwMDA1OTk4MiAwMDAwMCBuIAowMDAwMDYwMDM1IDAwMDAwIG4gCnRy
YWlsZXIKPDwgL1NpemUgNTIgL1Jvb3QgMjcgMCBSIC9JbmZvIDEgMCBSIC9JRCBbIDwxMzNhOTVm
ZThhPiBdID4+CnN0YXJ0eHJlZgo2MDE2NgolJUVPRgo=
"
