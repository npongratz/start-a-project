# google-app
#
# VERSION      0.0.1

#FROM pinterb/ubuntu-golang-dev:0.0.1
FROM progrium/busybox

MAINTAINER Brad Pinter brad.pinter@gmail.com

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

## run.sh (command line options)
ENV APP_ROOT /opt/gopher
ENV APP_PORT 8080
ENV APP_FILE helloworld.py
ENV APP_CALLABLE app

Add . /opt/gopher/

##RUN pip install -r /opt/falcon/app/requirements.txt

VOLUME ["/opt/gopher/app"]

### define default command.
###CMD ["/opt/gopher/run.sh"]
CMD ["/bin/sh"]
