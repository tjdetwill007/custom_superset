#!/usr/bin/env bash
#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
set -e
function show_waiting_animation() {
    local delay=7 # Delay in seconds between dots
    local iterations=2 # Number of iterations for the animation

    echo -n "Waiting"
    for ((i = 0; i < $iterations; i++)); do
        sleep $delay
        echo -n "."
    done
    echo " Done!"
}

# Call the function to display the waiting animation
show_waiting_animation

# Packages needed for puppeteer:
apt update
apt install -y chromium

chmod -R 777 /root
cd /app/superset-frontend
rm -rf node_modules

npm install -f --no-optional --global webpack webpack-cli
npm install

echo "Running frontend"
npm run dev
