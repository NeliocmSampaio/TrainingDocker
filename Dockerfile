# syntax=docker/dockerfile:1

FROM alpine:3.14 as build
RUN apk add --update --no-cache tzdata go

RUN wget https://golang.org/dl/go1.17.2.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.17.2.linux-amd64.tar.gz
RUN export PATH=$PATH:/usr/local/go/bin
RUN go version

WORKDIR /app

COPY *.go ./

RUN go mod init example.com/getting-started-go
RUN go mod tidy

RUN go build -o ./runnable ./main.go

RUN ls -l
CMD [ "./runnable" ]