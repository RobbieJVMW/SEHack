FROM webdevops/php-nginx 
COPY . /app/



docker build . -t jimmythesai/webserver:latest 
docker push jimmythesai/webserver:latest 


ENV dbserver=temperature.clmv89mfjqjm.eu-west-1.rds.amazonaws.com:3306
ENV dbuser=hackathon
ENV dbpass=hackathon123
ENV dbname=hackathon