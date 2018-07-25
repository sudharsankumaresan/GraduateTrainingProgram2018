-- ProblemSet 00, July <25> <2018>
-- Submission by <sudharsankumaresan@accenture.com> 

1. Select the Employee with the top three salaries

SELECT NAME,salary FROM EMPLOYEE WHERE SALARY >=(SELECT MAX(SALARY) FROM EMPLOYEE where SALARY<(SELECT MAX(SALARY) FROM EMPLOYEE WHERE SALARY<(SELECT MAX(SALARY) FROM EMPLOYEE))) ORDER BY SALARY DESC;

TARA CUMMINGS|99475
PAUL WILLS|94791
ADAM WAYNE|94324

 Your Record Count -3
 
 2.Select the Employee with the least salary
 
 select name from employee where salary=(select min(salary) from employee);
 
 JOHN HELLEN
 
 Your Record Count -1
 
 3.Select the Employee who does not have a manager in the department table
 
 SELECT *FROM EMPLOYEE E INNER JOIN DEPT D ON D.DEPMANAGER=E.NAME;
 
A178|BRUCE WILLS|D03|66861|A298|D03|PRODUCT|BRUCE WILLS
A187|ADAM JUSTIN|D02|80543|A298|D02|COMMUNICATIONS|ADAM JUSTIN
A165|NATASHA STEVENS|D05|31377|A298|D05|FINANCE|NATASHA STEVENS
A120|TIM ARCHER|D01|48834|A298|D01|HEALTH|TIM ARCHER

Your Record Count -4

4.Select the Employee who is also a Manager

SELECT NAME FROM EMPLOYEE E INNER JOIN DEPT D ON E.NAME=D.DEPMANAGER;

BRUCE WILLS
ADAM JUSTIN
NATASHA STEVENS
TIM ARCHER

Your Record Count -4

5.Select the Empolyee who is a Manager and has least salary

A165|NATASHA STEVENS|31377

Your Record Count -1

6.Select the total number of Employees in Communications departments

SELECT COUNT(*) FROM EMPLOYEE WHERE DEP_ID in(SELECT DEP_ID FROM DEPT WHERE DEPNAME='COMMUNICATIONS');

6

Your Record Count -1

7.Select the Employee in Finance Department who has the top salary

SELECT NAME,MAX(SALARY)FROM EMPLOYEE WHERE DEP_ID=(select DEP_ID FROM DEPT WHERE DEPNAME='FINANCE');

ADAM WAYNE|94324

Your Record Count -1

8.Select the Employee in product depatment who has the least salary

SELECT NAME,MIN(SALARY)FROM EMPLOYEE WHERE DEP_ID=(select DEP_ID FROM DEPT WHERE DEPNAME='PRODUCT');

NICK MARTIN|50174

Your Record Count -1

9.Select the count of Empolyees in Health with maximum salary

SELECT COUNT(E_ID) FROM EMPLOYEE WHERE SALARY=(SELECT MAX(SALARY) FROM EMPLOYEE WHERE DEP_ID=(select DEP_ID FROM DEPT WHERE DEPNAME='HEALTH'));

1

Your Record Count -1

10.Select the Employees who report to Natasha Stevens

SELECT NAME FROM EMPLOYEE WHERE MANAGERID=(SELECT E_ID FROM EMPLOYEE WHERE NAME='NATASHA STEVENS');

ADAM WAYNE
JOSEPHANGELIN

Your Record Count -2

11.Display the Employee name,Employee count,Dep name,Dept manager in the Health department

SELECT NAME,COUNT(E_ID),DEPNAME,DEPMANAGER FROM EMPLOYEE E INNER JOIN DEPT D ON E.DEP_ID=D.DEP_ID WHERE D. DEP_ID=(select DEP_ID FROM DEPT WHERE DEPNAME='HEALTH');

TIM ARCHER|5|HEALTH|TIM ARCHER

Your Record Count -1

12.Display the Department id,Employee ids and Manager ids for the Communications department

SELECT D.DEP_ID,E_ID,MANAGERID FROM EMPLOYEE E INNER JOIN DEPT D ON E.DEP_ID=D.DEP_ID WHERE D. DEP_ID=(select DEP_ID FROM DEPT WHERE DEPNAME='COMMUNICATIONS');

D02|A116|A187
D02|A187|A298
D02|A121|A187
D02|A194|A187
D02|A133|A187

Your Record Count -5

13.Select the Average Expenses for Each dept with Dept id and Dept name

SELECT D.DEP_ID,DEPNAME, AVG(SALARY) FROM EMPLOYEE E INNER JOIN DEPT D ON E.DEP_ID=D.DEP_ID GROUP BY D.DEP_ID;

D01|HEALTH|60535.6
D02|COMMUNICATIONS|54549.8
D03|PRODUCT|58517.5
D04|INSURANCE|64020.0
D05|FINANCE|56660.3333333333

Your Record Count -5

14.Select the total expense for the department finance

SELECT SUM(SALARY) FROM EMPLOYEE E INNER JOIN DEPT D ON E.DEP_ID=D.DEP_ID WHERE D. DEP_ID=(select DEP_ID FROM DEPT WHERE DEPNAME='FINANCE');

169981

Your Record Count -1

15.Select the department which spends the least with Dept id and Dept manager name

SELECT MIN(L),DEP_ID,DEPNAME,DEPMANAGER FROM (SELECT SUM(SALARY) AS L,D.DEP_ID,D.DEPNAME,D.DEPMANAGER FROM DEPT D INNER JOIN EMPLOYEE E ON D.DEP_ID=E.DEP_ID GROUP BY E.DEP_ID);

117035|D03|PRODUCT|BRUCE WILLS

Your Record Count -1

16.Select the count of Employees in each department

SELECT COUNT(*) FROM EMPLOYEE GROUP BY DEP_ID;

5
5
2
2
3

Your Record Count -5

17.Select the count of Employees in each department having salary <10000

SELECT COUNT(*) FROM EMPLOYEE GROUP BY DEP_ID HAVING SALARY<10000;

Your Record Count -0

18.Select the total number of Employees in Dept id D04

SELECT COUNT(E_ID) FROM EMPLOYEE  WHERE DEP_ID='D04';

2

Your Record Count -1

19.Select all department details of the Department with Maximum Employees

SELECT MAX(COUNT),DEP_ID,DEPNAME,DEPMANAGER FROM (SELECT COUNT(*) AS COUNT,D.DEP_ID,D.DEPNAME,D.DEPMANAGER FROM DEPT D INNER JOIN EMPLOYEE E ON D.DEP_ID=E.DEP_ID GROUP BY E.DEP_ID);

5|D01|HEALTH|TIM ARCHER

Your Record Count -1

20.Select the Employees who has Tim Cook as their manager

SELECT * FROM EMPLOYEE WHERE MANAGERID=(SELECT E_ID FROM EMPLOYEE WHERE NAME='TIM COOK');

Your Record Count -0










