1.���� ���̺�� ī�� ���̺��� �����
--���� ���̺� : ���� �̸�/ ���� / �Ǹ��ϴ� ī���� �̸�
--ī�����̺� : ī���̸� / ���� / �¼���
--���� �� ���̺��� Ŀ���̸�, ī���̸��� ������ ���� ���´�.

2.���ǿ� �´� ���̺� ����
--aī��� ���￡ ��ġ�ϰ� �¼��� 100�� �Ƹ޸�ī�� 2õ��, �� 3õ��, ���� 2500��.
--bī��� �Ǳ��� ��ġ�ϰ� �¼��� 80��  ȫ�� 2500��,	������ 3õ��, ���������� 4õ��.

3.������ �ۼ�
-- ��հ����� ��� ����� �� ���� ����
select count(*) from drink where d_price>(select avg(d_price)from drink);
-- ���� �� ���Ḧ �Ĵ� ī���� �̸���
select c_name from cafe where c_name = ( select d_cafe from drink where d_price = (select min(d_price)from drink));
-- ���￡ �ִ� ī�信�� ����� ���� ��հ�����
select avg(d_price) from drink where d_cafe=(select c_name from cafe where c_location='����');
-- �¼��� 90�� �̻��� ī�信�� �Ĵ� ������ �̸���
select d_name from drink where d_cafe=( select c_name from cafe where c_seat >=90);
-- ��հ� ������ ������ �̸�
select d_name from drink where d_price <=(select avg(d_price)from drink);
-- ���� ��� ���Ḧ �Ĵ� ī��� ��� �ִ���
select c_location from cafe   where c_name= ( select d_cafe from drink where d_price=(     select max(d_price)from drink));


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
drop table cafe cascade constraint purge;
insert into cafe values('a','����',100);
insert into cafe values('b','�Ǳ�',80);