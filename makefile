build:
	go build -o mode_service main.go

test:
	go test ./...

run:
	docker-compose up
