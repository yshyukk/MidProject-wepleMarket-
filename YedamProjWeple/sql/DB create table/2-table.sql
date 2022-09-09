--------------------------------------------------------
--  ������ ������ - �����-9��-01-2022   
--------------------------------------------------------
DROP TABLE "WEPLE"."ADDR" cascade constraints;
DROP TABLE "WEPLE"."BOARDS" cascade constraints;
DROP TABLE "WEPLE"."BUY_PROCESS" cascade constraints;
DROP TABLE "WEPLE"."COMMENTS" cascade constraints;
DROP TABLE "WEPLE"."EMPLOYEES" cascade constraints;
DROP TABLE "WEPLE"."INVENTORY" cascade constraints;
DROP TABLE "WEPLE"."JJIM" cascade constraints;
DROP TABLE "WEPLE"."ORDERS" cascade constraints;
DROP TABLE "WEPLE"."PRODUCTS" cascade constraints;
DROP TABLE "WEPLE"."REGIONS" cascade constraints;
DROP TABLE "WEPLE"."USERS" cascade constraints;
--------------------------------------------------------
--  DDL for Table ADDR
--------------------------------------------------------

  CREATE TABLE "WEPLE"."ADDR" 
   (	"USER_ID" VARCHAR2(20 BYTE), 
	"ADDR" VARCHAR2(50 BYTE), 
	"ADDR_DETAIL" VARCHAR2(50 BYTE), 
	"ZIP_CODE" NUMBER(6,0), 
	"IS_DEFAULT" NUMBER(1,0) DEFAULT 0, 
	"ADDR_NAME" VARCHAR2(25 BYTE), 
	"ADDR2" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table BOARDS
--------------------------------------------------------

  CREATE TABLE "WEPLE"."BOARDS" 
   (	"BOARD_TYPE" NUMBER(1,0), 
	"TITLE" VARCHAR2(300 BYTE), 
	"BOARD_CONTENT" VARCHAR2(3000 BYTE), 
	"WRITER" VARCHAR2(20 BYTE), 
	"WRITE_DATE" DATE DEFAULT sysdate, 
	"BNO" NUMBER(5,0), 
	"PROD_ID" NUMBER(5,0) DEFAULT 0, 
	"IS_HANDLED" NUMBER(1,0) DEFAULT 0, 
	"REPS_COMMENT" VARCHAR2(300 BYTE) DEFAULT null, 
	"ORDER_NUM" NUMBER(8,0) DEFAULT 0, 
	"CNT" NUMBER(5,0) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table BUY_PROCESS
--------------------------------------------------------

  CREATE TABLE "WEPLE"."BUY_PROCESS" 
   (	"USER_ID" VARCHAR2(20 BYTE), 
	"PROD_ID" NUMBER(5,0), 
	"BUY_AMOUNT" NUMBER(10,0), 
	"IS_SHARE" NUMBER(1,0) DEFAULT 0, 
	"IS_CART" NUMBER(1,0) DEFAULT 1, 
	"IS_BUY" NUMBER(1,0) DEFAULT 0, 
	"IS_DELIVERY" NUMBER(1,0) DEFAULT 0, 
	"IS_COMPLETED" NUMBER(1,0) DEFAULT 0, 
	"ORDER_NUM" NUMBER(8,0) DEFAULT 0, 
	"IS_REVIEW" NUMBER(1,0) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table COMMENTS
--------------------------------------------------------

  CREATE TABLE "WEPLE"."COMMENTS" 
   (	"BNO" NUMBER(10,0), 
	"REPLE_NUM" NUMBER(10,0), 
	"USER_ID" VARCHAR2(20 BYTE), 
	"REPLE" VARCHAR2(1000 BYTE), 
	"WRITE_DATE" VARCHAR2(1000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table EMPLOYEES
--------------------------------------------------------

  CREATE TABLE "WEPLE"."EMPLOYEES" 
   (	"EMP_ID" VARCHAR2(20 BYTE), 
	"EMP_PWD" VARCHAR2(40 BYTE), 
	"RWU" NUMBER(3,0) DEFAULT 111, 
	"ACCESS_AUTHO" VARCHAR2(100 BYTE), 
	"EMP_ROLE" NUMBER(1,0) DEFAULT 1
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table INVENTORY
--------------------------------------------------------

  CREATE TABLE "WEPLE"."INVENTORY" 
   (	"REGION" VARCHAR2(20 BYTE), 
	"PROD_ID" NUMBER(5,0), 
	"IN_OUT" NUMBER(1,0), 
	"AMOUNT" NUMBER(5,0), 
	"STOCK" NUMBER(7,0), 
	"INVT_DATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table JJIM
--------------------------------------------------------

  CREATE TABLE "WEPLE"."JJIM" 
   (	"PROD_ID" NUMBER(5,0), 
	"USER_ID" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table ORDERS
--------------------------------------------------------

  CREATE TABLE "WEPLE"."ORDERS" 
   (	"USER_ID" VARCHAR2(20 BYTE), 
	"ORDER_NUM" NUMBER(8,0), 
	"ORDER_PRICE" NUMBER(8,0), 
	"ORDER_INFO" VARCHAR2(50 BYTE), 
	"ORDER_DATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PRODUCTS
--------------------------------------------------------

  CREATE TABLE "WEPLE"."PRODUCTS" 
   (	"PROD_ID" NUMBER(5,0), 
	"IMG_URL" VARCHAR2(300 BYTE), 
	"PROD_NAME" VARCHAR2(4000 BYTE), 
	"PROD_PRICE" NUMBER(15,0), 
	"WEIGHT" NUMBER(5,0), 
	"CONTENT" VARCHAR2(200 BYTE), 
	"ORIGIN" VARCHAR2(40 BYTE), 
	"IS_SHARE" NUMBER(1,0) DEFAULT 0, 
	"SHARE_PEOPLE" NUMBER(2,0) DEFAULT 0, 
	"CATG_LEVEL_3" NUMBER(7,0), 
	"PARTICIPATE_PEOPLE" NUMBER(2,0) DEFAULT 0, 
	"CATG_LEVEL_1" NUMBER(7,0), 
	"CATG_LEVEL_2" NUMBER(7,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table REGIONS
--------------------------------------------------------

  CREATE TABLE "WEPLE"."REGIONS" 
   (	"REGION" VARCHAR2(20 BYTE), 
	"PROD_ID" NUMBER(5,0), 
	"AMOUNT" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "WEPLE"."USERS" 
   (	"USER_ID" VARCHAR2(20 BYTE), 
	"EMAIL" VARCHAR2(40 BYTE), 
	"USER_PWD" VARCHAR2(40 BYTE), 
	"PHONE" VARCHAR2(20 BYTE), 
	"USER_NAME" VARCHAR2(20 BYTE), 
	"GENDER" VARCHAR2(20 BYTE), 
	"BIRTH" DATE, 
	"GRADE" NUMBER(1,0) DEFAULT 1, 
	"ADDR" VARCHAR2(50 BYTE), 
	"ADDR_DETAIL" VARCHAR2(50 BYTE), 
	"ZIP_CODE" NUMBER(6,0), 
	"REG_DATE" DATE DEFAULT sysdate, 
	"USER_ROLE" NUMBER(1,0) DEFAULT 0, 
	"ADDR2" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_BOARD_NUM
--------------------------------------------------------

  CREATE UNIQUE INDEX "WEPLE"."PK_BOARD_NUM" ON "WEPLE"."BOARDS" ("BNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_EMP_ID
--------------------------------------------------------

  CREATE UNIQUE INDEX "WEPLE"."PK_EMP_ID" ON "WEPLE"."EMPLOYEES" ("EMP_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_ORDER_NUM
--------------------------------------------------------

  CREATE UNIQUE INDEX "WEPLE"."PK_ORDER_NUM" ON "WEPLE"."ORDERS" ("ORDER_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_PROD_ID
--------------------------------------------------------

  CREATE UNIQUE INDEX "WEPLE"."PK_PROD_ID" ON "WEPLE"."PRODUCTS" ("PROD_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_USER_ID
--------------------------------------------------------

  CREATE UNIQUE INDEX "WEPLE"."PK_USER_ID" ON "WEPLE"."USERS" ("USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index UK_USER_EMAIL
--------------------------------------------------------

  CREATE UNIQUE INDEX "WEPLE"."UK_USER_EMAIL" ON "WEPLE"."USERS" ("EMAIL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index UK_USER_PHONE
--------------------------------------------------------

  CREATE UNIQUE INDEX "WEPLE"."UK_USER_PHONE" ON "WEPLE"."USERS" ("PHONE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table ADDR
--------------------------------------------------------

  ALTER TABLE "WEPLE"."ADDR" MODIFY ("ADDR_NAME" CONSTRAINT "NN_ADDR_NAME" NOT NULL DISABLE);
  ALTER TABLE "WEPLE"."ADDR" ADD CONSTRAINT "CK_ADDR_IS_DEFAULT" CHECK (is_default between 0 and 1) ENABLE;
  ALTER TABLE "WEPLE"."ADDR" MODIFY ("ZIP_CODE" CONSTRAINT "NN_ADDR_ZIP_CODE" NOT NULL ENABLE);
  ALTER TABLE "WEPLE"."ADDR" MODIFY ("ADDR_DETAIL" CONSTRAINT "NN_ADDR_DETAIL" NOT NULL ENABLE);
  ALTER TABLE "WEPLE"."ADDR" MODIFY ("ADDR" CONSTRAINT "NN_ADDR" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOARDS
--------------------------------------------------------

  ALTER TABLE "WEPLE"."BOARDS" ADD CONSTRAINT "PK_BOARD_NUM" PRIMARY KEY ("BNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "WEPLE"."BOARDS" ADD CONSTRAINT "CK_BOARD_IS_HANDLED" CHECK (is_handled between 0 and 1) ENABLE;
  ALTER TABLE "WEPLE"."BOARDS" ADD CONSTRAINT "CK_BOARD_TYPE" CHECK (board_type between 1 and 4) ENABLE;
  ALTER TABLE "WEPLE"."BOARDS" MODIFY ("WRITE_DATE" CONSTRAINT "NN_WRITE_DATE" NOT NULL ENABLE);
  ALTER TABLE "WEPLE"."BOARDS" MODIFY ("BOARD_CONTENT" CONSTRAINT "NN_BOARD_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "WEPLE"."BOARDS" MODIFY ("BOARD_TYPE" CONSTRAINT "NN_BOARD_TYPE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BUY_PROCESS
--------------------------------------------------------

  ALTER TABLE "WEPLE"."BUY_PROCESS" ADD CONSTRAINT "CK_BUY_PROC_IS_COMP" CHECK (is_completed between 0 and 1) ENABLE;
  ALTER TABLE "WEPLE"."BUY_PROCESS" ADD CONSTRAINT "CK_BUY_PROC_IS_DELI" CHECK (is_delivery between 0 and 1) ENABLE;
  ALTER TABLE "WEPLE"."BUY_PROCESS" ADD CONSTRAINT "CK_BUY_PROC_IS_BUY" CHECK (is_buy between 0 and 1) ENABLE;
  ALTER TABLE "WEPLE"."BUY_PROCESS" ADD CONSTRAINT "CK_BUY_PROC_IS_CART" CHECK (is_cart between 0 and 1) ENABLE;
  ALTER TABLE "WEPLE"."BUY_PROCESS" ADD CONSTRAINT "CK_BUY_PROC_IS_SHARE" CHECK (is_share between 0 and 1) ENABLE;
  ALTER TABLE "WEPLE"."BUY_PROCESS" MODIFY ("IS_COMPLETED" CONSTRAINT "NN_BUY_PROC_IS_COMP" NOT NULL ENABLE);
  ALTER TABLE "WEPLE"."BUY_PROCESS" MODIFY ("IS_DELIVERY" CONSTRAINT "NN_BUY_PROC_IS_DELI" NOT NULL ENABLE);
  ALTER TABLE "WEPLE"."BUY_PROCESS" MODIFY ("IS_BUY" CONSTRAINT "NN_BUY_PROC_IS_BUY" NOT NULL ENABLE);
  ALTER TABLE "WEPLE"."BUY_PROCESS" MODIFY ("IS_CART" CONSTRAINT "NN_BUY_PROC_IS_CART" NOT NULL ENABLE);
  ALTER TABLE "WEPLE"."BUY_PROCESS" MODIFY ("IS_SHARE" CONSTRAINT "NN_BUY_PROC_IS_SHARE" NOT NULL ENABLE);
  ALTER TABLE "WEPLE"."BUY_PROCESS" MODIFY ("BUY_AMOUNT" CONSTRAINT "NN_BUY_PROC_AMOUNT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EMPLOYEES
--------------------------------------------------------

  ALTER TABLE "WEPLE"."EMPLOYEES" ADD CONSTRAINT "PK_EMP_ID" PRIMARY KEY ("EMP_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "WEPLE"."EMPLOYEES" ADD CONSTRAINT "CK_EMP_RWU" CHECK ( rwu in (0, 1, 10, 11, 100, 101, 110, 111)) ENABLE;
  ALTER TABLE "WEPLE"."EMPLOYEES" MODIFY ("EMP_PWD" CONSTRAINT "NN_EMP_PWD" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table INVENTORY
--------------------------------------------------------

  ALTER TABLE "WEPLE"."INVENTORY" ADD CONSTRAINT "CK_INVENTORY_IN_OUT" CHECK (in_out IN(0,1)) ENABLE;
  ALTER TABLE "WEPLE"."INVENTORY" ADD CONSTRAINT "CK_INVENTORY_REGION" CHECK (region IN ('daejeon', 'incheon', 'daegu', 'gwangju', 'seoul', 'ulsan', 'busan')) ENABLE;
  ALTER TABLE "WEPLE"."INVENTORY" MODIFY ("STOCK" CONSTRAINT "NN_INVENTORY_STOCK" NOT NULL ENABLE);
  ALTER TABLE "WEPLE"."INVENTORY" MODIFY ("AMOUNT" CONSTRAINT "NN_INVENTORY_AMOUNT" NOT NULL ENABLE);
  ALTER TABLE "WEPLE"."INVENTORY" MODIFY ("IN_OUT" CONSTRAINT "NN_INVENTORY_IN_OUT" NOT NULL ENABLE);
  ALTER TABLE "WEPLE"."INVENTORY" MODIFY ("REGION" CONSTRAINT "NN_INVENTORY_REGION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "WEPLE"."ORDERS" ADD CONSTRAINT "PK_ORDER_NUM" PRIMARY KEY ("ORDER_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "WEPLE"."ORDERS" MODIFY ("ORDER_PRICE" CONSTRAINT "NN_ORDER_PRICE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRODUCTS
--------------------------------------------------------

  ALTER TABLE "WEPLE"."PRODUCTS" ADD CONSTRAINT "PK_PROD_ID" PRIMARY KEY ("PROD_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "WEPLE"."PRODUCTS" ADD CONSTRAINT "CK_PROD_IS_SHARE" CHECK (is_share between 0 and 1) ENABLE;
  ALTER TABLE "WEPLE"."PRODUCTS" MODIFY ("SHARE_PEOPLE" CONSTRAINT "NN_PRO_SHARE_PEOPLE" NOT NULL ENABLE);
  ALTER TABLE "WEPLE"."PRODUCTS" MODIFY ("IS_SHARE" CONSTRAINT "NN_PRO_IS_SHARE" NOT NULL ENABLE);
  ALTER TABLE "WEPLE"."PRODUCTS" MODIFY ("ORIGIN" CONSTRAINT "NN_PROD_ORIGIN" NOT NULL ENABLE);
  ALTER TABLE "WEPLE"."PRODUCTS" MODIFY ("WEIGHT" CONSTRAINT "NN_PROD_WEIGHT" NOT NULL ENABLE);
  ALTER TABLE "WEPLE"."PRODUCTS" MODIFY ("PROD_PRICE" CONSTRAINT "NN_PROD_PRICE" NOT NULL ENABLE);
  ALTER TABLE "WEPLE"."PRODUCTS" MODIFY ("PROD_NAME" CONSTRAINT "NN_PROD_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REGIONS
--------------------------------------------------------

  ALTER TABLE "WEPLE"."REGIONS" ADD CONSTRAINT "CK_REGION_NAME" CHECK (region LIKE 'daejeon' OR region LIKE 'incheon' OR region LIKE 'daegu' OR
                                                                                        region LIKE 'gwangju' OR region LIKE 'seoul' OR region LIKE 'ulsan' OR
                                                                                        region LIKE 'busan') ENABLE;
  ALTER TABLE "WEPLE"."REGIONS" MODIFY ("AMOUNT" CONSTRAINT "NN_REGION_PROD_AMOUNT" NOT NULL ENABLE);
  ALTER TABLE "WEPLE"."REGIONS" MODIFY ("PROD_ID" CONSTRAINT "NN_REGION_PROD_ID" NOT NULL ENABLE);
  ALTER TABLE "WEPLE"."REGIONS" MODIFY ("REGION" CONSTRAINT "NN_REGION_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "WEPLE"."USERS" ADD CONSTRAINT "UK_USER_PHONE" UNIQUE ("PHONE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "WEPLE"."USERS" ADD CONSTRAINT "UK_USER_EMAIL" UNIQUE ("EMAIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "WEPLE"."USERS" ADD CONSTRAINT "PK_USER_ID" PRIMARY KEY ("USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "WEPLE"."USERS" ADD CONSTRAINT "CK_USER_GRADE" CHECK (grade between 1 and 4) ENABLE;
  ALTER TABLE "WEPLE"."USERS" MODIFY ("REG_DATE" CONSTRAINT "NN_USER_REG_DATE" NOT NULL ENABLE);
  ALTER TABLE "WEPLE"."USERS" MODIFY ("ZIP_CODE" CONSTRAINT "NN_USER_ZIP_CODE" NOT NULL ENABLE);
  ALTER TABLE "WEPLE"."USERS" MODIFY ("ADDR_DETAIL" CONSTRAINT "NN_USER_ADDR_DETAIL" NOT NULL ENABLE);
  ALTER TABLE "WEPLE"."USERS" MODIFY ("ADDR" CONSTRAINT "NN_USER_ADDR" NOT NULL ENABLE);
  ALTER TABLE "WEPLE"."USERS" MODIFY ("USER_NAME" CONSTRAINT "NN_USER_NAME" NOT NULL ENABLE);
  ALTER TABLE "WEPLE"."USERS" MODIFY ("PHONE" CONSTRAINT "NN_USER_PHONE" NOT NULL ENABLE);
  ALTER TABLE "WEPLE"."USERS" MODIFY ("USER_PWD" CONSTRAINT "NN_USER_PWD" NOT NULL ENABLE);
  ALTER TABLE "WEPLE"."USERS" MODIFY ("EMAIL" CONSTRAINT "NN_USER_EMAIL" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table ADDR
--------------------------------------------------------

  ALTER TABLE "WEPLE"."ADDR" ADD CONSTRAINT "FK_ADDR_USER_ID" FOREIGN KEY ("USER_ID")
	  REFERENCES "WEPLE"."USERS" ("USER_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOARDS
--------------------------------------------------------

  ALTER TABLE "WEPLE"."BOARDS" ADD CONSTRAINT "BOARD_WRITER_USER_ID" FOREIGN KEY ("WRITER")
	  REFERENCES "WEPLE"."USERS" ("USER_ID") DISABLE;
  ALTER TABLE "WEPLE"."BOARDS" ADD CONSTRAINT "FK_BOARD_ORDER_NUM" FOREIGN KEY ("ORDER_NUM")
	  REFERENCES "WEPLE"."ORDERS" ("ORDER_NUM") ENABLE;
  ALTER TABLE "WEPLE"."BOARDS" ADD CONSTRAINT "FK_BOARD_PROD_ID" FOREIGN KEY ("PROD_ID")
	  REFERENCES "WEPLE"."PRODUCTS" ("PROD_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BUY_PROCESS
--------------------------------------------------------

  ALTER TABLE "WEPLE"."BUY_PROCESS" ADD CONSTRAINT "FK_BUY_PROC_ORDER_NUM" FOREIGN KEY ("ORDER_NUM")
	  REFERENCES "WEPLE"."ORDERS" ("ORDER_NUM") DISABLE;
  ALTER TABLE "WEPLE"."BUY_PROCESS" ADD CONSTRAINT "FK_BUY_PROC_PROD_ID" FOREIGN KEY ("PROD_ID")
	  REFERENCES "WEPLE"."PRODUCTS" ("PROD_ID") ENABLE;
  ALTER TABLE "WEPLE"."BUY_PROCESS" ADD CONSTRAINT "FK_BUY_PROC_USER_ID" FOREIGN KEY ("USER_ID")
	  REFERENCES "WEPLE"."USERS" ("USER_ID") DISABLE;
--------------------------------------------------------
--  Ref Constraints for Table COMMENTS
--------------------------------------------------------

  ALTER TABLE "WEPLE"."COMMENTS" ADD CONSTRAINT "FK_BOARD_NUM" FOREIGN KEY ("BNO")
	  REFERENCES "WEPLE"."BOARDS" ("BNO") ENABLE;
  ALTER TABLE "WEPLE"."COMMENTS" ADD CONSTRAINT "FK_USER_ID" FOREIGN KEY ("USER_ID")
	  REFERENCES "WEPLE"."USERS" ("USER_ID") DISABLE;
--------------------------------------------------------
--  Ref Constraints for Table INVENTORY
--------------------------------------------------------

  ALTER TABLE "WEPLE"."INVENTORY" ADD CONSTRAINT "RK_INVENTORY_PROD_ID" FOREIGN KEY ("PROD_ID")
	  REFERENCES "WEPLE"."PRODUCTS" ("PROD_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table JJIM
--------------------------------------------------------

  ALTER TABLE "WEPLE"."JJIM" ADD CONSTRAINT "FK_JJIM_PROD_ID" FOREIGN KEY ("PROD_ID")
	  REFERENCES "WEPLE"."PRODUCTS" ("PROD_ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "WEPLE"."JJIM" ADD CONSTRAINT "FK_JJIM_USER_ID" FOREIGN KEY ("USER_ID")
	  REFERENCES "WEPLE"."USERS" ("USER_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "WEPLE"."ORDERS" ADD CONSTRAINT "FK_ORDER_USER_ID" FOREIGN KEY ("USER_ID")
	  REFERENCES "WEPLE"."USERS" ("USER_ID") DISABLE;
--------------------------------------------------------
--  Ref Constraints for Table REGIONS
--------------------------------------------------------

  ALTER TABLE "WEPLE"."REGIONS" ADD CONSTRAINT "FK_PROD_ID" FOREIGN KEY ("PROD_ID")
	  REFERENCES "WEPLE"."PRODUCTS" ("PROD_ID") ENABLE;