--------------------------------------------------------
--  ������ ������ - �����-9��-01-2022   
--------------------------------------------------------
delete from addr;
commit;
SET DEFINE OFF;
Insert into WEPLE.ADDR (USER_ID,ADDR,ADDR_DETAIL,ZIP_CODE,IS_DEFAULT,ADDR_NAME,ADDR2) values ('test5','��õ ������ ���帶ũ�� 68','ffff',22018,0,'����Ʈ',' (�۵���, ���帶ũ��Ƽ��Ʈ������)');
Insert into WEPLE.ADDR (USER_ID,ADDR,ADDR_DETAIL,ZIP_CODE,IS_DEFAULT,ADDR_NAME,ADDR2) values ('test8','asdf','sdafas',0,1,'��','sadfas');
Insert into WEPLE.ADDR (USER_ID,ADDR,ADDR_DETAIL,ZIP_CODE,IS_DEFAULT,ADDR_NAME,ADDR2) values ('agsir','�뱸 ���� ���� 1','303ȣ',42463,0,'��',' (���)');
Insert into WEPLE.ADDR (USER_ID,ADDR,ADDR_DETAIL,ZIP_CODE,IS_DEFAULT,ADDR_NAME,ADDR2) values ('test4','�뱸 ������ ������11�� 16-7','101',42023,0,'��',' (���)');
Insert into WEPLE.ADDR (USER_ID,ADDR,ADDR_DETAIL,ZIP_CODE,IS_DEFAULT,ADDR_NAME,ADDR2) values ('test4','�뱸 ������ ��� 150-8','�����Ƽ��',42025,0,'�繫��','(���)');
Insert into WEPLE.ADDR (USER_ID,ADDR,ADDR_DETAIL,ZIP_CODE,IS_DEFAULT,ADDR_NAME,ADDR2) values ('test6','���� �������� ������ 2-5','����',7376,0,'����Ʈ',' (�븲��, �븲���ڿ��վ���Ʈ)');
Insert into WEPLE.ADDR (USER_ID,ADDR,ADDR_DETAIL,ZIP_CODE,IS_DEFAULT,ADDR_NAME,ADDR2) values ('test4','�뱸 �߱� ���ϵ� 135-1','5�� 3���ǽ�',41935,0,'�п�','(�߱�)');
Insert into WEPLE.ADDR (USER_ID,ADDR,ADDR_DETAIL,ZIP_CODE,IS_DEFAULT,ADDR_NAME,ADDR2) values ('test8','��õ ������ ���帶ũ�� 68','fasdf',0,0,'�繫��','asdfas');
Insert into WEPLE.ADDR (USER_ID,ADDR,ADDR_DETAIL,ZIP_CODE,IS_DEFAULT,ADDR_NAME,ADDR2) values ('agsir','�뱸 ���� ��� 3019-30','111',42463,1,'�뱸',null);
Insert into WEPLE.ADDR (USER_ID,ADDR,ADDR_DETAIL,ZIP_CODE,IS_DEFAULT,ADDR_NAME,ADDR2) values ('agsir','�λ� �ؿ�뱸 APEC�� 17','1102',48060,0,' �λ�',' (�쵿)');
Insert into WEPLE.ADDR (USER_ID,ADDR,ADDR_DETAIL,ZIP_CODE,IS_DEFAULT,ADDR_NAME,ADDR2) values ('test4','�λ� �ؿ�뱸 APEC�� 17','1302ȣ',48060,0,'�ҸӴ���',' (�쵿)');
SET DEFINE ON;
commit;