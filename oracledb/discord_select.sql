--문제1: MEMBER 테이블에서 GMAIL을 사용하는 사람들을 구하세요
SELECT * FROM MEMBER WHERE EMAIL LIKE '%gmail.com';

--문제2:이메일에서 GMAIL 이면서 이메일의 길이가 12 글자 이상인 데이터를 뽑아내세요
SELECT * FROM MEMBER WHERE EMAIL LIKE '%gmail.com' AND LENGTH(MEMBER.EMAIL) >=12;

--문제3:이메일이 GMAIL 이면서 이메일의 길이가 12글자 이상이거나,
--이메일이 NAVER.COM을 사용하면서 길이가 10글자 이상인 조건에 해당하는 멤버를 찾으세요
SELECT * FROM MEMBER WHERE 
    (MEMBER.EMAIL  LIKE '%gmail.com' AND LENGTH(MEMBER.EMAIL) >=12)
OR 
    (MEMBER.EMAIL  LIKE '%naver.com' AND LENGTH(MEMBER.EMAIL) >=10);

-- 테이블의 컬럼 개수를 출력하고 싶으면 다음 쿼리를 실행한다
SELECT COUNT(1) FROM MEMBER;

--문제4:PAYMENT_HISTORY 테이블을 이용함,
--결제 금액이 1,000,000 이상이면서 구매 개수(STOCK)가 10개 이하인 주문이거나,
--결제 금액이 100,000, 이하면서 구매 개수가 10개 이상인 주문을 찾아주세요
SELECT * FROM PAYMENT_HISTORY WHERE 
    (ORDER_PRICE  >=1000000 AND ORDER_COUNT <=10) 
OR 
    (ORDER_PRICE  <= 100000 AND ORDER_COUNT >=10);

--조건문에 IN절을 사용 가능합니다.
--IN 절은 뒤에 따라오는 문자열 여러개 중 하나라도 들어있으면 TRUE 를 반환합니다.
-- 예) 'A' IN ('A', 'B', 'C') -> TRUE

--문제5:PAYMENT_HISTORY 테이블을 이용함,
--결제 금액이 1,000,000 이상이면서 구매 개수(STOCK)가 10개 이하인 주문이거나,
--결제 금액이 100,000 이하면서 구매 개수가 10개 이상인 주문이면서
--주문지(address)가 (서울, 서울특별시, 서울시) 셋중 하나인 경우를 모두 찾아주세요
SELECT * FROM PAYMENT_HISTORY WHERE 
    ((ORDER_PRICE  >=1000000 AND ORDER_COUNT <=10) OR (ORDER_PRICE  <= 100000 AND ORDER_COUNT >=10)) 
AND 
    address IN ('서울','서울특별시','서울시') ;

-- SELECT A.NUMBER AS SUMMARY_NUMBER, B.NUMBER AS AVERAGE_NUMBER, C.NUMBER FROM A, B, C
-- 컬럼명 뒤, 혹은 함수 뒤에 "AS 불리게될 컬럼명" 을 적어주시면 불리게될 컬럼명으로 출력됩니다

-- 미니 문제 #1
-- 아래 쿼리에서 컬럼명이 COUNT(1) 으로 나오게 되는데
-- COUNT(1) 이 아닌 TABLE_ROW_COUNT 로 나오게 해주세요
SELECT COUNT(1) AS TABLE_ROW_COUNT FROM MEMBER;

-- BETWEEN 문법은 x 부터 Y 까지 사이에 있는 데이터를 뽑기에 적합합니다
-- 예) PRICE BETWEEN 10000 AND 100000;

--문제6: PAYMENT_HISTORY 테이블에서 판매액(ORDER_PRICE) 가 100000 이상, 10000000 이하 인 값을 찾아주세요
SELECT * FROM PAYMENT_HISTORY WHERE ORDER_PRICE BETWEEN 100000 AND 10000000;

-- EXIST <- 존재 하는지를 확인할수 있다
-- 예) 컬럼명 IS NULL

--문제7:PRODUCT 테이블에서 ORIGIN(원산지)이 없는 데이터를 찾아주세요
SELECT * FROM PRODUCT WHERE ORIGIN IS NULL;

-- 문제8:MEMBER 테이블을 사용합니다
-- GMAIL 이메일 주소를 사용하면서 "서울시" 안에 살고 있으며, PASSWORD 의 길이가 10자리 이상이거나
-- NAVER 이메일 주소를 사용하면서 폰번호 안에 1 이 들어가있는 사람을 찾아 주세요
-- 다만 나이는 100살 이GK이어야 합니다
SELECT * FROM MEMBER WHERE 
    ((MEMBER.EMAIL  LIKE '%gmail.com' AND LENGTH(MEMBER.PASSWORD) >=10 AND address LIKE '%서울시%')
OR 
    (MEMBER.EMAIL  LIKE '%naver.com' AND PHONE LIKE '%1%'))
