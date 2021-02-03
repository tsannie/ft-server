# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tsannie <tsannie@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/02 12:38:57 by tsannie           #+#    #+#              #
#    Updated: 2021/02/03 14:52:49 by tsannie          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#docker build -t name .

FROM debian:buster

MAINTAINER tsannie

RUN apt-get update
RUN apt-get install -y nginx

RUN apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# docker build -t ftserv .
# docker image ls
# docker history ftserv
# docker run -tid --name test ftserv
# docker exec -ti test sh
# docker rm -f test
# docker rmi ftserv