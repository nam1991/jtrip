create table mem(
num number(11) ,/*주키*/
id varchar2(10) constraint mem_id_nn not null,/*not null은 colum단위로만 줄수 있다*/
pwd varchar2(10),
name varchar2(24),
gender VARCHAR2(8), /*unic 줘서 후보키*/
edate date,
constraint mem_num_pk primary key(num),
constraint mem_id_uq unique(id),
constraint mem_gender_ck check(gender ='남자' or gender = '여자'));

create sequence mem_seq
increment by 1
start with 1;
