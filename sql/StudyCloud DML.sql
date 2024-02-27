-- desc MEMBER; 
-- SELECT * FROM MEMBER;
-- 예시
-- insert into MEMBER values('아이디','비밀번호','이름','전화번호','이메일', DEFAULT , '계정권한', '가입구분');
Insert Into Member values('admin1asd','1234','admin','010-5968-9865','1234@naver.com', 1 , 'ROLE_ADMIN', null);
Insert Into Member values('admin2','5678','admin','010-5968-9855','12ax34@naver.com', 1 , 'ROLE_ADMIN', null);
Insert Into Member values('user1','1234','admin','010-5968-9884','12aaa34@naver.com', 1 , 'ROLE_USER', null);
Insert Into Member values('user2','1234','admin','010-5968-9878','1234@google.com', 0 , 'ROLE_USER', null);
-- update MEMBER set MEM_PASSWD = '비밀번호수정', MEM_PHONE = '전화번호수정', MEM_EMAIL = '이메일수정', MEM_SNS= '가입구분' where MEM_ID = '아이디';
-- DELETE FROM MEMBER WHERE MEM_ID = 'admin2';




-- desc MAP;
-- SELECT * FROM MAP;
-- 예시
-- insert into MAP values(상품번호, '상품이름', '상품주소', '전화번호');
insert into MAP values(SEQ_PRO_NUM.NEXTVAL, '작심스터디카페 혜화점', '서울 종로구 창경궁로 253-1 어젤리아명륜1 3층', '02-747-0910');
insert into MAP values(SEQ_PRO_NUM.NEXTVAL, '랭스터디카페 대학로점', '서울 종로구 대학로10길 15-11 3층', '02-766-0907');
insert into MAP values(SEQ_PRO_NUM.NEXTVAL, '플래닛스터디카페 대학로점', '서울 종로구 대학로 149 유니로드빌딩 6층', '010-8497-6296');
insert into MAP values(SEQ_PRO_NUM.NEXTVAL, '크라스 스터디랩 종로점', '서울 종로구 종로 120 동영타워 2층', '02-6959-8309');
insert into MAP values(SEQ_PRO_NUM.NEXTVAL, '멘토즈스터디카페 혜화역점', '서울 종로구 대학로 146 씨티밸리빌딩 5층 502호', '010-4767-8636');
insert into MAP values(SEQ_PRO_NUM.NEXTVAL, '그린스터디카페 독립문역점', '서울 종로구 통일로16길 5 시온빌딩 2층', '010-2089-3832');
insert into MAP values(SEQ_PRO_NUM.NEXTVAL, '멘토즈스터디카페 혜화가톨릭대점', '서울 종로구 창경궁로 293-1', '02-747-9785');
insert into MAP values(SEQ_PRO_NUM.NEXTVAL, '스터디카페 스페로 성균관대점', '서울 종로구 창경궁로 236 3층', '02-745-8934');
insert into MAP values(SEQ_PRO_NUM.NEXTVAL, '작심스터디카페 대학로점', '서울 종로구 대학로10길 12 4층', '010-7519-4344');
insert into MAP values(SEQ_PRO_NUM.NEXTVAL, '플래닛 스터디카페 혜화점', '서울 종로구 창경궁로 269 3층', '010-5559-6296');
insert into MAP values(SEQ_PRO_NUM.NEXTVAL, '스터디피아', '서울 종로구 창경궁로 109 세운스퀘어 주얼리관 1층', '02-6272-0022');
insert into MAP values(SEQ_PRO_NUM.NEXTVAL, '세검정스터디카페', '서울 종로구 자하문로 312 5층', '010-5915-3679');
insert into MAP values(SEQ_PRO_NUM.NEXTVAL, '코넬스터디카페', '서울 종로구 통일로 262 2층', '070-8098-4645');
insert into MAP values(SEQ_PRO_NUM.NEXTVAL, '초월스터디카페 혜화점', '서울 종로구 성균관로 13 2층', '010-9184-5046');
-- update MAP set PRO_NAME = '수정내용', PRO_ADDRESS = '수정내용', PRO_PHONE = '수정내용' where PRO_NUM = 1;
-- delete from MAP where PRO_NUM = 1;



