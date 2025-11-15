Create database ola;
use ola;
show tables;
select * from bookings;

-- 1. retrive all successful bookings
create view Successful_bookings as
select * from bookings where booking_status ='Success';
select * from Successful_bookings;

-- 2. find the avg ride distance for each vehicle type --
create view ride_distance_for_each_vehicle as
select Vehicle_Type, avg(Ride_Distance) as average_distance from bookings
group by Vehicle_Type;
select * from ride_distance_for_each_vehicle;

-- 3.Get total number of canceled rides by customers
create view canceled_rides_by_customer as
select count(*) from bookings
where booking_status= 'canceled by customer';
select * from canceled_rides_by_customer;

-- 4. List the top 10 customers who booked the highest number of rides
create view top_10_customers as 
select customer_ID, count(Booking_ID) as total_rides
from bookings
group by customer_ID 
order by total_rides desc
limit 10;
select * from top_10_customers;

-- 5. Get the number of rides canceled by drivers due to personal and car related issue
create view number_of_rides_canceled_by_drivers as 
select count(*) as drivers_canceled from bookings
where canceled_rides_by_driver ='Personal & Car related issue';
Select * from number_of_rides_canceled_by_drivers;

-- 6. Find the maximum and minimum rating for prime sedan bookings
create view max_min_driver_rating as
select Vehicle_type, max(driver_Ratings) as Max, min(driver_ratings) as min
from bookings where vehicle_type='prime sedan';
Select * from max_min_driver_rating;

-- 7. Retrieve all rides where payment was made by UPI 
create view upi_payment as 
select * from bookings
where payment_method='UPI';
Select * from upi_payment;

-- 8. find the average customer rating per vehicle
create view average_customer_rating_per_vehicle as
select vehicle_type, avg(customer_rating) as avg_customer_rating 
from bookings group by vehicle_type;
Select * from average_customer_rating_per_vehicle;



-- 9. Calculate total booking value of rides completed sucessfully
create view total_booking_value as 
select sum(Booking_value) as total_successful_values
from bookings
where booking_status ='success';
select * from total_booking_value;


-- 10. List all incomplete rides along with the reason
select incomplete_rides, incomplete_rides_reason
from bookings
where incomplete_rides='Yes';










