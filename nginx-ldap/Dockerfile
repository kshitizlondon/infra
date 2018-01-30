FROM debian:jessie

MAINTAINER Sergei Tikhanovich <sergei.tikhanovich@nttdata.com>

ENV NGINX_VERSION release-1.12.2

# Use jessie-backports for openssl >= 1.0.2
# This is required by nginx-auth-ldap when ssl_check_cert is turned on.
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
	&& echo 'deb http://ftp.debian.org/debian/ jessie-backports main' > /etc/apt/sources.list.d/backports.list \
	&& apt-get update \
	&& apt-get install -t jessie-backports -y \
		ca-certificates \
		git \
		gcc \
		make \
		libpcre3-dev \
		zlib1g-dev \
		libldap2-dev \
		libssl-dev \
		wget

# Add LDAP module
RUN cd ~ && mkdir nginx-auth-ldap
COPY config /root/nginx-auth-ldap 
COPY ngx_http_auth_ldap_module.c /root/nginx-auth-ldap
COPY dockerize.tar.gz /root
RUN mkdir /var/log/nginx \
	&& mkdir /etc/nginx \
        && mkdir /etc/nginx/conf.d \
	&& cd ~ \
	&& git clone https://github.com/nginx/nginx.git \
	&& cd ~/nginx \
	&& git checkout tags/${NGINX_VERSION} \
	&& ./auto/configure \
		--add-module=/root/nginx-auth-ldap \
		--with-http_ssl_module \
		--with-debug \
		--conf-path=/etc/nginx/nginx.conf \ 
		--sbin-path=/usr/sbin/nginx \ 
		--pid-path=/var/log/nginx/nginx.pid \ 
		--error-log-path=/var/log/nginx/error.log \ 
		--http-log-path=/var/log/nginx/access.log \
        --with-stream \
        --with-stream_ssl_module \
        --with-debug \
        --with-file-aio \
        --with-threads \
        --with-http_gunzip_module \
        --with-http_gzip_static_module \
        --with-http_v2_module \
        --with-http_auth_request_module \
	&& make install \
	&& cd .. \
	&& rm -rf nginx-auth-ldap \
	&& rm -rf nginx \
	&& tar -C /usr/local/bin -xzvf /root/dockerize.tar.gz \
	&& rm -rf /root/dockerize.tar.gz

EXPOSE 80 443

COPY run.sh /run.sh
CMD ["/run.sh"]
