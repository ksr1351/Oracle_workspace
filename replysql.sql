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
-----------------------------------------------------------------------

DROP TABLE reply;

CREATE table reply(
    rnum number,
    bnum number CONSTRAINT reply_bnum_const references board(num),
    message varchar2(1000),
    regdate date,
    replyEmail varchar2(50)
);