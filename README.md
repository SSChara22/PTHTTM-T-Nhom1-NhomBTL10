# PTHTTMDT-Nhom1-NhomBTL10
## 🛠️ Hướng dẫn cài đặt

### 🔹 **Bước 1: Clone Repository**
```sh
git clone https://github.com/SSChara22/PTHTTMDT-Nhom1-NhomBTL10
cd PTHTTMDT-Nhom1-NhomBTL10
```

### 🔹 **Bước 2: Install Dependencies**
```sh
composer install
npm install
```

### 🔹 **Bước 3: Tạo môi trường**
```sh
cp .env.example .env
php artisan key:generate
```
Cập nhật thông tin Database vào file `.env`

### 🔹 **Bước 4: Cấu hình Database**
```sh
php artisan migrate --seed
```
Nhập file `database/httmdt.sql` vào database.

### 🔹 **Bước 5: Khởi tạo storage**
```sh
php artisan storage:link
```

### 🔹 **Bước 6: Chạy chương trình**
```sh
php artisan serve
```
🔗 Truy cập `http://localhost:8000`

### **Tài khoản admin:**
**Email:** `admin@gmail.com`  
**Password:** `1111`
