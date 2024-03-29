--------------------------------------------------------
--  File created - �������-�������-11-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table DEPARTMENTS
--------------------------------------------------------

  CREATE TABLE "C##_STUDENT_MARIIA"."DEPARTMENTS" 
   (	"ID" NUMBER(10,0) GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"FACULTY_ID" NUMBER(10,0), 
	"NAME" VARCHAR2(32 BYTE), 
	"SHORT_NAME" VARCHAR2(32 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table DISCIPLINES
--------------------------------------------------------

  CREATE TABLE "C##_STUDENT_MARIIA"."DISCIPLINES" 
   (	"ID" NUMBER(10,0) GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"NAME" VARCHAR2(32 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table FACULTIES
--------------------------------------------------------

  CREATE TABLE "C##_STUDENT_MARIIA"."FACULTIES" 
   (	"ID" NUMBER(10,0) GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"NAME" VARCHAR2(32 BYTE), 
	"SHORT_NAME" VARCHAR2(32 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table GROUPS
--------------------------------------------------------

  CREATE TABLE "C##_STUDENT_MARIIA"."GROUPS" 
   (	"ID" NUMBER(10,0) GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"DEPARTMENT_ID" NUMBER(10,0), 
	"NAME" VARCHAR2(32 BYTE), 
	"COURSE" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table NEWS
--------------------------------------------------------

  CREATE TABLE "C##_STUDENT_MARIIA"."NEWS" 
   (	"ID" NUMBER(10,0) GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"HEADER" VARCHAR2(32 BYTE), 
	"NEWS_BODY" VARCHAR2(1000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table SCHEDULES
--------------------------------------------------------

  CREATE TABLE "C##_STUDENT_MARIIA"."SCHEDULES" 
   (	"ID" NUMBER(10,0) GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"NAME" VARCHAR2(32 BYTE), 
	"TEACHER_ID" NUMBER(10,0), 
	"DISCIPLINE_ID" NUMBER(10,0), 
	"GROUP_ID" NUMBER(10,0), 
	"TIME" VARCHAR2(32 BYTE), 
	"CLASSROOM" VARCHAR2(32 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table STUDENTS
--------------------------------------------------------

  CREATE TABLE "C##_STUDENT_MARIIA"."STUDENTS" 
   (	"ID" NUMBER(10,0) GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"GROUP_ID" NUMBER(10,0), 
	"NAME" VARCHAR2(32 BYTE), 
	"EMAIL" VARCHAR2(32 BYTE), 
	"PHONE" VARCHAR2(32 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TEACHERS
--------------------------------------------------------

  CREATE TABLE "C##_STUDENT_MARIIA"."TEACHERS" 
   (	"ID" NUMBER(10,0) GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"NAME" VARCHAR2(32 BYTE), 
	"SURNAME" VARCHAR2(32 BYTE), 
	"EMAIL" VARCHAR2(32 BYTE), 
	"PHONE" VARCHAR2(32 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into C##_STUDENT_MARIIA.DEPARTMENTS
SET DEFINE OFF;
Insert into C##_STUDENT_MARIIA.DEPARTMENTS (ID,FACULTY_ID,NAME,SHORT_NAME) values ('2','16','Engineering Mechanics Department','EM dep');
Insert into C##_STUDENT_MARIIA.DEPARTMENTS (ID,FACULTY_ID,NAME,SHORT_NAME) values ('3','1','Economics Managment Department','EcD');
REM INSERTING into C##_STUDENT_MARIIA.DISCIPLINES
SET DEFINE OFF;
Insert into C##_STUDENT_MARIIA.DISCIPLINES (ID,NAME) values ('1','Economics');
Insert into C##_STUDENT_MARIIA.DISCIPLINES (ID,NAME) values ('2','Maths');
Insert into C##_STUDENT_MARIIA.DISCIPLINES (ID,NAME) values ('4','OOP');
Insert into C##_STUDENT_MARIIA.DISCIPLINES (ID,NAME) values ('5','Web Technology');
Insert into C##_STUDENT_MARIIA.DISCIPLINES (ID,NAME) values ('21','Theory of Algorythms');
REM INSERTING into C##_STUDENT_MARIIA.FACULTIES
SET DEFINE OFF;
Insert into C##_STUDENT_MARIIA.FACULTIES (ID,NAME,SHORT_NAME) values ('1','Economic Management faculty','EMF');
Insert into C##_STUDENT_MARIIA.FACULTIES (ID,NAME,SHORT_NAME) values ('16','Basic Business faculty','BF');
Insert into C##_STUDENT_MARIIA.FACULTIES (ID,NAME,SHORT_NAME) values ('15','Programming Faculty','PF');
REM INSERTING into C##_STUDENT_MARIIA.GROUPS
SET DEFINE OFF;
Insert into C##_STUDENT_MARIIA.GROUPS (ID,DEPARTMENT_ID,NAME,COURSE) values ('41','3','IA-09','4');
Insert into C##_STUDENT_MARIIA.GROUPS (ID,DEPARTMENT_ID,NAME,COURSE) values ('2','2','IA-12','2');
Insert into C##_STUDENT_MARIIA.GROUPS (ID,DEPARTMENT_ID,NAME,COURSE) values ('3','2','IA-13','2');
Insert into C##_STUDENT_MARIIA.GROUPS (ID,DEPARTMENT_ID,NAME,COURSE) values ('4','2','IA-14','2');
REM INSERTING into C##_STUDENT_MARIIA.NEWS
SET DEFINE OFF;
Insert into C##_STUDENT_MARIIA.NEWS (ID,HEADER,NEWS_BODY) values ('41','Some sports competiton','Three comands will fight next Monday for the goblet of University!');
REM INSERTING into C##_STUDENT_MARIIA.SCHEDULES
SET DEFINE OFF;
Insert into C##_STUDENT_MARIIA.SCHEDULES (ID,NAME,TEACHER_ID,DISCIPLINE_ID,GROUP_ID,TIME,CLASSROOM) values ('21','MATHS IA-14','1','2','4','12:00','304');
Insert into C##_STUDENT_MARIIA.SCHEDULES (ID,NAME,TEACHER_ID,DISCIPLINE_ID,GROUP_ID,TIME,CLASSROOM) values ('2','ECONOMICS IA-12','1','1','2','13:00','126');
REM INSERTING into C##_STUDENT_MARIIA.STUDENTS
SET DEFINE OFF;
Insert into C##_STUDENT_MARIIA.STUDENTS (ID,GROUP_ID,NAME,EMAIL,PHONE) values ('1','4','Mary','mariia@gmail.com','38(038)099-77-99');
Insert into C##_STUDENT_MARIIA.STUDENTS (ID,GROUP_ID,NAME,EMAIL,PHONE) values ('3','4','Illia','illia@gmail.com','38(038)099-66-66');
REM INSERTING into C##_STUDENT_MARIIA.TEACHERS
SET DEFINE OFF;
Insert into C##_STUDENT_MARIIA.TEACHERS (ID,NAME,SURNAME,EMAIL,PHONE) values ('1','Diana','Slavenskaya','dianaSL@gmail.com','38(067)797-97-97');
Insert into C##_STUDENT_MARIIA.TEACHERS (ID,NAME,SURNAME,EMAIL,PHONE) values ('41','Irina','Pavlovna','irina@mail.com','38(097)302-30-70');
--------------------------------------------------------
--  DDL for Index SYS_C008476
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##_STUDENT_MARIIA"."SYS_C008476" ON "C##_STUDENT_MARIIA"."DEPARTMENTS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008498
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##_STUDENT_MARIIA"."SYS_C008498" ON "C##_STUDENT_MARIIA"."DISCIPLINES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008471
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##_STUDENT_MARIIA"."SYS_C008471" ON "C##_STUDENT_MARIIA"."FACULTIES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008481
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##_STUDENT_MARIIA"."SYS_C008481" ON "C##_STUDENT_MARIIA"."GROUPS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008508
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##_STUDENT_MARIIA"."SYS_C008508" ON "C##_STUDENT_MARIIA"."NEWS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008495
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##_STUDENT_MARIIA"."SYS_C008495" ON "C##_STUDENT_MARIIA"."SCHEDULES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008487
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##_STUDENT_MARIIA"."SYS_C008487" ON "C##_STUDENT_MARIIA"."STUDENTS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008504
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##_STUDENT_MARIIA"."SYS_C008504" ON "C##_STUDENT_MARIIA"."TEACHERS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table DEPARTMENTS
--------------------------------------------------------

  ALTER TABLE "C##_STUDENT_MARIIA"."DEPARTMENTS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "C##_STUDENT_MARIIA"."DEPARTMENTS" MODIFY ("FACULTY_ID" NOT NULL ENABLE);
  ALTER TABLE "C##_STUDENT_MARIIA"."DEPARTMENTS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "C##_STUDENT_MARIIA"."DEPARTMENTS" MODIFY ("SHORT_NAME" NOT NULL ENABLE);
  ALTER TABLE "C##_STUDENT_MARIIA"."DEPARTMENTS" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table DISCIPLINES
--------------------------------------------------------

  ALTER TABLE "C##_STUDENT_MARIIA"."DISCIPLINES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "C##_STUDENT_MARIIA"."DISCIPLINES" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "C##_STUDENT_MARIIA"."DISCIPLINES" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table FACULTIES
--------------------------------------------------------

  ALTER TABLE "C##_STUDENT_MARIIA"."FACULTIES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "C##_STUDENT_MARIIA"."FACULTIES" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "C##_STUDENT_MARIIA"."FACULTIES" MODIFY ("SHORT_NAME" NOT NULL ENABLE);
  ALTER TABLE "C##_STUDENT_MARIIA"."FACULTIES" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table GROUPS
--------------------------------------------------------

  ALTER TABLE "C##_STUDENT_MARIIA"."GROUPS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "C##_STUDENT_MARIIA"."GROUPS" MODIFY ("DEPARTMENT_ID" NOT NULL ENABLE);
  ALTER TABLE "C##_STUDENT_MARIIA"."GROUPS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "C##_STUDENT_MARIIA"."GROUPS" MODIFY ("COURSE" NOT NULL ENABLE);
  ALTER TABLE "C##_STUDENT_MARIIA"."GROUPS" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table NEWS
--------------------------------------------------------

  ALTER TABLE "C##_STUDENT_MARIIA"."NEWS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "C##_STUDENT_MARIIA"."NEWS" MODIFY ("HEADER" NOT NULL ENABLE);
  ALTER TABLE "C##_STUDENT_MARIIA"."NEWS" MODIFY ("NEWS_BODY" NOT NULL ENABLE);
  ALTER TABLE "C##_STUDENT_MARIIA"."NEWS" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCHEDULES
--------------------------------------------------------

  ALTER TABLE "C##_STUDENT_MARIIA"."SCHEDULES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "C##_STUDENT_MARIIA"."SCHEDULES" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "C##_STUDENT_MARIIA"."SCHEDULES" MODIFY ("TEACHER_ID" NOT NULL ENABLE);
  ALTER TABLE "C##_STUDENT_MARIIA"."SCHEDULES" MODIFY ("DISCIPLINE_ID" NOT NULL ENABLE);
  ALTER TABLE "C##_STUDENT_MARIIA"."SCHEDULES" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "C##_STUDENT_MARIIA"."SCHEDULES" MODIFY ("TIME" NOT NULL ENABLE);
  ALTER TABLE "C##_STUDENT_MARIIA"."SCHEDULES" MODIFY ("CLASSROOM" NOT NULL ENABLE);
  ALTER TABLE "C##_STUDENT_MARIIA"."SCHEDULES" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STUDENTS
--------------------------------------------------------

  ALTER TABLE "C##_STUDENT_MARIIA"."STUDENTS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "C##_STUDENT_MARIIA"."STUDENTS" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "C##_STUDENT_MARIIA"."STUDENTS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "C##_STUDENT_MARIIA"."STUDENTS" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "C##_STUDENT_MARIIA"."STUDENTS" MODIFY ("PHONE" NOT NULL ENABLE);
  ALTER TABLE "C##_STUDENT_MARIIA"."STUDENTS" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TEACHERS
--------------------------------------------------------

  ALTER TABLE "C##_STUDENT_MARIIA"."TEACHERS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "C##_STUDENT_MARIIA"."TEACHERS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "C##_STUDENT_MARIIA"."TEACHERS" MODIFY ("SURNAME" NOT NULL ENABLE);
  ALTER TABLE "C##_STUDENT_MARIIA"."TEACHERS" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "C##_STUDENT_MARIIA"."TEACHERS" MODIFY ("PHONE" NOT NULL ENABLE);
  ALTER TABLE "C##_STUDENT_MARIIA"."TEACHERS" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DEPARTMENTS
--------------------------------------------------------

  ALTER TABLE "C##_STUDENT_MARIIA"."DEPARTMENTS" ADD CONSTRAINT "FK_FACULTYIDINDEPARTMENTS" FOREIGN KEY ("FACULTY_ID")
	  REFERENCES "C##_STUDENT_MARIIA"."FACULTIES" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table GROUPS
--------------------------------------------------------

  ALTER TABLE "C##_STUDENT_MARIIA"."GROUPS" ADD CONSTRAINT "FK_DEPARTMENTIDINGROUPS" FOREIGN KEY ("DEPARTMENT_ID")
	  REFERENCES "C##_STUDENT_MARIIA"."DEPARTMENTS" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SCHEDULES
--------------------------------------------------------

  ALTER TABLE "C##_STUDENT_MARIIA"."SCHEDULES" ADD CONSTRAINT "FK_GROUPIDINSCHEDULES" FOREIGN KEY ("GROUP_ID")
	  REFERENCES "C##_STUDENT_MARIIA"."GROUPS" ("ID") ENABLE;
  ALTER TABLE "C##_STUDENT_MARIIA"."SCHEDULES" ADD CONSTRAINT "FK_DISCIPLINEIDINSCHEDULES" FOREIGN KEY ("DISCIPLINE_ID")
	  REFERENCES "C##_STUDENT_MARIIA"."DISCIPLINES" ("ID") ENABLE;
  ALTER TABLE "C##_STUDENT_MARIIA"."SCHEDULES" ADD CONSTRAINT "FK_TEACHERIDINSCHEDULES" FOREIGN KEY ("TEACHER_ID")
	  REFERENCES "C##_STUDENT_MARIIA"."TEACHERS" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table STUDENTS
--------------------------------------------------------

  ALTER TABLE "C##_STUDENT_MARIIA"."STUDENTS" ADD CONSTRAINT "FK_GROUPIDINSTUDENTS" FOREIGN KEY ("GROUP_ID")
	  REFERENCES "C##_STUDENT_MARIIA"."GROUPS" ("ID") ENABLE;
