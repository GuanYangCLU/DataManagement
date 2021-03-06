/*Final Exam SQL practial assignment QUERY*/
/*IT 509-02 Data Management*/
/*Dr. Virginia ILIE*/
/*Yang, Guan*/

/*Q1*/
SELECT city,state,au_lname,au_fname
FROM authors
WHERE state IN ('KS','UT','CA')
ORDER BY state, au_lname;

/*Q2*/
SELECT COUNT(au_id) AS authornumber
FROM authors
WHERE state = 'CA';

/*Q3*/
SELECT title_id, AVG(ytd_sales) AS [average ytd_sales]
FROM titles
GROUP BY title_id, type
HAVING type = 'business'
ORDER BY AVG(ytd_sales);

/*Q4*/
SELECT ord_num,payterms,stor_name,city,state
FROM stores AS ST,sales AS S
WHERE ST.stor_id = S.stor_id AND payterms = 'Net 60'
ORDER BY state,stor_name;

/*Q5*/
SELECT au_fname,au_lname,state,title
FROM authors AS A, titles AS T, titleauthor as TA
WHERE A.au_id = TA.au_id AND TA.title_id = T.title_id AND state = 'CA'
ORDER BY au_lname, au_fname;

/*Q6*/
SELECT stor_name,ST.city,ST.state,qty,price,title,type,pub_name
FROM stores AS ST,sales AS S,titles AS T,publishers AS P
WHERE ST.stor_id = S.stor_id AND S.title_id = T.title_id AND T.pub_id = P.pub_id
ORDER BY stor_name,pub_name;

/*Q7*/
SELECT COUNT(DISTINCT title_id) AS [Unique number of titles sold]
FROM sales;

/*Q8*/
SELECT stor_name,title,au_lname,au_fname,price,qty,(qty*price) AS [individual order total]
FROM stores AS ST,sales AS S,titles AS T,authors AS A, titleauthor AS TA
WHERE ST.stor_id = S.stor_id AND S.title_id = T.title_id AND A.au_id = TA.au_id AND TA.title_id = T.title_id AND (qty*price)>=100
ORDER BY stor_name,title;