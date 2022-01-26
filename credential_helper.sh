#!/bin/bash
git config --global credential.helper '!f() { sleep 1; echo "username=${GIT_USER}"; echo "password=${GIT_ACCESS_TOKEN}"; }; f'