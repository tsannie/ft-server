# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tsannie <tsannie@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/02 12:38:57 by tsannie           #+#    #+#              #
#    Updated: 2021/02/02 14:11:52 by tsannie          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
#docker run --name aname -it -p 80:80 -p 443:443 name
#docker build -t name .


FROM debian:buster

MAINTAINER tsannie

RUN apt-get update
RUN apt-get install -y \
    nginx

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp* 
