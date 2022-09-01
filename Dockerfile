FROM golang:1.18.5-alpine AS builder

WORKDIR /app

COPY go.* ./
RUN go mod download

COPY *.go ./
RUN go build -o /go-hello

FROM scratch
WORKDIR /
COPY --from=builder /go-hello /go-hello

ENTRYPOINT ["/go-hello"]

