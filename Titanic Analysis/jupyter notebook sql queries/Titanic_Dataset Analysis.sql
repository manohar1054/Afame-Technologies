CREATE DATABASE TITANIC
select * from Titanic_Dataset
-----✅ 1️⃣ Total Passengers----
SELECT COUNT(*) AS Total_Passengers
FROM Titanic_Dataset
-----✅ 2️⃣ Total Survivors---
SELECT COUNT(*) AS Total_Survivors
FROM Titanic_Dataset
WHERE Survived = 1
---✅ 3️⃣ Total Deceased---
SELECT COUNT(*) AS Total_Deceased
FROM Titanic_Dataset
WHERE Survived = 0;
--- 4️⃣ Survival Rate (%)---
SELECT 
    CAST(100.0 * SUM(CASE WHEN Survived = 1 THEN 1 ELSE 0 END) / COUNT(*) AS DECIMAL(5,2)) AS Survival_Rate_Percentage
FROM Titanic_Dataset;
--- 5️⃣ Survivors by Gender---
SELECT Sex, COUNT(*) AS Total_Survivors
FROM Titanic_Dataset
WHERE Survived = 1
GROUP BY Sex;
---✅ 6️⃣ Survivors by Passenger Class--
SELECT Pclass, COUNT(*) AS Total_Survivors
FROM Titanic_Dataset
WHERE Survived = 1
GROUP BY Pclass
ORDER BY Pclass;
---✅ 7️⃣ Average Fare---
SELECT AVG(Fare) AS Average_Fare
FROM Titanic_Dataset;
---✅ 8️⃣ Average Fare by Class--
SELECT Pclass, AVG(Fare) AS Average_Fare
FROM Titanic_Dataset
GROUP BY Pclass
ORDER BY Pclass;
---✅ 9️⃣ Survival by Embarkation Port---
SELECT Embarked, COUNT(*) AS Survivors
FROM Titanic_Dataset
WHERE Survived = 1
GROUP BY Embarked;
---✅ 🔟 Age Grouping with Survival Count---
SELECT 
  CASE 
    WHEN Age < 13 THEN 'Child'
    WHEN Age BETWEEN 13 AND 18 THEN 'Teen'
    WHEN Age BETWEEN 19 AND 30 THEN 'Young Adult'
    WHEN Age BETWEEN 31 AND 50 THEN 'Adult'
    ELSE 'Senior'
  END AS Age_Group,
  COUNT(*) AS Total_Passengers,
  SUM(CASE WHEN Survived = 1 THEN 1 ELSE 0 END) AS Survivors
FROM Titanic_Dataset
WHERE Age IS NOT NULL
GROUP BY 
  CASE 
    WHEN Age < 13 THEN 'Child'
    WHEN Age BETWEEN 13 AND 18 THEN 'Teen'
    WHEN Age BETWEEN 19 AND 30 THEN 'Young Adult'
    WHEN Age BETWEEN 31 AND 50 THEN 'Adult'
    ELSE 'Senior'
  END;
  ---🔁 Bonus: Family Size Calculation---
  SELECT 
  PassengerId,
  Name,
  (SibSp + Parch + 1) AS FamilySize
FROM Titanic_Dataset;




