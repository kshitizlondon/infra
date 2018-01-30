FROM nginx:stable
RUN rm /etc/nginx/conf.d/default.conf
COPY sonar.conf /etc/nginx/conf.d
COPY nexus.conf /etc/nginx/conf.d
COPY jenkins-infrastructure.conf /etc/nginx/conf.d
COPY gitlab.conf /etc/nginx/conf.d
COPY apache2.conf /etc/nginx/conf.d
COPY daweco-public-reverseproxy.conf /etc/nginx/conf.d
RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/
