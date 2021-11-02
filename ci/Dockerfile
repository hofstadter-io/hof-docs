FROM nginx:stable

COPY ./ci/nginx.conf /etc/nginx/nginx.conf
COPY ./ci/server.conf /etc/nginx/conf.d/default.conf
COPY dist /usr/share/nginx/html
