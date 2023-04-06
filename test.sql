SELECT first_name
FROM employees;

SELECT *
FROM tab;

SELECT salary, salary*10 AS bonus
FROM employees;

SELECT salary, salary*10 AS 보너스
FROM employees; -- 한글로는 잘 쓰지 않음

SELECT salary, salary*10 AS "b o n u s"
FROM employees;


SELECT last_name || '님의 급여는' || salary || '입니다' AS name
FROM employees;

SELECT first_name 
FROM employees;

-- DISTINCT 는 중복제거 후 출력해주는 명령어
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
-- SELECT 입력순서
SELECT column_name1, colomn_name2
FROM table_name1, table_name2
WHERE column_name = 'value'
GROUP BY column_name
HAVING column_name = 'value'
ORDER BY column_name ASC, column_name DESC;

-- SELECT 해석순서
FROM table_name1, table_name2
WHERE column_name = 'value'
GROUP BY column_name
HAVING column_name = 'value'
SELECT column_name1, column_name2
ORDER BY column_name ASC, column_name DESC;

ASC -> 오름차순정렬 (생략가능)
DESC -> 내림차순정렬 
*/

-- 대소문자 정확히 구분, 따옴표 구분 정확히해야함, WHERE절에서 =는 같다를 의미함
--employees테이블에서 first_name 컬럼의 값이 'David' 일때의 First_name, salary를 출력하라
SELECT first_name,salary
FROM employees
WHERE first_name = 'David';

--employees테이블에서 salary가 3000미만 일때의 first_name, salary를 출력하라.
SELECT first_name, salary
FROM employees
WHERE salary < 3000;

-- 같지 않다
-- employees 테이블에서 first_name이 'David'가 아닌 값의 first_name, salary를 출력
SELECT first_name, salary
FROM employees
WHERE first_name != 'David';

SELECT first_name, salary
FROM employees
WHERE first_name <> 'David';

SELECT first_name, salary
FROM employees
WHERE first_name ^= 'David';


-- 논리연산자 : AND(&&) , OR(||)
-- employees 테이블에서 salary가 3000, 9000, 17000일 때
-- first_name, hire_date, salary을 출력하라.
SELECT first_name, hire_date, salary
FROM employees
WHERE salary = 3000 OR salary = 9000 OR salary = 17000;

SELECT first_name, hire_date, salary
FROM employees
WHERE salary IN(3000,9000,17000);


-- employees테이블에서 salary이 3000부터 5000까지 일때의
-- first_name, hire_date, salary을 출력하라.
SELECT first_name, hire_date, salary
FROM employees
WHERE salary >= 3000 AND salary <= 5000;

SELECT first_name, hire_date, salary
FROM employees
WHERE salary BETWEEN 3000 AND 5000;


--employees테이블에서 job_id가 'IT_PROG'이 아닐때
--first_name, email, job_id을 출력하라
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


-- 부정문일때
-- employees 테이블에서 salary가 3000, 9000, 17000 아닐때
-- first_name, hire_date, salary을 출력하라.
SELECT first_name, hire_date, salary
FROM employees
WHERE NOT (salary = 3000 OR salary = 9000 OR salary = 17000);

SELECT first_name, hire_date, salary
FROM employees
WHERE salary NOT IN(3000,9000,17000);


-- employees테이블에서 salary이 3000부터 5000까지가 아닐 때의
-- first_name, hire_date, salary을 출력하라.
SELECT first_name, hire_date, salary
FROM employees
WHERE NOT(salary >= 3000 AND salary <= 5000);

SELECT first_name, hire_date, salary
FROM employees
WHERE salary NOT BETWEEN 3000 AND 5000;


-- employees테이블에서 commission_pct이 null일때
-- first_name, salary, commission_pct을 출력하라.
-- NULL 비교할때는 = null 이 아니라 IS NULL을 사용함.
SELECT first_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NULL;

-- employees테이블에서 commision_pct이 null아닐
-- first_name, salary, commission_pct을 출력하라.
SELECT first_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;

--employees테이블에서 first_name에 'der'이 포함된 
--first_name, salary, email을 출력하라.
SELECT first_name, salary, email
FROM employees
WHERE first_name LIKE '%der%'

--employees테이블에서 first_name의 값중 'A'로 시작하고
--두번째 문자는 임의 문자이면 'exander'로 끝나는
--first_name, salary, email을 출력하라

SELECT first_name, salary, email
FROM employees
WHERE first_name LIKE 'A_exander';


/*
WHERE절에서 사용된 연산자 3가지 종류
1.비교연산자 : = > >= < <= != <> ^=
2.SQL연산자 : BETWEEN a AND b, IN , LIKE, IS NULL
3.논리연산자 : AND, OR, NOT

우선순위
1.괄호()
2.NOT연산자
3.비교연산자, SQL연산자
4.AND
5.OR
*/



