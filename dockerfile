# Use the official Golang image to build the app
FROM golang:1.22 AS builder

# Set the working directory
WORKDIR /app

# Copy go.mod and go.sum files
COPY go.mod go.sum ./

# Download dependencies
RUN go mod download

# Copy the entire source code
COPY . .

# Build the Go application
RUN go build -o main ./main/main.go

# Use a minimal image for the final stage
FROM alpine:latest

# Set the working directory in the final image
WORKDIR /root/

# Copy the binary from the builder image
COPY --from=builder /app/main .

# Command to run the executable
CMD ["./main"]
