#!/usr/bin/env bash

# Erzeugt (einmalig, persistent) ein zufälliges MQTT-Passwort für das Backend,
# falls noch keines existiert. Wird in $APP_DATA_DIR/data/mqtt_password abgelegt,
# damit es Neustarts und Updates übersteht.

MQTT_PASSWORD_FILE="${APP_DATA_DIR}/data/mqtt_password"

if [[ ! -f "${MQTT_PASSWORD_FILE}" ]]; then
  mkdir -p "$(dirname "${MQTT_PASSWORD_FILE}")"
  openssl rand -hex 16 > "${MQTT_PASSWORD_FILE}"
fi

export APP_AUTOCURTAIN_MQTT_USERNAME="vorhang_backend"
export APP_AUTOCURTAIN_MQTT_PASSWORD="$(cat "${MQTT_PASSWORD_FILE}")"
