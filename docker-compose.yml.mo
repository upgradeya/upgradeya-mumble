murmur:
  image: luzifer/mumble
  ports:
    - "64738:64738"
    - "64738:64738/udp"
  log_driver: {{PROJECT_DOCKER_LOG_DRIVER}}
  volumes:
    - nginx_proxy_certs:/etc/nginx/certs:ro
    - {{PROJECT_NAMESPACE}}_murmur_data:/data
    - {{PROJECT_NAMESPACE}}_murmur_config:/config
nginx:
  build: containers/nginx
  environment:
    - VIRTUAL_HOST={{PROJECT_NGINX_PROXY_VIRTUAL_HOSTS}}
{{#PROJECT_LETSENCRYPT}}
    - LETSENCRYPT_HOST={{PROJECT_NGINX_PROXY_VIRTUAL_HOSTS}}
    - LETSENCRYPT_EMAIL={{PROJECT_LETSENCRYPT_EMAIL}}
{{/PROJECT_LETSENCRYPT}}
  log_driver: {{PROJECT_DOCKER_LOG_DRIVER}}

# vi: set tabstop=2 expandtab syntax=yaml:
