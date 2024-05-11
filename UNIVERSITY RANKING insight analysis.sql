SELECT * FROM [UniversityRanking (2)];


EXEC sp_rename
'[UniversityRanking (2)].name',
'NameOfUni','COLUMN'

--Retrieving the Universities and their student population, only including those with population greater than 500,000 students.

SELECT NAMEOFUNI, STUDENT_POPULATION,YEAR,Country
FROM [UniversityRanking (2)] 
WHERE Student_Population > 500000;

--Analyzing top11 Universities with respect to REaserch environment and sort in descending order.

SELECT TOP 11 NAMEOFUNI,Country, RESEARCH_ENVIRONMENT
FROM [UniversityRanking (2)]
ORDER BY Research_Environment DESC

--Analyze the Universities to with respect to REaserch quality and sort in descending order.

SELECT TOP 70 NAMEOFUNI,Country, Research_Quality
FROM [UniversityRanking (2)]
ORDER BY Research_Quality DESC

--Retrieve the top 5 Universities where name of uni contains the letter "W" and has international student > 20% .

SELECT  NAMEOFUNI, INTERNATIONAL_STUDENTS,Country
FROM [UniversityRanking (2)]
WHERE Country NOT IN ('Germany', 'France', 'United Kingdom', 'United States')
ORDER BY International_students desc

--Investigate the correlation between Teaching,Reseach quality and Research environment.

SELECT top 20 nameofuni, Teaching, Research_environment,Research_Quality
FROM [UniversityRanking (2)]
ORDER BY Teaching asc;

--Identify Universities that has an industry impact greater than average industry impact.

SELECT AVG(Industry_Impact) FROM [UniversityRanking (2)]

SELECT NAMEOFUNI, INDUSTRY_IMPACT
FROM [UniversityRanking (2)]
WHERE Industry_Impact > (SELECT AVG(Industry_Impact) FROM [UniversityRanking (2)])
ORDER BY Industry_Impact DESC


-- Find Universities with Reserch quality greater than 95, resesrch environment over 95,Teaching 95 and overrall score over 95.

SELECT NameOfUni, Research_quality,Research_environment, Overall_score,Teaching
FROM [UniversityRanking (2)]
WHERE Research_Quality > 95 AND Research_Environment > 95 AND Teaching > 95 AND Overall_Score > 95 ;

--Provide an in-depth analysis of the average REsearch factors (Quality,Environment and teaching) for each Univertities to inform competitive strategies.

SELECT top 50 NameOfUni, AVG(Research_Quality) AS AvgResearchQuality, AVG(Research_Environment) AS AvgResearchEnvironment, AVG(Teaching) AS AvgTeaching
FROM [UniversityRanking (2)]
GROUP BY nameofuni;

--Identify Nameofuni with  student population greater than 50000  in the Year 2016 in the united state,United Kingdom and Canada.

SELECT YEAR from [UniversityRanking (2)]

SELECT DISTINCT NAMEOFUNI, Student_Population,YEAR,Country
FROM [UniversityRanking (2)]
WHERE YEAR IN (2016) AND Student_Population > 50000 AND Country IN ('UNITED STATES', 'United Kingdom', 'canada')
ORDER BY STUDENT_POPULATION;

--Select all school in the Nigeria

SELECT distinct NAMEOFUNI, COUNTRY 
FROM  [UniversityRanking (2)]
WHERE COUNTRY IN ('Nigeria')

--Confirm the number of  Nigeria universities appeared in the dataset .

SELECT COUNT(Country) 
FROM [UniversityRanking (2)]
WHERE COUNTRY IN ('Nigeria');

--RETRIEVE AVERAGE RESEARCH QUALITY OF SCHOOLS IN THE UNITED STATES

SELECT AVG(Research_Quality) FROM [UniversityRanking (2)] WHERE Country in ('united states')
 
 --RETRIEVE NUMBER OF UNIVERSITIES FROM EACH COUNTRY
 
 SELECT COUNTRY, COUNT(NAMEOFUNI) AS NameOfUni
 FROM [UniversityRanking (2)]
 GROUP BY Country
 ORDER BY NameOfUni ASC 

 --nIGERIA

SELECT NAMEOFUNI, International_Students ,YEAR, Industry_Impact
FROM [UniversityRanking (2)]
WHERE YEAR IN (2019) AND INDUSTRY_IMPACT > 50 AND Country IN ('nIGERIA')



SELECT NameOfUni, AVG(Research_Quality) AS AvgResearchQuality, AVG(Research_Environment) AS AvgResearchEnvironment, AVG(Teaching) AS AvgTeaching
FROM [UniversityRanking (2)]
WHERE YEAR IN (2019) AND Research_Quality > 89 AND Research_Environment > 90 AND Teaching > 70
GROUP BY nameofuni;
