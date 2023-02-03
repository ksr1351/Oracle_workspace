
2022/01/17

SELECT * FROM  mem;

--두개의 테이블을 join해서 가져옴 (employees, departments)
SELECT e.employee_id, e.first_name, e.job_id, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;



--------------------------------------------------------------

2022/01/18

SELECT * FROM  mem
ORDER BY num DESC;

SELECT d.department_id, d.department_name, e.employee_id, e.first_name, e.job_id
FROM departments d, employees e
WHERE d.department_id = e.department_id;

SELECT * FROM mem
WHERE name LIKE '%길%'
OR age>20;


------------------------------------------------------------

2023/01/26

SELECT * FROM mem
ORDER BY num DESC;

INSERT INTO mem(num)
VALUES (100);

DELETE FROM mem
WHERE num=108;

commit;


---------------------------------------------------------

2023-01-27

DROP TABLE board;


CREATE TABLE   board(
    num number CONSTRAINT board_num PRIMARY KEY,
    writer varchar2(50),
    subject varchar2(50),
    reg_date date,
    readcount number default 0, 
    ref number, 
    re_step number, 
    re_level number, 
    content varchar2(100),
    ip varchar2(20),
    upload varchar2(300),
    memberEmail varchar2(50)   
);


--시퀀스가 없는 경우
DROP SEQUENCE board_num_seq;
CREATE SEQUENCE board_num_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;


INSERT INTO board 
VALUES(board_num_seq.nextval, '홍길동','제목1',sysdate,0,board_num_seq.nextval,
0,0,'내용 테스트.......','127.0.0.1','sample.txt','young@aaaa.com');



commit;

select * from board;


------------------------------------------------------------

2023/01/30


TRUNCATE TABLE board;



SELECT * FROM board
ORDER BY num DESC;

DELETE FROM board
WHERE num =3;





commit;


-------------------------------------------------------

2023/01/31

SELECT b.*
FROM(SELECT rownum AS rm, a.*
FROM (SELECT * FROM board
            ORDER BY ref DESC, re_step ASC)a)b
WHERE b.rm>=1 AND b.rm<=6;


DELETE FROM board;
commit;




----------------------------------------------------

2023/02/01

DROP TABLE members;

CREATE TABLE members(
    memberEmail varchar2(50) ,  --이메일
    memberPass varchar2(30), --비밀번호
    memberName varchar2(30), --이름
    memberPhone char(11), --전화번호
    memberType number(1) default 1, --회원구분 일반회원 1, 관리자 2
    constraint members_email primary key(memberEmail)
    );
    

--테이블 삭제하지 않고 데이터 수정하기
DELETE FROM members;

ALTER TABLE members
MODIFY memberPhone char(11);


commit;


SELECT * FROM members;

select * from board
order by num desc;



ALTER TABLE board
DROP COLUMN writer;

SELECT b.*, m.memberName
FROM board b, members m
WHERE b.memberEmail=m.memberEmail
AND m.memberEmail=(SELECT memberEmail FROM board WHERE num=32)
AND num=32;


SELECT memberName 
FROM members
WHERE memberEmail='ccc@daum.net';



SELECT * FROM employees;

commit;
