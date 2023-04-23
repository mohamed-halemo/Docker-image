
FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Africa/Egypt

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# Install required packages
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    fsl

# Set environment variable for FSL
ENV FSLDIR=/usr/share/fsl/5.0
ENV PATH=$PATH:$FSLDIR/bin

# Copy requirements.txt to the container and install Python packages
COPY requirements.txt .
RUN pip3 install -r requirements.txt

