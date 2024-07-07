SELECT
    last_name, first_name, birthday, sex
FROM
    users
WHERE
    age >= 18 AND sex = 'm'

После чего останутсятолько мужчины, которым есть 18 лет


Так же можно выполнять OR (ИЛИ)

SELECT
    last_name, first_name, birthday, sex
FROM
    users
WHERE
    age >= 18 OR sex = 'm'

В таблице окажутся женщины старше 18 лет и все мужчины, даже которые младше 18

Можно делать запрос больше

SELECT * FROM products
WHERE  country = 'RU' OR country = 'UA' OR country = 'BL'



Можно упростить запрос с помощью IN
SELECT * FROM products
WHERE  country IN ('RU','UA', 'BL') AND price < 10000

Получили страны в которых продукты стоят меньше 10000
Можно совмещать AND,OR,IN из-за чего они становятся гибкими

SELECT * FROM products
WHERE price >= 10000 AND price <= 20000>

Так же есть запрос BETWEEN (МЕЖДУ)
SELECT * FROM products
WHERE price BETWEEN  10000 AND 20000


SELECT * FROM products
WHERE price BETWEEN 10000 AND 20000 OR country = 'RU'
Товары попадающие в диапазон от 10 до 20 тысяч или страна РФ