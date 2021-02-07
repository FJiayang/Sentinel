FROM openjdk:8-jdk-alpine3.7

MAINTAINER fjy8018@gmail.com

ENV VERSION 1.8.0

RUN mkdir -p /sentinel

WORKDIR /sentinel

ADD ./sentinel-dashboard/target/sentinel-dashboard.jar ./app-${VERSION}.jar

# 设置时区，默认为UTC
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' > /etc/timezone

CMD java ${PARAM} -jar app-${VERSION}.jar
