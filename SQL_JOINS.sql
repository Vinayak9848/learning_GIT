/*
Create a query which links this table to the Film table using the SourceID column in each.
You should apply a WHERE clause so that your query lists out the 9 films in the database which have no source:
*/

USE Movies_02
GO
SELECT TOP 100 * FROM dbo.Source
SELECT TOP 100 * FROM dbo.Film

    SELECT FM.Title   AS Title,
	       SC.Source  AS [Source] 
      FROM dbo.Source SC
INNER JOIN dbo.Film FM
        ON SC.SourceID =  FM.SourceID
	WHERE Source ='NA'
 ORDER BY FM.Title
GO

/*
Create a query which uses an inner join to link the categories table to the events table (they share a column/field called CategoryId):
Change the inner join to an outer join, so that you show for each category its events - even when there aren't any:
*/

USE WorldEvents
GO
SELECT * FROM dbo.tblCategory
SELECT * FROM dbo.tblEvent 

	SELECT TE.EventName    AS EventName,
	       TE.EventDate    AS EventDate,
		   TC.CategoryName AS CategoryName,
		   TC.CategoryID   AS CategoryID
	  FROM dbo.tblCategory TC
 LEFT JOIN dbo.tblEvent TE
        ON TC.CategoryID = TE.CategoryID
  ORDER BY EventDate DESC
 
USE DoctorWho
GO

SELECT TOP 100 * FROM dbo.tblAuthor
SELECT TOP 100 * FROM dbo.tblEpisode 
SELECT TOP 100 * FROM tblEpisodeEnemy  
SELECT TOP 100 * FROM tblEnemy         
 
SELECT TA.AuthorID AS AuthorID,
       TE.Title,
	   EN.EnemyName,
	   TA.AuthorName
 FROM dbo.tblAuthor TA
INNER JOIN dbo.tblEpisode  TE
 ON TA.AuthorId = TE.AuthorId
 INNER JOIN tblEpisodeEnemy EE
 ON EE.EpisodeId = TE.EpisodeId
 INNER JOIN tblEnemy EN 
 ON En.EnemyId = EE.EnemyId
 WHERE En.EnemyName LIKE '%Daleks%'


 USE WorldEvents
 GO

 SELECT TOp  100 * FROM dbo.tblCountry
 SELECT TOp  100 * FROM dbo.tblEvent


 SELECT TC.CountryName AS Country,
   TE.EventName AS [What happened],
   TE.EventDate  AS [When happened]
 FROM dbo.tblCountry TC
 INNER JOIN dbo.tblEvent TE
 ON TC.CountryID =TE.CountryID
 ORDER BY [When happened] DESC

USE DoctorWho
GO

SELECT * FROM dbo.tblDoctor
SELECT * FROM dbo.tblEpisode

SELECT * FROM dbo.tblDoctor TD
INNER JOIN dbo.tblEpisode TE
ON TD.DoctorId =TE.DoctorId
WHERE DATEPART(YEAR,TE.EpisodeDate) ='2010'

USE Music_01
GO

SELECT TOP 100 * FROM dbo.City
SELECT TOP 100 * FROM dbo.Venue
SELECT TOP 100 * FROM dbo.Show
SELECT TOP 100 * FROM dbo.Artist
SELECT TOP 100 * FROM dbo.Tour

SELECT 
       A.Artist       AS Artist,
	   T.Tour_name    AS Tour_Name,
	   S.Show_date    AS Show_date,
       V.Venue        AS Venue,
       S.Leg          AS Leg,
	   S.Tickets_sold AS Tickets_sold
 FROM dbo.City C
INNER JOIN dbo.Venue V
ON C.City_ID = V.City_ID
INNER JOIN dbo.Show S
   ON v.Venue_ID = S.Venue_ID
INNER JOIN dbo.Tour T
 ON T.Tour_ID = S.Tour_ID
INNER JOIN dbo.Artist A
 ON A.Artist_ID = T.Artist_ID
 WHERE C.City ='Manchester'
 ORDER BY S.Show_date 

USE DoctorWho
GO
--SELECT * FROM dbo.tblEpisode
SELECT TA.AuthorName,TE.Title,TE.EpisodeType
  FROM dbo.tblAuthor TA
INNER JOIN dbo.tblEpisode TE
ON TA.AuthorId = TE.AuthorId
WHERE TE.EpisodeType LIKE '%Special%' ORDER BY TE.Title
 
USE WorldEvents
GO
SELECT * FROM dbo.tblCountry ORDER bY countryID
SELECT DISTINCT ContinentID  FROM dbo.tblCountry  --8 ContinentID

SELECT EV.EventName,CO.CountryName,EV.CountryID, CO.CountryID
FROM dbo.tblCountry CO
LEFT JOIN dbo.tblEvent EV
ON EV.CountryID = CO.CountryID
WHERE EV.CountryID IS NULL

USE Music_01
GO
 SELECT * FROM dbo.Album
 SELECT * FROM [dbo].[Genre]

SELECT Title AS Title,[US_sales_(m)] AS US_Sales,GR.Genre AS Subgenre 
  FROM dbo.Album AM
INNER JOIN dbo.Genre GR
ON Am.Subgenre_ID = GR.Genre_ID
  WHERE [US_sales_(m)]>0.5 AND [US_sales_(m)]<10
  AND GR.Genre ='Metal'

  use Music_01

select
	a.Title
	,a.[US_sales_(m)]
	,s.Subgenre
from
	dbo.Album as a
	inner join dbo.Subgenre as s on a.Subgenre_ID = s.Subgenre_ID
	inner join dbo.Genre as g on s.Genre_ID = g.Genre_ID
where
	a.[US_sales_(m)] >= 0.5
	and a.[US_sales_(m)] < 10
	and g.Genre = 'metal'
order by
	a.Title asc


 
