# cdw/py-app
#
# VERSION      0.0.1

FROM pinterb/ubuntu-python-dev:0.0.1

MAINTAINER Brad Pinter brad.pinter@gmail.com

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

## run.sh (command line options)
ENV APP_ROOT /opt/falcon
ENV APP_PORT 8080
ENV APP_FILE helloworld.py
ENV APP_CALLABLE app

Add . /opt/falcon/

RUN pip install -r /opt/falcon/app/requirements.txt

VOLUME ["/opt/falcon/app"]
EXPOSE 8080

### define default command.
CMD ["/opt/falcon/run.sh"]
