
# CasaOS Dockerfile
FROM ubuntu:20.04

# CasaOS yükleme komutları
RUN apt-get update && \
    apt-get install -y curl sudo && \
    curl -fsSL https://get.casaos.io | sudo bash

# Python uygulamasını kopyala
COPY . /app

# Çalışma dizinine geç
WORKDIR /app

# Python çalıştırılması için gerekli kütüphaneleri yükle
RUN apt-get install -y python3 python3-pip
RUN pip3 install flask

# Flask sunucusunu çalıştır
CMD ["python3", "app.py"]
