#!/bin/bash
#linha que monta drive de rede, atenção ao endereço de IP e ponto de montagem
sudo mount -t cifs //192.168.1.50/zimgbkp$ -o username="username",password="xxxxxxx" /media/USBHDD1/Windows_share

#linhas para backup do Crontab e da pasta home( em formato TAR) 
crontab -l > crontab.txt
sudo tar -zcvf /media/USBHDD1/Windows_share/home`date +%a`.tar.gz /home/pi/

#linha que faz uma imagem DD do SD, atenção ao ponto de montagem (local do Backup)
sudo dd bs=4M if=/dev/mmcblk0 | gzip > /media/USBHDD1/image`date +%a`.gz

#tempo para parado para que CPU possa baixar a temperatura- 20min
sleep 1080 

#linha que copia dados do backup local para micro em rede no armazenamento compartilhado
sudo cp /media/USBHDD1//image`date +%a`.gz /media/USBHDD1/shares/Windows_share

#desmonta rede do micro  local
sudo umount //1192.168.1.50/zimgbkp$

#uso futuro abaixo