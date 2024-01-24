-- Question 3
select count(1)
from green_tripdata_2019_09 
where TO_CHAR(CAST(lpep_pickup_datetime as TIMESTAMP), 'YYYY-MM-DD') = '2019-09-18'
and TO_CHAR(cast(lpep_dropoff_datetime as TIMESTAMP), 'YYYY-MM-DD') = '2019-09-18';
--15612

-- Question 4
select 
TO_CHAR(CAST(lpep_pickup_datetime as TIMESTAMP), 'YYYY-MM-DD') as pick_up_date,
trip_distance
from green_tripdata_2019_09
order by trip_distance desc
limit 1;
-- "2019-09-26" - 341.64

-- Question 5
select "Borough",sum(total_amount)
from green_tripdata_2019_09 green
join zones z
on green."PULocationID" = z."LocationID"
where TO_CHAR(CAST(lpep_pickup_datetime as TIMESTAMP), 'YYYY-MM-DD') = '2019-09-18'
and "Borough" not like 'Unknown'
group by "Borough"
order by 2 desc;
-- "Manhattan", "Queens", "Brooklyn"

-- Question 6
select tip_amount,zdo."Zone"
from green_tripdata_2019_09 green
join zones zpu
on green."PULocationID" = zpu."LocationID"
join zones zdo
on green."DOLocationID" = zdo."LocationID"
where TO_CHAR(CAST(lpep_pickup_datetime as TIMESTAMP), 'YYYY-MM') = '2019-09'
and zpu."Zone" like 'Astoria'
order by tip_amount desc
limit 1;
-- 62.31, "JFK Airport"


