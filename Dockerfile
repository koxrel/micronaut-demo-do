FROM gradle:7-jdk11-hotspot as build
WORKDIR /app
COPY . .
RUN gradle installShadowDist

FROM ghcr.io/graalvm/graalvm-ce:java11-21.1.0
WORKDIR /app
COPY --from=build /app/build/install/micronaut-demo-do-shadow .
ENTRYPOINT ["./bin/micronaut-demo-do"]
EXPOSE 8080
