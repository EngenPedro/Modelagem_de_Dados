use company;

select Fname, Lname, Address from employee
where Address like '%Atlanta%';

select * from employee
where (Salary between 40000 and 62500) and Dno = 6;
