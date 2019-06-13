FROM ubuntu:18.04

RUN apt-get update && \
  apt-get install -y software-properties-common

RUN apt-get update && apt-get install -y gnupg2 apt-utils

# see https://jevois.usc.edu/
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys DD24C027
RUN add-apt-repository "deb https://jevois.usc.edu/apt bionic main"
RUN apt-get update && \
   apt-get upgrade -y && \
   apt-get autoremove && \
   apt-get install -y jevois-sdk-dev && \
   apt-get purge modemmanager && \ 
   apt-get install -y jevois-inventor 

CMD ["echo", "this looks like docker"]