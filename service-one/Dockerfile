FROM openjdk:8u292
## based on Debian
RUN sed -i 's#http://deb.debian.org#http://mirrors.tuna.tsinghua.edu.cn#g' /etc/apt/sources.list \
    && sed -i 's#http://security.debian.org#http://mirrors.tuna.tsinghua.edu.cn#g' /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y net-tools \
    && rm -rf /var/lib/apt/lists/*
RUN cp "/usr/share/zoneinfo/Asia/Shanghai" "/etc/localtime"
ARG env=prd
ARG app=service-one
ENV LEMON_ENV=${env} TZ=CST-8 TIME_ZONE=Asia/Shanghai APP=${app}
COPY target/*.jar /app/${APP}/
COPY shell/* /app/${APP}/bin/
WORKDIR "/app/${APP}"
CMD ["bin/start.sh"]
EXPOSE 10010