FROM debian:stable
RUN apt-get update && apt-get install -y python-pip python-matplotlib
RUN useradd privacyidea
RUN mkdir /home/privacyidea /data
RUN chown -R privacyidea /home/privacyidea /data
USER privacyidea
RUN pip install privacyidea
COPY config.py /etc/privacyidea/pi.cfg
