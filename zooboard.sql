
CREATE TABLE zooboard(
    bno NUMBER NOT NULL,
    writer varchar2(100) NOT NULL,
    title varchar2(100) NOT NULL,
    regdate date DEFAULT SYSDATE,
    content varchar2(500),
    read_count number default 0,
    grade number,
    hos_code number
    );
    
    DROP TABLE zooboard;