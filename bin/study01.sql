--2000 �� ������ ������ �ּҰ����� ������
select min(s_price) from AUG30_SNACK where s_price <=2000;
--��� ������ ��հ���
select avg(s_price) from aug30_snack;
--������ �̸��� ������ 30% ���ε� �ݾ�
select s_name, s_price*0.7 from aug30_snack;
--3500���� ������ ������ �?
select count(s_price) from aug30_snack where s_price = 3500;
--3000�� ������ ������ �̸�,ȸ���̸�
select s_name,s_maker from aug30_snack where s_price <=3000;
--��� ���� �̸�, ����, ������� ��ȸ
select s_name, s_price , s_date from aug30_snack;
--��� ���� �̸�, ����, �ΰ��� ��ȸ 10%
select s_name , s_price , s_price*0.1 as �ΰ��� from aug30_snack;
--��� ���� �̸�, ����, �ǸŰ� ��ȸ 20%����
select s_name , s_price , s_price*0.8 as �ǸŰ� from aug30_snack;
--3000�� ���� ū �ݾ��� ���ڵ��� ��հ� ��ȸ
select avg(s_price) from aug30_snack where s_price > 3000;
--�ְ�,������,�� ���� ���� ������� ��ȸ
select max(s_price),min(s_price),count(s_name)from aug30_snack;
--3000�� �̻��� ������ ��ü ���� ��ȸ
select * from aug30_snack where s_price >= 3000;
--3000�� �̸��� ������ �̸�, ����, �ǸŰ� ��ȸ 20% ����
select s_name ,s_price , s_price*0.8 as �ǸŰ� from aug30_snack where s_price <3000;
--��Ϲ���Ĩ�� ���� ��ȸ
select s_price from aug30_snack where s_name='����Ŀ��';
--ũ��� ȸ���� ���� ���� ���� ��ȸ
select sum(s_price) from aug30_snack where s_maker ='ũ���';
--9�� ������ �Ծ�� �ϴ� ���� �̸�, ����, ������� ��ȸ
select s_name, s_price , s_date from aug30_snack where s_date < to_date('2022-10-01 00:00:00','YYYY-MM-DD HH24-MI-SS');
--'��'�� ���� ȸ�翡�� ���� ������ �̸� ��ȸ
select s_name from aug30_snack where s_maker like'%��%';
--'��' ������ ���ڵ� ��հ� ��ȸ
select avg(s_price) from aug30_snack where s_maker like'%��%';
--ũ�����ڰų�,����~�ΰ� �̸�,����ȸ��,���� ��ȸ
select s_name,s_maker,s_price from aug30_snack where s_maker='ũ���' or s_name like '%����%';
--������ �̸��� '���޴���'���� �����ϰų� '��' �� ������ ������ �̸�,������ ,���� ��ȸ 
select s_name, s_maker, s_price from aug30_snack where s_name like'���޴���%' or s_name like '%��';
--���� ������ �߿��� ȸ�簡 ũ����̰� ������ 1000�� �����̰ų� 3000�� �̻��� ���� ��ü���� ��ȸ
select * from aug30_snack where (s_maker ='ũ���') and (s_price <= 1000 or s_price >=3000);
--�Ե� �Ǵ� ���� ȸ���� ���� ��� ������ 1800 �� �̻��� �� �� ȸ���� ��� ���� ������ �� ����
select s_maker , round(avg(s_price)) from aug30_snack group by s_maker having avg(s_price) >= 1800 order by avg(s_price) desc;
--ȸ�纰�� �׷��� ��� ���� ��հ���, �ּҰ���, �ְ��� �� �˰������
select decode(s_maker,null,'��ü',s_maker)s_maker,sum(s_price)as �հ�,round(avg(s_price)) as ��հ�,min(s_price)as �ּҰ�,max(s_price)as �ְ� from aug30_snack group by rollup(s_maker);
--ȸ�� �̸�, ȸ�纰 ���� �� ���� �հ�� ��� ���ڵ��� �հ�
select decode(s_maker,null,'��ü',s_maker)s_maker,sum(s_price) as �հ� from aug30_snack group by rollup(s_maker);
--ȸ�纰�� ���� ��� ������ 2000�� �̻��� ȸ���� �̸��� ���� ��� ������ ��ȸ.
select decode(s_maker,null,'��ü',s_maker)s_maker,round(avg(s_price)) as ��հ���,count(s_name)as �������� from aug30_snack group by rollup(s_maker) having avg(s_price)>=2000 order by count(s_name)asc;

create table aug30_snack (
s_no number(5) primary key,
s_name varchar(10 char) not null,
s_maker varchar(10 char) not null,
s_price number(10)not null,
s_date date not null
);

create sequence aug30_snack_seq;

insert into aug30_snack values(aug30_snack_seq.nextval,'����Ŀ��','������',2000,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'������','�Ե�',2500,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'������','��ī�ݶ�',500,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'��ĵ��','�Ե�',3500,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'�����','������',1500,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'��������','����',1500,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'��¡���','ũ���',2000,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'��Ŭ����','ũ���',4000,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'���޴���','ũ���',3000,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'����','����',1000,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'�ٰ�Ʈ','ũ���',1000,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'Ŀ�ǻ���','����',5000,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'ġ������ũ','������',4500,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'����','����',2500,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'�Ұ�����','�Ե�',3000,sysdate);


------------------------------------------------------------------------------------------


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