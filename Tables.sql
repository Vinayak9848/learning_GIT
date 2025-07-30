USE master
GO
--Creating a Database
CREATE DATABASE DataWarehouse
GO

--Working inside the above created database
USE DataWarehouse
GO

--Creating SCHEMA (bronze,silver,gold)
CREATE SCHEMA bronze
GO
CREATE SCHEMA silver
GO
CREATE SCHEMA gold
GO

CREATE TABLE bronze_crm_Cust_Info(
                                  cst_id INT,
								  cst_key VARCHAr(20),
								  cst_firstname VARCHAR(20),
								  cst_lastname VARCHAR(20),
								  cst_marital_status CHAR(1),
								  cst_gndr CHAR(1),
								  cst_create_date DATE
								  )

--DROP TABLE dbo.bronze_crm_prd_Info
CREATE TABLE dbo.bronze_crm_prd_Info(
prd_id       INT,
prd_key      NVARCHAR(80),
prd_nm       NVARCHAR(80),
prd_cost     INT,
prd_line     NVARCHAR(10),
prd_start_dt DATE,
prd_end_dt   DATE
)

CREATE TABLE bronze_crm_sales_Info(
                                   sls_ord_num  NVARCHAr(50),
                                   sls_prd_key  NVARCHAr(50),
                                   sls_cust_id  INT,
                                   sls_order_dt INT,
                                   sls_ship_dt  INT,
                                   sls_due_dt   INT,
                                   sls_sales    INT,
                                   sls_quantity INT,
                                   sls_price    INT 
								  )

--DROP TABLE bronze_erp_cust_az12
CREATE TABLE bronze_erp_cust_az12(
                                 CID NVARCHAR(30),
								 BDATE DATE,
								 GEN VARCHAr(10)
                                 )

CREATE TABLE bronze_erp_loc_a101(
                                 CID NVARCHAR(50), 
								 cntry NVARCHAr(50)
                                 )

CREATE TABLE bronze_erp_px_cat_g1v2(
                                 id NVARCHAR(50),
								 cat            NVARCHAR(50),
								 subcat		    NVARCHAR(50),
								 maintainance   NVARCHAR(50)  
                                 )

CREATE OR ALTER PROCEDURE dbo.bronze_load_bronze
AS
BEGIN 
 	DECLARE @Errmsg   NVARCHAR(1000),
            @RowCount INT,
		    @Errnum INT =@@error 
 BEGIN TRY
BEGIN TRANSACTION T1
PRINT '<<Loading the Broze Layer Data>>'f
 
PRINT '<<-------------------------------------------------------1st_Insert_BEGIN--------------------------------------------------------------------------->>'                    



                    PRINT '<<TRUNCATING TABLE bronze_crm_Cust_Info >>'
					SET @Errmsg ='Error inserting into the table:bronze_crm_Cust_Info'
                    TRUNCATE TABLE dbo.bronze_crm_Cust_Info
 
                    BULK INSERT dbo.bronze_crm_Cust_Info
                           FROM 'C:\Users\MyBon\Downloads\sql-data-warehouse-project (1)\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
                           WITH (
                                  FIRSTROW=2,
                           	      FIELDTERMINATOR =',',
                           	      TABLOCK
                                );

 
								 SELECT @RowCount =@@Rowcount,@Errnum =@@error
                      IF @Errnum<>0
					  BEGIN 
                       	  ;THROW 60000,@Errmsg,1
						END 

PRINT '<<-------------------------------------------------------2nd_Insert_BEGIN--------------------------------------------------------------------------->>'
					PRINT '<<TRUNCATING TABLE bronze_crm_prd_Info >>'
                    
					SET @Errmsg ='Error inserting into the table:bronze_crm_prd_Info'
					TRUNCATE TABLE dbo.bronze_crm_prd_Info
  
                    BULK INSERT dbo.bronze_crm_prd_Info
                           FROM 'C:\Users\MyBon\Downloads\sql-data-warehouse-project (1)\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
                           WITH (
                                 FIRSTROW=2,
	                             FIELDTERMINATOR =',',
	                             TABLOCK
	                            )
 

								 SELECT @RowCount =@@Rowcount,@Errnum =@@error
                       IF @Errnum <> 0
                       BEGIN 
                           
						   ;THROW 60000,@Errmsg,1
						END  
 
