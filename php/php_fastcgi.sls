include:
  - init.pkg

php-install:
  file.managed:
    - name: /usr/local/src/php-5.5.35.tar.gz
    - source: salt://php/files/php-5.5.35.tar.gz
    - user: root
    - group: root
    - mode: 755

  cmd.run:
    - name:  cd /usr/local/src && tar zxf php-5.5.35.tar.gz && cd php-5.5.35 &&./configure --prefix=/usr/local/php-fastcgi --with-mysql --with-apxs2=/usr/local/apache2/bin/apxs --with-mysqli --with-pdo-mysql --with-jpeg-dir --with-png-dir --with-zlib --enable-xml --with-libxml-dir --with-curl --enable-bcmath --enable-shmop --enable-sysvsem --enable-inline-optimization --enable-mbregex --with-openssl --enable-mbstring --with-gd --enable-gd-native-ttf --enable-sockets --with-xmlrpc --enable-soap --disable-debug --enable-opcache --enable-zip --with-config-file-path=/usr/local/php-fastcgi/etc --enable-fpm --with-fpm-user=www --with-fpm-group=www && make && make install
    - unless: test -d /usr/local/php-fastcgi
