COMPONENT ?="php-fpm-apache-mysql-https"
DOCKER_COMPOSE := ops/docker/docker-compose.yml
CODE_CONTAINER := docker-php-fpm-1

ps: status
restart: nodev dev
status:
	@docker-compose -p ${COMPONENT} -f ${DOCKER_COMPOSE} ps

dev:
	@docker-compose -p ${COMPONENT} -f ${DOCKER_COMPOSE} up -d --build

kill:
	@docker-compose -p ${COMPONENT} -f ${DOCKER_COMPOSE} kill

nodev:
	@docker-compose -p ${COMPONENT} -f ${DOCKER_COMPOSE} kill
	@docker-compose -p ${COMPONENT} -f ${DOCKER_COMPOSE} rm -f

log: logs
logs:
	@docker-compose -p ${COMPONENT} -f ${DOCKER_COMPOSE} logs -f ${CODE_CONTAINER}

errors:
	@docker-compose -p ${COMPONENT} -f ${DOCKER_COMPOSE} logs -f ${CODE_CONTAINER} | grep --color=always -E 'ERROR|CRITICAL'

enter:
	@./ops/scripts/docker-enter.sh ${COMPONENT}


docker-destroy-everything:
	@docker system prune -a --volumes