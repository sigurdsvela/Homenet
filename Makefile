mkfile_path := $(shell pwd)

build:
	docker create \
		--name=wireguard \
		--cap-add=NET_ADMIN \
		--cap-add=SYS_MODULE \
		-e PUID=1000 \
		-e PGID=1000 \
		-e TZ=Europe/London \
		-e SERVERURL=wireguard.domain.com `#optional` \
		-e SERVERPORT=51820 `#optional` \
		-e PEERS=5 `#optional` \
		-e PEERDNS=auto `#optional` \
		-e INTERNAL_SUBNET=10.13.13.0 `#optional` \
		-p 51820:51820/udp \
		-v /config:/config \
		-v /lib/modules:/lib/modules \
		--sysctl="net.ipv4.conf.all.src_valid_mark=1" \
		--restart unless-stopped \
		linuxserver/wireguard

clean:
	docker rm wireguard

start:
	docker start wireguard

stop:
	docker stop wireguard

listPeers:
	docker exec -it wireguard /app/show-peer 1

deploy:
	scp -r $(mkfile_path) homenet@homefront.local:~/
	