FROM ubuntu:20.04

ENV RUNNER_VERSION=2.297.0

ENV DEBIAN_FRONTEND="nointeractive"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    libicu-dev \
    wget \
    git \
    jq
    
WORKDIR /no-conda-runner

RUN curl -o actions-runner-linux-x64-$RUNNER_VERSION.tar.gz -L https://github.com/actions/runner/releases/download/v$RUNNER_VERSION/actions-runner-linux-x64-$RUNNER_VERSION.tar.gz
RUN tar xzf actions-runner-linux-x64-$RUNNER_VERSION.tar.gz

COPY entrypoint.sh .
COPY get_token.py .
RUN chmod +x entrypoint.sh

RUN adduser ghrunner -uid 1001
RUN chown -R ghrunner:ghrunner /no-conda-runner

USER ghrunner

RUN mkdir /no-conda-runner/artifacts

ENTRYPOINT ["/no-conda-runner/entrypoint.sh"]
