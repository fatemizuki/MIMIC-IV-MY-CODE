安装
---
### 写在前面：
1、以下方法使用的是postgreSQL 10的版本，有小伙伴提供说11，12版本使用以下方法会报错，可以使用压缩包的方法进行安装，详见Issues和MIMIC-III官方github中的一些方法 

2、安装的方法参考的是官方之前MIMIC-III的安装方法，稍有修改，本人电脑是mac air2017，windows我也不清楚会不会出现什么奇怪的错误...

3、安装之前需要把压缩文件全部解压成csv，放到同一个文件夹里，使用的是MIMIC-IV 0.4版本的数据。然后下载这个文件夹里的三个sql文件

4、我没有写check的文件（懒），想检查是否安装错误可以对对bigquery中各个表的行数

5、YIKUAN8大佬那也有安装的方法，他那好像更简单，我这里嫌麻烦也可以去[看看他的](https://github.com/YIKUAN8/MIMIC-IV-Postgres)

---
**第一步**:首先你需要安装postgreSQL 10,此过程略去

**第二步**:打开psql,回车回车回车回车输密码回车

**第三步**:按照以下顺序输代码,输完一行回车一行

1、`DROP DATABASE IF EXISTS mimiciv;`

2、`CREATE DATABASE mimiciv OWNER postgres;`

3、`\c mimiciv;`

4、`CREATE SCHEMA mimiciv;`

5、`\i …create_tables.sql（create_tables文件的路径）` 例如：\i /Volumes/postgre/mimiciv/create_tables.sql

6、`\set ON_ERROR_STOP 1`

7、`\set datadir '…（你存放辣么多表格的路径）'` 例如：\i /Volumes/postgre/mimiciv

8、`\i …load_data.sql（load_data文件的路径）` 例如：\i /Volumes/postgre/mimiciv/load_data.sql 这个过程比较长，该吃吃该喝喝

9、`\i …add_indexes.sql（add_indexes文件的路径）`例如：\i /Volumes/postgre/mimiciv/add_indexes.sql 这个过程也比较长，该玩玩该睡睡

**第四步**：想用什么方法挖数据就用什么方法

---
### 注意事项：
1、\i \c后面有空格！！！

2、大小写区分！！！

3、报错先看看自己代码抄错没！！！

4、特别是 \ 和 / 不能抄错了！！！

5、以上示例限mac，windows的路径和mac的不大一样，大家自己解决



