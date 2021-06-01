#! /bin/bash
echo  `date`
s3=deepupgard
echo -e "\e[33mUpdate system. \e[0m"
apt update
echo -e "\e[34minstall webserver. \e[0m"
apt install apache2
echo -e "\e[33mwebserver service start. \e[0m"
systemctl start apache2
echo -e "\e[35mwebserver service status info. \e[0m"
systemctl status apache2
echo -e "\e[35mmaking tar of  access-log and error-log files. \e[0m"
tar -cvf Deep-httpd-logs-010621-180001 /var/log/apache2
echo -e "\e[36mmove tar file into tmp folder. \e[0m"
mv Deep-httpd-logs-010621-180001 /tmp/Deep-httpd-logs-010621-180001
echo -e "\e[36maws configure. \e[0m"
aws configure
echo -e "\e[37maws bucket formation. \e[0m"
aws s3 mb s3://deepupgrad
echo -e "\e[37m copy achrive into $s3 bucket. \e[0m"
aws s3 cp /tmp/Deep-httpd-logs-010621-180001 s3://deepupgrad