-- employees테이블에서 job_id을 오름차순으로 
-- first_name, email, job_id을 출력하시오.
SELECT first_name, email, job_id
FROM employees
ORDER BY job_id ASC;

SELECT first_name, email, job_id
FROM employees
ORDER BY job_id;


?employees테이블에서 department_id를 오름차순하고
?first_name을 내림차순으로
?department_id, first_name, salary를 출력하시오.
SELECT department_id, first_name, salary
FROM employees
ORDER BY department_id ASC, first_name DESC;

?employees테이블에서 업무(job_id)이 'FI_ACCOUNT'인 사원들의
?급여(salary)가 높은순으로 first_name, job_id, salary을 출력하시오.
SELECT first_name, job_id, salary
FROM employees
WHERE job_id = 'FI_ACCOUNT'
ORDER BY salary DESC;

SELECT *
FROM employees;

/*/////////////////////////////////////
//문제
////////////////////////////////////// */
-- 1) employees테이블에서 급여가 17000이하인 사원의 사원번호, 사원명(first_name), 급여를 출력하시오.
SELECT employee_id, first_name, salary
FROM employees
WHERE salary <= 17000;


-- 2) employees테이블에서 2005년 1월 1일 이후에 입사한 사원을 출력하시오.
SELECT *
FROM employees
WHERE hire_date > '2005-01-01';


-- 3) employees테이블에서 급여가 5000이상이고 업무(job_id)이 'IT_PROG'이 사원의 사원명(first_name), 급여, 
--  업무을 출력하시오.
SELECT first_name, salary, job_id
FROM employees
WHERE salary >= 5000 AND job_id = 'IT_PROG';

-- 4) employees테이블에서 부서번호가 10, 40, 50 인 사원의 사원명(first_name), 부서번호, 이메일(email)을 출력하시오.
SELECT first_name, department_id, email
FROM employees
WHERE department_id IN(10,40,50);

-- 5) employees테이블에서 사원명(first_name)이 even이 포함된 사원명,급여,입사일을 출력하시오.
SELECT first_name, salary, hire_date
FROM employees
WHERE first_name LIKE '%even%';

-- 6) employees테이블에서 사원명(first_name)이 teve앞뒤에 문자가 하나씩 있는 사원명,급여,입사일을 -출력하시오.
SELECT first_name, salary, hire_date
FROM employees
WHERE first_name LIKE '_teve_';

-- 7) employees테이블에서 급여가 17000이하이고 커미션이 null이 아닐때의 사원명(first_name), 급여, 
--  커미션을 출력하시오.
 SELECT first_name, salary, commission_pct
 FROM employees
 WHERE salary <= 17000 AND commission_pct IS NOT NULL;
  
-- 8) 2005년도에 입사한 사원의 사원명(first_name),입사일을 출력하시오.
 SELECT first_name, hire_date
 FROM employees
 WHERE hire_date LIKE '05%';
 

-- 9) 커미션 지급 대상인 사원의 사원명(first_name), 커미션을 출력하시오.
 SELECT first_name, commission_pct
 FROM employees
 WHERE commission_pct IS NOT NULL;

-- 10) 사번이 206인 사원의 이름(first_name)과 급여를 출력하시오.
 SELECT first_name, salary
 FROM employees
 WHERE employee_id = 206;

-- 11) 급여가 3000이 넘는 업무(job_id),급여(salary)를 출력하시오.
 SELECT job_id , salary
 FROM employees
 WHERE salary > 3000;

-- 12)'ST_MAN'업무을 제외한 사원들의 사원명(first_name)과 업무(job_id)을 출력하시오.
SELECT first_name , job_id
FROM employees
WHERE NOT(job_id = 'ST_MAN');

-- 13) 업무이 'PU_CLERK' 인 사원 중에서 급여가 3000 이상인 사원명(first_name),업무(job_id),급여(salary)을 출력하시오.
SELECT first_name, job_id, salary
FROM employees
WHERE job_id = 'PU_CLERK' AND salary >= 3000;

-- 14) commission을 받는 사원명(first_name)을 출력하시오.
 SELECT first_name
 FROM employees
 WHERE commission_pct IS NOT NULL;

-- 15) 20번 부서와 30번 부서에 속한 사원의 사원명(fist_name), 부서를 출력하시오.
SELECT first_name, department_id
FROM employees
WHERE department_id IN(20,30);
   

-- 16) 급여가 많은 사원부터 출력하되 급여가 같은 경우 사원명(first_name) 순서대로 출력하시오.
 SELECT *
 FROM employees
 ORDER BY salary DESC, first_name ASC;

-- 17) 업무이 'MAN' 끝나는 사원의 사원명(first_name), 급여(salary), 업무(job_id)을 출력하시오.
 SELECT first_name, salary, job_id
 FROM employees
 WHERE job_id LIKE '%MAN';


SELECT length ('korea')
FROM dual;

SELECT length ('한글')
FROM dual;

CREATE TABLE person1(
data varchar2(5) -- 5byte를 의미함
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
VALUES('한글');
