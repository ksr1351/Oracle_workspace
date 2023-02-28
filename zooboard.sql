
CREATE TABLE zooboard(
    num number CONSTRAINT board_num PRIMARY KEY,
    writer varchar2(50),
    title varchar2(50),
    regdate date,
    content varchar2(500),
    read_count number default 0,
    grade number,
    hos_code number
    );
    