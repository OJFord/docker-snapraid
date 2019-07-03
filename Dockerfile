FROM alpine:latest AS builder
ENV SNAPRAID_VERSION 11.3

RUN apk add autoconf automake gcc git libc-dev make
RUN git clone https://github.com/amadvance/snapraid
WORKDIR snapraid

RUN git checkout "v$SNAPRAID_VERSION"
RUN autoreconf -i && ./configure && make
RUN mv snapraid /bin/snapraid

FROM alpine:latest

COPY --from=builder /bin/snapraid /usr/local/bin/snapraid

COPY enter.sh enter.sh

RUN adduser -D -u1000 sruser
USER sruser

ENTRYPOINT ["./enter.sh"]
