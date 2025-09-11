FROM valian/docker-nginx-auto-ssl

COPY nginx.custom.conf /etc/nginx/conf.d
