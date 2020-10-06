### 基础表格
---
这个文件夹主要是一些基础表格，主要还是MIMIC-III中转换过来的，详细代码可以参考MIMIC-III的官网（见首页的readme）


在我修改之前如果官方有修改好的我就不修改了，统一在这里放出相应的表格名字：（详细的表格见于MIMIC-IV官方github）

官方的表有几个需要重复修改的地方我写在这里，大家可以自行修改

1、一般在跑表之前我会写上：DROP MATERIALIZED VIEW IF EXISTS 表名; CREATE MATERIALIZED VIEW 表名 AS

2、FROM之后的表名需要修改，修改成本地你保存的这个表的名字


first_day：

first_day_lab：
