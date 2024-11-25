use company;

-- gerente por departamento
select Ssn, Fname, Dname from employee e, department d where e.Ssn = d.Mgrssn;

-- recuperando dependentes por empregados
select Fname, Dependent_name , Relationship from employee e, dependent d where d.Essn = e.Ssn;

-- nascimento e endereço do colaborador por nome 
select Bdate, Address from employee
	where Fname = 'Alex' and Minit = 'D' and Lname = 'Freed';
    
-- recuperando departamento especifico
select * from department where Dname = 'Administration';

select Fname, Lname, Address from employee , department 
	where Dname = 'Administration' and Dnumber= Dno;
    
select Fname, Pname, Essn, hours from project, works_on, employee
	where Pnumber = Pno and Essn = Ssn;
    
-- retirar ambiguidade através do alias ou AS Statement

select Dname as department_name, loc.Dlocation 
	from department as d, dept_locations as loc
    where d.Dnumber = loc.Dnumber;
    
select concat(Fname,'',Lname) as Nome from employee;