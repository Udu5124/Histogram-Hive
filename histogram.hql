drop table Color;

create table Color (
  red int,
  green int,
  blue int)
row format delimited fields terminated by ',' stored as textfile;

load data local inpath 'pixels-large.txt' overwrite into table Color;

(SELECT 1,red ,COUNT(*)
FROM Color
GROUP BY red ORDER BY red )
UNION
(SELECT 2,green ,COUNT(*)
FROM Color
GROUP BY green ORDER BY green)
UNION
(SELECT 3,blue ,COUNT(*)
FROM Color
GROUP BY blue ORDER BY blue);