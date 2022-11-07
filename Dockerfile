FROM golang:1.16-alpine as builder

WORKDIR /app

COPY ./codeEdu.go /app

RUN go build codeEdu.go

FROM hello-world
WORKDIR /app
COPY --from=builder ./app/codeEdu /app
ENTRYPOINT [ "./codeEdu" ]
