create user weple identified by weple123
default tablespace users
temporary tablespace temp;

grant connect, resource to weple;

grant create view to weple;
