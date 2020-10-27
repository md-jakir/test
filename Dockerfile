FROM centos:7
MAINTAINER My porject
#LABEL Vendor="CentOS" \
#      License=GPLv2 \
#      Version=2.4.6-40


RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install httpd && \
    yum clean all

COPY ./index.html /var/www/html     # place index.html file where Dockerfile has been placed means same location

EXPOSE 80

# Simple startup script to avoid some issues observed with container restart
ADD run-httpd.sh /start-httpd.sh
RUN chmod -v +x /start-httpd.sh

CMD ["/start-httpd.sh"]
