FROM torz/base

MAINTAINER "rsys.io"

RUN apt-get -qq update && \
    apt-get install -y python3-pip \
                       libblas3 \
                       libblas-dev \
                       libgfortran3 \
                       liblapack3 \
                       liblapack-dev \
                       gfortran \
                       libhdf5-dev

RUN pip3 install numpy
RUN pip3 install scipy
RUN pip3 install cython
RUN pip3 install numexpr
RUN pip3 install pandas
RUN pip3 install tables
RUN pip3 install scikit-learn
RUN pip3 install bokeh

# install matplotlib ------------------------------------
RUN apt-get -qq update && \
    apt-get install -y pkg-config \
                       libpng12-dev \
                       libfreetype6-dev
RUN pip3 install matplotlib

# might make the image smaller
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /srv
