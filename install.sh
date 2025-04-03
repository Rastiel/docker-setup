#!/bin/bash

echo "🚀 Docker kurulumu başlıyor..."

# 1. Güncelleme
echo "📦 Sistem güncelleniyor..."
sudo apt update && sudo apt upgrade -y

# 2. Bağımlılıklar
echo "🔧 Gerekli paketler yükleniyor..."
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common gnupg

# 3. GPG ve Docker Repo
echo "🔐 Docker GPG anahtarı ekleniyor..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "📚 Docker kaynak listesi ekleniyor..."
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 4. Docker kurulumu
echo "🐳 Docker kuruluyor..."
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# 5. Servis başlatma ve enable
echo "🔁 Docker servisi başlatılıyor..."
sudo systemctl start docker
sudo systemctl enable docker

# 6. Test
echo "✅ Kurulum tamam! Test container'ı çalıştırılıyor..."
sudo docker run hello-world

echo "🎉 Docker başarıyla kuruldu!"
