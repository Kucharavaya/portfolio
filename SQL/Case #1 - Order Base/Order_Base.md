# :package:Case #1 - Order Base

## :books:Содержание:
- [Диаграмма «Order Base»](#db)
- [Вопрос и решение](#questions)

---
**Дано**: имеется следующая <a id="db">диаграмма «Order Base»</a>
<img width="832" height="672" alt="db_Order_Base" src="https://github.com/user-attachments/assets/137b8ceb-d6d9-4c0d-a5e4-a61361c2f38b" />

**Задание**: Написать скрипты запросов к базе данных

---
## <a id="questions">Вопрос и решение</a>
**1.	Выбрать фамилии и даты найма всех сотрудников.**
```SQL
SELECT
    NAME,
    HIRE_DATE
FROM SALESREPS
```
**Решение:**
| | NAME | HIRE_DATE |
| - | - | - |
|1|Dan Roberts|	2004-10-20 |
|2|Sue Smith	|2004-12-10 |
|3|Paul Cruz	|2005-03-01 |
|4|Bob Smith	|2005-05-19 |
|5|Bill Adams	|2006-02-12 |
|6|Sam Clark	|2006-06-14 |
|7|Nancy Angelli	|2006-11-14 |
|8|Larry Fitch	|2007-10-12 |
|9|Mary Jones	|2007-10-12 |
|10|Tom Snyder	|2008-01-13 |

---

**2.	Выбрать номер и дату заказов, выполненных после определенной даты ('2008-01-13').**
```SQL
SELECT
    ORDER_NUM,
    ORDER_DATE
FROM ORDERS
WHERE ORDER_DATE > '2008-01-13'
```
**Решение:**
| | ORDER_NUM | ORDER_DATE |
| - | - | - |
|1|113003	|2008-01-25|
|2|113013	|2008-01-14|
|3|113024	|2008-01-20|
|4|113027	|2008-01-22|
|5|113034	|2008-01-29|
|6|113036	|2008-01-30|
|7|113042	|2008-02-20|
|8|113045	|2008-02-02|
|9|113048	|2008-02-10|
|10|113049	|2008-02-10|
|11|113051	|2008-02-10|
|12|113055	|2008-02-15|
|13|113057	|2008-02-18|
|14|113058	|2008-02-23|
|15|113062	|2008-02-24|
|16|113065	|2008-02-27|
|17|113069	|2008-03-02|

---

**3.	Выбрать все офисы из определенного региона ('Eastern') и управляемые определенным сотрудником (номер сотрудника = 105).**
```SQL
SELECT
    *
FROM OFFICES
WHERE REGION = 'Eastern'
    AND MGR = 105
```
**Решение:**
| | OFFICE | CITY | REGION | MGR | TARGET | SALES |
| - | - | - | - | - | - | - |
|1|13	|Atlanta	|Eastern	|105	|350000.00	|367911.00|
|2|52	|London	|Eastern	|105	|60000.00	|55000.00|

---

**4.	Выбрать заказы, сделанные в определенный период (с '2007-12-31' по '2008-02-01').**

Вариант #1 (с использованием оператора сравнения)
```SQL
SELECT
    *
FROM ORDERS
WHERE ORDER_DATE >= '2007-12-31'
    AND ORDER_DATE <= '2008-02-01'
```
Вариант #2 (с использованием оператора BETWEEN)
```SQL
SELECT
    *
FROM ORDERS
WHERE ORDER_DATE BETWEEN '2007-12-31'
    AND '2008-02-01';
```
**Решение:**
| | ORDER_NUM| ORDER_DATE| CUST| REP| MFR| PRODUCT| QTY| AMOUNT|
| - | - | - | - | - | - | - | - | - |
|1|112987	|2007-12-31	|2103	|105	|ACI	|4100Y	|11	|27500.00|
|2|112989	|2008-01-03	|2101	|106	|FEA	|114  	|6	|1458.00|
|3|112997	|2008-01-08	|2124	|107	|BIC	|41003	|1	|652.00|
|4|113003	|2008-01-25	|2108	|109	|IMM	|779C 	|3	|5625.00|
|5|113007	|2008-01-08	|2112	|108	|IMM	|773C 	|3	|2925.00|
|6|113012	|2008-01-11	|2111	|105	|ACI	|41003	|35	|3745.00|
|7|113013	|2008-01-14	|2118	|108	|BIC	|41003	|1	|652.00|
|8|113024	|2008-01-20	|2114	|108	|QSA	|XK47 	|20	|7100.00|
|9|113027	|2008-01-22	|2103	||105	|ACI	|41002	|54	|4104.00|
|10|113034	|2008-01-29	|2107	|110	|REI	|2A45C	|8	|632.00|
|11|113036	|2008-01-30	|2107	|110	|ACI	|4100Z	|9	|22500.00|

---

**5	Выбрать сотрудника, у которого нет менеджера (самого главного).**
```SQL
SELECT
    *
FROM SALESREPS
WHERE MANAGER IS NULL
```
**Решение:**
||EMPL_NUM| NAME| AGE| REP_OFFICE| TITLE| HIRE_DATE| MANAGER| QUOTA| SALES|
| - | - | - | - | - | - | - | - | - | - |
|1|106|	Sam Clark|	52|	11|	VIP| SALES	|2006-06-14|	NULL	|275000.00|	299912.00|

---

**6.	Выбрать офисы из региона, который начинается на "E".**
```SQL
SELECT
    *
FROM OFFICES
WHERE REGION LIKE 'E%'
```
**Решение:**
||OFFICE| CITY| REGION| MGR| TARGET| SALES|
| - | - | - | - | - | - | - |
|1|11	|New York	|Eastern	|106	|575000.00	|692637.00
|2|12	|Chicago	|Eastern	|104	|800000.00	|735042.00
|3|13	|Atlanta	|Eastern	|105	|350000.00	|367911.00
|4|52	|London	|Eastern	|105	|60000.00	|55000.00

---

**7.	Выбрать все заказы с ценой больше определенного значения (20000) и отсортировать вначале по стоимости по убыванию, а затем по количеству заказанного по возрастанию.**
```SQL
SELECT
    *
FROM ORDERS
WHERE AMOUNT > 20000
ORDER BY AMOUNT DESC,
    QTY ASC
```
**Решение:**
| | ORDER_NUM| ORDER_DATE| CUST| REP| MFR| PRODUCT| QTY| AMOUNT|
| - | - | - | - | - | - | - | - | - |
|1|113045	|2008-02-02	|2112	|108	|REI	|2A44R	|10	|45000.00|
|2|112961	|2007-12-17	|2117	|106	|REI	|2A44L	|7	|31500.00|
|3|113069	|2008-03-02	|2109	|107	|IMM	|775C 	|22	|31350.00|
|4|112987	|2007-12-31	|2103	|105	|ACI	|4100Y	|11	|27500.00|
|5|113042	|2008-02-20	|2113	|101	|REI	|2A44R	|5	|22500.00|
|6|113036	|2008-01-30	|2107	|110	|ACI	|4100Z	|9	|22500.00|

---


**8.	Выбрать 5 самых дорогих товаров.**

Вариант #1 (с использованием оператора TOP)
```SQL
-- TOP 5 WITH TIES -> вернет первые 5 строк 
--                    если будут совпадения по сортировке вернет и их
SELECT
    TOP 5
WITH TIES *
FROM PRODUCTS
ORDER BY PRICE DESC
```
Вариант #2 (с использованием оператора FETCH)
```SQL
-- OFFSET 0 ROWS -> пропустить 0 строк
-- FETCH NEXT 5 ROWS ONLY -> и получить следующие за ним 5
SELECT
    *
FROM PRODUCTS
ORDER BY PRICE DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;
```
**Решение:**
| |MFR_ID| PRODUCT_ID| DESCRIPTION| PRICE| QTY_ON_HAND|
| - | - | - | - | - | - |
|1|REI|	2A44L	|Left |Hinge	|4500,00	|12|
|2|REI|	2A44R	|Right |Hinge	|4500,00	|12|
|3|ACI|	4100Y	|Widget |Remover	|2750,00	|25|
|4|ACI| 4100Z	|Widget |Installer	|2500,00	|28|
|5|IMM| 779C 	|900-LB |Brace	|1875,00	|9|

---

**9.	Выбрать 20% самых дорогих заказов.**
```SQL
SELECT
    TOP 20 PERCENT *
FROM ORDERS
ORDER BY AMOUNT DESC
```
**Решение:**
| | ORDER_NUM| ORDER_DATE| CUST| REP| MFR| PRODUCT| QTY| AMOUNT|
| - | - | - | - | - | - | - | - | - |
|1|113045	|2008-02-02	|2112	|108	|REI	|2A44R	|10	|45000.00|
|2|112961	|2007-12-17	|2117	|106	|REI	|2A44L	|7	|31500.00|
|3|113069	|2008-03-02	|2109	|107	|IMM	|775C 	|22	|31350.00|
|4|112987	|2007-12-31	|2103	|105	|ACI	|4100Y	|11	|27500.00|
|5|113036	|2008-01-30	|2107	|110	|ACI	|4100Z	|9	|22500.00|
|6|113042	|2008-02-20	|2113	|101	|REI	|2A44R	|5	|22500.00|

---


**10.	Подсчитать количество сотрудников в каждом отделе.**
```SQL
SELECT
    REP_OFFICE,
    COUNT(*) AS количество_сотрудников
FROM SALESREPS
GROUP BY REP_OFFICE
```
**Решение:**
| | REP_OFFICE| количество_сотрудников|
|-|-|-|
|1|NULL	|1|
|2|11	|2|
|3|12	|3|
|4|13	|1|
|5|21	|2|
|6|22	|1|

---

**11.	Подсчитать максимальный возраст в отделе.**
```SQL
SELECT
    REP_OFFICE,
    MAX(AGE) максимальный_возраст
FROM SALESREPS
GROUP BY REP_OFFICE
```
**Решение:**
| | REP_OFFICE| максимальный_возраст|
|-|-|-|
|1|NULL	|41|
|2|11	|52|
|3|12	|45|
|4|13	|37|
|5|21	|62|
|6|22	|49|

---

**12.	Подсчитать среднюю цену товара по производителю. Результат округлить до двух знаков после запятой.**
```SQL
SELECT
    MFR_ID,
    ROUND(AVG(PRICE), 2) средняя_цена
FROM PRODUCTS
GROUP BY MFR_ID
```
**Решение:**
| |MFR_ID| средняя_цена|
|-|-|-|
|1|ACI	|804,29|
|2|BIC	|352,33|
|3|FEA	|195,50|
|4|IMM	|842,33|
|5|QSA	|222,00|
|6|REI	|2357,25|

---

**13.	Найти количество продуктов для каждого производителя.**
```SQL
SELECT
    MFR_ID,
    SUM(QTY_ON_HAND) AS количество_продуктов
FROM PRODUCTS
GROUP BY MFR_ID
ORDER BY MFR_ID
```
**Решение:**
| |MFR_ID| количество_продуктов|
|-|-|-|
|1|ACI	|880|
|2|BIC	|81|
|3|FEA	|130|
|4|IMM	|321|
|5|QSA	|278|
|6|REI	|248|

---

**14. Найти отделы и количество сотрудников в них, где средний возраст сотрудника не превышает 40 лет.**
```SQL
SELECT
    REP_OFFICE,
    COUNT(*) количество_сотрудников,
    AVG(AGE) средний_возраст
FROM SALESREPS
GROUP BY REP_OFFICE
HAVING AVG(AGE) <= 40
```
**Решение:**
| |REP_OFFICE| количество_сотрудников| средний_возраст|
|-|-|-|-|
|1|12	|3	|35|
|2|13	|1	|37|

---

**15. Производители, средняя цена товара которых больше 500 рублей. Результат округлить до двух знаков после запятой.**
```SQL
SELECT
    MFR_ID,
    ROUND(AVG(PRICE), 2) AS средняя_цена
FROM PRODUCTS
GROUP BY MFR_ID
HAVING AVG(PRICE) > 500
```
**Решение:**
| |MFR_ID|средняя_цена|
|-|-|-|
|1|ACI	|804,29|
|2|IMM	|842,33|
|3|REI	|2357,25|

---

**16. Найти покупателей, и количество их заказов.**

Вариант #1 (с использованием оператора JOIN)
```SQL
SELECT
    C.COMPANY,
    COUNT(O.ORDER_NUM) OrderCount
FROM CUSTOMERS C
LEFT JOIN ORDERS O
ON C.CUST_NUM = O.CUST
GROUP BY C.COMPANY
ORDER BY OrderCount DESC
```
Вариант #2 (с использованием подзапроса)
```SQL
SELECT
    C.COMPANY,
    OrderCount = (
    SELECT
        COUNT(ORDER_NUM)
    FROM ORDERS O
    WHERE O.CUST = C.CUST_NUM
)
FROM CUSTOMERS C
ORDER BY OrderCount DESC
```

**Решение:**
| |COMPANY|OrderCount|
|-|-|-|
|1|Acme Mfg.	|4|
|2|Midwest Systems|	4|
|3|Holm \& Landis	|3|
|4|JCP Inc.	|3|
|5|Fred Lewis Corp.|	2|
|6|Zetacorp	|2|
|7|Ace International	|2|
|8|Orion Corp.	|2|
|9|Peter Brothers	|2|
|10|Rico Enterprises	|1|
|11|Ian \& Schmidt	|1|
|12|J.P. Sinclair	|1|
|13|Chen Associates	|1|
|14|First Corp.	|1|
|15|Jones Mfg.	|1|
|16|AAA Investments	|0|
|17|Carter \& Sons	|0|
|18|Smithson Corp.	|0|
|19|Solomon Inc.	|0|
|20|Three Way Lines	|0|
|21|QMA Assoc.	|0|

---

**17. Найти покупателей, у которых есть заказы в определенный период (с '2007-12-31' по '2008-02-01').**
```SQL
SELECT
    DISTINCT O.CUST,
    C.COMPANY
FROM CUSTOMERS C
JOIN ORDERS O
ON C.CUST_NUM = O.CUST
WHERE O.ORDER_DATE BETWEEN '2007-12-31'
    AND '2008-02-01'
ORDER BY C.COMPANY
```

**Решение:**
| |CUST|COMPANY|
|-|-|-|
|1|2107	|Ace International|
|2|2103	|Acme Mfg.|
|3|2108	|Holm \& Landis|
|4|2111	|JCP Inc.|
|5|2101	|Jones Mfg.|
|6|2118	|Midwest Systems|
|7|2114	|Orion Corp.|
|8|2124	|Peter Brothers|
|9|2112	|Zetacorp|

---

**18. Найти все заказы, которые оформляли менеджеры (все) из региона EAST.**
```SQL
SELECT
    OFFICES.REGION,
    OFFICES.OFFICE,
    S.REP_OFFICE,
    OFFICES.CITY,
    OFFICES.MGR,
    S.MANAGER,
    S.EMPL_NUM AS номер_сотрудника,
    S.NAME AS имя_сотрудника,
    O.ORDER_NUM,
    O.ORDER_DATE
FROM ORDERS O
RIGHT JOIN SALESREPS S
ON O.REP = S.EMPL_NUM
LEFT JOIN OFFICES
ON S.REP_OFFICE = OFFICES.OFFICE
    OR S.EMPL_NUM = OFFICES.MGR
WHERE OFFICES.REGION LIKE 'E%'
ORDER BY S.NAME
```

**Решение:**
| |REGION|OFFICE|REP_OFFICE|CITY|MGR|MANAGER|номер_сотрудника|имя_сотрудника|ORDER_NUM|ORDER_DATE|
|-|-|-|-|-|-|-|-|-|-|-|
|1|Eastern	|13	|13	|Atlanta	|105	|104	|105	|Bill Adams	|112963	|2007-12-17|
|2|Eastern	|13	|13	|Atlanta	|105	|104	|105	|Bill Adams	|112983	|2007-12-27|
|3|Eastern	|13	|13	|Atlanta	|105	|104	|105	|Bill Adams	|112987	|2007-12-31|
|4|Eastern	|13	|13	|Atlanta	|105	|104	|105	|Bill Adams	|113012	|2008-01-11|
|5|Eastern	|13	|13	|Atlanta	|105	|104	|105	|Bill Adams	|113027	|2008-01-22|
|6|Eastern	|52	|13	|London	|105	|104	|105	|Bill Adams	|112963	|2007-12-17|
|7|Eastern	|52	|13	|London	|105	|104	|105	|Bill Adams	|112983	|2007-12-27|
|8|Eastern	|52	|13	|London	|105	|104	|105	|Bill Adams	|112987	|2007-12-31|
|9|Eastern	|52	|13	|London	|105	|104	|105	|Bill Adams	|113012	|2008-01-11|
|10|Eastern	|52	|13	|London	|105	|104	|105	|Bill Adams	|113027	|2008-01-22|
|11|Eastern	|12	|12	|Chicago	|104	|106	|104	|Bob Smith	|NULL	|NULL|
|12|Eastern	|12	|12	|Chicago	|104	|104	|101	|Dan Roberts	|112968	|2007-10-12|
|13|Eastern	|12	|12	|Chicago	|104	|104	|101	|Dan Roberts	|113042	|2008-02-20|
|14|Eastern	|12	|12	|Chicago	|104	|104	|101	|Dan Roberts	|113055	|2008-02-15|
|15|Eastern	|11	|11	|New York	|106	|106	|109	|Mary Jones	|113003	|2008-01-25|
|16|Eastern	|11	|11	|New York	|106	|106	|109	|Mary Jones	|113058	|2008-02-23|
|17|Eastern	|12	|12	|Chicago	|104	|104	|103	|Paul Cruz	|112975	|2007-10-12|
|18|Eastern	|12	|12	|Chicago	|104	|104	|103	|Paul Cruz	|113057	|2008-02-18|
|19|Eastern	|11	|11	|New York	|106	|NULL	|106	|Sam Clark	|112961	|2007-12-17|
|20|Eastern	|11	|11	|New York	|106	|NULL	|106	|Sam Clark	|112989	|2008-01-03|

---

**19. Определить сотрудников, которые продали больше своего руководителя.**
```SQL
SELECT
    S1.NAME сотрудник,
    S1.SALES продажи_сотрудника,
    S2.SALES продажи_руководителя,
    S2.NAME руководитель
FROM SALESREPS S1
LEFT JOIN SALESREPS S2
ON S1.MANAGER = S2.EMPL_NUM
WHERE S1.SALES > S2.SALES
```

**Решение:**
| |сотрудник|продажи_сотрудника|продажи_руководителя|руководитель|
|-|-|-|-|-|
|1|Sue Smith	|474050.00	|361865.00	|Larry Fitch|
|2|Paul Cruz	|286775.00	|142594.00	|Bob Smith|
|3|Bill Adams	|367911.00	|142594.00	|Bob Smith|
|4|Larry Fitch	|361865.00	|299912.00	|Sam Clark|
|5|Mary Jones	|392725.00	|299912.00	|Sam Clark|
|6|Tom Snyder	|75985.00	|5.00	|Dan Roberts|

---

**20. Выбрать все заказы, которые оформлялись менеджерами из восточного региона.**
```SQL
SELECT
    *
FROM ORDERS
WHERE REP IN (
    SELECT
        EMPL_NUM
    FROM SALESREPS
    WHERE REP_OFFICE IN (
        SELECT
            OFFICE
        FROM OFFICES
        WHERE REGION LIKE 'E%'
    )
)
```

**Решение:**
| |ORDER_NUM| ORDER_DATE| CUST| REP| MFR| PRODUCT| QTY| AMOUNT|
|-|-|-|-|-|-|-|-|-|
|1|112961	|2007-12-17	|2117	|106	|REI	|2A44L	|7	|31500.00|
|2|112963	|2007-12-17	|2103	|105	|ACI	|41004	|28	|3276.00|
|3|112968	|2007-10-12	|2102	|101	|ACI	|41004	|34	|3978.00|
|4|112975	|2007-10-12	|2111	|103	|REI	|2A44G	|6	|2100.00|
|5|112983	|2007-12-27	|2103	|105	|ACI	|41004	|6	|702.00|
|6|112987	|2007-12-31	|2103	|105	|ACI	|4100Y	|11	|27500.00|
|7|112989	|2008-01-03	|2101	|106	|FEA	|114  	|6	|1458.00|
|8|113003	|2008-01-25	|2108	|109	|IMM	|779C 	|3	|5625.00|
|9|113012	|2008-01-11	|2111	|105	|ACI	|41003	|35	|3745.00|
|10|113027	|2008-01-22	|2103	|105	|ACI	|41002	|54	|4104.00|
|11|113042	|2008-02-20	|2113	|101	|REI	|2A44R	|5	|22500.00|
|12|113055	|2008-02-15	|2108	|101	|ACI	|4100X	|6	|150.00|
|13|113057	|2008-02-18	|2111	|103	|ACI	|4100X	|24	|600.00|
|14|113058	|2008-02-23	|2108	|109	|FEA	|112  	|10	|1480.00|

---
