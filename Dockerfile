# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tsannie <tsannie@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/02 12:38:57 by tsannie           #+#    #+#              #
#    Updated: 2021/02/05 13:44:46 by tsannie          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
MAINTAINER Théo SANNIE <tsannie@42.student.fr>

# Moove config-files
COPY ./srcs/launch.sh ./
COPY ./srcs/nginx-conf ./tmp/
COPY ./srcs/phpmyadmin.inc.php ./tmp/
COPY ./srcs/wp-config.php ./tmp/

# Launch server
CMD bash launch.sh


# docker build -t ftserv .
# docker image ls
# docker history ftserv
# docker run -tid --name test ftserv
# docker exec -ti test sh
# docker rm -f test
# docker rmi ftserv
# docker run --name test -it -p 80:80 -p 443:443 ftserv
