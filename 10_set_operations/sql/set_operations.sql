-- SET OPERATIONS

SELECT * FROM synthetic.sales_jan;

SELECT * FROM synthetic.sales_feb;

-- UNION

-- Med UNION så slår vi ihop två tabeller. 
-- Vi måste ha samma antal kolumner i tabellerna för att UNION ska fungera

SELECT * FROM synthetic.sales_jan
UNION
SELECT * FROM synthetic.sales_feb;

------------------------------------

-- Följande kod kastar bort allt som blir duplicerat,
-- här får vi bara en 'Monitor', trots att det finns 'Monitor'
-- i både sales_jan och sales_feb.

SELECT product_name, amount FROM synthetic.sales_jan
UNION
SELECT product_name, amount FROM synthetic.sales_feb;

-- MEN! Om vi vill behålla all så kan vi köra UNION ALL:

SELECT product_name, amount FROM synthetic.sales_jan
UNION ALL
SELECT product_name, amount FROM synthetic.sales_feb;

------------------------------------

-- INTERSECT

-- Med INTERSECT så hittar vi vad de båda tabellerna har gemensamt:

SELECT product_name, amount FROM synthetic.sales_jan
INTERSECT
SELECT product_name, amount FROM synthetic.sales_feb;

-- Med denna kod kommer vi att få ett tomt set, detta beror på att vi
-- har olika datum i 'Monitor'

SELECT * FROM synthetic.sales_jan
INTERSECT
SELECT * FROM synthetic.sales_feb;

------------------------------------

-- EXCEPT

-- Med EXCEPT så tar vi bort ena resultatmängden från den andra resultatmängden.

SELECT product_name, amount FROM synthetic.sales_jan
EXCEPT
SELECT product_name, amount FROM synthetic.sales_feb;

------------------------------------

