FROM chimeralinux/chimera as builder

RUN apk --no-cache update && apk --no-cache upgrade
RUN apk add git cargo

WORKDIR /var/build
RUN git clone --depth 1 https://github.com/syobocat/plegosa.git
RUN cd plegosa && cargo build --release


FROM chimeralinux/chimera

RUN apk --no-cache update && apk --no-cache upgrade && apk add --no-cache ca-certificates

COPY --from=builder --chown=root /var/build/plegosa/target/release/plegosa /var/app/plegosa

USER 587

ENV PLEGOSA_CONFIG=/var/app/config.toml
CMD ["/var/app/plegosa"]