FROM oracle/graalvm-ce:20.1.0-java11 as graalvm
RUN gu install native-image

COPY . /home/app/alarmo
WORKDIR /home/app/alarmo

RUN native-image --no-server -cp build/libs/alarmo-*-all.jar

FROM frolvlad/alpine-glibc
RUN apk update && apk add libstdc++
EXPOSE 8080
COPY --from=graalvm /home/app/alarmo/alarmo /app/alarmo
ENTRYPOINT ["/app/alarmo"]
