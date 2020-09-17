build: clean
	docker build --tag wireguard .

clean:
	docker rm --force wg &> /dev/null
	docker rm wireguard &> /dev/null

start:
	docker run --detach --name wg wireguard

stop:
	docker stop wg &> /dev/null

repl:
	docker exec -it wg /bin/bash