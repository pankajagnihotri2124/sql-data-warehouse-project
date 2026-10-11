
-- creating data base and schemas for bronze, silver and gold layer of the data architecture

--before running this query make sure that no database exist with the same name

Create Database DataWareHouse

use DataWareHouse;

Create Schema bronze;
go
Create Schema silver;
go
Create Schema gold;
