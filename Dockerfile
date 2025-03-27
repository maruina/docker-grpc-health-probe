FROM alpine:3.21 as builder
ENV GRPC_HEALTH_PROBE_VERSION=v0.4.34
RUN wget -qO/bin/grpc_health_probe https://github.com/grpc-ecosystem/grpc-health-probe/releases/download/${GRPC_HEALTH_PROBE_VERSION}/grpc_health_probe-linux-amd64 && \
    chmod +x /bin/grpc_health_probe

FROM gcr.io/distroless/base-debian12
COPY --from=builder /bin/grpc_health_probe /bin/grpc_health_probe
ENTRYPOINT [ "/bin/grpc_health_probe"]
