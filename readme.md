<h1><b style="color: red">Các bước setup để chạy</b></h1>

<h2>
	<b>1.Cài Laravel tại folder gốc (folder chứa project) bằng powershell (Shift + chuột phải chọn Open powershell) hoặc cài bằng cmd.</b>
</h2>
<h2>
	<b>2.Nhập dòng lệnh php composer.phar install</b>
</h2>

<h2>
	<b>3.Copy file .env bỏ vào folder project (File này lấy trên ggdrive ở trên group)
</b>
</h2>
<pre>
APP_NAME=Laravel
APP_ENV=local
APP_KEY=base64:vDwPNpcLxinEDm54Ro5wCHpyGVUbvH2/iF6Yeo55QIQ=
APP_DEBUG=true
APP_LOG_LEVEL=debug
APP_URL=http://localhost

DB_CONNECTION=mysql
DB_HOST=localhost
DB_PORT=3306
DB_DATABASE=db_hotel
DB_USERNAME=root
DB_PASSWORD=mysql

BROADCAST_DRIVER=log
CACHE_DRIVER=file
SESSION_DRIVER=file
SESSION_LIFETIME=120
QUEUE_DRIVER=sync

REDIS_HOST=127.0.0.1
REDIS_PASSWORD=null
REDIS_PORT=6379

MAIL_DRIVER=smtp
MAIL_HOST=smtp.gmail.com
MAIL_PORT=587
MAIL_USERNAME=whatthemail2@gmail.com
MAIL_PASSWORD=trinhcongdanh2
MAIL_ENCRYPTION=tls

PUSHER_APP_ID=
PUSHER_APP_KEY=
PUSHER_APP_SECRET=
PUSHER_APP_CLUSTER=mt1
</pre>


<h2><b>4. Import file sql vào database 'db_hotel' trong phpmyadmin </b></h2>

<p style="color: red; font-size: 16px">File nằm trong thư mục 'source_db'</p>

<h3><b>Ai có thay đổi db thì export ra để vào thư mục 'source_db' nhá </b></h3>

<h2><b>5. Mở localhost lên chạy</b></h2>