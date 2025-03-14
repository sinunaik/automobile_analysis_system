-- creating table 
CREATE TABLE car_type (
    model VARCHAR(50),
    fuel_type VARCHAR(20),
    aspiration VARCHAR(20),
    num_of_doors VARCHAR(10),
    body_style VARCHAR(30),
    drive_wheels VARCHAR(10),
    engine_location VARCHAR(10),
    wheel_base FLOAT,
    length FLOAT,
    width FLOAT,
    height FLOAT,
    curb_weight INT,
    engine_type VARCHAR(20),
    num_of_cylinders VARCHAR(20),
    engine_size INT,
    fuel_system VARCHAR(20),
    bore FLOAT,
    stroke FLOAT,
    compression_ratio FLOAT,
    horsepower INT NULL,
    peak_rpm INT NULL,
    city_mpg INT NULL,
    highway_mpg INT NULL,
    price INT NULL
);

--checking data
SELECT COUNT(*)FROM car_type ;

-- checking whethere null value are  there in price column 
SELECT * FROM car_type WHERE price IS NULL;

-- CALCULATING AVERAGE PRICE
SELECT AVG(price) FROM car_type;


  -- finding top 5 most expensive car
SELECT model, fuel_type, price FROM  car_type WHERE  price IS NOT NULL ORDER BY  price DESC LIMIT 5;


--find cars with the best fuel efficiency (city & highway)

SELECT model,city_mpg,highway_mpg FROM 
car_type ORDER BY city_mpg DESC,
highway_mpg DESC LIMIT 10;

--finding car which has more than 200 horsepower

SELECT model,horsepower FROM  car_type WHERE horsepower > 200 ORDER BY horsepower DESC;


--finding cars with the largest engine size for each fuel type

SELECT fuel_type,model,engine_size from car_type as c1 WHERE
engine_size=(SELECT MAX(engine_size) FROM car_type as 
c2 WHERE C1.fuel_type=c2.fuel_type) ORDER BY fuel_type;

