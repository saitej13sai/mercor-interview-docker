FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

# Basic system packages
RUN apt update && apt install -y \
    software-properties-common \
    wget \
    git \
    build-essential \
    libffi-dev \
    python3 \
    python3-pip \
    python-is-python3 \
    jq \
    curl \
    locales \
    locales-all \
    tzdata \
    nano \
    neovim \
    && rm -rf /var/lib/apt/lists/*

# Install Conda
RUN wget "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-$(arch).sh" -O miniconda.sh \
    && bash miniconda.sh -b -p /opt/miniconda3 \
    && rm miniconda.sh
ENV PATH="/opt/miniconda3/bin:$PATH"

# Set up conda
RUN conda init --all
RUN conda config --append channels conda-forge

# Create a conda environment with Python 3.7 and required packages
RUN conda create -n testbed python=3.7 -y \
    && conda run -n testbed conda install -y \
        pytest=5.0 \
        hypothesis \
        six \
        setuptools \
        wheel

# Add non-root user (if needed)
RUN adduser --disabled-password --gecos 'interviewer' nonroot

# Set working directory
WORKDIR /Mercor_Interview

# Required for Mercor's Git safe directory policy
RUN git config --global --add safe.directory /Mercor_Interview
