FROM ubuntu:latest

RUN apt-get update && apt-get install -y python3-pip python3-dev python3-setuptools python3-venv git libyaml-dev build-essential
WORKDIR /usr/local/octoprint
RUN pip3 install octoprint
RUN useradd -m -r octoprint
RUN usermod -a -G tty octoprint
RUN usermod -a -G dialout octoprint
USER octoprint

EXPOSE 5000

ENTRYPOINT ["/usr/local/bin/octoprint", "--host", "0.0.0.0"]