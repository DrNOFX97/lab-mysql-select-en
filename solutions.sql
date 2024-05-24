USE pubs;

-- Challenge 1 - Who Have Published What At Where?
SELECT 
    ta.au_id AS 'AUTHOR ID',
    au.au_lname AS 'LAST NAME',
    au.au_fname AS 'FIRST NAME',
    t.title AS 'TITLE',
    pub.pub_name AS 'PUBLISHER'
FROM 
    titleauthor ta
JOIN 
    authors au ON ta.au_id = au.au_id
JOIN 
    titles t ON ta.title_id = t.title_id
JOIN 
    publishers pub ON t.pub_id = pub.pub_id
ORDER BY 
    ta.au_id ASC;


-- Challenge 2 - Who Have Published How Many At Where?
SELECT 
    ta.au_id AS 'AUTHOR ID',
    au.au_lname AS 'LAST NAME',
    au.au_fname AS 'FIRST NAME',
    pub.pub_name AS 'PUBLISHER',
    COUNT(t.title_id) AS 'TITLE COUNT'
FROM 
    titleauthor ta
JOIN 
    authors au ON ta.au_id = au.au_id
JOIN 
    titles t ON ta.title_id = t.title_id
JOIN 
    publishers pub ON t.pub_id = pub.pub_id
GROUP BY 
    ta.au_id, au.au_lname, au.au_fname, pub.pub_name
ORDER BY 
    `TITLE COUNT` DESC;
    
-- Challenge 3 - Best Selling Authors
SELECT 
    ta.au_id AS 'AUTHOR ID',
    au.au_lname AS 'LAST NAME',
    au.au_fname AS 'FIRST NAME',
    COUNT(t.title_id) AS 'TOTAL'
FROM 
    titleauthor ta
JOIN 
    authors au ON ta.au_id = au.au_id
JOIN 
    titles t ON ta.title_id = t.title_id
GROUP BY 
    ta.au_id, au.au_lname, au.au_fname
ORDER BY 
    COUNT(t.title_id) DESC
LIMIT 3;

-- Challenge 4 - Best Selling Authors Ranking
SELECT 
    ta.au_id AS 'AUTHOR ID',
    au.au_lname AS 'LAST NAME',
    au.au_fname AS 'FIRST NAME',
    COUNT(t.title_id) AS 'TOTAL'
FROM 
    authors au
LEFT JOIN 
    titleauthor ta ON au.au_id = ta.au_id
LEFT JOIN 
    titles t ON ta.title_id = t.title_id
GROUP BY 
    au.au_id, au.au_lname, au.au_fname
ORDER BY 
    COUNT(t.title_id) DESC;
