#!/bin/bash

# 安装 Python 和 pip
# apt-get update
# apt-get install -y python3 python3-pip

# 安装 MkDocs 及其依赖项
pip3 install -r requirements.txt

# 构建 MkDocs 项目
mkdocs build -d site