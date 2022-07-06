FROM golang:alpine AS build

MAINTAINER Bruno Mota <bruno91.m@gmail.com>

WORKDIR /go/src

COPY . .

RUN CGO_ENABLED=0
RUN go build -o /src main.go

FROM scratch

COPY --from=build /src /src

CMD ["/src"]