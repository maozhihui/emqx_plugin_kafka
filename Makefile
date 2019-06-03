PROJECT = emqx_plugin_kafka
PROJECT_DESCRIPTION = EMQ X Kafka plugin
PROJECT_VERSION = 1.0.0

DEPS = ekaf
dep_ekaf = git https://github.com/helpshift/ekaf master


BUILD_DEPS = cuttlefish
dep_cuttlefish = git https://github.com/emqtt/cuttlefish

COVER = true

include erlang.mk

app:: rebar.config

app.config::
	./deps/cuttlefish/cuttlefish -l info -e etc/ -c etc/emqttd_kafka_bridge.conf -i priv/emqttd_kafka_bridge.schema -d data
