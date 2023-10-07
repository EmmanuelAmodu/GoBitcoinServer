FROM golang:1.20.6-alpine

# Add the script to the Docker Image
ADD . /root/settlement-service

# Add the cron job
RUN echo "*/5 * * * * go run /root/settlement-service/main.go" >> /var/spool/cron/crontabs/root

RUN wget -q -t3 'https://packages.doppler.com/public/cli/rsa.8004D9FF50437357.key' -O /etc/apk/keys/cli@doppler-8004D9FF50437357.rsa.pub && \
  echo 'https://packages.doppler.com/public/cli/alpine/any-version/main' | tee -a /etc/apk/repositories && \
  apk add doppler

# Run the command on container startup
CMD ["doppler", "run", "--", "crond", "-f"]
