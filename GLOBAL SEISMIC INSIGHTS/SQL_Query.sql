use projectdb;
SELECT COUNT(*) FROM earthquakes_import;
SHOW WARNINGS;

LOAD DATA LOCAL INFILE 'C:/Users/HP/OneDrive/Desktop/SQL/projectdata.csv'
INTO TABLE earthquakes_import
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(
    id,
    time,
    latitude,
    longitude,
    depth,
    mag,
    magType,
    nst,
    gap,
    dmin,
    rms,
    net,
    updated,
    place,
    type,
    horizontalError,
    depthError,
    magError,
    magNst,
    status,
    locationSource,
    magSource
);

SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT id) AS unique_events,
    SUM(id IS NULL) AS missing_ids,
    SUM(time IS NULL) AS missing_times,
    SUM(type IS NULL) AS missing_types
FROM earthquakes_import;

SELECT
    type,
    COUNT(*) AS event_count
FROM earthquakes_import
GROUP BY type
ORDER BY event_count DESC;

-- converting time and updated from text to date/time
alter table earthquakes_import
add column time_dt DATETIME,
add column updated_dt DATETIME;

update earthquakes_import 
set
time_dt = STR_TO_DATE(time, '%d-%m-%Y %H:%i'),
updated_dt = STR_TO_DATE(updated, '%d-%m-%Y %H:%i');

SET SQL_SAFE_UPDATES = 0;

SELECT
    COUNT(*) AS total_records,
    SUM(time_dt IS NULL) AS missing_event_dates,
    SUM(updated_dt IS NULL) AS missing_update_dates
FROM earthquakes_import;

SET SQL_SAFE_UPDATES = 1;

SELECT time, time_dt, updated, updated_dt
FROM earthquakes_import
LIMIT 5;

-- 1. total no.of earthquakes
select count(*) 
from earthquakes_import 
where type="earthquake";

-- 2. how many earthquakes in each year
select count(*) as Total_earthquake,
Year(str_to_date(time, '%d-%m-%Y %H:%i')) as Earthquake_year
from earthquakes_import
where type = "earthquake" 
group by Earthquake_year
order by Earthquake_year;

-- 3. monthly earthquakes
select year(time_dt) as Year,
month(time_dt) as Month,
count(*) as No_of_Earthquakes
from earthquakes_import
where type="earthquake"
group by Year,Month
order by Year,Month;
 
-- 4. Average magnitude
select avg (mag) from earthquakes_import;

-- 5. Max magnitude earthquake
select max(mag) as highest_mag 
from earthquakes_import;

-- 6. min magnitude
select min(mag) as lowest_mag
from earthquakes_import;

-- 7. magnitude classification
select 
case 
    when mag >=4 and mag <=4.9 then  "Light"
    when mag >=5 and mag <=5.9 then  "Moderate"
    when mag >=6 and mag <=6.9 then  "Strong"
    when mag >=7 and mag <=7.9 then  "Major"
    else "Great"
end as Magnitude_category
from earthquakes_import
where type="earthquake"
group by Magnitude_category
order by min(mag);

-- 8. top 10 strongest earthquakes
select id,mag,time,place, depth
from earthquakes_import
where type="earthquake"
order by mag desc
limit 10;

-- 9. depth category
select
count(*) as Earthquake_count,
case
   when depth <70 then "Shallow"
   when depth<=300 then "Intermediate"
   else "Deep"
end as Depth_category
from earthquakes_import
where type="earthquake"
group by Depth_category
order by min(depth);

-- 10. mag vs depth relationship
select mag, depth, time, place 
from earthquakes_import
where type="earthquake";

-- 11. top 10 earthquake locations
select place,
count(*) as No_of_Earthquakes
from earthquakes_import
where type ="earthquake"
group by place
order by No_of_Earthquakes desc
limit 10;

-- 12. global earthquake map
select latitude, longitude, mag, depth
from earthquakes_import 
where type ="earthquake";

-- 13. avg mag per year
select year(time_dt) as Earthquake_year,
avg(mag) as average_mag,
avg(depth) as average_depth,
max(mag) as highest_mag
from earthquakes_import
where type="earthquake"
group by Earthquake_year
order by Earthquake_year;




