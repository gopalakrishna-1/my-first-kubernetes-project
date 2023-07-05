FROM centos:latest
LABEL mail=vgkcivil@gmail.com
RUN yum update -y
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN yum install -y httpd \
zip \
unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page292/yogast.zip /var/www/html
WORKDIR /var/www/html
RUN unzip yogast.zip
RUN cp -rvf yogast/* .
RUN rm -rf yogast yogast.zip
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
EXPOSE 80 
