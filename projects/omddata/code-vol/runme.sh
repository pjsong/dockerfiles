#!/usr/bin/env bash
sudo docker rm omddata_code-vol && sudo docker create -v /volumeCode --name omddata_code-vol omddata_code-vol