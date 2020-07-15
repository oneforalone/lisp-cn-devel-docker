FROM debian
ENV APT_SRC_DIR /etc/apt
RUN mv $APT_SRC_DIR/sources.list $APT_SRC_DIR/sources.list.ori
COPY sources-cn.list $APT_SRC_DIR/sources.list
RUN apt update && apt upgrade -y && apt install vim wget curl net-tools \
    nginx php7.3 php7.3-fpm -y

ENV NGINX_CONF_DIR /etc/nginx/conf.d
ENV PHP_FPM_CONF_DIR /etc/php/7.3/fpm
RUN sed -i 's@/run/php/php7.3-fpm.sock@127.0.0.1:9000@' \
    $PHP_FPM_CONF_DIR/pool.d/www.conf
COPY http.conf $NGINX_CONF_DIR/http.conf
RUN cd /var/www/html && mv index.nginx-debian.html index.php && \
    sed -i '24i <?php phpinfo(); ?>' index.php