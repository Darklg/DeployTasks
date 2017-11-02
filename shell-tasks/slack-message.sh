#!/bin/bash

cd "${DEPLOYTASKS__PROJECT_DIR}";

# Use App "Incoming Webhooks on Slack" to set hook URL & Channel.

echo '########################################';
echo 'ALERT ON SLACK';
echo '########################################';

if [ -z "${DEPLOYTASKS__SLACKMSG__ICONEMOJI+x}" ]; then
    DEPLOYTASKS__SLACKMSG__ICONEMOJI=":loudspeaker:";
fi;
if [ -z "${DEPLOYTASKS__SLACKMSG__USER+x}" ]; then
    DEPLOYTASKS__SLACKMSG__USER="DeployBot";
fi;
if [ -z "${DEPLOYTASKS__SLACKMSG__MESSAGE+x}" ]; then
    DEPLOYTASKS__SLACKMSG__MESSAGE='A deploy has been launched.';
fi;
if [ -z "${DEPLOYTASKS__SLACKMSG__CHANNEL+x}" ]; then
    DEPLOYTASKS__SLACKMSG__CHANNEL="#general";
fi;
if [ -z "${DEPLOYTASKS__SLACKMSG__HOOKURL+x}" ]; then
    echo '- ERROR : NO HOOK URL AVAILABLE!';
    exit 0;
fi;

curl -s -X POST --data-urlencode "payload={\"channel\": \"${DEPLOYTASKS__SLACKMSG__CHANNEL}\", \"username\": \"${DEPLOYTASKS__SLACKMSG__USER}\", \"text\": \"${DEPLOYTASKS__SLACKMSG__MESSAGE}\", \"icon_emoji\": \"${DEPLOYTASKS__SLACKMSG__ICONEMOJI}\"}" ${DEPLOYTASKS__SLACKMSG__HOOKURL} > /dev/null
