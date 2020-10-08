FROM debian:stable
LABEL maintainer="Yuqi Liu <yuqi.lyle@outlook.com>"

RUN sed -n -i'.ori' \
    's/\(deb\|security\).debian.org/mirrors.163.com/gp' \
    /etc/apt/sources.list

RUN apt update && apt install vim wget curl net-tools \
    nginx php7.3 php7.3-fpm -y

RUN sed -i'.ori' 's@/run/php/php7.3-fpm.sock@127.0.0.1:9000@' \
    /etc/php/7.3/fpm/pool.d/www.conf

RUN mkdir -p /web
RUN sed -i 's@/var/www/html@/web@g' /etc/nginx/sites-enabled/default

COPY http.conf /etc/nginx/conf.d/http.conf

VOLUME ["/web"]

# CMD /etc/init.d/php7.3-fpm start && nginx -g "daemon off;"

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
