--Create table #name(name varchar(50))
--Insert into #name values ('Amritesh')
--Insert into #name values ('Rakesh')
--Insert into #name values ('Sita')
--Insert into #name values ('Sonu')
--Insert into #name values ('Raptor')
--Insert into #name values ('Analytics')
--Insert into #name values ('Tom')

--select * from #name

-- to search name which start with vowel a,e,i,o,u
select * from #name where name like '[aeiou]%'

-- to search name which not start with vowel 
select * from #name where name like '[^aeiou]%'

-- to search name where 2nd character is vowel
select * from #name where name like '_[aeiou]%'

-- to search name where last character is vowel
select * from #name where name like '%[aeiou]'

-- to search name which start with a,r
select * from #name where name like '[ar]%'

-- to search name which start with a to r any letter 
select * from #name where name like '[a-s]%'
