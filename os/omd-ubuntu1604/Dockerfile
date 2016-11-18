FROM ubuntu:16.04

ENV TZ=Asia/Shanghai
RUN echo ${TZ} | tee /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata
# or use -e TZ='Asia/Shanghai' when docker run
RUN apt-get update && apt-get install -y expect