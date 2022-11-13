SELECT *
FROM product
WHERE to_tsvector(name) @@ to_tsquery('Awesome'); -- names that contain 'Awesome'
