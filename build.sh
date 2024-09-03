#!/bin/bash

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py

# 安装 MkDocs 及其依赖项
pip install -r requirements.txt

mkdocs build -d site