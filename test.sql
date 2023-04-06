SELECT first_name
FROM employees;

SELECT *
FROM tab;

SELECT salary, salary*10 AS bonus
FROM employees;

SELECT salary, salary*10 AS ���ʽ�
FROM employees; -- �ѱ۷δ� �� ���� ����

SELECT salary, salary*10 AS "b o n u s"
FROM employees;


SELECT last_name || '���� �޿���' || salary || '�Դϴ�' AS name
FROM employees;

SELECT first_name 
FROM employees;

-- DISTINCT �� �ߺ����� �� ������ִ� ��ɾ�
SELECT DISTINCT first_name
FROM employees;

SELECT first_name, last_name
FROM employees;

SELECT DISTINCT first_name, last_name
FROM employees;


/*
first_name  last_name
sunder         Abel
sunder         Abel
sunder         Ande
*/

/*
-- SELECT �Է¼���
SELECT column_name1, colomn_name2
FROM table_name1, table_name2
WHERE column_name = 'value'
GROUP BY column_name
HAVING column_name = 'value'
ORDER BY column_name ASC, column_name DESC;

-- SELECT �ؼ�����
FROM table_name1, table_name2
WHERE column_name = 'value'
GROUP BY column_name
HAVING column_name = 'value'
SELECT column_name1, column_name2
ORDER BY column_name ASC, column_name DESC;

ASC -> ������������ (��������)
DESC -> ������������ 
*/

-- ��ҹ��� ��Ȯ�� ����, ����ǥ ���� ��Ȯ���ؾ���, WHERE������ =�� ���ٸ� �ǹ���
--employees���̺��� first_name �÷��� ���� 'David' �϶��� First_name, salary�� ����϶�
SELECT first_name,salary
FROM employees
WHERE first_name = 'David';

--employees���̺��� salary�� 3000�̸� �϶��� first_name, salary�� ����϶�.
SELECT first_name, salary
FROM employees
WHERE salary < 3000;

-- ���� �ʴ�
-- employees ���̺��� first_name�� 'David'�� �ƴ� ���� first_name, salary�� ���
SELECT first_name, salary
FROM employees
WHERE first_name != 'David';

SELECT first_name, salary
FROM employees
WHERE first_name <> 'David';

SELECT first_name, salary
FROM employees
WHERE first_name ^= 'David';


-- �������� : AND(&&) , OR(||)
-- employees ���̺��� salary�� 3000, 9000, 17000�� ��
-- first_name, hire_date, salary�� ����϶�.
SELECT first_name, hire_date, salary
FROM employees
WHERE salary = 3000 OR salary = 9000 OR salary = 17000;

SELECT first_name, hire_date, salary
FROM employees
WHERE salary IN(3000,9000,17000);


-- employees���̺��� salary�� 3000���� 5000���� �϶���
-- first_name, hire_date, salary�� ����϶�.
SELECT first_name, hire_date, salary
FROM employees
WHERE salary >= 3000 AND salary <= 5000;

SELECT first_name, hire_date, salary
FROM employees
WHERE salary BETWEEN 3000 AND 5000;


--employees���̺��� job_id�� 'IT_PROG'�� �ƴҶ�
--first_name, email, job_id�� ����϶�
SELECT first_name, email, job_id
FROM employees
WHERE job_id != 'IT_PROG';

SELECT first_name, email, job_id
FROM employees
WHERE job_id <> 'IT_PROG';

SELECT first_name, email, job_id
FROM employees
WHERE job_id ^= 'IT_PROG';

SELECT first_name, email, job_id
FROM employees
WHERE NOT(job_id = 'IT_PROG');


-- �������϶�
-- employees ���̺��� salary�� 3000, 9000, 17000 �ƴҶ�
-- first_name, hire_date, salary�� ����϶�.
SELECT first_name, hire_date, salary
FROM employees
WHERE NOT (salary = 3000 OR salary = 9000 OR salary = 17000);

SELECT first_name, hire_date, salary
FROM employees
WHERE salary NOT IN(3000,9000,17000);


-- employees���̺��� salary�� 3000���� 5000������ �ƴ� ����
-- first_name, hire_date, salary�� ����϶�.
SELECT first_name, hire_date, salary
FROM employees
WHERE NOT(salary >= 3000 AND salary <= 5000);

SELECT first_name, hire_date, salary
FROM employees
WHERE salary NOT BETWEEN 3000 AND 5000;


-- employees���̺��� commission_pct�� null�϶�
-- first_name, salary, commission_pct�� ����϶�.
-- NULL ���Ҷ��� = null �� �ƴ϶� IS NULL�� �����.
SELECT first_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NULL;

-- employees���̺��� commision_pct�� null�ƴ�
-- first_name, salary, commission_pct�� ����϶�.
SELECT first_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;

--employees���̺��� first_name�� 'der'�� ���Ե� 
--first_name, salary, email�� ����϶�.
SELECT first_name, salary, email
FROM employees
WHERE first_name LIKE '%der%'

--employees���̺��� first_name�� ���� 'A'�� �����ϰ�
--�ι�° ���ڴ� ���� �����̸� 'exander'�� ������
--first_name, salary, email�� ����϶�

SELECT first_name, salary, email
FROM employees
WHERE first_name LIKE 'A_exander';


/*
WHERE������ ���� ������ 3���� ����
1.�񱳿����� : = > >= < <= != <> ^=
2.SQL������ : BETWEEN a AND b, IN , LIKE, IS NULL
3.�������� : AND, OR, NOT

�켱����
1.��ȣ()
2.NOT������
3.�񱳿�����, SQL������
4.AND
5.OR
*/



