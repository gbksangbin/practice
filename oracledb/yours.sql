-- DATE 형간의 비교는 그냥 '20200101' 과 같이 VARCHAR 쓰셔도 비교가 가능하긴 하지만
-- 옳은 방법은 아닙니다.
-- 따라서 TO_DATE 함수를 사용하여 비교하는것이 옳습니다

SELECT
    *
FROM 
    PAYMENT_HISTORY
WHERE
 ORDER_DATE >= TO_DATE('20200101')  AND
      ORDER_DATE < TO_DATE('20200201');

-- 문제 1.
-- PAYMENT_HISTORY 에서 1월달 매출(ORDER_PRICE)의 합을 구해 주세요
SELECT
    SUM(ORDER_PRICE)
FROM 
    PAYMENT_HISTORY
WHERE 
    ORDER_DATE >= TO_DATE('20200101')  AND
    ORDER_DATE < TO_DATE('20200201');

-- 월별 매출을 뽑기 위해서는 날짜 데이터를 MONTH 까지 잘라서
-- 자른 데이터를 기준으로 그룹 바이 구문을 사용하면 MONTH 기준으로 뽑을수 있습니다
-- TO_CHAR(바꿀날짜컬럼, 포멧 문자열)
-- YYYY - 4자리 년도
-- MM - 2자리 월
-- DD - 2자리 일
SELECT
    to_char(order_date, 'YYYYMM') AS month,
    SUM(order_price)
FROM
    payment_history
GROUP BY
    to_char(order_date, 'YYYYMM');

--문제2
--1월 사이의 일별 매출 뽑아주세요
SELECT
    to_char(order_date, 'MMDD') AS month,
    SUM(order_price)
FROM
    payment_history
WHERE
    ORDER_DATE >= TO_DATE('20200101')  AND
    ORDER_DATE < TO_DATE('20200201')
GROUP BY
    to_char(order_date, 'MMDD');
    
-- 문제 3.
-- 안녕하세요 마케팅팀입니다
-- 혹시 1월 ~ 3월의 매출액과 판매 대수를 각각 알고싶은데
-- 데이터를 보내주실수 있을까요?
-- 최대한 빨리 부탁드리겠습니다
-- 감사합니다
SELECT 
   TO_CHAR(ORDER_DATE,'YYYYMM'),
   SUM(order_price),
   COUNT(order_price)
FROM
    PAYMENT_HISTORY
WHERE
    ORDER_DATE >= TO_DATE('20200101')  AND
    ORDER_DATE < TO_DATE('20200401')
GROUP BY 
    TO_CHAR(ORDER_DATE,'YYYYMM');

-- 문제4.
-- 안녕하세요 xxx 님 YY팀 ZZZ입니다
-- 혹시 데이터 담당하시는거 같아서
-- 문의 드리는데요
-- 요즘 이제 월별 단일 매출액이 가장 높은 금액이 얼마인지 궁굼해서 -> MAX 사용
-- 요청드립니다
-- 감사합니다
SELECT 
   TO_CHAR(ORDER_DATE,'MM') AS 월,
   max(order_price) AS MAX매출액
FROM
    PAYMENT_HISTORY
GROUP BY 
    TO_CHAR(ORDER_DATE,'MM')
ORDER BY 
    TO_CHAR(ORDER_DATE,'MM');