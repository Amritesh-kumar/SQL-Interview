declare @v1 sql_variant ;
set @v1 = 123.888888;
select @v1;
SELECT SQL_VARIANT_PROPERTY(@v1, 'BaseType');  
SELECT SQL_VARIANT_PROPERTY(@v1, 'MaxLength'); 
select CAST(@v1 as decimal(8,2)); 
select CAST(@v1 as int);
SELECT SQL_VARIANT_PROPERTY(@v1, 'BaseType');  
SELECT SQL_VARIANT_PROPERTY(@v1, 'MaxLength'); 
set @v1 = 'abc';
SELECT SQL_VARIANT_PROPERTY(@v1, 'BaseType');  
SELECT SQL_VARIANT_PROPERTY(@v1, 'MaxLength');  
select @v1;
set @v1 = 'abc1'; 
select @v1;
SELECT SQL_VARIANT_PROPERTY(@v1, 'BaseType');  
SELECT SQL_VARIANT_PROPERTY(@v1, 'MaxLength'); 


create table tab1 (cl1 sql_variant, cl2 int);

insert into tab1 values (1.4,3);

select * from tab1