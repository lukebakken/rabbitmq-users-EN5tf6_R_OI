RABBITMQCTL ?= /usr/sbin/rabbitmqctl

rabbitmqadmin:
	curl -LO https://raw.githubusercontent.com/rabbitmq/rabbitmq-server/master/deps/rabbitmq_management/bin/rabbitmqadmin
	chmod 755 $(CURDIR)/rabbitmqadmin

repro: rabbitmqadmin
	$(RABBITMQCTL) set_policy my-policy "my-queue" '{"dead-letter-exchange":"my-exchange","dead-letter-routing-key":"my-queue-dl","message-ttl": 1200000}' --apply-to queues
	$(CURDIR)/rabbitmqadmin declare queue name=my-queue
