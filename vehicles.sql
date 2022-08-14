CREATE TABLE owners (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL);

CREATE TABLE vehicles (
  id SERIAL PRIMARY KEY,
  make TEXT NOT NULL,
  model TEXT NOT NULL,
  year INT NOT NULL,
  price NUMERIC(10, 2) NOT NULL,
  owner_id INTEGER NOT NULL REFERENCES owners);

INSERT INTO owners (first_name)
  VALUES
    ('Bob'),
    ('Jane'),
    ('Melody'),
    ('Sarah'),
    ('Alex'),
    ('Shana'),
    ('Maya'),
    ('Jane');

INSERT INTO vehicles (make, model, year, price, owner_id)
  VALUES
    ('Toyota', 'Corolla', 2002, 2999.99, 1),
    ('Honda', 'Civic', 2012, 12999.99, 1),
    ('Nissan', 'Altima', 2016, 23999.99, 2),
    ('Subaru', 'Legacy', 2006, 5999.99, 2),
    ('Ford', 'F150', 2012, 2599.99, 3),
    ('GMC', 'Yukon', 2016, 12999.99, 3),
    ('GMC', 'Yukon', 2014, 22999.99, 4),
    ('Toyota', 'Avalon', 2009, 12999.99, 4),
    ('Toyota', 'Camry', 2013, 12999.99, 4),
    ('Honda', 'Civic', 2001, 7999.99, 5),
    ('Nissan', 'Altima', 1999, 1899.99, 6),
    ('Lexus', 'ES350', 1998, 1599.99, 6),
    ('BMW', '300', 2012, 22999.99, 6),
    ('BMW', '700', 2015, 52999.99, 6);



SELECT o.id, o.first_name, v.id, v.make, v.model, v.year, v.price, v.owner_id
FROM vehicles v
FULL OUTER JOIN owners o
ON v.owner_id = o.id;


// what goes after GROUP BY


    SELECT o.first_name, COUNT(v.owner_id)
    FROM vehicles AS v
    JOIN owners AS o
    ON o.id = v.owner_id
    GROUP BY o.id
    ORDER BY o.first_name;

    SELECT o.first_name, ROUND(AVG(v.price),0), COUNT(v.owner_id)
    FROM vehicles AS v
    JOIN owners AS o
    ON o.id = v.owner_id
    GROUP BY o.first_name
    HAVING AVG(v.price) > 10000
    ORDER BY o.first_name DESC
    ;
