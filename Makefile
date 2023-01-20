db-up:
	docker run --name postgres12 -p 5432:5432 -v data-vol:/var/lib/postgresql/data -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:12-alpine

db-start:
	docker start postgres12

db-stop:
	docker stop postgres12

db-down:
	docker stop postgres12
	docker rm postgres12

db-clean:
	docker volume rm data-vol

db-createdb:
	docker exec -it postgres12 createdb --username=root --owner=root auth_svc
	docker exec -it postgres12 createdb --username=root --owner=root order_svc
	docker exec -it postgres12 createdb --username=root --owner=root product_svc

db-dropdb:
	docker exec -it postgres12 dropdb auth_svc
	docker exec -it postgres12 dropdb order_svc
	docker exec -it postgres12 dropdb product_svc


.PHONY: db-up db-down db-start db-stop db-clean db-createdb db-dropdb