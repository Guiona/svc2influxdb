#!/bin/bash
set -e

USER_NAME="svc2influxdb"
HOME_DIR="/opt/${USER_NAME}"
SCRIPT_DIRECTORY=$(dirname ${0})
FILE_LIST="${SCRIPT_DIRECTORY}/requirements.txt ${SCRIPT_DIRECTORY}/setup_venv.sh ${SCRIPT_DIRECTORY}/svc2influxdb.conf ${SCRIPT_DIRECTORY}/svc2influxdb.py"

echo ""
echo "Create User : ${USER_NAME}"
useradd -c "svc2influxdb Collector" -m -r -U -d ${HOME_DIR} -s /bin/bash ${USER_NAME}

echo ""
echo "Copy files to \"${HOME_DIR}\""
cp -p ${FILE_LIST} ${HOME_DIR}
chown -R ${USER_NAME}.${USER_NAME} ${HOME_DIR}
ls -l ${HOME_DIR}

echo ""
echo "Systemd service file"
cp -p ${SCRIPT_DIRECTORY}/share/svc2influxdb.service /usr/lib/systemd/system/
