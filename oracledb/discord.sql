CREATE TABLE PRODUCT (
    id number NOT NULL ,
    category_id number NOT NULL,
    name varchar2(200) NOT NULL,
    price number NOT NULL,
    stock number DEFAULT 0,
    description varchar(1000),
    origin varchar2(200),
    CONSTRAINT PRODUCT_PK PRIMARY KEY (id)
);

CREATE TABLE CATEGORY (
    id number NOT NULL,
    name varchar2(200) NOT NULL,
    CONSTRAINT CATEGORY_PK PRIMARY KEY (id)
);

CREATE TABLE MEMBER (
    id number NOT NULL,
    password varchar2(100) NOT NULL,
    name varchar2(50) NOT NULL,
    email varchar2(100) NOT NULL,
    phone varchar2(40),
    address varchar2(200),
    age number(3),
    CONSTRAINT MEMBER_PK PRIMARY KEY (id)
);

CREATE TABLE PAYMENT_HISTORY (
    id number NOT NULL,
    order_date date NOT NULL,
    order_status varchar2(16) NOT NULL, -- PAYMENT_WAITING, PAYMENT_SUCCESS, SHIPPING, SHIPED
    order_count number NOT NULL,
    order_price number NOT NULL,
    product_id number NOT NULL,
    member_id number NOT NULL,
    address varchar2(200) NOT NULL,
    CONSTRAINT PAYMENT_HISTORY_PK PRIMARY KEY (id),
    CONSTRAINT PAYMENT_HISTORY_CK CHECK (order_status IN('PAYMENT_WAITING','PAYMENT_SUCCESS','SHIPPING','SHIPED'))
);

COMMENT ON COLUMN PAYMENT_HISTORY.ORDER_STATUS IS '주문 진행 단계, 4가지 단계만 들어갈 수 있도록 함.';

SELECT *
FROM ALL_COL_COMMENTS
WHERE TABLE_NAME = 'PAYMENT_HISTORY';

SELECT * FROM PRODUCT WHERE;

INSERT INTO PRODUCT(ID,category_id,name,price,stock,description,origin)
VALUES(49,1,"2021년식 맥북",1690000,10,"애플 그 이상", "캘리포니아");

CREATE TABLE CATALOGUE (
    id number NOT NULL,
    name varchar2(200) NOT NULL,
    stock number DEFAULT 0,
    origin varchar2(200)
);

INSERT INTO CATALOGUE 
SELECT id, name, price, origin 
FROM PRODUCT
WHERE price >= 100000;

UPDATE PRODUCT 
SET STOCK = STOCK + 5 
WHERE  PRICE >=100000;

DELETE FROM PRODUCT WHERE ID=49;
