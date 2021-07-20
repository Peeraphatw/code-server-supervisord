FROM alpine
WORKDIR /app

RUN apk update && apk add --no-cache \
    supervisor \
    nginx\
    nodejs \
    npm \
    yarn \
    openrc 

COPY ./vscode.sh /app/vscode.sh
RUN sh /app/vscode.sh
COPY ./config.codeserver.yaml /root/.config/code-server/config.yaml
COPY ./server .

EXPOSE 80
# nginx port
EXPOSE 8080
# code-server port
EXPOSE 3000
# node port

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./codeserver.conf /etc/nginx/conf.d/default.conf
COPY ./supervisord.conf /etc/supervisord.conf

ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