PRINT '<<-------------------------------------------------------3rd_Insert_BEGIN--------------------------------------------------------------------------->>'PRINT '<<TRUNCATING TABLE bronze_crm_sales_Info >>'

  SET @Errmsg ='Error inserting into the table:bronze_crm_sales_Info'
TRUNCATE TABLE dbo.bronze_crm_sales_Info  

BULK INSERT dbo.bronze_crm_sales_Info  FROM 'C:\Users\MyBon\Downloads\sql-data-warehouse-project (1)\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
WITH(
FIRSTROW=2,
FieldTerminator=',',
TABLOCK
)  

 SELECT @RowCount =@@Rowcount,@Errnum =@@error
                          IF @Errnum <> 0
                       BEGIN 
                           
						   ;THROW 60000,@Errmsg,1
						END 

PRINT '<<-------------------------------------------------------4th_Insert_BEGIN--------------------------------------------------------------------------->>'
PRINT '<<TRUNCATING TABLE bronze_erp_cust_az12 >>'
 
  SET @Errmsg ='Error inserting into the table:bronze_erp_cust_az12'
TRUNCATE TABLE dbo.bronze_erp_cust_az12
 
BULK INSERT dbo.bronze_erp_cust_az12 FROM 'C:\Users\MyBon\Downloads\sql-data-warehouse-project (1)\sql-data-warehouse-project\datasets\source_erp\CUST_aZ12.csv'
WITH 
(
FIRSTROw=2,`
Fieldterminator =',',
TABLOCK
) 

  SELECT @RowCount =@@Rowcount,@Errnum =@@error
                          IF @Errnum <> 0
                       BEGIN 
                            
						   ;THROW 60000,@Errmsg,1
						END 


PRINT '<<-------------------------------------------------------5th_Insert_BEGIN--------------------------------------------------------------------------->>'
PRINT '<<TRUNCATING TABLE bronze_erp_loc_a101 >>'

  SET @Errmsg ='Error inserting into the table:bronze_erp_loc_a101'
TRUNCATE TABLE dbo.bronze_erp_loc_a101
 
BULK INSERT dbo.bronze_erp_loc_a101 FROM 'C:\Users\MyBon\Downloads\sql-data-warehouse-project (1)\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
WITH
(
FIRSTROW=2,
FIELDTERMINATOR= ',',
TABLOCK
) 
 SELECT @RowCount =@@Rowcount,@Errnum =@@error
                          IF @Errnum <> 0
                       BEGIN 
                           
						   ;THROW 60000,@Errmsg,1
						END 
 
PRINT '<<-------------------------------------------------------6th_Insert_BEGIN--------------------------------------------------------------------------->>'
PRINT '<<TRUNCATING TABLE bronze_erp_px_cat_g1v2 >>'

SET @Errmsg ='Error inserting into the table:bronze_erp_px_cat_g1v2'
TRUNCATE TABLE dbo.bronze_erp_px_cat_g1v2
 
BULK INSERT dbo.bronze_erp_px_cat_g1v2 FROM 'C:\Users\MyBon\Downloads\sql-data-warehouse-project (1)\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
WITH 
(
FIRSTROW=2,
Fieldterminator= ',',
TABLOCK
)
SET @Errnum = @@error 
SET @RowCount =@@RowCount

 SELECT @RowCount =@@Rowcount,@Errnum =@@error
                       IF @Errnum <> 0
                       BEGIN 
                             
						   ;THROW 60000,@Errmsg,1
						END 
 
COMMIT TRANSACTION T1
END TRY
BEGIN CATCH
           ROLLBACK TRANSACTION T1
          PRINT CONCAT(@ErrMsg, ' | Error#: ', ERROR_NUMBER(), ' | Error Line#: ', ERROR_LINE(), ' | Error Message: ', ERROR_MESSAGE())
      --    ;THROW 60000,@Errmsg,1
  END CATCH
 END
   
  

EXEC dbo.bronze_load_bronze

