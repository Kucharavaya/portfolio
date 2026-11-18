/* =========================================
   Создание таблиц (DDL)
   СУБД: MS SQL Server
   ========================================= */

/* 1. Справочник: Склады */
CREATE TABLE WAREHOUSE 
( 
    Warehouse_ID VARCHAR(10) NOT NULL, -- id Склад (PK)
    Address VARCHAR(50)                -- Адрес
);

ALTER TABLE WAREHOUSE
  ADD CONSTRAINT WAREHOUSE_PK PRIMARY KEY (Warehouse_ID);


/* 2. Справочник: Работники */
CREATE TABLE WORKERS
(
    Workers_ID INT NOT NULL,           -- id Работники (PK)
    FIRST_AND_LAST_NAME VARCHAR(50),   -- ФИО
    Warehouse VARCHAR(10),             -- Склад (FK)
    Title VARCHAR(30)                  -- Должность
);

ALTER TABLE WORKERS 
  ADD CONSTRAINT WORKERS_PK PRIMARY KEY (Workers_ID);


/* 3. Справочник: Типы документов */
CREATE TABLE DOCUMENT_TUPE
(
    Doc_type_ID INT NOT NULL,          -- id Тип документа (PK)
    Document_name VARCHAR(30)          -- Название (приход/расход/перемещение)
);

ALTER TABLE DOCUMENT_TUPE 
  ADD CONSTRAINT DOCUMENT_TUPE_PK PRIMARY KEY (Doc_type_ID);


/* 4. Справочник: Поставщики */
CREATE TABLE SUPPLIER
(
    UNP_supplier_ID INT NOT NULL,      -- id УНП Поставщика (PK)
    NameSUP VARCHAR(50),               -- Название
    AddressSUP VARCHAR(50),            -- Адрес
    Telephone VARCHAR(20)              -- Телефон
);

ALTER TABLE SUPPLIER 
  ADD CONSTRAINT SUPPLIER_PK PRIMARY KEY (UNP_supplier_ID);


/* 5. Справочник: Номенклатура */
CREATE TABLE NOMENCLATURE
(
    Product_code_ID INT NOT NULL,      -- id шифр товара (PK)
    Product_name VARCHAR(50),          -- Название товара    
);
  
ALTER TABLE NOMENCLATURE 
  ADD CONSTRAINT NOMENCLATURE_PK PRIMARY KEY (Product_code_ID);


/* 6. Справочник: Характеристики продуктов */
CREATE TABLE CHARACTERISTICS
(
    Characteristic_ID INT NOT NULL,    -- id Характеристики (PK)
    Product_code INT,                  -- Шифр товара / ссылка на Номенклатуру (FK)
    Unit_measurement VARCHAR(10),      -- Единица измерения
    Packaging FLOAT,                   -- Фасовка
    Description VARCHAR(50)            -- Описание
);

ALTER TABLE CHARACTERISTICS 
  ADD CONSTRAINT CHARACTERISTICS_PK PRIMARY KEY (Characteristic_ID);


/* 7. Документы: Договоры */
CREATE TABLE CONTRACTS
(
    Contr_ID INT NOT NULL,             -- id (PK)
    Contract_number VARCHAR(15),       -- Номер договора
    FromDATE DATE,                     -- От какой даты
    Validity_period DATE,              -- Срок действия
    UNP_supplier INT                   -- УНП Поставщика (FK)
);

ALTER TABLE CONTRACTS 
  ADD CONSTRAINT CONTRACTS_PK PRIMARY KEY (Contr_ID);
  

/* 8. Документы: Шапка документа (Накладная) */
CREATE TABLE DOCUMENT
(
    DOC_ID INT NOT NULL,               -- id таблица документа (PK)
    NumberDoc INT,                     -- Номер накладной (ТТН)
    From_The_DATE DATE,                -- От какой даты
    Amount MONEY,                      -- Общая Сумма по накладной
    Doc_type INT,                      -- Тип документа (FK)
    Workers INT,                       -- Работники (FK)
    UNP_supplier INT,                  -- УНП Поставщика (FK)
    ContNumber VARCHAR(15)             -- Номер договора (FK)
);

