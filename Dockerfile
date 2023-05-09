FROM golang:1.19-alpine AS builder

WORKDIR /app

COPY . .

RUN go build -o /main

FROM scratch

WORKDIR /
COPY --from=builder /main /main

ENTRYPOINT ["/main"]