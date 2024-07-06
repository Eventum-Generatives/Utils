EVENTUM_STUDIO_PATH=$(which eventum-studio)

if [ ! -z "${EVENTUM_STUDIO_PATH}" ]; then
    SERVICE_CONTENT="\
[Unit]
Description=Eventum Studio web application
After=network.target

[Service]
Type=simple
ExecStart=${EVENTUM_STUDIO_PATH}
Restart=on-failure
RestartSec=3

[Install]
WantedBy=default.target
"   
    echo "${SERVICE_CONTENT}" | sudo tee /etc/systemd/system/eventum-studio.service
else
    echo "Could not found installed eventum-studio"
    exit 1
fi
