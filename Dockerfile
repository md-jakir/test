FROM centos:7
MAINTAINER The CentOS Project <cloud-ops@centos.org>
#LABEL Vendor="CentOS" \
#      License=GPLv2 \
#      Version=2.4.6-40


RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install httpd mod_ssl && \
    yum clean all

COPY ./index.html /var/www/html

EXPOSE 80

# Simple startup script to avoid some issues observed with container restart
ADD httpd.sh /httpd.sh
RUN chmod -v +x /httpd.sh

CMD ["/httpd.sh"]
