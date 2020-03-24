-- 상품 리스트(startRow, endRow)
SELECT*FROM PRODUCT ORDER BY pDATE DESC;
SELECT*FROM (SELECT ROWNUM RN, A.* FROM (SELECT*FROM PRODUCT ORDER BY pDATE DESC)A) WHERE RN BETWEEN 2 AND 5;

-- 전체 상품 개수
SELECT COUNT(*) TOTCNT FROM PRODUCT;

-- 상품 상세보기
SELECT*FROM PRODUCT WHERE pID='1';


-- 상품 등록
INSERT INTO PRODUCT (pID, pCATEGORY, pNAME, pPRICE, pDISCOUNT, 
    pIMAGE1, pIMAGE2, pCONTENT, pPOLICY1, pPOLICY2, pSTOCK)
    VALUES (PRODUCT_SEQ.NEXTVAL, 'FURNITURE', 'SAMPLE PRODUCT', PRODUCT_SEQ.CURRVAL || 39000, 10, 'sample' || PRODUCT_SEQ.CURRVAL || '.jpg',
        NULL, 'THIS IS A SAMPLE PRODUCT. FROM FRITZHANSEN', '교환환불 규정입니다.', '배송규정입니다.', 10);
INSERT INTO PRODUCT (pID, pCATEGORY, pNAME, pPRICE, pDISCOUNT, 
    pIMAGE1, pIMAGE2, pCONTENT, pPOLICY1, pPOLICY2, pSTOCK)
    VALUES (PRODUCT_SEQ.NEXTVAL, 'FURNITURE', 'SAMPLE PRODUCT', PRODUCT_SEQ.CURRVAL || 39000, 10, 'sample' || PRODUCT_SEQ.CURRVAL || '.jpg',
        NULL, 'THIS IS A SAMPLE PRODUCT. FROM FRITZHANSEN', '교환환불 규정입니다.', '배송규정입니다.', 10);
INSERT INTO PRODUCT (pID, pCATEGORY, pNAME, pPRICE, pDISCOUNT, 
    pIMAGE1, pIMAGE2, pCONTENT, pPOLICY1, pPOLICY2, pSTOCK)
    VALUES (PRODUCT_SEQ.NEXTVAL, 'FURNITURE', 'SAMPLE PRODUCT', PRODUCT_SEQ.CURRVAL || 39000, 10, 'sample' || PRODUCT_SEQ.CURRVAL || '.jpg',
        NULL, 'THIS IS A SAMPLE PRODUCT. FROM FRITZHANSEN', '교환환불 규정입니다.', '배송규정입니다.', 10);
INSERT INTO PRODUCT (pID, pCATEGORY, pNAME, pPRICE, pDISCOUNT, 
    pIMAGE1, pIMAGE2, pCONTENT, pPOLICY1, pPOLICY2, pSTOCK)
    VALUES (PRODUCT_SEQ.NEXTVAL, 'FURNITURE', 'SAMPLE PRODUCT', PRODUCT_SEQ.CURRVAL || 39000, 10, 'sample' || PRODUCT_SEQ.CURRVAL || '.jpg',
        NULL, 'THIS IS A SAMPLE PRODUCT. FROM FRITZHANSEN', '교환환불 규정입니다.', '배송규정입니다.', 10);

COMMIT;

-- 상품 삭제
DELETE PRODUCT WHERE pID='11';

-- 상품 정보 수정
UPDATE PRODUCT 
    SET pCATEGORY1 = 'FURNITURE',
        pCATEGORY2 = NULL, 
        pNAME = 'SAMPLE',
        pPRICE = 1200000,
        pDISCOUNT = 12,
        pIMAGE1 = 'sample11.jpg',
        pIMAGE2 = NULL,
        pCONTENT = 'THIS IS A SAMPLE PRODUCT',
        pPOLICY1 = 'RETURN AND EXCHANGE...',
        pPOLICY2 = 'DELIVERY POLICY...',
        pSTOCK = 5
    WHERE pID = 12;
    
-- // 주문 시 실재 재고에 반영
UPDATE PRODUCT SET pSTOCK = pSTOCK - 5 WHERE pID=1;

-- 상품 클릭할 때마다 히트 수 하나 씩 올리기 용
UPDATE PRODUCT SET pHIT = pHIT+1 WHERE pID=24;

-- 베스트 30 리스트 가져오기(페이징은 필요 없음)
SELECT*FROM PRODUCT ORDER BY pHIT DESC;
SELECT*FROM (SELECT ROWNUM RN, A.* FROM (SELECT*FROM PRODUCT ORDER BY pHIT DESC) A) WHERE RN BETWEEN 1 AND 30;

delete product where pid between 30 and 32;
commit;
