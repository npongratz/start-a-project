# perl-app
#
# VERSION      0.0.1

FROM pinterb/ubuntu-perl-dev:0.0.1

MAINTAINER Brad Pinter brad.pinter@gmail.com

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

## run.sh (command line options)
ENV APP_ROOT /srv/www
ENV APP_FILE helloworld.pl
ENV PERL_CARTON_PATH /srv/www/app/local

RUN mkdir -p /srv/www
Add . /srv/www/

RUN cd /srv/www/app/ && \
 ~/.plenv/bin/plenv local $PERL_STABLE && \
 carton install

VOLUME ["/srv/www/app"]

WORKDIR /srv/www/app

### define default command.
CMD ["/srv/www/run.sh"]
