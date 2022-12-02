--���ڵ� �� �ְ�
select s_price from aug30_snack where s_price = (select max(s_price) from aug30_snack); 
--���Ϻ�� �����̸�,������,����
select s_name,s_maker,s_price from aug30_snack where s_price = (select max(s_price)from aug30_snack);
--���� �� ���ڴ� ��𿡼� ���峪��
select s_maker from aug30_snack where s_price =(select min(s_price)from aug30_snack);
--��հ����� ��� ���ڴ� �� ����?
select count(s_name) from aug30_snack where s_price > (select avg(s_price) from aug30_snack);
--��������� ���� �������� ������ ��ü����.
select * from aug30_snack where s_date = (select max(s_date)from aug30_snack);



--���� �� ���� ���� ȸ�翡�� ����� �����̸�, ����
select s_name,s_price from aug30_snack where s_maker = (select m_name from maker where m_staff = (select min(m_staff)from maker));
--���� ��� ���ڸ� ����� ȸ��� ��� �ִ���
select m_address from maker where m_name =(select s_maker from AUG30_SNACK where s_price =(select max(s_price)from AUG30_SNACK));
--��õ�� �ִ� ȸ�翡�� ����� ������ ��հ�
select avg(s_price) from aug30_snack where s_maker=(select m_name from maker where m_address='ȣ��');
--��հ� �̻��� ���ڸ� ����� ȸ���� �̸�,��ġ --error : single-row subquery ��¼�� ��¼�� in ����ؼ� �ذ�
select m_name, m_address from maker where m_name in (select s_maker from AUG30_SNACK where s_price >= (select avg(s_price)from maker));



select *from tab;
--���̺� �����͸� �˻�, ����, ����, ���� �ϴµ� ����ϴ� ������
--������ ���۾� DML �߿��� �����͸� �ְ��ϴ� ��ɾ��� insert ��
--�����͸� �˻� ��ȸ�� �� �ִ� ��ɾ��� select �� ������ �����ߴ�.

distinct �ߺ��������ִ� ���� �ٽ� ��������.

---------------------------------------
���� ��� ���� ��������(subquery)****
--select �� �ȿ� �ٽ� select ���� ���. : �ϳ��� SQL �� �ȿ� �ٸ� SQL���� ��ø�� ���ǹ�
--�ٸ� ���̺��� ������ �����ͷ� ���� ���̺� �ִ� ������ ã�ų� ������ �� ���. 
--���� �����Ͱ� �뷮 �� �� �����͸� ��� ���ļ� �����ϴ� join ���� �ʿ��� �����͸�ã�Ƴ��� �������ִ� subquery �� ������ �� ������
--ȸ�縶�� join�� ����ϴ°��� ����.
--������	(main query,�ܺ�����)	�� 
--�μ�����	(subquery,��������) 	�� �����ȴ�.
select s_name, s_price from aug30_snack where s_price <(select avg(s_price) from aug30_snack);



select s_maker from aug30_snack;

---------------------------------------
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