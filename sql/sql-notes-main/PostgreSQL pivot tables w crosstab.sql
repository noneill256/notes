CREATE EXTENSION tablefunc;
-- pivot the rows in products to create a table of products which have rows of their detail

SELECT * FROM crosstab(
      'SELECT name, detail, COUNT(*) AS ct
      FROM products AS p
      JOIN details AS d
        ON p.id = d.product_id
      GROUP BY p.name, d.detail
      ORDER BY 1, 2')
        -- this just orders it by the first two columns (name and detail)
  AS crtbl(name text, bad bigint, good bigint, ok bigint);
  
  
  /*
 Each distinct value of detail becomes its own column
 
 AFTER PIVOTING:
  name	              bad	good	ok
Durable Rubber Knife	27	31	35
Durable Steel Wallet	26	37	43
Ergonomic Granite Bag	33	38	36
Ergonomic Marble Hat	37	29	31
Fantastic Wooden Pants	34	33	27
Gorgeous Marble Clock	28	30	46
Incredible Marble Wallet37	27	39
Lightweight Granite Car	37	35	37
Lightweight Steel Clock	39	30	28
Rustic Aluminum Watch	29	26	35

BEFORE PIVOTING LOL:
name	                detail	ct
Aerodynamic Granite Car	bad	32
Aerodynamic Granite Car	good	34
Aerodynamic Granite Car	ok	23
Durable Copper Knife	bad	37
Durable Copper Knife	good	26
Durable Copper Knife	ok	33
Fantastic Iron Keyboard	bad	31
Fantastic Iron Keyboard	good	33
Fantastic Iron Keyboard	ok	28
Fantastic Iron Shirt	bad	41
Fantastic Iron Shirt	good	32
Fantastic Iron Shirt	ok	35
Gorgeous Bronze Plate	bad	37
Gorgeous Bronze Plate	good	47
Gorgeous Bronze Plate	ok	35
Heavy Duty Wool Knife	bad	23
Heavy Duty Wool Knife	good	37
Heavy Duty Wool Knife	ok	36
Intelligent Paper Coat	bad	42
Intelligent Paper Coat	good	38
Intelligent Paper Coat	ok	20
Lightweight Aluminum Chair	bad	31
Lightweight Aluminum Chair	good	34
Lightweight Aluminum Chair	ok	31
Practical Marble Keyboard	bad	25
Practical Marble Keyboard	good	44
Practical Marble Keyboard	ok	39
Small Granite Watch	bad	30
Small Granite Watch	good	35
Small Granite Watch	ok	31
  */
