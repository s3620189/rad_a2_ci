#!/bin/bash

cd ~/app/dist

sudo ./TechTestApp updatedb -s
sudo ./TechTestApp serve
