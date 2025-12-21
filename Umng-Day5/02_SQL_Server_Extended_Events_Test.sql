USE AdventureWorks2022;

SELECT * FROM Person.Person;

SELECT * FROM Person.Person
WHERE BusinessEntityID = 1001;

USE db01;

CREATE TABLE dbo.Test
(
id int
);

DROP TABLE dbo.Test;

select * from sys.fn_xe_file_target_read_file('c:\xe\tsql_batch*.xel', null, null, null)

select CAST(event_data AS xml) from sys.fn_xe_file_target_read_file('c:\xe\tsql_batch*.xel', null, null, null)


select * from sys.fn_xe_file_target_read_file('c:\xe\deadlock*.xel', null, null, null)

select * from sys.fn_xe_file_target_read_file('c:\xe\deadlock*.xel', null, null, null)
WHERE object_name = 'xml_deadlock_report'

select CAST(event_data AS xml) from sys.fn_xe_file_target_read_file('c:\xe\deadlock*.xel', null, null, null)
WHERE object_name = 'xml_deadlock_report'


select CAST(event_data AS xml).query('//inputbuf') from sys.fn_xe_file_target_read_file('c:\xe\deadlock*.xel', null, null, null)
WHERE object_name = 'xml_deadlock_report'


select CAST(event_data AS xml).query('//process') from sys.fn_xe_file_target_read_file('c:\xe\deadlock*.xel', null, null, null)
WHERE object_name = 'xml_deadlock_report'