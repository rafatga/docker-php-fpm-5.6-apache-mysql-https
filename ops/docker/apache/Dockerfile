# httpd base image
FROM httpd:2.4-alpine

RUN apk update; \
    apk upgrade;

RUN apk add nano vim

# Copy certificates
COPY ./apache/certificates/certificate.pem /usr/local/apache2/conf/certificate.pem
COPY ./apache/certificates/certificate-key.pem /usr/local/apache2/conf/certificate-key.pem

# Copy the Apache virtual host configuration file to the container
COPY ./apache/config/apache.vhost.conf /usr/local/apache2/conf/extra/apache.vhost.conf
COPY ./apache/config/httpd-ssl.conf /usr/local/apache2/conf/extra/httpd-ssl.conf

#RUN echo 'ServerName localhost' >> /usr/local/apache2/conf/httpd.conf

# Enable Apache modules to ensure proper functionality
RUN sed -i \
    # Uncomment the configuration for socache_shmcb_module to enable compression
    -e '/#LoadModule socache_shmcb_module/s/^#//g' \
    # Uncomment the configuration for mod_headers to enable compression
    -e '/#LoadModule mod_headers/s/^#//g' \
    # Uncomment the configuration for ssl_module to enable compression
    -e '/#LoadModule ssl_module/s/^#//g' \
    # Uncomment the configuration for expires_module to enable compression
    -e '/#LoadModule expires_module/s/^#//g' \
    # Uncomment the configuration for rewrite_module to enable compression
    -e '/#LoadModule rewrite_module/s/^#//g' \
    # Uncomment the configuration for mod_deflate to enable compression
    -e '/#LoadModule deflate_module/s/^#//g' \
    # Uncomment the configuration for mod_proxy to enable proxying capabilities
    -e '/#LoadModule proxy_module/s/^#//g' \
    # Uncomment the configuration for mod_proxy_fcgi to enable FastCGI proxy module
    -e '/#LoadModule proxy_fcgi_module/s/^#//g' \
    /usr/local/apache2/conf/httpd.conf

RUN sed -i 's,#\(Include conf/extra/httpd-ssl.conf\),\1,g' /usr/local/apache2/conf/httpd.conf

#Include conf/extra/httpd-ssl.conf
RUN { \
  echo 'IncludeOptional conf.d/*.conf'; \
} >> /usr/local/apache2/conf/httpd.conf \
  && mkdir /usr/local/apache2/conf.d

# Include the virtual host configuration file in the main Apache configuration
RUN echo "Include /usr/local/apache2/conf/extra/apache.vhost.conf" >> /usr/local/apache2/conf/httpd.conf

EXPOSE 80
EXPOSE 443