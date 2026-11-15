FROM golang:1.27.3-alpine AS builder

WORKDIR /app
COPY go.mod ./
COPY main.go ./

RUN CGO_ENABLED=0 GOOS=linux go build -o server .

FROM alpine:3.22

WORKDIR /app
COPY --from=builder /app/server .

EXPOSE 3000
CMD ["./server"]