-- employees���̺��� job_id�� ������������ 
-- first_name, email, job_id�� ����Ͻÿ�.
SELECT first_name, email, job_id
FROM employees
ORDER BY job_id ASC;

SELECT first_name, email, job_id
FROM employees
ORDER BY job_id;


?employees���̺��� department_id�� ���������ϰ�
?first_name�� ������������
?department_id, first_name, salary�� ����Ͻÿ�.
SELECT department_id, first_name, salary
FROM employees
ORDER BY department_id ASC, first_name DESC;

?employees���̺��� ����(job_id)�� 'FI_ACCOUNT'�� �������
?�޿�(salary)�� ���������� first_name, job_id, salary�� ����Ͻÿ�.
SELECT first_name, job_id, salary
FROM employees
WHERE job_id = 'FI_ACCOUNT'
ORDER BY salary DESC;

SELECT *
FROM employees;

/*/////////////////////////////////////
//����
////////////////////////////////////// */
-- 1) employees���̺��� �޿��� 17000������ ����� �����ȣ, �����(first_name), �޿��� ����Ͻÿ�.
SELECT employee_id, first_name, salary
FROM employees
WHERE salary <= 17000;


-- 2) employees���̺��� 2005�� 1�� 1�� ���Ŀ� �Ի��� ����� ����Ͻÿ�.
SELECT *
FROM employees
WHERE hire_date > '2005-01-01';


-- 3) employees���̺��� �޿��� 5000�̻��̰� ����(job_id)�� 'IT_PROG'�� ����� �����(first_name), �޿�, 
--  ������ ����Ͻÿ�.
SELECT first_name, salary, job_id
FROM employees
WHERE salary >= 5000 AND job_id = 'IT_PROG';

-- 4) employees���̺��� �μ���ȣ�� 10, 40, 50 �� ����� �����(first_name), �μ���ȣ, �̸���(email)�� ����Ͻÿ�.
SELECT first_name, department_id, email
FROM employees
WHERE department_id IN(10,40,50);

-- 5) employees���̺��� �����(first_name)�� even�� ���Ե� �����,�޿�,�Ի����� ����Ͻÿ�.
SELECT first_name, salary, hire_date
FROM employees
WHERE first_name LIKE '%even%';

-- 6) employees���̺��� �����(first_name)�� teve�յڿ� ���ڰ� �ϳ��� �ִ� �����,�޿�,�Ի����� -����Ͻÿ�.
SELECT first_name, salary, hire_date
FROM employees
WHERE first_name LIKE '_teve_';

-- 7) employees���̺��� �޿��� 17000�����̰� Ŀ�̼��� null�� �ƴҶ��� �����(first_name), �޿�, 
--  Ŀ�̼��� ����Ͻÿ�.
 SELECT first_name, salary, commission_pct
 FROM employees
 WHERE salary <= 17000 AND commission_pct IS NOT NULL;
  
-- 8) 2005�⵵�� �Ի��� ����� �����(first_name),�Ի����� ����Ͻÿ�.
 SELECT first_name, hire_date
 FROM employees
 WHERE hire_date LIKE '05%';
 

-- 9) Ŀ�̼� ���� ����� ����� �����(first_name), Ŀ�̼��� ����Ͻÿ�.
 SELECT first_name, commission_pct
 FROM employees
 WHERE commission_pct IS NOT NULL;

-- 10) ����� 206�� ����� �̸�(first_name)�� �޿��� ����Ͻÿ�.
 SELECT first_name, salary
 FROM employees
 WHERE employee_id = 206;

-- 11) �޿��� 3000�� �Ѵ� ����(job_id),�޿�(salary)�� ����Ͻÿ�.
 SELECT job_id , salary
 FROM employees
 WHERE salary > 3000;

-- 12)'ST_MAN'������ ������ ������� �����(first_name)�� ����(job_id)�� ����Ͻÿ�.
SELECT first_name , job_id
FROM employees
WHERE NOT(job_id = 'ST_MAN');

-- 13) ������ 'PU_CLERK' �� ��� �߿��� �޿��� 3000 �̻��� �����(first_name),����(job_id),�޿�(salary)�� ����Ͻÿ�.
SELECT first_name, job_id, salary
FROM employees
WHERE job_id = 'PU_CLERK' AND salary >= 3000;

-- 14) commission�� �޴� �����(first_name)�� ����Ͻÿ�.
 SELECT first_name
 FROM employees
 WHERE commission_pct IS NOT NULL;

-- 15) 20�� �μ��� 30�� �μ��� ���� ����� �����(fist_name), �μ��� ����Ͻÿ�.
SELECT first_name, department_id
FROM employees
WHERE department_id IN(20,30);
   

-- 16) �޿��� ���� ������� ����ϵ� �޿��� ���� ��� �����(first_name) ������� ����Ͻÿ�.
 SELECT *
 FROM employees
 ORDER BY salary DESC, first_name ASC;

-- 17) ������ 'MAN' ������ ����� �����(first_name), �޿�(salary), ����(job_id)�� ����Ͻÿ�.
 SELECT first_name, salary, job_id
 FROM employees
 WHERE job_id LIKE '%MAN';


SELECT length ('korea')
FROM dual;

SELECT length ('�ѱ�')
FROM dual;

CREATE TABLE person1(
data varchar2(5) -- 5byte�� �ǹ���
);


CREATE TABLE person2(
data varchar2(10) 
);

DESC person1;

DESC person2;

DESC person1, person2;

SELECT * FROM person1;
SELECT * 
FROM person2;

INSERT INTO person1(data)
VALUES('korea');

INSERT INTO person2(data)
VALUES ('3');


INSERT INTO person1(data)
VALUES('south korea');

INSERT INTO person1(data)
VALUES('apple');

INSERT INTO person1(data)
VALUES('�ѱ�');
