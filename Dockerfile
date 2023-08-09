FROM nginx:latest
WORKDIR /data

RUN mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/backup
COPY sphfs.conf /etc/nginx/conf.d
COPY index.html project.json vm.js /data/
COPY assets/* .

ARG PORT_BUILD=8080
ENV PORT=$PORT_BUILD
EXPOSE $PORT_BUILD