#!/bin/bash

rsync --update --delete --recursive --links --times /etc/nginx .