-- desc PRODUCT;
-- SELECT * FROM PRODUCT;
-- 예시
insert into PRODUCT values(상품번호, '아이디', '상품소개', '시설안내', '유의사항', '환불정책', '우편번호');
-- update PRODUCT set PRO_POST = '상품소개수정내용', PRO_INFO = '시설안내수정내용', PRO_NOTICE = '유의사항수정내용', PRO_REFUND = '환불정책수정내용' where PRO_NUM = 1;
-- DELETE FROM PRODUCT WHERE PRO_NUM = 5;


 
-- desc PRODUCTFILE;
-- SELECT * FROM PRODUCTFILE;
-- 예시
insert into PRODUCTFILE values(상품번호, '상품사진', '상품사진사본');
-- update PRODUCTFILE set PRO_PIC_ORIGINAL = '수정내용', PRO_PIC_RENAME = '수정내용' where PRO_NUM = 1;
-- DELETE FROM PRODUCTFILE WHERE PRO_NUM = 5;

 

-- desc PROTIME;
-- SELECT * FROM PROTIME;
-- 예시
insert into PROTIME values('사용시간', 상품번호, 가격(시간당), '주문번호');
-- update PROTIME set PRO_PRICE = '가격수정내용' where PRO_NUM = 1;
-- DELETE FROM PROTIME WHERE PRO_NUM = 5


-- desc CANCEL;
-- SELECT * FROM CANCEL;
-- 예시
--insert into CANCEL values('주문번호', '취소날짜', '환불사유');
insert into CANCEL values('주문번호', '취소날짜', '환불사유');
-- delete from CANCEL where RSV_NUM = '1';







-- desc CHATTROOM;
-- SELECT * FROM CHATTROOM;
-- 예시
-- insert into CHATTROOM values(방번호, '내용', 마지막작성시간);
insert into CHATTROOM values(1, 'ROOM_CONTENTS', DEFAULT);
-- update CHATTROOM set ROOM_CONTENTS = '수정내용' where CHA_ROOM_NUM = 1;
-- delete from CHATTROOM where CHA_ROOM_NUM = 1;



-- desc MEMBER_ROOM;
-- SELECT * FROM MEMBER_ROOM;
-- 예시 
-- insert into MEMBER_ROOM values('아이디', 방번호);
insert into MEMBER_ROOM values('아이디', 1);
-- DELETE FROM MEMBER_ROOM WHERE ROOM_NUM = 1;

-- desc CHAT; 
-- SELECT * FROM CHAT; 
-- 예시
-- insert into CHAT values(작성시간, '아이디', 방번호, '내용');
insert into CHAT values(DEFAULT, '아이디', 1, '내용');
-- update CHAT set CHA_CONTENTS = '수정내용' where ROOM_NUM = 1;
-- delete from CHAT where ROOM_NUM = 1;



-- desc NOTICE;
-- SELECT * FROM NOTICE;
INSERT INTO NOTICE VALUES(
       (SELECT NVL(MAX(NOTI_NUM), 0)+1 FROM NOTICE)
      , 'admin1'
      , '공지'
      , '숏폼 크리에이터 ‘스클 힙스터’에 도전해봐'
      , '나만의 라이프스타일로 사람들에게 영감을 줄 숏폼 크리에이터 ‘스클 힙스터’ 대모집! 당당하고 자기다운 공간 라이프를 즐기고 콘텐츠를 통한 퍼스널 브랜딩에 관심이 있다면 망설이지 말고 지금 바로 지원해봐^^ 스클 힙스터란? 자신만의 라이프스타일을 대중과 공유하는 디지털 크리에이터로, 스터디클라우드에 등록된 다양한 공간에서 숏폼 콘텐츠를 제작하고 홍보하는 인플루언서야.
      활동내용 매달 미션주제에 따라 1~3분 길이의 영상 콘텐츠 2건씩 제작할거야. 스터디클라우드 공간에서 학교, 직장, 여가와 연계된 공간활용 꿀팁을 소개하거나 공감할 수 있는 관련 에피소드를 담으면 돼'
      , DEFAULT
      , NULL
      , NULL
);

