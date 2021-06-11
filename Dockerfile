FROM caddy:builder-alpine AS builder

RUN xcaddy build \
    --with github.com/greenpau/caddy-auth-portal@v1.4.6 \
    --with github.com/greenpau/caddy-auth-jwt@v1.2.7 \
    --with github.com/greenpau/caddy-trace@v1.1.6

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
