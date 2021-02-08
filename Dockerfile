# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tsannie <tsannie@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/02 12:38:57 by tsannie           #+#    #+#              #
#    Updated: 2021/02/08 12:37:03 by tsannie          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		debian:buster
MAINTAINER	Théo SANNIE <tsannie@42.student.fr>

# Moove config-files
COPY ./srcs/launch.sh ./tmp/
COPY ./srcs/nginx-conf ./tmp/
COPY ./srcs/phpmyadmin.inc.php ./tmp/
COPY ./srcs/wp-config.php ./tmp/

# Launch server
CMD bash tmp/launch.sh