INSERT INTO NOTICE VALUES(
       (SELECT NVL(MAX(NOTI_NUM), 0)+1 FROM NOTICE)
      , 'admin1'
      , '이벤트'
      , '우리학교 근처 버스정류장에서 QR 찍고 공간 쿠폰 받자!'
      , '스터디클라우드가 3월 한달간 서울 시내 대학가 버스정류장 10곳에서 쿠폰 증정 이벤트를 진행합니다.
      QR코드 찍고 이벤트 페이지에서 동아리, 알바, 장학금, 우정사진 등 새학기 버킷리스트를 고르기만 하면 1만원 공간쿠폰 선물이 딱!'
      , DEFAULT
      , NULL
      , NULL
);
INSERT INTO NOTICE VALUES(
       (SELECT NVL(MAX(NOTI_NUM), 0)+1 FROM NOTICE)
      , 'admin1'
      , '복구'
      , '설 연휴 기간 고객센터 임시운영 안내'
      , '2023년 설 연휴를 앞두고 고객센터 임시운영 일정 안내드립니다. 아래 일정을 확인하시고 서비스 이용에 참고부탁드립니다.'
      , DEFAULT
      , NULL
      , NULL
);
INSERT INTO NOTICE VALUES(
       (SELECT NVL(MAX(NOTI_NUM), 0)+1 FROM NOTICE)
      , 'admin1'
      , '복구'
      , '네이버페이 결제/취소 관련 장애 안내'
      , '2023년 1월 23일 14시 24분 ~ 15시 50 동안 네이버페이 서비스 접속불가 현상이 발생했습니다. 네이버페이 측 공지사항, 관련기사 확인하기'
      , DEFAULT
      , NULL
      , NULL
);

--UPDATE NOTICE SET
--   NOTI_IDX = '복구 완료'
--,  NOTI_TITLE = '설연휴 고객센터(수정)'
--,  NOTI_CONTENTS = '<복구 완료> 현재 네이버페이 접속 장애가 복구되어, 정상적으로 서비스 이용이 가능합니다. 감사합니다. 2023년 1월 23일 14시 24분 ~ 15시 50 동안 네이버페이 서비스 접속불가 현상이 발생했습니다. 네이버페이 측 공지사항, 관련기사 확인하기'
--WHERE NOTI_NUM = 1;

-- DELETE FROM NOTICE WHERE NOTI_NUM = 5;

 
-- desc RESERVE;
-- SELECT * FROM RESERVE;
INSERT INTO RESERVE VALUES(
       (SELECT NVL(MAX(RSV_NUM), 0) + 1 FROM RESERVE),
        TO_DATE('2023-05-04', 'YYYY-MM-DD'), 
        3, 
        'user1', 
        4500, 
        NULL
);


INSERT INTO RESERVE VALUES(
       (SELECT NVL(MAX(RSV_NUM), 0) + 1 FROM RESERVE),
        TO_DATE('2023-05-05', 'YYYY-MM-DD'), 
        3, 
        'user1', 
        4500, 
        NULL
);


INSERT INTO RESERVE VALUES(
       (SELECT NVL(MAX(RSV_NUM), 0) + 1 FROM RESERVE),
        TO_DATE('2023-05-05', 'YYYY-MM-DD'), 
        1, 
        'user1', 
        1000, 
        NULL
);


-- update RESERVE set MEM_QUESTION = '사용자문의글 수정내용' where RSV_NUM = 1;
-- DELETE FROM RESERVE WHERE RSV_NUM = 5;
 
 
 
-- desc REVIEW;
-- SELECT * FROM REVIEW;
-- 예시
insert into REVIEW values('주문번호', '상품이름', '리뷰내용', DEFAULT, '계정권한', '호스트답글');
-- update REVIEW set REV_CONTENTS = '리뷰내용 수정내용' where RSV_NUM = 1;
-- DELETE FROM REVIEW WHERE RSV_NUM = 5;

 
-- desc QNA;
-- SELECT * FROM QNA;
-- 예시
insert into QNA values(상품번호, '상품이름', '아이디', '사용자문의글', '계정권한', '호스트답글', 'QNA작성시간');
-- update QNA set MEM_QUESTION = '사용자문의글 수정내용' where PRO_NUM = 1;
-- DELETE FROM QNA WHERE PRO_NUM = 5;




-- desc SNS;
-- SELECT * FROM SNS;
-- 예시
insert into SNS values('토큰', '아이디', 'SNS별명', 'SNS연동날짜 DEFAULT', 'SNS종류', '계정권한');
-- update SNS set SNS_NAME = 'SNS별명 수정내용' where MEM_ID = '아이디';
-- DELETE FROM SNS WHERE MEM_ID = '아이디';

