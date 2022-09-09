--------------------------------------------------------
--  颇老捞 积己凳 - 格夸老-9岿-01-2022   
--------------------------------------------------------
DROP VIEW "WEPLE"."V_BO_PLUS_NM";
DROP VIEW "WEPLE"."V_CART_LIST";
DROP VIEW "WEPLE"."V_EN_WRITE_REV";
DROP VIEW "WEPLE"."V_IN_AMOUNT";
DROP VIEW "WEPLE"."V_LOGIN_ROLE";
DROP VIEW "WEPLE"."V_MAX_ORDER_SEQ";
DROP VIEW "WEPLE"."V_MY_JJIM";
DROP VIEW "WEPLE"."V_NONE_COMMENT_QNA";
DROP VIEW "WEPLE"."V_ORDER_RECORD";
DROP VIEW "WEPLE"."V_OUT_AMOUNT";
DROP VIEW "WEPLE"."V_PROD_SHARE_LIST";
DROP VIEW "WEPLE"."V_RT_REVIW_LIST";
DROP VIEW "WEPLE"."V_STOCK";
--------------------------------------------------------
--  DDL for View V_BO_PLUS_NM
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "WEPLE"."V_BO_PLUS_NM" ("PROD_NAME", "IMG_URL", "BOARD_TYPE", "TITLE", "BOARD_CONTENT", "WRITER", "WRITE_DATE", "BNO", "PROD_ID", "IS_HANDLED", "REPS_COMMENT", "ORDER_NUM", "CNT") AS 
  select p.prod_name, p.img_url, b."BOARD_TYPE",b."TITLE",b."BOARD_CONTENT",b."WRITER",b."WRITE_DATE",b."BNO",b."PROD_ID",b."IS_HANDLED",b."REPS_COMMENT",b."ORDER_NUM",b."CNT" from boards b join products p on (b.prod_id = p.prod_id)
;
--------------------------------------------------------
--  DDL for View V_CART_LIST
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "WEPLE"."V_CART_LIST" ("USER_ID", "PROD_ID", "BUY_AMOUNT", "IS_SHARE", "IS_CART", "IS_BUY", "IS_DELIVERY", "IS_COMPLETED", "ORDER_NUM") AS 
  select "USER_ID","PROD_ID","BUY_AMOUNT","IS_SHARE","IS_CART","IS_BUY","IS_DELIVERY","IS_COMPLETED","ORDER_NUM" from buy_process where is_cart=1
;
--------------------------------------------------------
--  DDL for View V_EN_WRITE_REV
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "WEPLE"."V_EN_WRITE_REV" ("USER_ID", "PROD_ID", "BUY_AMOUNT", "IS_SHARE", "IS_CART", "IS_BUY", "IS_DELIVERY", "IS_COMPLETED", "ORDER_NUM") AS 
  select p."USER_ID",p."PROD_ID",p."BUY_AMOUNT",p."IS_SHARE",p."IS_CART",p."IS_BUY",p."IS_DELIVERY",p."IS_COMPLETED",p."ORDER_NUM" from buy_process p
join (select user_id, prod_id, order_num
from buy_process
where is_cart = 0 
and is_buy = 1 
and is_delivery = 0 
and is_completed = 1 
and order_num not like 0 
and buy_amount not like 0
minus
select writer as user_id, prod_id, order_num
from boards) r
on p. user_id = r.user_id and p.prod_id = r.prod_id and p.order_num = r.order_num
;
--------------------------------------------------------
--  DDL for View V_IN_AMOUNT
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "WEPLE"."V_IN_AMOUNT" ("AMOUNT", "REGION", "PROD_ID") AS 
  select nvl(sum(amount),0) as amount, region, prod_id from inventory where in_out=0 group by region, prod_id
;
--------------------------------------------------------
--  DDL for View V_LOGIN_ROLE
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "WEPLE"."V_LOGIN_ROLE" ("ID", "PWD", "ROLE") AS 
  select user_id as id, user_pwd as pwd, user_role as role
from users
union all
select emp_id as id, emp_pwd as pwd, emp_role as role
from employees
;
--------------------------------------------------------
--  DDL for View V_MAX_ORDER_SEQ
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "WEPLE"."V_MAX_ORDER_SEQ" ("ORDER_NUM", "USER_ID") AS 
  select max(order_num) order_num, user_id from orders group by user_id
