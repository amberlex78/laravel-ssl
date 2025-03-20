#!/bin/bash

set -x

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $(dirname $0)/cert/laravel-ssl.test.key -out $(dirname $0)/cert/laravel-ssl.test.crt -subj "/CN=laravel-ssl.test"

# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout cert/laravel-ssl.test.key -out cert/laravel-ssl.test.crt -subj "/CN=laravel-ssl.test"
