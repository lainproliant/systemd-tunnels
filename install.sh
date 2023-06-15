#!/bin/bash
#
# install.sh
#
# Author: Lain Musgrove (lain.proliant@gmail.com)
# Date: Thursday June 15, 2023
#
# Distributed under terms of the MIT license.
#


sudo cp *.service /etc/systemd/system/
echo "Service files copied, running daemon-reload..."
sudo systemctl daemon-reload
echo "Done."
