--과자들 중 최고가
select s_price from aug30_snack where s_price = (select max(s_price) from aug30_snack); 
--제일비싼 과자이름,제조사,가격
select s_name,s_maker,s_price from aug30_snack where s_price = (select max(s_price)from aug30_snack);
--제일 싼 과자는 어디에서 만드나요
select s_maker from aug30_snack where s_price =(select min(s_price)from aug30_snack);
--평균가보다 비싼 과자는 몇 종류?
select count(s_name) from aug30_snack where s_price > (select avg(s_price) from aug30_snack);
--유통기한이 가장 오래남은 과자의 전체정보.
select * from aug30_snack where s_date = (select max(s_date)from aug30_snack);



--직원 수 제일 적은 회사에서 만드는 과자이름, 가격
select s_name,s_price from aug30_snack where s_maker = (select m_name from maker where m_staff = (select min(m_staff)from maker));
--제일 비싼 과자를 만드는 회사는 어디에 있는지
select m_address from maker where m_name =(select s_maker from AUG30_SNACK where s_price =(select max(s_price)from AUG30_SNACK));
--부천에 있는 회사에서 만드는 과자의 평균가
select avg(s_price) from aug30_snack where s_maker=(select m_name from maker where m_address='호주');
--평균가 이상의 과자를 만드는 회사의 이름,위치 --error : single-row subquery 어쩌고 저쩌고 in 사용해서 해결
select m_name, m_address from maker where m_name in (select s_maker from AUG30_SNACK where s_price >= (select avg(s_price)from maker));



select *from tab;
--테이블에 데이터를 검색, 삽입, 수정, 삭제 하는데 사용하는 문장인
--데이터 조작어 DML 중에서 데이터를 넣게하는 명령어인 insert 와
--데이터를 검색 조회할 수 있는 명령어인 select 의 구조를 공부했다.

distinct 중복제거해주는 역할 다시 복습하자.

---------------------------------------
오늘 배울 내용 서브쿼리(subquery)****
--select 문 안에 다시 select 문을 사용. : 하나의 SQL 문 안에 다른 SQL문이 중첩된 질의문
--다른 테이블에서 가져온 데이터로 현재 테이블에 있는 정보를 찾거나 가공할 때 사용. 
--보통 데이터가 대량 일 때 데이터를 모두 합쳐서 연산하는 join 보다 필요한 데이터만찾아내서 공급해주는 subquery 가 성능이 더 좋지만
--회사마다 join을 사용하는곳도 많음.
--주질의	(main query,외부질의)	와 
--부속질의	(subquery,내부질의) 	로 구성된다.
select s_name, s_price from aug30_snack where s_price <(select avg(s_price) from aug30_snack);



select s_maker from aug30_snack;

---------------------------------------
create table maker (
m_name varchar(20 char) primary key,
m_address varchar(30 char) not null,
m_staff number(3)not null
);

insert into maker values('오리온','화성',56);
insert into maker values('롯데','일본',20);
insert into maker values('코카콜라','미국',500);
insert into maker values('크라운','호주',450);
insert into maker values('해태','대한민국',980);