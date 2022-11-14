FROM debian:bullseye-slim

LABEL maintainer="Jeremy Garigliet <jeremy.garigliet@gmail.com>"

# Set timezone
RUN cp /usr/share/zoneinfo/Europe/Paris /etc/localtime && \
    echo "Europe/Paris" > /etc/timezone && \
    date

RUN echo 'deb http://deb.debian.org/debian buster-backports main' >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get --no-install-recommends -qy install \
      certbot \
      python3-certbot-dns-gandi \
      python3-certbot-dns-ovh \
      python3-certbot-dns-cloudflare \
      python3-certbot-dns-digitalocean \
      python3-certbot-dns-google \
      python3-certbot-dns-linode \
      && \
    apt-get -qy clean && \
    apt-get -qy autoremove && \
    rm -rf /var/lib/apt/lists/*

COPY certgen.sh /usr/bin/certgen

RUN chmod 755 /usr/bin/certgen

CMD [ "certbot" ]
