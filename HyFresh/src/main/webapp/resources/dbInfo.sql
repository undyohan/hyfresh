CREATE TABLE tbl_MEMBER(
 mno number NOT null,
 email varchar2(100) NOT NULL,
 pwd varchar2(100) NOT null,
 name varchar2(100),
 addrno number(10),
 tel varchar2(100),
 birth DATE,
 grade number(10) DEFAULT 0,
 regd8 DATE DEFAULT sysdate,
 point number(10) DEFAULT 0
);

CREATE SEQUENCE seq_member_mno 
start with 1
increment by 1
nocycle nocache;

ALTER TABLE tbl_member add(
CONSTRAINT pk_member
PRIMARY KEY (mno)
);

INSERT INTO tbl_member (email,pwd,name,grade,point)
values(admin@admin.com,1234,ADMIN,99,100000);

----------------------------------Address----------------------------------
CREATE TABLE tbl_Address(
addrno NUMBER NOT null,
mno NUMBER(10),
addrname varchar2(100),
receiver varchar2(100),
addr varchar2(1000),
tel varchar2(100)
);

CREATE SEQUENCE seq_Address_addrno 
start with 1
increment by 1
nocycle nocache;

ALTER TABLE tbl_Address add(
CONSTRAINT pk_Address
PRIMARY KEY (addrno)
);

alter table tbl_Address
add constraint fk_mno_address
foreign key(mno) references tbl_MEMBER(mno);

----------------------------------Tag----------------------------------
create table tbl_tag (
tno number not null,
tname varchar2(100));

alter table tbl_tag add constraint pk_tag
primary key(tno);

create sequence seq_tag_tno
start with 1
increment by 1
nocycle nocache;


----------------------------------Product----------------------------------
create table tbl_product (
pno number NOT null,
cateno number(10),
mno number(10),
tno number(10),
pname varchar2(200),
price number(10) default 0,
content varchar2(2000),
img varchar2(2000) DEFAULT 'NONE',
regd8 date default sysdate,
modd8 date default sysdate,
stock number(10) DEFAULT 0,
dfee number(10) DEFAULT 0,
readcount NUMBER(10) DEFAULT 0,
sellcount number(10) DEFAULT 0,
discount number(10) DEFAULT 0,
custom varchar2(10) DEFAULT Null
);

CREATE SEQUENCE seq_product_pno
start with 1
increment by 1
nocycle nocache;

ALTER TABLE tbl_product add(
CONSTRAINT pk_product
PRIMARY KEY (pno)
);

alter table tbl_product
add constraint fk_product_member
foreign key(mno) references tbl_MEMBER(mno);

alter table tbl_product
add constraint fk_tno_product
foreign key(tno) references tbl_TAG(tno);

----------------------------------Cart----------------------------------
create table tbl_cart(
cno number not null,
pno number not null,
mno number not null,
qt number not null,
getd8 date default sysdate);

alter table tbl_cart add constraint pk_cart
primary key(cno);

create sequence seq_cart_cno
start with 1
increment by 1
nocycle nocache;

alter table tbl_cart
add constraint fk_pno_cart
foreign key(pno) references tbl_product(pno);

alter table tbl_cart
add constraint fk_mno_cart
foreign key(mno) references tbl_member(mno);


----------------------------------Category----------------------------------
create table tbl_category(
cateno number not null,
catename varchar2(100) not null,
catecode number not null
);

alter table tbl_category add constraint pk_category
primary key (cateno);

create sequence seq_member_cateno
start with 1
increment by 1
nocycle nocache;

---------------------------------Review----------------------------------
create table tbl_review(
rno number not null,
pno number not null,
mno number not null,
rate number (1,1) not null,
writer varchar2(100) not null,
title varchar2(400) not null,
content varchar2(1000) not null,
img varchar2(2000) DEFAULT 'NONE',
regd8 date default sysdate,
modd8 date default sysdate);

alter table tbl_review add constraint pk_review
primary key(rno);

alter table tbl_review
add constraint fk_pno_review
foreign key(pno) references tbl_product(pno);

alter table tbl_review
add constraint fk_mno_review
foreign key(mno) references tbl_member(mno);

create sequence seq_review_rno
start with 1
increment by 1
nocycle nocache;

