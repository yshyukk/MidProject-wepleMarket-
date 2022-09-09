--------------------------------------------------------
--  颇老捞 积己凳 - 格夸老-9岿-01-2022   
--------------------------------------------------------
DROP SEQUENCE "WEPLE"."BOARD_NUM_SEQ";
DROP SEQUENCE "WEPLE"."ORDER_NUM_SEQ";
DROP SEQUENCE "WEPLE"."PROD_ID_SEQ";
DROP SEQUENCE "WEPLE"."REPLE_NUM_SEQ";
--------------------------------------------------------
--  DDL for Sequence BOARD_NUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "WEPLE"."BOARD_NUM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10500 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence ORDER_NUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "WEPLE"."ORDER_NUM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10000260 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PROD_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "WEPLE"."PROD_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 11180 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPLE_NUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "WEPLE"."REPLE_NUM_SEQ"  MINVALUE 1 MAXVALUE 2000 INCREMENT BY 1 START WITH 23 NOCACHE  NOORDER  NOCYCLE ;
