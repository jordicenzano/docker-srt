# Generate a docker for srt
# by Jordi Cenzano
# VERSION               1.0.0

FROM ubuntu:16.04
MAINTAINER jordi.cenzano@gmail.com

# Update
RUN apt-get update -y

# Upgrade
RUN apt-get upgrade -y

# Install curl
RUN apt-get install curl -y

#I nstall unzip
RUN apt-get install unzip -y

# Install wget
RUN apt-get install wget -y

# Install git
RUN apt-get install git -y

# Prepare docker for SRT
RUN apt-get install tclsh pkg-config cmake libssl-dev build-essential -y

# Compile SRT from sources ----------------
RUN mkdir -p /root/srt_sources && \
  cd /root/srt_sources && \
  git clone --depth 1 https://github.com/Haivision/srt.git && \
  cd /root/srt_sources/srt && \
  ./configure && \
  make

# Clean up
RUN apt-get clean

# Start
ENTRYPOINT ["/root/srt_sources/srt/stransmit"]
