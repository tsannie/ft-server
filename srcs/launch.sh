# DL tools
apt-get update
apt-get -y upgrade
apt-get install -y	wget \
					vim \
					nginx \
					mariadb-server \
					php \
					php-mysql \
					php-fpm \
					php-cli \
					php-mbstring \
					php-zip \
					php-gd
# Generate SSL key
mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/my_website.pem -keyout /etc/nginx/ssl/my_website-key.pem -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=tsannie/CN=my_website"

# Create folder for website
chown -R www-data /var/www/*
chmod -R 755 /var/www/*
mkdir /var/www/my_website

# DL PHPMyAdmin
mkdir /var/www/my_website/phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
tar -xvf phpMyAdmin-5.0.4-all-languages.tar.gz --strip-components 1 -C /var/www/my_website/phpmyadmin
mv ./tmp/phpmyadmin.inc.php /var/www/my_website/phpmyadmin/config.inc.php

# Config NGINX
cp ./tmp/nginx-conf /etc/nginx/sites-available/my_website
ln -s /etc/nginx/sites-available/my_website /etc/nginx/sites-enabled/my_website
rm -rf /etc/nginx/sites-enabled/default

# DL WordPress
cd /tmp/
wget -c https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
mv wordpress/ /var/www/my_website
mv /tmp/wp-config.php /var/www/my_website/wordpress

# Config MYSQL
service mysql start
echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "UPDATE mysql.user SET plugin='mysql_native_password' WHERE user='root';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

service php7.3-fpm start
service nginx start
bash