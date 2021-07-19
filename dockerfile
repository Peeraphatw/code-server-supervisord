FROM alpine

COPY ./nginx.conf /etc/nginx/nginx.conf


COPY ./codeserver.conf /etc/nginx/conf.d/default.conf

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
COPY /server .

EXPOSE 80
# nginx port
EXPOSE 8080
# code-server port
EXPOSE 3000
# node port



COPY supervisord.conf /etc/supervisord.conf
ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
# ENTRYPOINT [ "sh", "/app/start.sh" ]
