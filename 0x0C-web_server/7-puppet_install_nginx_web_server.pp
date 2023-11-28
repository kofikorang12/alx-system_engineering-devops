# Install nginx server
exec {'/usr/bin/env apt-get update':}
exec {'/usr/bin/env apt-get install -y nginx':}
exec {'/usr/bin/env mkdir -p /var/www/kofikorang12/html':}
exec {'/usr/bin/env echo "Hello World!" > /var/www/kofikorang12/html/index.html':}
exec {'/usr/bin/env echo "Ceci n\'est pas une page" > /var/www/kofikorang12/html/custom_404.html':}
exec {'/usr/bin/env echo "server{
    listen 80 default_server;
    listen [::]:80 default_server;
    root /var/www/kofikorang12/html;
    index index.html index.htm;
    server_name kofikorang12.tech;
    rewrite ^/redirect_me$ http://example.com permanent;
    error_page 404 /custom_404.html;
}" > /etc/nginx/sites-available/kofikorang12.tech':}
exec {'/usr/bin/env sudo rm /etc/nginx/sites-enabled/default':}
exec {'/usr/bin/env sudo ln -s /etc/nginx/sites-available/kofikorang12.tech /etc/nginx/sites-enabled/':}
exec {'/usr/bin/env sudo service nginx restart':}
