FROM debian:bookworm

#Install kismet
COPY sources.list /etc/apt/
RUN \
	rm /etc/apt/sources.list.d/debian.sources; \
	apt update && \
	apt install -y firmware-misc-nonfree wget gnupg2 usbutils wireless-tools iproute2 kmod vim

#RUN wget https://www.kismetwireless.net/repos/kismet-release.gpg.key##
#RUN apt-key add kismet-release.gpg.key
#RUN echo 'deb https://www.kismetwireless.net/repos/apt/release/bullseye bullseye main' | tee /etc/apt/sources.list.d/kismet.list
#RUN apt update && apt install -y kismet gpsd

RUN \
	wget -O - https://www.kismetwireless.net/repos/kismet-release.gpg.key --quiet | gpg --dearmor | tee /usr/share/keyrings/kismet-archive-keyring.gpg >/dev/null; \
	echo 'deb [signed-by=/usr/share/keyrings/kismet-archive-keyring.gpg] https://www.kismetwireless.net/repos/apt/release/kali kali main' | tee /etc/apt/sources.list.d/kismet.list >/dev/null; \
	apt update && apt install -y kismet gpsd

EXPOSE 2501
EXPOSE 3501

WORKDIR /Drive/kismet_files
CMD kismet
