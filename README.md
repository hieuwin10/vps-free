# VPS Free

Project VPS miễn phí sử dụng Docker.

## 🐳 Cài đặt và Sử dụng với Docker

### Yêu cầu
- Docker
- Docker Compose

### Cách sử dụng

#### 1. Build và chạy container
```bash
# Build và start container
docker-compose up -d

# Hoặc build lại nếu có thay đổi
docker-compose up -d --build
```

#### 2. Kiểm tra container đang chạy
```bash
docker-compose ps
```

#### 3. Truy cập vào container
```bash
# Truy cập bash shell
docker-compose exec vps-free bash

# Hoặc sử dụng docker exec
docker exec -it vps-free-container bash
```

#### 4. Xem logs
```bash
# Xem logs real-time
docker-compose logs -f

# Xem logs của service cụ thể
docker-compose logs -f vps-free
```

#### 5. Dừng container
```bash
# Dừng container
docker-compose stop

# Dừng và xóa container
docker-compose down

# Dừng và xóa cả volumes
docker-compose down -v
```

#### 6. Restart container
```bash
docker-compose restart
```

### Cấu trúc thư mục
```
.
├── Dockerfile              # Định nghĩa image Docker
├── docker-compose.yml      # Cấu hình Docker Compose
├── .dockerignore          # File loại trừ khi build
├── data/                  # Thư mục lưu trữ dữ liệu (được mount)
├── logs/                  # Thư mục logs (được mount)
└── README.md              # Tài liệu hướng dẫn
```

### Cấu hình

#### Ports
- `8080:80` - HTTP
- `8443:443` - HTTPS

Có thể thay đổi port mapping trong file `docker-compose.yml`.

#### Volumes
- `./data:/app/data` - Lưu trữ dữ liệu
- `./logs:/app/logs` - Lưu trữ logs

#### Environment Variables
Thay đổi biến môi trường trong `docker-compose.yml`:
```yaml
environment:
  - TZ=Asia/Ho_Chi_Minh
```

### Troubleshooting

#### Container không start
```bash
# Kiểm tra logs
docker-compose logs

# Kiểm tra status
docker-compose ps
```

#### Xóa toàn bộ và bắt đầu lại
```bash
docker-compose down -v
docker-compose up -d --build
```

#### Build lại image
```bash
docker-compose build --no-cache
docker-compose up -d
```

## 📝 License

MIT