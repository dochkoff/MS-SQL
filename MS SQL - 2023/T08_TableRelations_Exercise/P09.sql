SELECT m.MountainRange, PeakName, Elevation FROM Peaks AS p
JOIN Mountains AS m on m.Id = p.MountainId
Where m.MountainRange = 'Rila'
ORDER BY Elevation DESC