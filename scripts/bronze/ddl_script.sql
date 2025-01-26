Create or Alter procedure bronze.load_bronze as

Begin
	Declare @start_time Datetime, @end_time datetime, @batch_start_time date, @batch_end_time date;

	Begin Try
			Set @batch_start_time = GETDATE();
				Print '=======================================================';
				Print 'Loading Bronze Layer';
				Print '=======================================================';


				Print '--------------------------------------------------------';
				Print 'Loading CRM Tables';
				Print '--------------------------------------------------------';
	

			Set @start_time = GETDATE();
				Print '>> Truncating Table: bronze.crm_cus_info';
			Truncate table bronze.crm_cus_info;
				Print '>> Inserting Data Into: bronze.crm_cus_info';
			Bulk Insert bronze.crm_cus_info

			from 'C:\Users\chuka\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'

			With (
				Firstrow = 2,
				fieldterminator = ',',
				tablock
			);
			Set @end_time = GETDATE();
			Print '>> Load Duration: ' + Cast(DateDiff(second, @start_time, @end_time) as NVARCHAR) + ' seconds';
			Print '-------------------------------------------------------------------------------'
	
			Set @start_time = GETDATE();
			Print '>> Truncating Table: bronze.crm_prd_info';
			Truncate table bronze.crm_prd_info;
				Print '>> Inserting Data into: bronze.crm_prd_info';
			Bulk Insert bronze.crm_prd_info

			from 'C:\Users\chuka\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'

			With (
				Firstrow = 2,
				fieldterminator = ',',
				tablock
			);
			Set @end_time = GETDATE();
			Print '>> Load Duration: ' + Cast(DateDiff(second, @start_time, @end_time) as NVARCHAR) + ' seconds';
			Print '-------------------------------------------------------------------------------'
	
			Set @start_time = GETDATE();
			Print '>> Truncating Table: bronze.crm_sales_details';
			Truncate table bronze.crm_sales_details;
				Print '>> Inserting Data Into: bronze.crm_sales_details';
			Bulk Insert bronze.crm_sales_details

			from 'C:\Users\chuka\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'

			With (
				Firstrow = 2,
				fieldterminator = ',',
				tablock
			);
			Set @end_time = GETDATE();
			Print '>> Load Duration: ' + Cast(DateDiff(second, @start_time, @end_time) as NVARCHAR) + ' seconds';
			Print '-------------------------------------------------------------------------------'

	

				Print '--------------------------------------------------------';
				Print 'Loading ERP Tables';
				Print '--------------------------------------------------------';
	
			Set @start_time = GETDATE();
			Print '>> Truncating Table: bronze.erp_cust_az12';
			Truncate table bronze.erp_cust_az12;
				Print '>> Truncating Table: bronze.erp_cust_az12';
			Bulk Insert bronze.erp_cust_az12

			from 'C:\Users\chuka\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'

			With (
				Firstrow = 2,
				fieldterminator = ',',
				tablock
			);
			Set @end_time = GETDATE();
			Print '>> Load Duration: ' + Cast(DateDiff(second, @start_time, @end_time) as NVARCHAR) + ' seconds';
			Print '-------------------------------------------------------------------------------'
	
			Set @start_time = GETDATE();
			Print '>> Truncating Table: bronze.erp_loc_a101';
			Truncate table bronze.erp_loc_a101;
				Print '>> Insert Data Into : bronze.erp_loc_a101';
			Bulk Insert bronze.erp_loc_a101

			from 'C:\Users\chuka\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'

			With (
				Firstrow = 2,
				fieldterminator = ',',
				tablock
			);
			Set @end_time = GETDATE();
			Print '>> Load Duration: ' + Cast(DateDiff(second, @start_time, @end_time) as NVARCHAR) + ' seconds';
			Print '-------------------------------------------------------------------------------'
	
			Set @start_time = GETDATE();
			Print '>> Truncating Table: bronze.erp_px_cat_g1v2';
			Truncate table bronze.erp_px_cat_g1v2;
				Print '>> Insert Data Into: bronze.erp_px_cat_g1v2';
			Bulk Insert bronze.erp_px_cat_g1v2

			from 'C:\Users\chuka\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'

			With (
				Firstrow = 2,
				fieldterminator = ',',
				tablock
			);
			Set @end_time = GETDATE();
			Print '>> Load Duration: ' + Cast(DateDiff(second, @start_time, @end_time) as NVARCHAR) + ' seconds';
			Print '-------------------------------------------------------------------------------'
	End Try


	Begin Catch
				Print '=======================================================';
				Print 'Error Occured during Loading Bronze Layer';
				Print 'Error Message ' + Error_Message();
				Print 'Error Message ' + Cast (Error_Message() as NVARCHAR);
				Print 'Error Message ' + Cast (Error_State() as NVARCHAR);
				Print '=======================================================';
	End Catch
			Set @batch_end_time = GETDATE();
			Print '========================================================'
			Print 'Loading Bronze Layer is Completed!!!'
			Print ' - Total Load Duration: ' + Cast(DateDiff(second, @start_time, @end_time) as NVARCHAR) + ' seconds';
			Print '========================================================'
End;

Exec bronze.load_bronze
