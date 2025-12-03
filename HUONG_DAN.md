# 🚀 HƯỚNG DẪN KHỞI ĐỘNG PROJECT VPS-FREE

## 📋 Yêu cầu hệ thống
- Docker và Docker Compose đã được cài đặt
- KVM hỗ trợ ảo hóa (để chạy Windows VM)
- Tối thiểu 16GB RAM
- Ít nhất 40GB dung lượng ổ cứng trống

## 🔧 Các bước khởi động project

### Bước 1: Clone hoặc Pull code mới nhất
```bash
# Clone project (lần đầu)
git clone https://github.com/hieuwin10/vps-free.git
cd vps-free

# Hoặc pull code mới nhất (nếu đã có)
git pull origin main
```

### Bước 2: Kiểm tra cấu hình
Kiểm tra và điều chỉnh cấu hình trong các file:
- `docker-compose.yml` - VPS Ubuntu cơ bản
- `win10.yaml` - Windows 10 VM

### Bước 3: Khởi động VPS Ubuntu
```bash
# Build và start container Ubuntu
docker-compose up -d

# Kiểm tra container đã chạy
docker-compose ps

# Xem logs
docker-compose logs -f
```

### Bước 4: Khởi động Windows 10 VM (Tùy chọn)
```bash
# Start Windows 10 VM
docker-compose -f win10.yaml up -d

# Kiểm tra trạng thái
docker-compose -f win10.yaml ps

# Xem logs
docker-compose -f win10.yaml logs -f
```

### Bước 5: Truy cập vào hệ thống

#### VPS Ubuntu:
```bash
# Truy cập container
docker-compose exec vps-free bash
```

#### Windows 10 VM:
- **Web UI**: http://localhost:8006
- **RDP**: localhost:3389 (dùng Remote Desktop)
- **VNC**: localhost:5900
- Username: `admin`
- Password: `password123`

## 🔄 Các lệnh quản lý thường dùng

### Restart containers
```bash
# Restart VPS Ubuntu
docker-compose restart

# Restart Windows 10 VM
docker-compose -f win10.yaml restart
```

### Dừng containers
```bash
# Dừng VPS Ubuntu
docker-compose stop

# Dừng Windows 10 VM
docker-compose -f win10.yaml stop
```

### Xóa và khởi động lại từ đầu
```bash
# VPS Ubuntu
docker-compose down -v
docker-compose up -d --build

# Windows 10 VM
docker-compose -f win10.yaml down -v
docker-compose -f win10.yaml up -d
```

### Xem logs
```bash
# VPS Ubuntu
docker-compose logs -f

# Windows 10 VM
docker-compose -f win10.yaml logs -f
```

## 📂 Cấu trúc thư mục quan trọng

```
vps-free/
├── docker-compose.yml      # Cấu hình VPS Ubuntu
├── win10.yaml             # Cấu hình Windows 10 VM
├── Dockerfile             # Định nghĩa image Ubuntu
├── storage/               # Lưu trữ dữ liệu Windows VM
├── data/                  # Dữ liệu VPS Ubuntu (được tạo tự động)
├── logs/                  # Logs (được tạo tự động)
└── README.md              # Tài liệu chi tiết

```

## ⚙️ Tùy chỉnh cấu hình

### Thay đổi RAM và CPU cho Windows VM
Chỉnh sửa file `win10.yaml`:
```yaml
environment:
  RAM_SIZE: "16G"    # Thay đổi dung lượng RAM
  CPU_CORES: "4"     # Thay đổi số core CPU
  DISK_SIZE: "32G"   # Thay đổi dung lượng ổ cứng
```

### Thay đổi Port
Chỉnh sửa trong các file yaml:
```yaml
ports:
  - "8080:80"   # Đổi port theo nhu cầu
```

## 🐛 Xử lý lỗi thường gặp

### Container không khởi động
```bash
# Kiểm tra logs để xem lỗi
docker-compose logs

# Rebuild image
docker-compose build --no-cache
docker-compose up -d
```

### Windows VM không khởi động
```bash
# Kiểm tra KVM
ls -la /dev/kvm

# Nếu không có KVM, kiểm tra ảo hóa
egrep -c '(vmx|svm)' /proc/cpuinfo

# Restart container
docker-compose -f win10.yaml restart
```

### Hết dung lượng
```bash
# Dọn dẹp Docker
docker system prune -a

# Xóa volumes không dùng
docker volume prune
```

## 📝 Ghi chú
- Lần khởi động đầu tiên Windows VM sẽ mất 15-30 phút để cài đặt
- Dữ liệu được lưu trong thư mục `storage/` và `data/`
- Backup thư mục `storage/` để giữ lại Windows VM

## 🔐 Bảo mật
- Đổi password mặc định trong `win10.yaml`
- Không expose ports ra internet nếu không cần thiết
- Sử dụng firewall và VPN khi cần

## 📞 Hỗ trợ
Nếu gặp vấn đề, tạo issue trên GitHub: https://github.com/hieuwin10/vps-free/issues
