# 基础表格
---
这个文件夹主要是一些基础表格，主要还是MIMIC-III中转换过来的，详细代码可以参考MIMIC-III的官网（见首页的readme）


在我修改之前如果官方有修改好的我就不修改了，统一在这里放出相应的表格名字：（详细的表格见于MIMIC-IV官方github）

官方的表有几个需要重复修改的地方我写在这里，大家可以自行修改

1、一般在跑表之前我会写上：DROP MATERIALIZED VIEW IF EXISTS 表名; CREATE MATERIALIZED VIEW 表名 AS

2、FROM之后的表名需要修改，修改成本地你保存的这个表的名字

---

## first_day：

### first_day_lab：

1、需要前置表complete_blood_count, chemistry, blood_differential, coagulation, enzyme

2、platelets需要修改成platelet

3、如果使用postgreSQL没有DATATIME_SUB和DATATIME_ADD这两个函数，直接改成加号或减号就行，例如SUB的那句改成ie.intime - INTERVAL '6' HOUR（后面也有表有同样的问题，操作是一样的，就不多说了）

### first_day_urine_output：

1、需要前置表urine_output

### first_day_vitalsign：

1、需要前置表vitalsign

2、对于postgreSQL来说，vitalsign中的ROUND函数里，需要使用CAST函数，具体修改： 
, ROUND(
      CAST(AVG(case when itemid in (223761) and valuenum > 70 and valuenum < 120 then (valuenum-32)/1.8 -- converted to degC in valuenum call
              when itemid in (223762) and valuenum > 10 and valuenum < 50  then valuenum else null end) AS NUMERIC)
    , 2) as temperature

### first_day_rrt：

1、需要前置表rrt

### first_day_weight：

1、需要前置表weight_durations

### first_day_height:

1、需要前置表height：ROUND里需要加CAST函数，同上

### first_day_gcs:

1、需要前置表gcs：INTERVAL '6' HOUR，原代码里6没有打引号，要加个引号

2、first_day_gcs代码中删除最后的endotrachflag

### first_day_bg/first_day_bg_art:

1、需要前置表bg：记得给INTERVAL后面的数字加引号

---

## others:

### ventilator_setting:

1、最后一个select增加stay_id

### inflammation:

1、目前只有crp

### oxygen_delivery

### crrt

### invasive_line:

1、有创监测操作

### age:

1、中间datetime_diff那句话不适用于postgreSQL，更改为 , (EXTRACT(year FROM ad.admittime) - pa.anchor_year + pa.anchor_age) AS age


---

## medication:

### dobutamine --> medication_dobutamine

### dopamine --> medication_dopamine

### epinephrine --> medication_epinephrine

### neuroblock --> medication_neuroblock

### norepinephrine --> medication_norepinephrine

### phenylephrine --> medication_phenylephrine

### vasopression --> medication_vasopression



