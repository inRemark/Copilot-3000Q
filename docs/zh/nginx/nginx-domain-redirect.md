# Nginx域名跳转配置

## http跳转https

要在 `Nginx` 中将 `HTTP` 请求重定向到 `HTTPS`，可以在 `Nginx` 配置文件中添加以下配置：

打开 `Nginx` 配置文件，通常位于 `/etc/nginx/nginx.conf` 或 `/etc/nginx/sites-available/default`。

***配置内容***

```conf
server {
    listen 80;
    server_name yourdomain.com www.yourdomain.com;

    #（第一种）把http的域名请求转成https
    # return 301 https://$host$request_uri;

    #（第二种）强制将http的URL重写成https
    rewrite ^(.*) https://$server_name$1 permanent;
}

server {
    listen 443 ssl;
    server_name yourdomain.com www.yourdomain.com;

    # 这里是你的其他配置，例如 SSL 证书配置
    ssl_certificate /path/to/your/certificate.crt;
    ssl_certificate_key /path/to/your/certificate.key;

    # 其他配置，例如：
    location / {
        try_files $uri $uri/ =404;
    }
}
```

***重新加载配置文件***

```bash
sudo nginx -s reload
```

## `www.domain.com`跳转到`domain.com`的Nginx配置

要在 `Nginx` 中将 `www.domain.com` 重定向到 `domain.com`，你可以使用以下配置：

打开 `Nginx` 配置文件：通常位于 `/etc/nginx/nginx.conf` 或 `/etc/nginx/sites-available/default`。
添加重定向配置：在服务器块中添加重定向规则。

1. 配置内容

```conf
server {
    listen 80;
    server_name www.domain.com;

    return 301 $scheme://domain.com$request_uri;
}

server {
    listen 80;
    server_name domain.com;
    # 这里是你的其他配置，例如：
    root /var/www/domain.com;
    index index.html index.htm;

    location / {
        try_files $uri $uri/ =404;
    }
}
```

***解释***

- 第一个服务器块：监听 `www.domain.com`，并将所有请求重定向到 domain.com，使用 301 永久重定向。
- 第二个服务器块：处理 domain.com 的请求，包含你的网站的其他配置。

***测试配置***

```bash
sudo nginx -t
```

***重新加载 Nginx***

```bash
sudo systemctl reload nginx
```