;
--------------------------------------------------------
--  DDL for View V_MY_JJIM
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "WEPLE"."V_MY_JJIM" ("JJIM", "PROD_ID", "IMG_URL", "PROD_NAME", "PROD_PRICE", "WEIGHT", "CONTENT", "ORIGIN", "IS_SHARE", "SHARE_PEOPLE", "CATG_LEVEL_3", "PARTICIPATE_PEOPLE", "CATG_LEVEL_1", "CATG_LEVEL_2", "USER_ID") AS 
  select "JJIM","PROD_ID","IMG_URL","PROD_NAME","PROD_PRICE","WEIGHT","CONTENT","ORIGIN","IS_SHARE","SHARE_PEOPLE","CATG_LEVEL_3","PARTICIPATE_PEOPLE","CATG_LEVEL_1","CATG_LEVEL_2","USER_ID" 
from (select decode(m.prod_id, null, 0, 1) jjim, p.*, m.user_id 
from products p, jjim m 
where p.prod_id = m.prod_id(+)) 
where jjim = 1
;
--------------------------------------------------------
--  DDL for View V_NONE_COMMENT_QNA
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "WEPLE"."V_NONE_COMMENT_QNA" ("BOARD_TYPE", "TITLE", "BOARD_CONTENT", "WRITER", "WRITE_DATE", "BNO", "PROD_ID", "IS_HANDLED", "REPS_COMMENT", "ORDER_NUM") AS 
  select "BOARD_TYPE","TITLE","BOARD_CONTENT","WRITER","WRITE_DATE","BNO","PROD_ID","IS_HANDLED","REPS_COMMENT","ORDER_NUM" from boards
where board_type = 2 and is_handled = 0
;
--------------------------------------------------------
--  DDL for View V_ORDER_RECORD
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "WEPLE"."V_ORDER_RECORD" ("USER_ID", "ODER_PRICE") AS 
  SELECT user_id, sum(order_price) oder_price
FROM
(
    SELECT user_id, order_price, order_date
    FROM orders 
    WHERE TO_DATE(TO_CHAR(order_date, 'yyyy-mm-dd'), 'YYYY-MM-DD') 
    IN (
        SELECT TO_DATE(TO_CHAR(order_date, 'yyyy-mm-dd'), 'YYYY-MM-DD')
        FROM orders WHERE TO_DATE(TO_CHAR(order_date, 'yyyy-mm-dd'), 'YYYY-MM-DD')
        BETWEEN TRUNC(ADD_MONTHS(sysdate, -6), 'MM')
        AND TRUNC(sysdate, 'MM')-(1/(24*60))
    )
)
GROUP BY user_id
;
--------------------------------------------------------
--  DDL for View V_OUT_AMOUNT
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "WEPLE"."V_OUT_AMOUNT" ("AMOUNT", "REGION", "PROD_ID") AS 
  select nvl(sum(amount),0) as amount, region, prod_id from inventory where in_out=1 group by region, prod_id
;
--------------------------------------------------------
--  DDL for View V_PROD_SHARE_LIST
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "WEPLE"."V_PROD_SHARE_LIST" ("PROD_ID", "IMG_URL", "PROD_NAME", "PROD_PRICE", "WEIGHT", "CONTENT", "ORIGIN", "IS_SHARE", "SHARE_PEOPLE", "CATG_LEVEL_3", "PARTICIPATE_PEOPLE", "CATG_LEVEL_1", "CATG_LEVEL_2", "RATIO", "STAR") AS 
  select p."PROD_ID",p."IMG_URL",p."PROD_NAME",p."PROD_PRICE",p."WEIGHT",p."CONTENT",p."ORIGIN",p."IS_SHARE",p."SHARE_PEOPLE",p."CATG_LEVEL_3",p."PARTICIPATE_PEOPLE",p."CATG_LEVEL_1",p."CATG_LEVEL_2", trunc((participate_people / share_people * 100),1) ratio, floor((participate_people / share_people * 100)/20) star 
from products p where is_share = 1 order by ratio desc
;
--------------------------------------------------------
--  DDL for View V_RT_REVIW_LIST
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "WEPLE"."V_RT_REVIW_LIST" ("BOARD_CONTENT", "WRITER", "WRITE_DATE", "BNO", "PROD_ID", "CNT", "IMG_URL", "PROD_NAME", "PROD_PRICE") AS 
  select b.board_content, b.writer, b.write_date, b.bno, b.prod_id, b.cnt, p.img_url, p.prod_name, p.prod_price
from boards b, products p
where b.board_type = 3 and b.prod_id = p.prod_id
order by cnt desc, write_date desc
;
--------------------------------------------------------
--  DDL for View V_STOCK
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "WEPLE"."V_STOCK" ("REGION", "PROD_ID", "STOCK") AS 
  select i.region, i.prod_id, (i.amount - (decode(o.amount, null, 0, o.amount))) stock from v_in_amount i, v_out_amount o where i.region = o.region(+) and i.prod_id = o.prod_id(+)
;
