#!/bin/bash
#linha que monta drive de rede
sudo mount -t cifs //192.168.1.50/zimgbkp$ -o username="username",password="xxxxxxx" /media/USBHDD1/Windows_share

#linhas para backup dos scripts
crontab -l > crontab.txt
sudo tar -zcvf /media/USBHDD1/Windows_share/home`date +%a`.tar.gz /home/pi/

#linha que faz imagem DD do SD
sudo dd bs=4M if=/dev/mmcblk0 | gzip > /media/USBHDD1/image`date +%a`.gz

#tempo para parado para resfrescar- 20min
sleep 1080 

#linha que copia dados do backup local para micro 
sudo cp /media/USBHDD1//image`date +%a`.gz /media/USBHDD1/shares/Windows_share

#desmonta rede do micro  local
sudo umount //1192.168.1.50/zimgbkp$


#uso futuro abaixo
