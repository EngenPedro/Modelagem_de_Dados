use company;

-- Round aredonda o resultado para duas casas decimais
-- Recolhendo o valor do INSS 
select Fname, Lname, Salary, round(Salary * 0.011,2) as INSS from employee;

-- Exibindo nome completo salario e criando uma nova coluna com aumento de 10% 
-- sobre o salario para os colaboradores do projeto Middleware
select concat(e.Fname, ' ', e.Lname) as complete_name, e.Salary, round(e.Salary * 1.1,2) as Increased_Salary
	from employee e, works_on w, project p
    where (e.Ssn = w.Essn and w.Pno = p.Pnumber and p.Pname = 'Middleware');