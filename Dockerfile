FROM debian:stable
VOLUME /data
WORKDIR /home/privacyidea
RUN apt-get update && apt-get install -y python-pip python-matplotlib sudo
RUN useradd privacyidea
RUN chown -R privacyidea /home/privacyidea
USER privacyidea
RUN pip install privacyidea
USER root
COPY config.py /etc/privacyidea/pi.cfg
COPY entrypoint.sh /usr/bin/entrypoint
ENTRYPOINT ["/usr/bin/entrypoint"]
