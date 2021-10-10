--create table #holiday (holidayDate date)
--Insert into #holiday values ('2021-06-30')
--Insert into #holiday values ('2021-06-09')
--Insert into #holiday values ('2021-05-31')
--Insert into #holiday values ('2021-06-28')
--select * from #holiday

Declare @input_date Date = '2021-06-05'
Declare @last_date Date = eomonth(@input_date)
Declare @last_working_date Date, @second_last_working_date Date

select @last_working_date = case when datename(w, @last_date) = 'Saturday' then dateadd(dd,-1,@last_date)
when datename(w, @last_date) = 'Sunday' then dateadd(dd,-2,@last_date)
else @last_date end 

select @second_last_working_date = case when datename(w, @last_working_date) = 'Saturday' then dateadd(dd,-1,@last_working_date)
when datename(w, @last_working_date) = 'Sunday' then dateadd(dd,-2,@last_working_date)
when datename(w, @last_working_date) = 'Monday' then dateadd(dd,-3,@last_working_date)
else dateadd(dd,-1,@last_working_date)  end 

if exists(select 1 from #holiday where holidayDate = @last_working_date)
begin
select @last_working_date = dateadd(dd,-1,@last_working_date) 
select @last_working_date = case when datename(w, @last_working_date) = 'Saturday' then dateadd(dd,-1,@last_working_date)
when datename(w, @last_working_date) = 'Sunday' then dateadd(dd,-2,@last_working_date)
else @last_working_date end 

select @second_last_working_date = case when datename(w, @second_last_working_date) = 'Saturday' then dateadd(dd,-2,@second_last_working_date)
when datename(w, @second_last_working_date) = 'Sunday' then dateadd(dd,-3,@second_last_working_date)
else dateadd(dd,-1,@second_last_working_date)  end 

end

if exists(select 1 from #holiday where holidayDate = @second_last_working_date)
begin

select @second_last_working_date = case when datename(w, @second_last_working_date) = 'Saturday' then dateadd(dd,-2,@second_last_working_date)
when datename(w, @second_last_working_date) = 'Sunday' then dateadd(dd,-3,@second_last_working_date)
else dateadd(dd,-1,@second_last_working_date)  end 

end


select @last_working_date as 'Last Working Date' , @second_last_working_date as 'Second Last Working date'