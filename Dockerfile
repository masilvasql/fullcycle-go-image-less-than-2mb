FROM golang:1.19 as builder

WORKDIR /usr/src/app

COPY . .

RUN go build ./main.go

FROM scratch

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/main .

CMD ["./main"]