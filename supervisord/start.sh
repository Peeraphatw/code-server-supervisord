#!bin/sh
sed -i "s/NGINX_APP_TYPE/\"$NGINX_APP_TYPE\"/g" /etc/nginx/conf.d/default.conf
sed -i "s/CODE_SERVER_PASSWORD/$CODE_SERVER_PASSWORD/g" /root/.config/code-server/config.yaml
/usr/bin/supervisord -c /etc/supervisord.conf
