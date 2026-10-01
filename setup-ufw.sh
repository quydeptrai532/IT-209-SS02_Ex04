#!/usr/bin/env bash
#
# Bài 4 (Lớp 1) - Cấu hình UFW trong hệ điều hành Ubuntu
# Chỉ cho phép SSH (22/tcp) và HTTP (80/tcp) đi vào Droplet.
#
# Cách dùng:
#   chmod +x setup-ufw.sh
#   sudo ./setup-ufw.sh

set -euo pipefail

echo "==> Cài đặt UFW (nếu chưa có)"
apt-get update
apt-get install -y ufw

echo "==> Chính sách mặc định: chặn vào, cho phép ra"
ufw default deny incoming
ufw default allow outgoing

echo "==> Mở cổng dịch vụ cần thiết"
ufw allow 22/tcp comment 'SSH'
ufw allow 80/tcp comment 'HTTP'
# ufw allow 443/tcp comment 'HTTPS'   # bật nếu dùng HTTPS

echo "==> Kích hoạt tường lửa (không hỏi xác nhận)"
ufw --force enable

echo "==> Trạng thái UFW"
ufw status verbose

echo "==> Hoàn tất. Nhớ cấu hình thêm DigitalOcean Cloud Firewall ở tầng hạ tầng."
