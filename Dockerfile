# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tsannie <tsannie@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/02 12:38:57 by tsannie           #+#    #+#              #
#    Updated: 2021/02/04 11:31:03 by tsannie          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

MAINTAINER tsannie

RUN apt-get update
RUN apt-get install -y	nginx \
						vim \
						wget \
						mariadb-server \
						mariadb-client

RUN apt-get install -y	php \
						php-fpm \
						php-gd \
						php-mysql \
						php-cli \
						php-curl \
						php-json

RUN apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./srcs/nginx.conf ./tmp/nginx.conf
COPY ./srcs/wp-config.php ./tmp/wp-config.php
COPY ./srcs/phpmyadm.php ./tmp/phpmyadm.php

# docker build -t ftserv .
# docker image ls
# docker history ftserv
# docker run -tid --name test ftserv
# docker exec -ti test sh
# docker rm -f test
# docker rmi ftserv
