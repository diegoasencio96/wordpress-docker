cms_dev_logs:
    docker-compose logs system_wordpress_cms_dev
db_dev_logs:
    docker-compose logs system_mysql_database_dev
webserver_dev_logs:
    docker-compose logs system_nginx_webserver_dev
ssl_dev_logs:
    docker-compose logs system_certbot_openssl_dev

cms_prod_logs:
    docker-compose logs system_wordpress_cms_prod
db_prod_logs:
    docker-compose logs system_mysql_database_prod
webserver_prod_logs:
    docker-compose logs system_nginx_webserver_prod
ssl_prod_logs:
    docker-compose logs system_certbot_openssl_prod

deploy_dev:
    docker-compose -f docker-compose-dev.yml up -d
recreate_cms_dev:
    docker-compose -f docker-compose-dev.yml up -d --force-recreate --no-deps system_wordpress_cms_prod
recreate_webserver_dev:
    docker-compose -f docker-compose-dev.yml up -d --force-recreate --no-deps system_nginx_webserver_dev
check_cert_dev:
    docker-compose -f docker-compose-dev.yml exec system_nginx_webserver_dev ls -la /etc/letsencrypt/live
renew_cert_dev:
    docker-compose -f docker-compose-dev.yml up --force-recreate --no-deps system_certbot_openssl_dev

deploy_prod:
    docker-compose -f docker-compose-prod.yml up -d
recreate_cms_prod:
    docker-compose -f docker-compose-prod.yml up -d --force-recreate --no-deps system_wordpress_cms_prod
recreate_webserver_prod:
    docker-compose -f docker-compose-prod.yml up -d --force-recreate --no-deps system_nginx_webserver_prod
check_cert_prod:
    docker-compose -f docker-compose-prod.yml exec system_nginx_webserver_prod ls -la /etc/letsencrypt/live
renew_cert_prod:
    docker-compose -f docker-compose-prod.yml up --force-recreate --no-deps system_certbot_openssl_prod