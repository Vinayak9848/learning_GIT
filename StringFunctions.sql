CREATE TABLE #People (
    FullName NVARCHAR(50),
    Email NVARCHAR(50)
);

INSERT INTO #People VALUES
('John Doe',    'john@example.com'),
('Jane Smith',  'jane.smith@example.com'),
('Sam Green',   'sam_green@example.com'),
(' Anna Lee ',  'anna@example.com');

SELECT * FROM #People


SELECT Email FROM #People
WHERE FullName LIKE '%Doe%'

SELECT email,SUBSTRING(email,1,4)
 FROM #People
WHERE FullName LIKE '%Doe%'

SELECT email, REPLACE(SUBSTRING(email,1,LEN(email)),'.com',' ')
 FROM #People
WHERE FullName LIKE '%Doe%'

DECLARE @Name VARCHAR(20),
        @NameCharIndex VARCHAR(20)
   SET @Name =' John '
   SET @NameCharIndex ='Hello_World'
SELECT @Name,
       LEN(@Name)                       AS LenName,
       DATALENGTH(@Name)                AS DatalengthName,
	   TRIM(@Name)                      AS RemvoingTrailandleadingSpaces,
	   LEN(TRIM(@Name))                 AS RemvoingTrailandleadingSpaces_Length,
	   DATALENGTH(TRIM(@Name))          AS RemvoingTrailandleadingSpaces_DataLength,
	   LTRIM(@Name)                     AS ltrimName,
	   LEN(LTRIM(@Name))                AS ltrimName_length,
	   DATALENGTH(LTRIM(@Name))         AS ltrimName_Datalength,
       RTRIM(@Name)                     AS RtrimName,
	   LEN(RTRIM(@Name))                AS RtrimName_length,
	   DATALENGTH(RTRIM(@Name))         AS RtrimName_Datalength,
	   CHARINDEX('ll',@NameCharIndex)   AS CharacterPosition,
	   CHARINDEX('l_',@NameCharIndex)   AS CharacterPosition,
	   PATINDEX('%e%',@NameCharIndex)   AS PatindexCharacterPosition,
	   PATINDEX('%l_%',@NameCharIndex)  AS PatindexCharacterPosition
















