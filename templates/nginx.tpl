server {
    listen   80;
    server_name ${:server-name} ${:server-name} ${:other-server-names};

    access_log  ${buildout:directory}/../../logs/${:server-name}_access.log;
    error_log  ${buildout:directory}/../../logs/${:server-name}_error.log;

    gzip            on;
    gzip_min_length 1000;
    gzip_proxied    expired no-cache no-store private auth;
    gzip_types      text/plain application/xml text/css application/x-javascript text/javascript;


    location / {
        proxy_pass  http://unix:${buildout:directory}/gunicorn.sock;
        proxy_redirect              off;
        proxy_set_header            Host $host;
        proxy_set_header            X-Real-IP $remote_addr;
        proxy_set_header            X-Forwarded-For $proxy_add_x_forwarded_for;
        client_max_body_size        200m;
        client_body_buffer_size     128k;
        proxy_connect_timeout       300;
        proxy_send_timeout          90;
        proxy_read_timeout          90;
        proxy_buffer_size           4k;
        proxy_buffers               4 32k;
        proxy_busy_buffers_size     64k;
        proxy_temp_file_write_size  64k;
    }


    location /static  {
        alias ${buildout:directory}/../static;
        expires 8d;

       }

    location /static/js/admin  {
        alias ${buildout:directory}/../static/js/admin;
        expires 0;
        add_header Cache-Control private;
    }


    location /media  {
        alias ${buildout:directory}/../media;
        expires 8d;
       }

    location /robots.txt {
        return 200 "User-agent: *\nDisallow: ";
    }

    error_page   500 502  503 504  /50x.html;
    location =  /50x.html {
        root    html;
      }


}
