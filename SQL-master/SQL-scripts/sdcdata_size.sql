SELECT
relname AS "relation",
pg_size_pretty (
pg_total_relation_size (C .oid)
) AS total_size,
pg_size_pretty (
pg_total_relation_size (C .oid)*10
) as sdcdata
FROM
pg_class C
LEFT JOIN pg_namespace N ON (N.oid = C .relnamespace)
WHERE
nspname NOT IN (
'pg_catalog',
'information_schema'
)
--  добавлено. указывать таблицы по шаблону '<schema.table>'. партициированные таблицы указаывать по имени партиции

--  '<schema.partition>'
and concat(nspname,'.',relname) in ('deposit.deposit_0','deposit.deposit_1','deposit.deposit_2')
-- где 'deposit.deposit_0','deposit.deposit_1','deposit.deposit_2' - перечень реплицируемых таблиц
AND C .relkind <> 'i'
AND nspname !~ '^pg_toast'
ORDER BY
pg_total_relation_size (C .oid) DESC
LIMIT 1;