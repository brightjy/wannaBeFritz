-- 글 목록(startRow, endRow)
-- 정렬 기준(최신 리뷰 순, 원글-답글 순)
SELECT R.*, pIMAGE1, pNAME  FROM REVIEW_BOARD R, PRODUCT P WHERE R.pID=P.pID ORDER BY rGROUP DESC, rSTEP;
SELECT*FROM(SELECT ROWNUM RN, A.* FROM 
    (SELECT R.*, pIMAGE1, pNAME  FROM REVIEW_BOARD R, PRODUCT P WHERE R.pID=P.pID ORDER BY rGROUP DESC, rSTEP)A) 
    WHERE RN BETWEEN 3 AND 10;

-- 내가 쓴 글 목록
SELECT*FROM(SELECT ROWNUM RN, A.* FROM 
    (SELECT R.*, pIMAGE1, pNAME  FROM REVIEW_BOARD R, PRODUCT P WHERE R.pID=P.pID ORDER BY rGROUP DESC, rSTEP)A) 
    WHERE MID='aaa' AND RN BETWEEN 3 AND 10;

-- 전체 리뷰 개수
SELECT COUNT(*) TOTCNT FROM REVIEW_BOARD;

commit;

-- 원글 쓰기
INSERT INTO REVIEW_BOARD (rID, oID, pID, mID, aID, rPW, rTITLE, rCONTENT, rFILE1, rFILE2, rGROUP, rSTEP, rINDENT, rIP)
    VALUES (REVIEW_SEQ.NEXTVAL, '1', '1', 'aaa', NULL, '111', '리뷰제목', '리뷰내용', '리뷰첨부파일', NULL, REVIEW_SEQ.CURRVAL, 0, 0, '111.111.11.11');
commit;
-- 답글 쓰기 전 stepA
UPDATE REVIEW_BOARD SET rSTEP=rSTEP+1 WHERE rGROUP=1 AND rSTEP>0;

-- 답글 쓰기
INSERT INTO REVIEW_BOARD (rID, oID, pID, mID, aID, rPW, rTITLE, rCONTENT, rFILE1, rFILE2, rGROUP, rSTEP, rINDENT, rIP)
    VALUES (REVIEW_SEQ.NEXTVAL, '2', '1', NULL, 'admin', '111', '답변제목', '답변내용', NULL, NULL, 1, 0+1, 0+1, '111.111.11.11'); 

-- rId로 리뷰 불러서 조회수 1 올리기
UPDATE REVIEW_BOARD
    SET rHIT = rHIT+1
    WHERE rID='1';

-- rId로 리뷰 DTO 불러오기
SELECT*FROM REVIEW_BOARD WHERE rID='1';
SELECT R.*, pIMAGE1, pNAME  FROM REVIEW_BOARD R, PRODUCT P WHERE R.pID=P.pID AND rID='1';
SELECT*FROM(SELECT ROWNUM RN, A.* FROM 
    (SELECT R.*, pIMAGE1, pNAME  FROM REVIEW_BOARD R, PRODUCT P WHERE R.pID=P.pID ORDER BY rGROUP DESC, rSTEP)A) 
    WHERE MID='aaa' AND RN BETWEEN 3 AND 10;


-- pId로 리뷰 불러오기(해당 상품 상세페이지에 해당 상품 리뷰 보여주기 용)
SELECT*FROM REVIEW_BOARD WHERE pID='1';
SELECT R.*, pIMAGE1, pNAME  FROM REVIEW_BOARD R, PRODUCT P WHERE R.pID=P.pID AND P.pID='1';
SELECT*FROM(SELECT ROWNUM RN, A.* FROM 
    (SELECT R.*, pIMAGE1, pNAME  FROM REVIEW_BOARD R, PRODUCT P WHERE R.pID=P.pID ORDER BY rGROUP DESC, rSTEP)A) 
    WHERE pID='1' AND RN BETWEEN 3 AND 10;


-- 상품 별 리뷰 개수

SELECT COUNT(*) TOTCNT FROM REVIEW_BOARD WHERE PID='1';
SELECT COUNT(*) TOTCNT FROM REVIEW_BOARD R, PRODUCT P WHERE R.pID=P.pID AND P.PID='1';

-- oId로 리뷰 불러오기(고객이 오더한 상품 중 리뷰 작성할 상품이 있으면, 주문 상세페이지에서 보여줄 용)
SELECT*FROM REVIEW_BOARD WHERE oID='2';

-- mId로 리뷰 불러오기(내가 쓴 글 - 내가 쓴 리뷰 보여주기 용)
SELECT*FROM REVIEW_BOARD WHERE mID='aaa';

-- 내가 쓴 리뷰 글 개수
SELECT COUNT(*) TOTCNT FROM REVIEW_BOARD WHERE MID='aaa';


-- 글 수정
UPDATE REVIEW_BOARD
    SET rTITLE = '수정한 제목',
        rCONTENT = '수정한 내용',
        rFILE1 ='수정첨부',
        rFILE2 = '첨부첨부',
        rIP = '111.111.11,11'
    WHERE rID='5' AND rPW='222';    

-- 글 삭제
DELETE REVIEW_BOARD WHERE rID='3' AND rPW='1234';

COMMIT;

리뷰 작성 여부 확인하기
SELECT COUNT(*) C FROM REVIEW_BOARD WHERE MID='bbarkji' AND OID='98' AND PID='2';  