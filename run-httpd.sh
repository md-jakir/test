# Just a shell script to start httpd in Forground
# It could be added into Docker file as following
# CMD ["/usr/sbin/apache2", "-D",  "FOREGROUND"] 

exec /usr/sbin/apachectl -DFOREGROUND