AND AGE <=100;

-- DISTINCT 문은 중복을 제거할수 있습니다
-- 예를들어 address 가 ('서울시', '서울시', '은평구') 와 같이 3row 가 있다고 가정한다면
-- 다음과 같이 사용하면 중복을 제거할수 있습니다, 따라서 값은 ('서울시', '은평구')
-- SELECT DISTINCT COLUMN FROM TABLE;

--문제9:MEMBER 테이블을 사용
--회원들이 살고있는 주소만 중복없이 찾아주세요
--SELECT ADDRESS 만 하세요
SELECT DISTINCT address FROM member;

-- 미니 문제 #2
-- PRODUCT 에서 STOCK 을 내림차순으로 출력하세요, 다만 STOCK 이 10개 이상이어야 합니다
SELECT * FROM product WHERE STOCK >=10 ORDER BY STOCK DESC;

-- 문제 10.
-- MEMBER 테이블과 PAYMENT_HISTORY 테이블을 조인하여 데이터를 표시하시요
-- 구매자명, 구매 금액, 구매 일자만 나오게끔 작성해 주세요
SELECT
    member.name                    AS 구매자명,
    payment_history.order_price    AS 구매금액,
    payment_history.order_date     AS 구매일자
FROM
    member,
    payment_history
WHERE
    member.id = payment_history.member_id;

-- 문제 11.
-- MEMBER 테이블과 PAYMENT_HISTORY 테이블을 조인하여 데이터를 표시하시요
-- 구매자명, 구매 금액, 구매 일자만 나오게끔 작성해 주세요
-- 구매 금액이 1,000,000 이상인 값만 나오게끔 작성해 주세요
-- 구매금액 높은 순으로 정렬하여 주세요
SELECT
   member.name                      AS 구매자명,
    payment_history.order_price     AS 구매금액,
    payment_history.order_date      AS 구매일자
FROM
    payment_history,
    MEMBER
WHERE
        member.id = payment_history.member_id 
    AND payment_history.order_price >= 1000000
ORDER BY 
    payment_history.order_price DESC;

-- 문제 12.
-- PAYMENT_HISTORY, PRODUCT, CATEGORY 를 전부 가져오게끔 합니다
-- 구매 금액, 카테고리, 상품명을 출력해야 합니다
SELECT
    payment_history.order_price     AS 구매금액,
    payment_history.order_count     AS 구매개수,
    category.name                   AS 상품명,
    product.name                    AS 카테고리명
FROM
    payment_history,
    product,
    category
WHERE
        product.id=payment_history.product_id 
    AND product.category_id=category.ID;

-- 문제 13.
-- PAYMENT_HISTORY, PRODUCT, CATEGORY, MEMBER 를 전부 가져오게끔 합니다
-- 구매 금액, 구매 개수, 카테고리, 상품명, 구매자명을 출력해야 합니다
SELECT
    payment_history.order_price    AS 구매금액,
    payment_history.order_count    AS 구매개수,
    product.name                   AS 카테고리명,
    category.name                  AS 상품명,
    member.name                    AS 구매자명
FROM
    payment_history,
    product,
    category,
    member
WHERE
        product.id = payment_history.product_id
    AND product.category_id = category.id
    AND member.id = payment_history.member_id;

--count, sum, avg, min, max
--개수,  합,  평균,최대,최소
--SELECT SUM(PRICE) FROM PRODUCT;

--문제14
--모든 상품의 개수,합,평균,최대,최소값을 동시에 뽑아주세요
SELECT 
    category_id,
    COUNT(PRICE) AS 상품의개수,
    SUM(price) AS 가격의합,
    AVG(PRICE) AS 가격의평균,
    MAX(PRICE) AS 가격의최대,
    MIN(PRICE) AS 가격의최소
FROM
    product
GROUP BY 
    category_id
HAVING
    SUM(PRICE) < 10000000;

-- 문제 15.
-- 모든 상품의 개수, 가격의 합, 가격의 평균, 가격의 최대, 가격의 최소값을 동시에 뽑아주세요
-- 카테고리 별로 그룹핑하여 보여주세요
-- 다만, 그룹핑 하기 전의 상품의 가격이 1,000,000 넘는 상품은 제외해주세요

SELECT 
    category_id,
    COUNT(PRICE) AS 상품의개수,
    SUM(price) AS 가격의합,
    AVG(PRICE) AS 가격의평균,
    MAX(PRICE) AS 가격의최대,
    MIN(PRICE) AS 가격의최소
FROM
    product
WHERE 
    PRICE <=1000000
GROUP BY 
    category_id
