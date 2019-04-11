### Image from Ubuntu 18.04.1
FROM ubuntu:18.04

LABEL autor="CJJ < cassio.jjesus@gmail.com >"


RUN apt update && apt -y upgrade \
    && apt install -y tzdata \
    && apt install -y nginx \
    && apt install -y default-jre openjdk-8-jre-headless \
    && ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log \
    && mkdir -p /data/www

COPY confs/nginx.conf /etc/nginx
COPY confs/default.conf /etc/nginx/conf.d

EXPOSE 80 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]

##################
### References ###
##################
### To ttimezone
## -> https://blog.codingecho.com/2017/08/01/how-to-change-timezone-on-docker-with-ubuntu-16-04/ (2018-08-31 at 17:00)
### To logs
## -> https://docs.docker.com/config/containers/logging/ (2018-09-03 at 18:09)
## -> https://github.com/nginxinc/docker-nginx/blob/8921999083def7ba43a06fabd5f80e4406651353/mainline/jessie/Dockerfile#L21-L23 (2018-09-03 at 18:09)
