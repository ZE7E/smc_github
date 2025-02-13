-- 문제 1.
-- 맴버중 100만원 이상 구매한 맴버 이름을 출력하세요
-- member, payment_history 테이블 사용
-- 이름, 결제 금액을 출력하세요
SELECT
    MEMBER.NAME AS 이름, SUM(PAYMENT_HISTORY.ORDER_PRICE) AS 결제금액
FROM
    MEMBER, PAYMENT_HISTORY
WHERE
    MEMBER.ID = PAYMENT_HISTORY.MEMBER_ID AND
    (PAYMENT_HISTORY.ORDER_PRICE) >= 1000000
GROUP BY
    MEMBER.NAME, MEMBER.ID
ORDER BY
    결제금액 DESC;

-- 문제 2.
-- 맴버중 평균 결제 금액이 10만원 이상인 맴버의 이름을 출력하세요
-- member, payment_history 테이블 사용
-- 이름, 결제 금액을 출력하세요
SELECT
    MEMBER.NAME AS 이름, AVG(PAYMENT_HISTORY.ORDER_PRICE) AS 결제금액
FROM
    MEMBER, PAYMENT_HISTORY
WHERE
    MEMBER.ID = PAYMENT_HISTORY.MEMBER_ID AND
    (ORDER_PRICE/ORDER_COUNT) >= 100000
GROUP BY
    MEMBER.NAME, MEMBER.ID
ORDER BY
    결제금액 DESC;

-- 문제 3.
-- 카테고리중 상품이 5개 이상 등록된 카테고리의 이름을 출력하세요
-- category, product 사용
SELECT
    CATEGORY.NAME AS 카테고리이름, COUNT(PRODUCT.CATEGORYID) AS 상품수
FROM
    CATEGORY, PRODUCT
WHERE
    CATEGORY.ID = PRODUCT.CATEGORYID
GROUP BY
    CATEGORY.NAME, CATEGORY.ID
HAVING
    COUNT(PRODUCT.CATEGORYID) >= 5
ORDER BY
    상품수 DESC;

-- 문제 4.
-- CATALOGUE 테이블을 신규로 만들어주세요
-- 테이블의 구성은 ID, NAME, PRICE, ORIGIN 입니다
-- 데이터는 PRODUCT 안의 데이터를 INSERT SELECT 문을 사용하여 데이터를 넣어 주세요
-- ID, NAME, PRICE, ORIGIN 의 데이터 타입은 PRODUCT 테이블과 동일합니다
CREATE TABLE CATALOGUE(
    id number NOT NULL, 
    name varchar2(200) NOT NULL,
    price number NOT NULL,
    origin varchar2(200),
);

INSERT INTO
    CATALOGUE
SELECT
    PRODUCT.ID, PRODUCT.NAME, PRODUCT.PRICE, PRODUCT.ORIGIN
FROM
    PRODUCT;

-- 문제 5.
-- PRODUCT 테이블에서 가격이 10000000(천만)원 이상인 상품의 가격을 일괄적으로 1000000(백만원) 으로 변경하세요
-- PRODUCT 테이블 사용, UPDATE 구문 사용
UPDATE
    PRODUCT
SET
    PRODUCT.PRICE = 1000000
WHERE
    PRODUCT.PRICE >= 10000000;

-- 문제 6.
-- 문제 5번을 푸신 후, PRODUCT 의 가격 != PAYMENT_HISTORY.ORDER_PRICE / PAYMNET_HISTORY.ORDER_COUNT 
-- 인 값들을 찾으세요
-- 5번으로 인해 가격이 다운된 상품들을 찾고, PAYMENT_HISTORY 에서 구한 단가로 비교하면 됩니다
SELECT DISTINCT
    PRODUCT.NAME, PRODUCT.PRICE
FROM
    PRODUCT, PAYMENT_HISTORY
WHERE
    PRODUCT.ID = PAYMENT_HISTORY.PRODUCT_ID AND
    PRODUCT.PRICE != (PAYMENT_HISTORY.ORDER_PRICE/PAYMENT_HISTORY.ORDER_COUNT);

-- 추가 문제 #1.
-- 카탈로그 테이블에 CATEGORY_ID 를 추가로 생성해주시고
-- NAME 기준으로 PRODUCT 테이블에 있는 데이터(카테고리 id)를 CATALOGUE 테이블에 추가해 주시고
-- CATALOGUE 테이블에서 FK(외래키) 를 설정해주세요
ALTER TABLE 
    CATALOGUE
ADD
    CATEGORYID NUMBER;

INSERT INTO
    CATALOGUE
SELECT
    *
FROM 
    PRODUCT.CATEGORYID
WHERE 
    PRODUCT.NAME = PRODUCT_ID;

-- 문제 7.
-- CATEGORY, MEMBER, PAYMENT_HISTORY, PRODUCT 테이블을 모두 조인하여
-- 상품명, 카테고리명, 구매한 유저명, 구매 금액, 구매 개수를 출력하세요
SELECT
    PRODUCT.NAME AS 상품명,
    CATEGORY.NAME AS 카테고리명,
    MEMBER.NAME AS 구매한유저명,
    PAYMENT_HISTORY.ORDER_PRICE AS 구매금액,
    PAYMENT_HISTORY.ORDER_COUNT AS 구매개수
FROM
    PRODUCT, CATEGORY, MEMBER, PAYMENT_HISTORY
WHERE
    MEMBER.ID = PAYMENT_HISTORY.MEMBER_ID AND
    CATEGORY.ID = PRODUCT.CATEGORYID AND
    PRODUCT.ID = PAYMENT_HISTORY.PRODUCT_ID;

-- 문제 8.
-- PAYMENT_HISTORY 와 PRODUCT 테이블을 사용하여 원산지별 판매 액수를 출력해주세요
-- 만약, 원산지가 없는 경우 원산지 없음 이라고 나오게끔 작성해주세요
-- NVL 함수 사용 (https://gent.tistory.com/189)

-- 추가 문제 #2
-- PRODUCT 테이블에서 상품명, 상품 설명을 가져오게끔 합니다
-- 만약 상품 설명이 10글자 이상인 경우 "탁월한 생산성을 위..." 와 같이 10글자 이후에는 ... 을 붙혀 주고
-- 10글자 미만인 경우 모두 출력되게끔 합니다 (... 이 붙어서는 안됩니다)
-- oracle IF(https://coding-factory.tistory.com/451), SUBSTR(https://docs.oracle.com/cd/B19306_01/server.102/b14200/functions162.htm), ||(https://dpdpwl.tistory.com/80) 연산자 사용 필요

-- 문제 9.
-- PAYMENT_HISTORY 에서 1월중 가장 단일 판매 액수가 높은 주문 건수를 찾아서
-- 상품명, 구매한 유저명, 구매 금액, 구매 개수를 출력해주세요

-- 문제 10.
-- PAYMENT_HISTORY 에서 모든 기간의 일별 매출액을 출력해주세요
