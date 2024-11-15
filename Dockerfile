FROM rabbitmq:3.8.0-management

COPY rabbitmq.conf /etc/rabbitmq/

WORKDIR /plugins
RUN apt-get update && apt-get install -y wget && apt-get install -y mc
RUN wget https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/v3.8.0/rabbitmq_delayed_message_exchange-3.8.0.ez

ENV RABBITMQ_NODENAME=rabbit@localhost

RUN chown rabbitmq:rabbitmq /etc/rabbitmq/rabbitmq.conf

USER rabbitmq:rabbitmq

RUN rabbitmq-plugins enable rabbitmq_delayed_message_exchange