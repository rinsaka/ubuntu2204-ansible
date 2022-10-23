# # What's This?
- インストールされた直後の Ubuntu 22.04 に，Python, PHP, Laravel, MySQL, Mecab などを自動的にインストールすることができます．

# 設定方法

## スクリプトの実行
~~~
./run.sh
~~~

## 設定を反映させる
~~~
exec $SHELL -l
~~~


## mysql のパスワード設定

~~~
vagrant@ubuntu2204:~$ sudo mysql
mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'xxxx';
mysql> FLUSH PRIVILEGES;
mysql> exit
vagrant@ubuntu2204:~$
~~~

## 再起動
- カーネルが更新されるので再起動が必要
~~~
vagrant@ubuntu2204:~$ sudo reboot
~~~
