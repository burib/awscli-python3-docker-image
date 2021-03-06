FROM amazon/aws-cli:latest
ARG PYTHON_VERSION=3.9.10
ENV PYTHON_VERSION=${PYTHON_VERSION}
RUN aws --version %% \
    yum update && \
    yum install -y bash curl jq git file tar hub gcc glibc glibc-common gd gd-devel make openssl-devel bzip2-devel libffi-devel && \
    yum clean all

RUN curl https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz -o /tmp/Python-$PYTHON_VERSION.tgz
WORKDIR /tmp
RUN tar -zxvf /tmp/Python-$PYTHON_VERSION.tgz \
    && mkdir /usr/share/$PYTHON_VERSION \
    && mv /tmp/Python-$PYTHON_VERSION/* /usr/share/$PYTHON_VERSION \
    && rm -f /tmp/Python-$PYTHON_VERSION.tgz

WORKDIR /usr/share/$PYTHON_VERSION
RUN ./configure --enable-optimizations \
    && make altinstall \
    && ln -s /usr/share/$PYTHON_VERSION/python /usr/bin/$PYTHON_VERSION \
    && /usr/share/$PYTHON_VERSION/python -m pip install -U pip

RUN update-alternatives --verbose --install /usr/bin/python python /usr/bin/$PYTHON_VERSION 1
RUN update-alternatives --verbose --install /usr/bin/pip pip /usr/bin/pip3 1

SHELL ["/bin/bash"]
ENTRYPOINT ["/bin/bash", "-c"]
