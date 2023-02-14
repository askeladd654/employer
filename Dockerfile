FROM anasty17/mltb:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
RUN apt update;apt install -yy apache2;sed -i 's/Listen 80/Listen 10000/' /etc/apache2/ports.conf

COPY . .

CMD ["bash", "start.sh"]
