FROM ubuntu:16.04

RUN mkdir /logs
RUN apt-get update --yes >>/logs/ubuntu-update.log
RUN apt-get upgrade --yes >>/logs/ubuntu-upgrade.log
