create database bank_db;
use bank_db;
select* from customer;

/* Total customer*/
select count(distinct customer_id) from customer;

/*total churned customer*/
select sum(exited) from customer;

/*churn rate*/
select round(sum(exited)/count(customer_id)*100,2) churn_rate from customer;

/*churn per country*/
select geography , round(sum(exited)/count(customer_id)*100,2) churn_rate from customer group by geography order by churn_rate desc ;

/*churn per gender*/
select gender , round(sum(exited)/count(customer_id)*100,2) churn_rate from customer group by gender order by churn_rate desc ;

/*churn per age_group*/
select age_group,  round(sum(exited)/count(customer_id)*100,2) churn_rate from customer group by age_group order by churn_rate desc ;

/*churn per product*/
select num_of_products ,  round(sum(exited)/count(customer_id)*100,2) churn_rate from customer group by num_of_products order by churn_rate desc ;

select num_of_products, count(customer_id) customers ,round(sum(exited),2) churned  ,round(sum(exited)/count(customer_id)*100,2) churn_rate from customer group by num_of_products ;
/*churn by active status*/
select active_status ,  round(sum(exited)/count(customer_id)*100,2) churn_rate from customer group by active_status order by churn_rate desc ;

/*churn based on credit_score*/
select credit_score ,  round(sum(exited)/count(customer_id)*100,2) churn_rate from customer group by credit_score order by churn_rate desc ;
/*churn by tenure*/
select tenure_group ,  round(sum(exited)/count(customer_id)*100,2) churn_rate from customer group by tenure_group order by churn_rate desc ;

/*churn by balance*/
select balance , round(sum(exited)/count(customer_id)*100,2) churn_rate from customer group by balance order by churn_rate desc ;

/*churn by salary*/
select estimated_salary , round(sum(exited)/count(customer_id)*100,2) churn_rate from customer group by estimated_salary order by churn_rate desc ;

/*country with most customers*/
select geography , count(customer_id) customers from customer group by geography order by customers desc;

/*churned and retained_customers*/
select round(churned/customers*100,2) churn_rate, round((customers-churned)/customers*100,2) retained_rate from  (select sum(exited) churned,count(customer_id) customers from customer ) a;

/*avg credit score of churned customer*/
select avg(credit_score) from customer where exited=1 ;

select sum(credit_score)/sum(exited) avg_credi_score_churned from customer where exited=1;