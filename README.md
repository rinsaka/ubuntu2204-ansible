# # What's This?
- インストールされた直後の Ubuntu 22.04 に，Python, PHP, Laravel, MySQL, Mecab などを自動的にインストールすることができます．

# 設定方法
## Cabocha をインストールする場合
- [GoogleDrive](https://drive.google.com/drive/folders/0B4y35FiV1wh7cGRCUUJHVTNJRnM?resourcekey=0-ym0BJTHMkjw3y1AEgwwaxA) から cabocha-0.69.tar.bz2 をダウンロードし，work ディレクトリに scp コマンド（あるいは Cyberduck等）でアップロードしてから，[05-meca.yml](05-meca.yml) ファイルの次の部分を有効にしてください．

~~~
    - name: unarchive CaboCha
      command: chdir={{work_dir}} tar xvjf {{cabocha_ver}}.tar.bz2
      become: no
    - name: configure CaboCha
      command: chdir={{work_dir}}/{{cabocha_ver}} ./configure --with-charset=UTF8
      become: no
    - name: make CaboCha
      command: chdir={{work_dir}}/{{cabocha_ver}} make
      become: no
    - name: make install CaboCha
      command: chdir={{work_dir}}/{{cabocha_ver}} make install
      become: yes
    - name: edit .bashrc
      shell: /usr/bin/echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib' >> ~/.bashrc
      become: no
~~~

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
