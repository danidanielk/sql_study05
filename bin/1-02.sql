1.음료 테이블과 카페 테이블을 만들기
--음료 테이블 : 음료 이름/ 가격 / 판매하는 카페의 이름
--카페테이블 : 카페이름 / 지역 / 좌석수
--조건 각 테이블에서 커피이름, 카페이름은 고유한 값을 갖는다.

2.조건에 맞는 테이블 생성
--a카페는 서울에 위치하고 좌석이 100석 아메리카노 2천원, 라떼 3천원, 녹차 2500원.
--b카페는 판교에 위치하고 좌석이 80석  홍차 2500원,	스무디 3천원, 에스프레소 4천원.

3.쿼리문 작성
-- 평균가보다 비싼 음료는 몇 종류 인지
select count(*) from drink where d_price>(select avg(d_price)from drink);
-- 제일 싼 음료를 파는 카페의 이름은
select c_name from cafe where c_name = ( select d_cafe from drink where d_price = (select min(d_price)from drink));
-- 서울에 있는 카페에서 만드는 음료 평균가격은
select avg(d_price) from drink where d_cafe=(select c_name from cafe where c_location='서울');
-- 좌석이 90석 이상인 카페에서 파는 음료의 이름은
select d_name from drink where d_cafe=( select c_name from cafe where c_seat >=90);
-- 평균가 이하인 음료의 이름
select d_name from drink where d_price <=(select avg(d_price)from drink);
-- 가장 비싼 음료를 파는 카페는 어디에 있는지
select c_location from cafe   where c_name= ( select d_cafe from drink where d_price=(     select max(d_price)from drink));


create table drink (
d_name varchar2(30 char) primary key,
d_price number(8) not null,
d_cafe varchar2(30 char) not null
);
insert into drink values('아메리카노',2000,'a');
insert into drink values('라떼',3000,'a');
insert into drink values('녹차',2500,'a');
insert into drink values('홍차',2500,'b');
insert into drink values('스무디',3000,'b');
insert into drink values('에스프레소',4000,'b');

create table cafe (
c_name varchar2(30 char) primary key,
c_location varchar2(30 char) not null,
c_seat number(4) not null
);
drop table cafe cascade constraint purge;
insert into cafe values('a','서울',100);
insert into cafe values('b','판교',80);