create table mem(
num number(11) ,/*��Ű*/
id varchar2(10) constraint mem_id_nn not null,/*not null�� colum�����θ� �ټ� �ִ�*/
pwd varchar2(10),
name varchar2(24),
gender VARCHAR2(8), /*unic �༭ �ĺ�Ű*/
edate date,
constraint mem_num_pk primary key(num),
constraint mem_id_uq unique(id),
constraint mem_gender_ck check(gender ='����' or gender = '����'));

create sequence mem_seq
increment by 1
start with 1;