ALTER TABLE DOCUMENT 
  ADD CONSTRAINT DOCUMENT_PK PRIMARY KEY (DOC_ID);


/* 9. Связующая таблица: Содержание документа */
CREATE TABLE Contents_DOCUMENT
(
    ContentDoc_ID INT NOT NULL,        -- id содержание документа (PK)
    DOC INT,                           -- таблица документа (FK)
    Number INT,                        -- Номер накладной
    From_DATE DATE,                    -- От какой даты
    Product_code INT,                  -- шифр товара (FK) 
    Quantity_goods FLOAT,              -- Кол-во товара
    Price FLOAT,                       -- Цена
    Summ FLOAT,                        -- Сумма позиции в документе	
    Expiration_date DATE               -- Срок годности  
);
 
ALTER TABLE Contents_DOCUMENT 
  ADD CONSTRAINT Contents_DOCUMENT_PK PRIMARY KEY (ContentDoc_ID);


/* 10. Связующая таблица: Содержание договора */
CREATE TABLE Contents_CONTRACTS
(
    ContentContracts_ID INT NOT NULL,  -- id содержание договора (PK)
    Contr INT,                         -- (FK)
    Contract_num VARCHAR(15),          -- Номер договора 
    Product_name VARCHAR(50),          -- Название товара
    QTY_product FLOAT,                 -- Кол-во товара
    PriceCon FLOAT,                    -- Цена
    SummCon FLOAT                      -- Сумма
);
  
ALTER TABLE Contents_CONTRACTS 
  ADD CONSTRAINT Contents_CONTRACTS_PK PRIMARY KEY (ContentContracts_ID);


/* =========================================
   Установление внешних ключей (Foreign Keys)
   ========================================= */

ALTER TABLE WORKERS 
  ADD CONSTRAINT WAREHOUSE_WORKERS_FK FOREIGN KEY (Warehouse)
  REFERENCES WAREHOUSE (Warehouse_ID);

ALTER TABLE DOCUMENT 
  ADD CONSTRAINT WORKERS_DOCUMENT_FK FOREIGN KEY (Workers)
  REFERENCES WORKERS (Workers_ID);

ALTER TABLE DOCUMENT 
  ADD CONSTRAINT DOCUMENT_TUPE_DOCUMENT_FK FOREIGN KEY (Doc_type)
  REFERENCES DOCUMENT_TUPE (Doc_type_ID);

ALTER TABLE DOCUMENT            
  ADD CONSTRAINT SUPPLIER_DOCUMENT_FK FOREIGN KEY (UNP_supplier)
  REFERENCES SUPPLIER (UNP_supplier_ID);

ALTER TABLE Contents_DOCUMENT 
  ADD CONSTRAINT DOCUMENT_Contents_DOCUMENT_FK FOREIGN KEY (DOC)
  REFERENCES DOCUMENT (DOC_ID);

ALTER TABLE Contents_DOCUMENT 
  ADD CONSTRAINT NOMENCLATURE_Contents_DOCUMENT_FK FOREIGN KEY (Product_code)
  REFERENCES NOMENCLATURE (Product_code_ID);

ALTER TABLE CONTRACTS 
  ADD CONSTRAINT SUPPLIER_CONTRACTS_FK FOREIGN KEY (UNP_supplier)
  REFERENCES SUPPLIER (UNP_supplier_ID);

ALTER TABLE Contents_CONTRACTS 
  ADD CONSTRAINT CONTRACTS_Contents_CONTRACTS_FK FOREIGN KEY (Contr)
  REFERENCES CONTRACTS (Contr_ID);

ALTER TABLE CHARACTERISTICS 
  ADD CONSTRAINT NOMENCLATURE_CHARACTERISTICS_FK FOREIGN KEY (Product_code)
  REFERENCES NOMENCLATURE (Product_code_ID);