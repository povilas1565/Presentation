# Используем образ Python для приложения Flask
FROM python:3.9-slim

# Устанавливаем нужные пакеты: Nginx и необходимые библиотеки
RUN apt-get update && apt-get install -y \
    nginx \
    libnginx-mod-http-ntlm \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Копируем и устанавливаем зависимости Python
COPY requirements.txt /app/
WORKDIR /app
RUN pip install --no-cache-dir -r requirements.txt

# Копируем приложение Flask
COPY app.py /app/

# Копируем конфигурацию Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Открываем порты для приложения Flask и Nginx
EXPOSE 5000 80

# Стартуем Nginx и Flask
CMD service nginx start && python /app/app.py