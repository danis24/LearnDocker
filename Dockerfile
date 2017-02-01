FROM debian:latest
MAINTAINER Muhammad Surya Ihsanuddin<surya.kejawen@gmail.com>

# Set Environment Variables
RUN DEBIAN_FRONTEND=noninteractive

# Install Dependencies
RUN apt-get update && apt-get install -y apt-utils && apt-get upgrade -y
RUN mkdir /home/site && mkdir /home/site/cache
RUN apt-get install -y varnish

# Setting Configurations
ENV VCL_CONFIG      /etc/varnish/default.vcl
ENV CACHE_SIZE      128m
ENV VARNISHD_PARAMS -p default_ttl=3600 -p default_grace=3600

ADD varnish/start.sh /etc/varnish/start.sh

RUN chmod +x /etc/varnish/start.sh

CMD ["/etc/varnish/start.sh"]

EXPOSE 80