create table tbl_member (
email varchar2(100),
pwd varchar2(1000) not null,
nickname varchar2(100) not null,
regd8 date default sysdate);

alter table tbl_member add constraint pk_member
primary key(email);

------------------ product part ------------------
create table tbl_product (
pno number(10,0),
title varchar2(200) not null,
content varchar2(4000) not null,
writer varchar2(100) not null,
price number(8,0) default 0,
readcount number(11,0) default 0,
regd8 date default sysdate,
modd8 date default sysdate,
imgfile varchar2(1000) default 'NONE'
);

alter table tbl_product add constraint pk_product
primary key (pno);

create sequence seq_product_pno
start with 1
increment by 1
nocycle nocache;

------------------ Comment Part -------------------
create table tbl_comment(
cno number(10,0),
pno number(10,0) not null,
content varchar2(1000) not null,
writer varchar2(100) not null,
regd8 date default sysdate,
modd8 date default sysdate);

alter table tbl_comment
add constraint pk_comment primary key(cno);

alter table tbl_comment
add constraint fk_comment_product
foreign key(pno) references tbl_product(pno);

create sequence seq_comment_cno
start with 1
increment by 1
nocycle nocache;

---------------------- AOP Part ---------------
drop sequence seq_product_pno;
drop sequence seq_comment_cno;

create sequence seq_product_pno
start with 1
increment by 1
nocycle nocache;

create sequence seq_comment_cno
start with 1
increment by 1
nocycle nocache;

truncate table tbl_comment;
truncate table tbl_product;


alter table tbl_product
add (cmtcnt number(10,0) default 0);
















