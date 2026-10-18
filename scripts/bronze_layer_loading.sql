-- stored procedure to load the data into bronze layer

-- loading the data into bronze layer tables
-- before loading we need to make sure we are not duplicating the data so first we need to truncate the table
-- loading = bulk loading

Create or alter procedure bronze.load_bronze_layer as 
begin
	declare @strt Datetime, @end Datetime; -- adding time stamp to check how much time it took to completet the loading individual table

	begin try  -- Error handling
		print '-----------------------------------------------------------------------';
		Print 'Bronze layer loading initiated....';
		print '-----------------------------------------------------------------------';
		set @strt = GETDATE() -- to get the loading start time
		Print 'loading into bronze.crm_cust_info....';
		--loading the data into 'bronze.crm_cust_info'
		truncate table bronze.crm_cust_info  -- to dlt the duplicate records
		bulk insert bronze.crm_cust_info
		from "D:\SQL\SQL_Project\SQL_Warehouse_Project\Dataset\source_crm\cust_info.csv"
		with (
			firstrow = 2, -- as first row is header skipping the 1st row
			fieldterminator = ',' -- specifying the filedeterminator
		);
		set @end = GETDATE() -- to get the loading end time
		print 'loading into bronze.crm_cust_info completed in ' + cast(Datediff(second, @strt, @end) as nvarchar(100)) + ' sec';


		set @strt = GETDATE() -- to get the loading start time
		Print 'loading into bronze.crm_prd_info....';
		--loading the data into 'bronze.crm_prd_info'
		truncate table bronze.crm_prd_info  -- to dlt the duplicate records
		bulk insert bronze.crm_prd_info
		from "D:\SQL\SQL_Project\SQL_Warehouse_Project\Dataset\source_crm\prd_info.csv"
		with (
			firstrow = 2, -- as first row is header skipping the 1st row
			fieldterminator = ',' -- specifying the filedeterminator
		)
		set @end = GETDATE() -- to get the loading end time
		print 'loading into bronze.crm_prd_info completed in ' + cast(Datediff(second, @strt, @end) as nvarchar(100)) + ' sec';


		set @strt = GETDATE() -- to get the loading start time
		Print 'loading into bronze.crm_sales_details....';
		--loading the data into 'bronze.crm_sales_details'
		truncate table bronze.crm_sales_details  -- to dlt the duplicate records
		bulk insert bronze.crm_sales_details
		from "D:\SQL\SQL_Project\SQL_Warehouse_Project\Dataset\source_crm\sales_details.csv"
		with (
			firstrow = 2, -- as first row is header skipping the 1st row
			fieldterminator = ',' -- specifying the filedeterminator
		)
		set @end = GETDATE() -- to get the loading end time
		print 'loading into bronze.crm_sales_details completed in ' + cast(Datediff(second, @strt, @end) as nvarchar(100)) + ' sec';


		set @strt = GETDATE() -- to get the loading start time
		Print 'loading into bronze.erp_cust_info....';
		--loading the data into 'bronze.erp_cust_info'
		truncate table bronze.erp_cust_info  -- to dlt the duplicate records
		bulk insert bronze.erp_cust_info
		from "D:\SQL\SQL_Project\SQL_Warehouse_Project\Dataset\source_erp\CUST_AZ12.csv"
		with (
			firstrow = 2, -- as first row is header skipping the 1st row
			fieldterminator = ',' -- specifying the filedeterminator
		)
		set @end = GETDATE() -- to get the loading end time
		print 'loading into bronze.erp_cust_info completed in ' + cast(Datediff(second, @strt, @end) as nvarchar(100)) + ' sec';


		set @strt = GETDATE() -- to get the loading start time
		Print 'loading into bronze.erp_loc....';
		--loading the data into 'bronze.erp_loc'
		truncate table bronze.erp_loc  -- to dlt the duplicate records
		bulk insert bronze.erp_loc
		from "D:\SQL\SQL_Project\SQL_Warehouse_Project\Dataset\source_erp\LOC_A101.csv"
		with (
			firstrow = 2, -- as first row is header skipping the 1st row
			fieldterminator = ',' -- specifying the filedeterminator
		)
		set @end = GETDATE() -- to get the loading end time
		print 'loading into bronze.erp_loc completed in ' + cast(Datediff(second, @strt, @end) as nvarchar(100)) + ' sec';


		set @strt = GETDATE() -- to get the loading start time
		Print 'loading into bronze.erp_px_cat....';
		--loading the data into 'bronze.erp_px_cat'
		truncate table bronze.erp_px_cat  -- to dlt the duplicate records
		bulk insert bronze.erp_px_cat
		from "D:\SQL\SQL_Project\SQL_Warehouse_Project\Dataset\source_erp\PX_CAT_G1V2.csv"
		with (
			firstrow = 2, -- as first row is header skipping the 1st row
			fieldterminator = ',' -- specifying the filedeterminator
		)

		set @end = GETDATE() -- to get the loading end time
		print 'loading into bronze.erp_px_cat completed in ' + cast(Datediff(second, @strt, @end) as nvarchar(100)) + ' sec';
	end try
	begin catch
		print 'Error occured.....';
		print 'Loading failed';
	end catch
end