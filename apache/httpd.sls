include:
  - init.pkg_apache

apr-install:
  file.managed:
    - name: /usr/local/src/apr-1.4.6.tar.gz
    - source: salt://apache/files/apr-1.4.6.tar.gz
    - user: root
    - group: root
    - mode: 644

  cmd.run:
    - name: cd /usr/local/src && tar zxf apr-1.4.6.tar.gz && cd  apr-1.4.6 && ./configure && make && make install

apr-util-install:
  file.managed:
    - name: /usr/local/src/apr-util-1.5.2.tar.gz
    - source: salt://apache/files/apr-util-1.5.2.tar.gz
    - user: root
    - group: root
    - mode: 644

  cmd.run:
    - name: cd /usr/local/src &&tar zxf apr-util-1.5.2.tar.gz &&  cd apr-util-1.5.2 && ./configure --with-apr=/usr/local/apr/ && make && make install

apache-install:
  file.managed:
    - name: /usr/local/src/httpd-2.4.4.tar.gz
    - source: salt://apache/files/httpd-2.4.4.tar.gz
    - user: root
    - group: root
    - mode: 644

  cmd.run:
    - name: cd /usr/local/src && tar zxf httpd-2.4.4.tar.gz && cd  httpd-2.4.4 && ./configure --prefix=/usr/local/apache2 --enable-so --enable-ssl --enable-rewrite --with-mpm=worker --with-suexec-bin --with-apr=/usr/local/apr/ && make &&  make install

#    - unless: test -d /usr/local/apache2
#    - require:
#      - file: apache-install

