use DataWareHouse

-- Bronze layer script as we are following a medallion architecture for our data warehouse
-- In Bronze layer we are just extracting the data from the source as is without any transformation

--before creating any table need to check whether it is exist or if exist drop the table then create

--Creating bronze layer table for customer info sourced from crm
if OBJECT_ID('bronze.crm_cust_info', 'U') is not null
	Drop table bronze.crm_cust_info
Create table bronze.crm_cust_info(
cst_id int,
cst_key	nvarchar(50),
cst_firstname nvarchar(50),
cst_lastname nvarchar(50),
cst_marital_status nvarchar(50),
cst_gndr nvarchar(50),
cst_create_date Date
);


--Creating bronze layer table for product info sourced from crm
if OBJECT_ID('bronze.crm_prd_info', 'U') is not null
	Drop table bronze.crm_prd_info
Create table bronze.crm_prd_info(
prd_id int,
prd_key nvarchar(50),
prd_nm nvarchar(50),
prd_cost int,
prd_line nvarchar(50),
prd_start_dt date,
prd_end_dt date
);


--Creating bronze layer table for sales details sourced from crm
if OBJECT_ID('bronze.crm_sales_details', 'U') is not null
	Drop table bronze.crm_sales_details
Create table bronze.crm_sales_details(
sls_ord_num	nvarchar(50),
sls_prd_key	nvarchar(50),
sls_cust_id	int,
sls_order_dt int,
sls_ship_dt	int,
sls_due_dt	int,
sls_sales	int,
sls_quantity int,
sls_price int
);


--Creating bronze layer table for customer info sourced from erp
if OBJECT_ID('bronze.erp_cust_info', 'U') is not null
	Drop table bronze.erp_cust_info
Create table bronze.erp_cust_info(
CID	nvarchar(50),
BDATE date,
GEN nvarchar(50),
);


--Creating bronze layer table for customer location sourced from erp
if OBJECT_ID('bronze.erp_loc', 'U') is not null
	Drop table bronze.erp_loc
Create table bronze.erp_loc(
CID	nvarchar(50),
CNTRY nvarchar(50),
);


--Creating bronze layer table for prd cat sourced from erp
if OBJECT_ID('bronze.erp_px_cat', 'U') is not null
	Drop table bronze.erp_px_cat
Create table bronze.erp_px_cat(
ID nvarchar(50),
CAT nvarchar(50),
SUBCAT nvarchar(50),
MAINTENANCE nvarchar(50),
);