FROM amd64/buildpack-deps:buster-curl as installer

ARG SENTINEL_VERSION=1.8.8
RUN echo "Downloading Sentinel Dashboard version ${SENTINEL_VERSION}"
RUN set -x \
    && curl -SLv --retry 5 --output /home/sentinel-dashboard.jar https://github.com/alibaba/Sentinel/releases/download/${SENTINEL_VERSION}/sentinel-dashboard-${SENTINEL_VERSION}.jar
FROM openjdk:17-slim

# copy sentinel jar
COPY --from=installer ["/home/sentinel-dashboard.jar", "/home/sentinel-dashboard.jar"]

ENV JAVA_OPTS '-Dserver.port=8080 -Dcsp.sentinel.dashboard.server=localhost:8080'

RUN chmod -R +x /home/sentinel-dashboard.jar

EXPOSE 8080

CMD java ${JAVA_OPTS} -jar /home/sentinel-dashboard.jar

