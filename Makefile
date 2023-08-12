build:
	docker build . -t tdsepsilon/kismet:bookworm

exec:
	docker run -it debian:bookworm /bin/bash

wifi:
	kismet_cap_linux_wifi \
		--tcp \
		--connect 192.168.22.20:3501 \
		--source wlan0:name=remote_couch_wifi,timestamp=false &

bluetooth:
	kismet_cap_linux_bluetooth \
		--tcp \
		--connect 192.168.22.20:3501 \
		--source hci0:name=remote_couch_bluetooth,timestamp=false &

run: wifi bluetooth
