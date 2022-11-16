FROM nginx:1.22
WORKDIR /usr/share/nginx/html/
COPY . .
ARG PORT_BUILD=80
ENV PORT=$PORT_BUILD
EXPOSE $PORT_BUILD