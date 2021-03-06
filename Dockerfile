# vim:ft=Dockerfile:
FROM ubuntu:vivid

MAINTAINER "rsys.io"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update && \
    apt-get install -yq --no-install-recommends \
    libzmq3 \
    libyaml-dev \
    libzmq3-dev \
    python3-pip \
    libblas3 \
    libblas-dev \
    libgfortran3 \
    liblapack3 \
    liblapack-dev \
    gfortran \
    libhdf5-dev \
    pkg-config \
    libpng12-dev \
    libfreetype6-dev; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip3 install numpy
RUN pip3 install elasticsearch
RUN pip3 install jsonschema
RUN pip3 install scipy
RUN pip3 install cython
RUN pip3 install numexpr
RUN pip3 install pandas
RUN pip3 install scikit-learn
RUN pip3 install bokeh
RUN pip3 install pyzmq
RUN pip3 install tornado
RUN pip3 install jinja2
RUN pip3 install jupyter
RUN pip3 install matplotlib
RUN pip3 install seaborn

ADD run.sh /
RUN chmod +x /run.sh

WORKDIR /srv

VOLUME /srv
EXPOSE 8888

# You can mount your own SSL certs as necessary here
ENV PEM_FILE /tmp/key.pem
# $PASSWORD will get `unset` within notebook.sh, turned into an IPython style hash
ENV PASSWORD Dont make this your default

ENV USE_HTTP 0

# Default command to run
CMD ["/run.sh"]
