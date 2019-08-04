FROM alpine                

RUN apk update && \
apk upgrade && \
apk add bash dnsmasq && \
rm -rf /var/cache/apk/* && \
mkdir -p /etc/default/ && \
echo -e "ENABLED=1\nIGNORE_RESOLVCONF=yes" > /etc/default/dnsmasq

COPY /dnsmasq.conf /etc/dnsmasq.conf

CMD ["dnsmasq","--no-daemon"]