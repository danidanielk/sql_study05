
1.���������� ����...snack ���̺� �̿��Ͽ� �������� �ۼ�

--���ڵ� �� �ְ�
select max(s_price)from snack;
--���Ϻ�� �����̸�,������,����
select s_name , s_maker , s_price from snack where s_price in (select max(s_price) from snack);
--���� �� ���ڴ� ��𿡼� ���峪��
select s_maker from snackwhere s_price = (select min(s_price)from snack);
--��հ����� ��� ���ڴ� �� ����?
select count(s_name) from snack where s_price > (select avg(s_price)from snack);
--��������� ���� �������� ������ ��ü����.
select * from snack where s_date = (select max(s_date)from snack);

create table snack (
s_no number(5) primary key,
s_name varchar(10 char) not null,
s_maker varchar(10 char) not null,
s_price number(10)not null,
s_date date not null
);

create sequence snack_seq;

insert into snack values(snack_seq.nextval,'����Ŀ��','������',2000,sysdate);
insert into snack values(snack_seq.nextval,'������','�Ե�',2500,sysdate);
insert into snack values(snack_seq.nextval,'������','��ī�ݶ�',500,sysdate);
insert into snack values(snack_seq.nextval,'��ĵ��','�Ե�',3500,sysdate);
insert into snack values(snack_seq.nextval,'�����','������',1500,sysdate);
insert into snack values(snack_seq.nextval,'��������','����',1500,sysdate);
insert into snack values(snack_seq.nextval,'��¡���','ũ���',1500,sysdate);
insert into snack values(snack_seq.nextval,'��Ŭ����','ũ���',1500,sysdate);
insert into snack values(snack_seq.nextval,'���޴���','ũ���',1500,sysdate);


------------------------------------------------------------------------
2.������ ���� snack table and maker table �� �̿��Ͽ� ���������� �ۼ�

--���� �� ���� ���� ȸ�翡�� ����� �����̸�, ����
select s_price , s_name from snack where s_maker=(select m_name from maker where m_staff = (select min(m_staff)from maker));
--���� ��� ���ڸ� ����� ȸ��� ��� �ִ���
select m_address from maker where m_name=(select s_maker from snack where s_price=(select max(s_price)from snack ))	;
--��õ�� �ִ� ȸ�翡�� ����� ������ ��հ�
select avg(s_price) from snack where s_maker = (select m_name from maker where m_address = '�Ϻ�'	);
--��հ� �̻��� ���ڸ� ����� ȸ���� �̸�,��ġ --error : single-row subquery ��¼�� ��¼�� in ����ؼ� �ذ�
select m_address,m_name from maker where m_name in (select s_maker from snack where s_price >= (select avg(s_price)from snack));

create table maker (
m_name varchar(20 char) primary key,
m_address varchar(30 char) not null,
m_staff number(3)not null
);

insert into maker values('������','ȭ��',56);
insert into maker values('�Ե�','�Ϻ�',20);
insert into maker values('��ī�ݶ�','�̱�',500);
insert into maker values('ũ���','ȣ��',450);
insert into maker values('����','���ѹα�',980);

select * from maker;
----------------------------------------------------------------------------------
1.���� ���̺�� ī�� ���̺��� �����
--���� ���̺� : ���� �̸�/ ���� / �Ǹ��ϴ� ī���� �̸�
--ī�����̺� : ī���̸� / ���� / �¼���
--���� �� ���̺��� Ŀ���̸�, ī���̸��� ������ ���� ���´�.

2.���ǿ� �´� ���̺� ����
--aī��� ���￡ ��ġ�ϰ� �¼��� 100�� �Ƹ޸�ī�� 2õ��, �� 3õ��, ���� 2500��.
--bī��� �Ǳ��� ��ġ�ϰ� �¼��� 80��  ȫ�� 2500��,	������ 3õ��, ���������� 4õ��.

3.������ �ۼ�
-- ��հ����� ��� ����� �� ���� ����
select count(d_name) from drink where d_price > (select avg(d_price)from drink);
-- ���� �� ���Ḧ �Ĵ� ī���� �̸���
select d_cafe from drink where d_price =(select min(d_price)from drink);
-- ���￡ �ִ� ī�信�� ����� ���� ��հ�����
select avg(d_price) from drink where d_cafe =(select c_name from cafe where c_location = '����');
-- �¼��� 90�� �̻��� ī�信�� �Ĵ� ������ �̸���
select d_name from drink where d_cafe = (select c_name from cafe where c_seat >= 90);
-- ��հ� ������ ������ �̸�
select d_name from drink where d_price <= (select avg(d_price)from drink);
-- ���� ��� ���Ḧ �Ĵ� ī��� ��� �ִ���
select d_cafe from drink where d_price =(select max(d_price)from drink);

create table drink (
d_name varchar2(30 char) primary key,
d_price number(8) not null,
d_cafe varchar2(30 char) not null
);
insert into drink values('�Ƹ޸�ī��',2000,'a');
insert into drink values('��',3000,'a');
insert into drink values('����',2500,'a');
insert into drink values('ȫ��',2500,'b');
insert into drink values('������',3000,'b');
insert into drink values('����������',4000,'b');

create table cafe (
c_name varchar2(30 char) primary key,
c_location varchar2(30 char) not null,
c_seat number(4) not null
);

select round(avg(d_price))from drink;
drop table cafe cascade constraint purge;
insert into cafe values('a','����',100);
insert into cafe values('b','�Ǳ�',80);