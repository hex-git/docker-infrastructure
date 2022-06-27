FROM arm64v8/ubuntu:20.04

ENV RUNNER_VERSION=2.294.0
ENV MINICONDA_VERSION="py37_4.12.0"

ENV DEBIAN_FRONTEND="nointeractive"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    libicu-dev \
    wget \
    git \
    jq
    
WORKDIR /base-runner

RUN curl -o actions-runner-linux-arm64-$RUNNER_VERSION.tar.gz -L https://github.com/actions/runner/releases/download/v$RUNNER_VERSION/actions-runner-linux-arm64-$RUNNER_VERSION.tar.gz
RUN curl -o Miniconda3-$MINICONDA_VERSION-Linux-aarch64.sh -L https://repo.anaconda.com/miniconda/Miniconda3-$MINICONDA_VERSION-Linux-aarch64.sh

RUN tar xzf actions-runner-linux-arm64-$RUNNER_VERSION.tar.gz
RUN bash Miniconda3-$MINICONDA_VERSION-Linux-aarch64.sh -b -p ./miniconda3

ENV CONDA="/base-runner/miniconda3"

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

RUN adduser ghrunner -uid 1001
RUN chown -R ghrunner:ghrunner /base-runner

USER ghrunner

RUN mkdir /base-runner/artifacts
RUN $CONDA/bin/conda init

ENTRYPOINT ["/base-runner/entrypoint.sh"]
