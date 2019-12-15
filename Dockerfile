FROM busybox:latest
LABEL maintainer="Dave Akers <dave@dazoe.net>"

ADD https://www.mumble.info/downloads/linux-static-server /opt/murmur-static_x86.tar.bz2

RUN adduser -Sh /data murmur && \
    bzcat /opt/murmur-static_x86.tar.bz2 | tar -x -C /opt -f - && \
    rm /opt/murmur-static_x86.tar.bz2 && \
    mv /opt/murmur-static_x86-* /opt/murmur

COPY murmur.ini /data/murmur.ini

EXPOSE 64738/tcp 64738/udp

VOLUME [ "/data" ]

CMD ["/opt/murmur/murmur.x86", "-fg", "-v", "-ini", "/data/murmur.ini"]
