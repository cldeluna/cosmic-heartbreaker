# Latest Ubuntu LTS 18 Cosmic Cuttlefish
# 18.10, cosmic-20190131, cosmic, rolling (cosmic/Dockerfile)
# Python 2.7, Python 3.6, Ansible 2.6, Nornir 2.0
# Ansible 2.6 Heartbreaker
# https://github.com/ansible/ansible/blob/stable-2.6/changelogs/CHANGELOG-v2.6.rst

FROM ubuntu:18.10

MAINTAINER Claudia de Luna <claudia@indigowire.net>


RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get install -y python-yaml python-jinja2 python-httplib2 python-keyczar python-paramiko python-setuptools python-pkg-resources git python-pip

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get install -y build-essential libssl-dev libffi-dev python3-dev && \
    apt-get install -y python3-pip python3-venv python3-setuptools && \
    apt-get install -y python3-yaml python3-jinja2 python3-httplib2

RUN apt-get install -yq software-properties-common && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update -q && \
    apt-get install -yq ansible=2.6*

RUN apt-get install -y tree && \
    apt-get install -y nano && \
    apt-get install -y git && \
    apt-get install -y wget && \
    apt-get install -y vim && \
    apt-get install -y traceroute && \
    apt-get install -y iputils-ping && \
    apt-get install -y snmp && \
    apt-get install -y snmp-mibs-downloader

RUN pip3 install --upgrade pip
RUN pip install --upgrade pip

RUN pip3 install argparse && \
        pip3 install requests && \
        pip3 install nornir && \
        pip3 install textfsm && \
        pip3 install openpyxl && \
        pip3 install ciscoconfparse && \
        pip3 install netmiko && \
        pip3 install xlrd

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*


VOLUME /ansible

WORKDIR /ansible

RUN git clone https://github.com/cldeluna/ansible2_4_base.git
RUN git clone https://github.com/cldeluna/cisco_aci.git
RUN git clone https://github.com/cldeluna/cisco_ios.git
