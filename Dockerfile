FROM golang AS builder

WORKDIR /gochallenge

COPY gochallenge.go .

RUN go mod init gochallenge
RUN go build -ldflags "-s"

FROM scratch

WORKDIR /gochallenge

COPY --from=builder /gochallenge/gochallenge .

ENTRYPOINT ["./gochallenge" ]
