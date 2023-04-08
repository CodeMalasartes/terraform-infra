#!/bin/bash

apt-get update
apt-get install git -y
sudo apt install python3.8-venv -y
git clone https://github.com/CodeMalasartes/auto-gpt.git /var/www/Auto-GPT
cd /var/www/Auto-GPT
python3 -m venv env
source env/bin/activate
apt-get update
apt-get install nginx -y


pip3 install -r requirements.txt


# Configure Nginx to serve the app
cat > /etc/nginx/sites-available/default <<EOL
server {
    listen 80;
    server_name _;

    location / {
        proxy_pass http://127.0.0.1:5000;
        include /etc/nginx/proxy_params;
        proxy_redirect off;
    }
}
EOL

# Start and enable Nginx service
systemctl start nginx
systemctl enable nginx

# Run the Flask app
export FLASK_APP=scripts.main
export FLASK_ENV=production
flask run --host=127.0.0.1 --port=5000
