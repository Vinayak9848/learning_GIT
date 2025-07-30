CREATE TABLE #TestNulls (val1 INT, val2 INT);

INSERT INTO #TestNulls VALUES
(NULL, 100),
(200, NULL),
(NULL, NULL);

SELECT*
FROM #TestNulls;
 

SELECT
val1,
Val2,
ISNULL(val1,0) AS ISNULLFunction,
Coalesce(val1,Val2,999) AS COALESCEFunction,
NULLIF(val1,Val2) AS NULLIFFunction
FROM #TestNulls


