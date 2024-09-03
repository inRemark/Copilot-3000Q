#!/bin/bash

# 安装 Python 和 pip
# apt-get update
# apt-get install -y python3 python3-pip

# 安装 MkDocs 及其依赖项
# pip3 install -r requirements.txt
pip3 install mkdocs
pip3 install mkdocs-material
pip3 install mkdocs-static-i18n

# 构建 MkDocs 项目
mkdocs build -d site