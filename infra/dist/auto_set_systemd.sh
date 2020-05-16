#!/bin/bash

sudo cp app.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable app.service

