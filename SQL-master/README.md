* столбцы FROM=ИЗ юзеров
SELECT * FROM users;

Выдаст три столбца Фамилия, имя, день рождения
SELECT last_name, first_name, birthday FROM users;

Если добавить WHERE от куда, где в таблице AGE больше 18
SELECT last_name, first_name, birthday FROM users WHERE > 18;

```
SELECT
    last_name, first_name, birthday, sex, age
FROM
    users
#фильтруем с помощью
WHERE
    age >= 18 AND(OR) sex = 'm'
```

SELECT * FROM products

WHERE country = 'RU' OR country = 'UA' OR 'BL'

Чтобы сделать проще 

SELECT * FROM products
WHERE country IN ('RU', 'UA', 'BL')

SELECT * FROM products
WHERE country IN ('RU', 'UA', 'BL') AND price < 1000