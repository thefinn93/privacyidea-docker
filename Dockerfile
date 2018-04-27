FROM debian:stable
RUN apt-get update && apt-get install -y python-pip python-matplotlib sudo
RUN useradd privacyidea
RUN mkdir /home/privacyidea /data
RUN chown -R privacyidea /home/privacyidea /data
USER privacyidea
RUN pip install privacyidea
USER root
COPY config.py /etc/privacyidea/pi.cfg
COPY entrypoint.sh /usr/bin/entrypoint
WORKDIR /home/privacyidea
ENTRYPOINT ["/usr/bin/entrypoint"]
