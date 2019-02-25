FROM fedora:28
#
# https://github.com/hamano/apache-mod-markdown
#

RUN dnf -y install httpd libmarkdown procps-ng

COPY mod_markdown.so /usr/lib64/httpd/modules/mod_markdown.so
COPY httpd.conf /etc/httpd/conf/httpd.conf

RUN ln -s /dev/stdout /var/log/httpd/access_log && \
    ln -s /dev/stderr /var/log/httpd/error_log
EXPOSE 80
VOLUME /usr/local/apache2/htdocs/

CMD /usr/sbin/httpd;tail -f /dev/stderr
