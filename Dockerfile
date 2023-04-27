FROM httpd:2.4 
ADD /docker-entrypoint.sh /
ADD /docker-entrypoint.d/* /docker-entrypoint.d/
RUN apt update && \
    apt-get -y install fortune fortunes cowsay cowsay-off && \
    rm -rf /var/lib/apt/lists/ && \
    chmod +x /docker-entrypoint.sh && \
    chmod +x /docker-entrypoint.d/kino.sh && \
    rm /usr/local/apache2/htdocs/index.html
EXPOSE 80
ENTRYPOINT ["/docker-entrypoint.sh", "apachectl"]
CMD ["-DFOREGROUND"]
