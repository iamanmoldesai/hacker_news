
#Understanding the dataset


 SELECT title,score
 FROM hacker_news.hn
 ORDER BY score DESC
 LIMIT 5;

#Hacker News Moderating
#Is a small percentage of Hacker News submitters taking the majority of the points?

 SELECT SUM(score)
 FROM hacker_news.hn;

 #Finding the individual users who have gotten combined scores of more than 200, and their combined scores.

 SELECT user, SUM(score)
 FROM hacker_news.hn
 GROUP BY user
 HAVING SUM(score) > 200
 ORDER BY 2 DESC; 

 #Is Hacker News dominated by these users?

 SELECT (517 + 309 + 304 + 282) / 6366.0;

#How many times has each offending user posted this link?
-- Hacker News Moderating
SELECT user,COUNT(*)
FROM hacker_news.hn
WHERE url LIKE '%watch?v=dQw4w9WgXcQ%'
GROUP BY 1
ORDER BY 2 DESC;

#Which sites feed Hacker News?

#Which of these sites feed Hacker News the most:
#GitHub, Medium, or New York Times?
SELECT CASE
   WHEN url LIKE '%github.com%' THEN 'GitHub'
   WHEN url LIKE '%medium.com%' THEN 'Medium'
   WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
   ELSE 'Other'
  END AS 'Source'
FROM hacker_news.hn
LIMIT 10;

#Which sites feed Hacker News?
 
SELECT CASE
   WHEN url LIKE '%github.com%' THEN 'GitHub'
   WHEN url LIKE '%medium.com%' THEN 'Medium'
   WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
   ELSE 'Other'
  END AS 'Source',
  COUNT(*)
FROM hacker_news.hn
GROUP BY 1;

#What's the best time to post a story?


SELECT timestamp
FROM hacker_news.hn
LIMIT 10;


SELECT timestamp,
   strftime('%H', timestamp)
FROM hacker_news.hn
GROUP BY 1
LIMIT 20;


SELECT strftime('%H', timestamp), 
   AVG(score),
   COUNT(*)
FROM hacker_news.hn
GROUP BY 1
ORDER BY 1;


#What's the best time to post a story?
 
SELECT strftime('%H', timestamp) AS 'Hour', 
   ROUND(AVG(score), 1) AS 'Average Score', 
   COUNT(*) AS 'Number of Stories'
FROM hacker_news.hn
WHERE timestamp IS NOT NULL
GROUP BY 1
ORDER BY 1;

