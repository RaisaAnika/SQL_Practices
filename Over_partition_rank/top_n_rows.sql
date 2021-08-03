  CREATE TABLE cities
   (
      city VARCHAR(80),
      country VARCHAR(80),
      population INT
   );
 
   INSERT INTO cities VALUES ('New York', 'United States', 8175133); 
   INSERT INTO cities VALUES ('Los Angeles', 'United States', 3792621); 
   INSERT INTO cities VALUES ('Chicago', 'United States', 2695598); 
 
   INSERT INTO cities VALUES ('Paris', 'France', 2181000);
   INSERT INTO cities VALUES ('Marseille', 'France', 808000);
   INSERT INTO cities VALUES ('Lyon', 'France', 422000);
 
   INSERT INTO cities VALUES ('London', 'United Kingdom',	7825300);
   INSERT INTO cities VALUES ('Birmingham', 'United Kingdom', 1016800);
   INSERT INTO cities VALUES ('Leeds', 'United Kingdom', 770800);
   
     SELECT city, country, population
   FROM
    (SELECT city, country, population, 
                  ROW_NUMBER() OVER (PARTITION BY country ORDER BY population DESC) as country_rank
      FROM cities) ranked
   WHERE country_rank <= 2;