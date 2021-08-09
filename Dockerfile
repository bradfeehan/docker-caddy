FROM caddy:builder-alpine AS builder

RUN xcaddy build \
    --with github.com/greenpau/caddy-auth-portal@v1.4.18 \
    --with github.com/greenpau/caddy-auth-jwt@v1.3.14 \
    --with github.com/greenpau/caddy-trace@v1.1.7

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
