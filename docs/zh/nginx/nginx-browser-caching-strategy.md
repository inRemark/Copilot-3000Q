# Nginx控制浏览器缓存策略

在 `Nginx` 中，你可以通过配置响应头来控制浏览器缓存。常用的方法是使用
`expires`指令和 `add_header` 指令来设置缓存策略。

## 基本配置

1.设置缓存过期时间： 使用 `expires` 指令来设置资源的缓存过期时间。

```conf
server {
    listen 80;
    server_name example.com;
    location / {
        root /path/to/your/site;
        expires 30d;  # 设置缓存过期时间为30天
    }
}
```

2.添加缓存控制头： 使用 `add_header` 指令来添加 `Cache-Control` 头，以更
精细地控制缓存行为。

```conf
server {
    listen 80;
    server_name example.com;
    location / {
        root /path/to/your/site;
        expires 30d;
        # 设置缓存控制头，max-age为30天（2592000秒）
        add_header Cache-Control "public, max-age=2592000";  
    }
}
```

## 禁用缓存

禁用某些资源的缓存，可以设置 `expires` 为 -1 或 0，并设置 `Cache-Control`
为 `no-cache` 或 `no-store`

```conf
server {
    listen 80;
    server_name example.com;
    # ...
    # 禁用缓存
    location ~* \.(php|html)$ {
        expires -1;
        add_header Cache-Control "no-store, no-cache, must-revalidate, 
        proxy-revalidate, max-age=0";
    }
}
```

## 针对不同类型的文件设置缓存

你可以根据文件类型设置不同的缓存策略

```conf
server {
    listen 80;
    server_name example.com;
    # ...
    # 对图像文件设置较长的缓存时间
    location ~* \.(jpg|jpeg|png|gif|ico|css|js)$ {
        expires 30d;
        add_header Cache-Control "public, max-age=2592000";
    }
    # 对 HTML 文件设置较短的缓存时间
    location ~* \.(html)$ {
        expires 1h;
        add_header Cache-Control "public, max-age=3600";
    }
}
```
