#!/bin/bash
# Configure nginx
cat > /etc/nginx/sites-available/default << 'EOF'
server {
    listen 80;
    server_name _;

    root /var/www/html;
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }
}
EOF

# Restart nginx
systemctl restart nginx

# Set proper permissions
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html
