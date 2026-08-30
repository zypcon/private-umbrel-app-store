#!/usr/bin/env bash

# Fallback: Falls APP_DATA_DIR nicht von umbreld gesetzt wird, selbst berechnen
# (folgt Umbrels Standard-Konvention: ${UMBREL_ROOT}/app-data/${APP_ID})
: "${APP_DATA_DIR:=${SCRIPT_UMBREL_ROOT}/app-data/private-store-autocurtain}"

MQTT_PASSWORD_FILE="${APP_DATA_DIR}/data/mqtt_password"

if [[ ! -f "${MQTT_PASSWORD_FILE}" ]]; then
  mkdir -p "$(dirname "${MQTT_PASSWORD_FILE}")"
  openssl rand -hex 16 > "${MQTT_PASSWORD_FILE}"
fi

export APP_AUTOCURTAIN_MQTT_USERNAME="vorhang_backend"
export APP_AUTOCURTAIN_MQTT_PASSWORD="$(cat "${MQTT_PASSWORD_FILE}")"