----------------------------------Notice----------------------------------
create table tbl_notice(
nno number not null,
mno number not null,
title varchar2(400) not null,
content varchar2(1000) not null,
img varchar2(2000) DEFAULT 'NONE',
regd8 date default sysdate,
modd8 date default sysdate,
readcount number (10,0) DEFAULT 0
);

alter table tbl_notice add constraint pk_notice
primary key(nno);

create sequence seq_notice_nno
start with 1
increment by 1
nocycle nocache;

----------------------------------PQuestion----------------------------------
create table tbl_pquestion (
pqno number not null,
pno number not null,
mno number not null,
writer varchar2(100) not null,
islock number(2,0) not null,
title varchar2(100) not null,
content varchar2(1000) not null,
regd8 date default sysdate);

alter table tbl_pquestion add constraint pk_pquestion
primary key(pqno);

create sequence seq_pquestion_pqno
start with 1
increment by 1
nocycle nocache;

alter table tbl_pquestion
add constraint fk_pno_pquestion foreign key (pno)
references tbl_product(pno);

alter table tbl_pquestion
add constraint fk_mno_pquestion foreign key (mno)
references tbl_member(mno);

----------------------------------PAnswer----------------------------------
create table tbl_panswer (
pano number not null,
pqno number not null,
mno number not null,
content varchar2(100) not null,
regd8 date default sysdate);

alter table tbl_panswer add constraint pk_panswer
primary key(pano);

create sequence seq_panswer_pano
start with 1
increment by 1
nocycle nocache;

alter table tbl_panswer 
add constraint fk_pqno_panswer foreign key (pqno)
references tbl_pquestion(pqno);

alter table tbl_panswer 
add constraint fk_mno_panswer foreign key (mno)
references tbl_member (mno);

----------------------------------Question----------------------------------
create table tbl_question (
qno number not null,
mno number not null,
writer varchar2(100) not null,
title varchar2(100) not null,
content varchar2(1000) not null,
img varchar2(1000),
regd8 date default sysdate);

alter table tbl_question add constraint pk_question
primary key(qno);

create sequence seq_question_qno
start with 1
increment by 1
nocycle nocache;

alter table tbl_question
add constraint fk_mno_question foreign key (mno)
references tbl_member(mno);

----------------------------------Answer----------------------------------
create table tbl_answer (
ano number not null,
qno number not null,
mno number not null,
content varchar2(100) not null,
regd8 date default sysdate);

alter table tbl_answer add constraint pk_answer
primary key(ano);

create sequence seq_answer_ano
start with 1
increment by 1
nocycle nocache;

alter table tbl_answer 
add constraint fk_qno_answer foreign key (qno)
references tbl_question(qno);

alter table tbl_answer 
add constraint fk_mno_answer foreign key (mno)
references tbl_member (mno);


----------------------------------Order----------------------------------
CREATE TABLE tbl_order(
  ocode varchar2(50) not null,
  mno number NOT NULL,
  addrno NUMBER(10),
  orderd8 DATE DEFAULT sysdate,
  oprice number(10) DEFAULT 0,
  memo varchar2(200) DEFAULT null
);

alter table tbl_order add 
constraint pk_order
primary key (ocode);

alter table tbl_order
add constraint fk_mno_order
foreign key(mno) references tbl_MEMBER(mno);

alter table tbl_order
add constraint fk_addrno_order
foreign key(addrno) references tbl_Address(addrno);

----------------------------------OrderDetail----------------------------------
CREATE TABLE tbl_orderdetail(
  odno number NOT NULL,
  ocode varchar2(50) not null,
  pno number NOT NULL,
  rno number(10),
  qt number(10),
  deliverd8 Date,
  sendd8 DATE DEFAULT sysdate,
  status number(10) DEFAULT 0
);

ALTER TABLE tbl_orderdetail add(
CONSTRAINT pk_orderdetail
PRIMARY KEY (odno)
);

CREATE SEQUENCE seq_orderdetail_odno 
start with 1
increment by 1
nocycle nocache;

alter table tbl_orderdetail
add constraint fk_pno_orderdetail
foreign key(pno) references tbl_product(pno);

alter table tbl_orderdetail
add constraint fk_rno_orderdetail
foreign key(rno) references tbl_review(rno);