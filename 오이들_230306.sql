-- sequence 생성
create sequence customer_code_seq
    start with 1
    increment by 1
    nocache
    nocycle;
    
create sequence company_code_seq
    start with 1
    increment by 1
    nocache
    nocycle;
    
create sequence hotel_code_seq
    start with 1
    increment by 1
    nocache
    nocycle;

create sequence room_code_seq
    start with 1
    increment by 1
    nocache
    nocycle;
    
create sequence booking_code_seq
    start with 1
    increment by 1
    nocache
    nocycle;

create sequence board_code_seq
    start with 1
    increment by 1
    nocache
    nocycle;

create sequence reply_code_seq
    start with 1
    increment by 1
    nocache
    nocycle;
    
create sequence notice_code_seq
    start with 1
    increment by 1
    nocache
    nocycle;
    
create sequence image_code_seq
    start with 1
    increment by 1
    nocache
    nocycle;
    
create sequence review_code_seq
    start with 1
    increment by 1
    nocache
    nocycle;


-- table 생성
-- 관리자 테이블
CREATE TABLE admin (
    admin_id varchar2(10) not null,
    admin_pwd varchar2(20),
    name varchar2(10),
    regdate date default sysdate,
    moddate date default sysdate
);

-- 일반회원 테이블
CREATE TABLE customer (
    customer_code number CONSTRAINT customer_code_seq PRIMARY KEY,
    id varchar2(20) not null, --아이디
    pwd varchar2(20) not null, --비번
    name varchar2(20) not null, --이름
    contact varchar(11) not null, --전화번호
    type number not null, --회원구분 일반회원 1, 기업회원 2
    regdate date default sysdate,
    moddate date default sysdate   
);

-- 기업회원 테이블
CREATE TABLE company (
    company_code number CONSTRAINT company_code_seq PRIMARY KEY,
    id varchar2(20) not null, --아이디
    pwd varchar2(20) not null, --비번
    name varchar2(20) not null, --기업명
    license varchar2(10) not null, --사업자등록번호
    type number not null, --회원구분 일반회원 1, 기업회원 2
    regdate date default sysdate,
    moddate date default sysdate   
);

-- 호텔정보 테이블
CREATE TABLE hotel (
    hotel_code number CONSTRAINT hotel_code_seq PRIMARY KEY,
    name varchar2(20), --호텔명
    type varchar2(20), --호텔유형
    address varchar2(100), --호텔주소
    contact varchar(11), --전화번호
    rating number, --호텔등급
    regdate date default sysdate,
    moddate date default sysdate
);

-- 객실정보 테이블
CREATE TABLE room (
    room_code number PRIMARY KEY,
    hotel_code number not null, --FK
    room_name varchar2(100), --호수,방이름
    room_type varchar2(10), --객실타입
    room_price number, --객실가격
    room_max number, --객실최대수용인원
    room_desc varchar2(1000),
    checkin varchar2(100),
    checkout varchar2(100),
    regdate date default sysdate, --객실등록일
    moddate date default sysdate, --객실정보수정일
    enabled varchar2(1) --사용유무
);

-- 예약정보 테이블
CREATE TABLE booking (
    booking_code number CONSTRAINT booking_code_seq PRIMARY KEY,
    customer_code number not null, --FK
    room_code number not null, --FK
    guests number, --예약인원
    checkin varchar2(100),
    checkout varchar2(100),
    status varchar2(1), --예약상태 (대기중, 완료, 취소)
    regdate date default sysdate, --예약이 이루어진 날짜
    canceldate date --예약취소일
);

-- 객실이미지정보 테이블
CREATE TABLE room_images (
    image_code number CONSTRAINT image_code_seq primary key,
    room_code number not null, --FK
    filename varchar2(200),
    filepath varchar2(200),
    regdate date default sysdate,
    moddate date default sysdate
);

-- 리뷰댓글정보 테이블
CREATE TABLE review (
    review_code number CONSTRAINT review_code_seq primary key,
    room_code number not null, --FK
    content varchar2(1000), --리뷰내용
    rating number, --평점
    regdate date default sysdate,
    moddate date default sysdate
);

-- 자유게시판 테이블
CREATE TABLE board (
    board_code number CONSTRAINT board_code_seq PRIMARY KEY,
    customer_code number not null, --FK
    title varchar2(50),
    content varchar2(1000),
    regdate date default sysdate,
    moddate date default sysdate
);

-- 자유게시판_댓글 테이블 보류
CREATE TABLE board_reply (
    reply_code number CONSTRAINT reply_code_seq PRIMARY KEY,
    board_code number not null, --FK
    customer_code number not null, --FK
    content varchar2(1000),
    regdate date default sysdate,
    moddate date default sysdate
);

-- 공지사항 테이블
CREATE TABLE notice (
    notice_code number CONSTRAINT notice_code_seq PRIMARY KEY,
    admin_id varchar2(10) not null, --FK
    title varchar2(100),
    content varchar2(1000),
    regdate date default sysdate,
    moddate date default sysdate
);





-- foreing key 설정
ALTER TABLE hotel ADD CONSTRAINT hotel_company_fk
    FOREIGN KEY (company_code)
    REFERENCES company (company_code);

ALTER TABLE board ADD CONSTRAINT board_customer_fk
    FOREIGN KEY (customer_code)
    REFERENCES customer (customer_code);
    
ALTER TABLE board_reply ADD CONSTRAINT reply_board_fk
    FOREIGN KEY (board_code)
    REFERENCES board (board_code);
    
ALTER TABLE board_reply ADD CONSTRAINT reply_customer_fk
    FOREIGN KEY (customer_code)
    REFERENCES customer (customer_code);
    
ALTER TABLE booking ADD CONSTRAINT booking_customer_fk
    FOREIGN KEY (customer_code)
    REFERENCES customer (customer_code);
    
ALTER TABLE booking ADD CONSTRAINT booking_room_fk
    FOREIGN KEY (room_code)
    REFERENCES room (room_code);
    
ALTER TABLE room ADD CONSTRAINT room_hotel_fk
    FOREIGN KEY (hotel_code)
    REFERENCES hotel (hotel_code);
    
ALTER TABLE notice ADD CONSTRAINT notice_admin_fk
    FOREIGN KEY (admin_id)
    REFERENCES admin (admin_id);   
    
ALTER TABLE notice ADD CONSTRAINT notice_admin_fk
    FOREIGN KEY (admin_id)
    REFERENCES admin (admin_id);

ALTER TABLE review ADD CONSTRAINT review_room_fk
    FOREIGN KEY (room_code)
    REFERENCES admin (room_code);

ALTER TABLE room_images ADD CONSTRAINT room_images_room_fk
    FOREIGN KEY (room_code)
    REFERENCES admin (room_code);
    
    
    

-- 더미 데이터
INSERT INTO board 
VALUES(board_num_seq.nextval, '1', '제목1', '내용1', sysdate, sysdate);




