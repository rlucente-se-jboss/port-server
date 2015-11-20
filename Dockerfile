FROM fedora:22

MAINTAINER Rich Lucente <rlucente@redhat.com>

LABEL vendor="Red Hat"
LABEL version="0.1"
LABEL description="Test port connectivity"

# Add the needed packages for netcat
RUN    dnf -y update \
    && dnf -y install \
           net-tools \
           nmap-ncat \
    && dnf -y clean all

EXPOSE 5901

USER 1000

CMD /bin/nc -l 5901 >> /tmp/nc-server.out

