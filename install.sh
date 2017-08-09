#!/bin/bash
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;11m"
COL_GREEN=$ESC_SEQ"32;11m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_YELLOW=$ESC_SEQ"33;11m"

function greenMessage {
    echo -e "\\033[32;1m${@}\033[0m"
}

function magentaMessage {
    echo -e "\\033[35;1m${@}\033[0m"
}

function cyanMessage {
    echo -e "\\033[36;1m${@}\033[0m"
}

function redMessage {
    echo -e "\\033[31;1m${@}\033[0m"
}

function yellowMessage {
	echo -e "\\033[33;1m${@}\033[0m"
}

clear

greenMessage "=============================================================================="
redMessage "MusikBot Install Script"
redMessage "By Nexus"
redMessage "Viel Spass"
greenMessage "=============================================================================="
sleep 6
clear
sleep 3

redMessage "=========================================="
redMessage "--------------------------------------- 0%"
redMessage "=========================================="
sleep 1

greenMessage "Erst werden die Programme Installiert "
sleep 5

apt-get update
apt-get install x11vnc xvfb libxcursor1 ca-certificates bzip2 -y 
update-ca-certificates
apt-get install screen htop nano
clear
sleep 3

redMessage "=========================================="
redMessage "====----------------------------------- 5%"
redMessage "=========================================="
sleep 1

greenMessage "User SinusBot wird erstellt"
sleep 5

adduser sinusbot
clear
sleep 3


redMessage "=========================================="
redMessage "======-------------------------------- 10%"
redMessage "=========================================="
sleep 1

greenMessage "Der Bot wird Heruntergeladen"
sleep 5

mkdir /opt/ts3soundboard
cd /opt/ts3soundboard
wget https://www.sinusbot.com/dl/sinusbot-beta.tar.bz2
tar -xjvf sinusbot-beta.tar.bz2
cp config.ini.dist config.ini
clear
sleep 3

redMessage "=========================================="
redMessage "=============------------------------- 25%"
redMessage "=========================================="
sleep 1

greenMessage "Installiere Teamspeak Client"
sleep 5

wget http://dl.4players.de/ts/releases/3.0.18.2/TeamSpeak3-Client-linux_amd64-3.0.18.2.run
chmod 0755 TeamSpeak3-Client-linux_amd64-3.0.18.2.run
su root -c "./TeamSpeak3-Client-linux_amd64-3.0.18.2.run"
clear
sleep 3

redMessage "=========================================="
redMessage "====================------------------ 50%"
redMessage "=========================================="
sleep 1

greenMessage "Bearbeite Datein"
sleep 5

cp plugin/libsoundbot_plugin.so /opt/ts3soundboard/TeamSpeak3-Client-linux_amd64/plugins
chmod 0755 sinusbot
sleep 3
clear

redMessage "=========================================="
redMessage "==========================------------ 65%"
redMessage "=========================================="
sleep 1

greenMessage "Bot wirden Gestartet Moment..."
sleep 5

cd /opt/ts3soundboard/
su sinusbot -c "screen -A -m -d -S Sinusbot1 ./sinusbot -pwreset=foobar"
clear
sleep 3

redMessage "=========================================="
redMessage "===============================------- 75%"
redMessage "=========================================="
sleep 1

greenMessage "Installiere das Startscript"
sleep 5

cd /opt/ts3soundboard
wget https://raw.githubusercontent.com/RocketSun/SinusBot-Script/master/start.sh
chmod 777 start.sh
clear
sleep 3

redMessage "=========================================="
redMessage "===================================== 100%"
redMessage "=========================================="
sleep 1
clear

greenMessage "=============================================================================="
redMessage   "Der Bot Ist Jetzt Online !!!"  
redMessage   "Mit dem Befehl ./start.sh start kannst du deinen Musikbot starten"
redMessage   "Mit dem Befehl ./start.sh stop kannst du deinen Musikbot stoppen"
greenMessage "=============================================================================="