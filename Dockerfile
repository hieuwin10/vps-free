# Sử dụng Ubuntu 22.04 làm base image
FROM ubuntu:22.04

# Thiết lập biến môi trường để tránh interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Cập nhật và cài đặt các packages cơ bản
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    vim \
    nano \
    htop \
    net-tools \
    iputils-ping \
    ca-certificates \
    gnupg \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

# Tạo thư mục làm việc
WORKDIR /app

# Copy toàn bộ project vào container
COPY . .

# Expose port (có thể thay đổi tùy theo nhu cầu)
EXPOSE 80 443

# Command mặc định khi container khởi động
CMD ["/bin/bash"]
