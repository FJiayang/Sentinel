FROM amd64/buildpack-deps:buster-curl as installer

RUN set -x \
    && curl -SLv --retry 5 --output /home/sentinel-dashboard.jar https://github.com/alibaba/Sentinel/releases/download/1.8.8/sentinel-dashboard-1.8.8.jar
FROM openjdk:17-slim

# copy sentinel jar
COPY --from=installer ["/home/sentinel-dashboard.jar", "/home/sentinel-dashboard.jar"]

ENV JAVA_OPTS '-Dserver.port=8080 -Dcsp.sentinel.dashboard.server=localhost:8080'

RUN chmod -R +x /home/sentinel-dashboard.jar

EXPOSE 8080

CMD java ${JAVA_OPTS} -jar /home/sentinel-dashboard.jar

