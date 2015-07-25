FROM debian:stable
MAINTAINER Pierre-Jean Baraud <pierre-jean@baraud.fr>

# Install apache php mcrypt
RUN apt-get update && DEBIAN_FRONTEND=noninteractive && apt-get install -y \
	apache2 \
	libapache2-mod-php5 \
	php5-mcrypt \
	wget 

# Get Simplevault and deploy it
RUN rm /var/www/html/* \
	&& wget -O /var/www/simplevault-1.8.tgz "http://downloads.sourceforge.net/project/simplevault/simplevault/simplevault-1.8.tgz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fsimplevault%2Ffiles%2F&ts=1402174081&use_mirror=garr" \
	&& tar -xf /var/www/simplevault-1.8.tgz -C /var/www/html/ --strip-components 1 \
	&& rm /var/www/simplevault-1.8.tgz

# Add simplevault textfile (user login and passwords)
RUN mkdir /var/lib/simplevault
RUN touch /var/lib/simplevault/simplevault.txt
RUN chown -R :www-data /var/lib/simplevault/
RUN chmod -R 770 /var/lib/simplevault/simplevault.txt

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
