FROM golang:1.17 as builder
WORKDIR /app
COPY go.mod .
COPY go.sum .
COPY *.go .
RUN GOOS=linux CGO_ENABLED=0 go build -o ./app .

FROM alpine
WORKDIR /app
COPY --from=builder /app/app .
EXPOSE 8080
CMD ["/app/app"]
