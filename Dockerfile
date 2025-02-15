FROM openjdk:17-slim

# 使用LABEL替换MAINTAINER
LABEL maintainer="fjy8018@gmail.com"

# 更新环境变量格式
ENV PARAM="" \
    VERSION=1.8.8

RUN mkdir -p /sentinel
RUN ls
WORKDIR /sentinel
RUN ls
ADD ./sentinel-dashboard/target/sentinel-dashboard.jar ./app-${VERSION}.jar

# 设置时区，默认为UTC
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' > /etc/timezone

ENTRYPOINT ["java", "${PARAM}", "-jar", "app-${VERSION}.jar"]