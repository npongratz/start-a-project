## Sample Python project

This project is designed to get you started writing a [microservice](http://martinfowler.com/articles/microservices.html) using
the [Python](https://www.python.org/) programming language.  This project uses the [Falcon](http://falconframework.org/) framework to implement a very
simple end point.

Perhaps more importantly, this project uses [Docker](http://www.docker.com/) to run this web service in a Linux containter.  To
learn more about Docker you should read this [introduction](http://www.docker.com/whatisdocker/).  And more detailed documentation
can be found [here](http://docs.docker.com/).

### Instructions


docker run -it -p 8080:8080 -v /home/pinter/projects/github/start-a-project/microservices/perl/mojo:/srv/www:rw perl-app:0.0.1
