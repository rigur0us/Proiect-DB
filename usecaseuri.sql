-- USE CASE uri

-- Această interogare determina jucatorul cu cele mai multe puncte castigate intr-un turneu specific.
SELECT 
    p.FirstName, 
    p.LastName, 
    fr.win_points, 
    c.comp_name 
FROM 
    Final_results fr
JOIN 
    Player p ON fr.id_user = p.id
JOIN 
    Competition c ON fr.id_competition = c.id
WHERE 
    c.comp_name = 'Grand Chess Tour Blitz'
ORDER BY 
    fr.win_points DESC
LIMIT 1;

-- Top 3 jucători cu cel mai mare rating din baza de date

SELECT 
    FirstName, 
    LastName, 
    Rating 
FROM 
    Player
ORDER BY 
    Rating DESC
LIMIT 3;

-- Determinarea castigatorilor tuturor competitiilor, in functie de punctele obtinute în fiecare competiție.
SELECT c.comp_name, p.FirstName, p.LastName, fr.win_points
FROM Final_results fr
JOIN Player p ON fr.id_user = p.id
JOIN Competition c ON fr.id_competition = c.id
WHERE fr.win_points = (
    SELECT MAX(win_points)
    FROM Final_results
    WHERE id_competition = c.id
)
ORDER BY c.comp_name;

-- unde a participat carlsen
SELECT c.comp_name, c.comp_place, c.comp_date
FROM Competition c
JOIN Player_competition pc ON c.id = pc.id_competition
JOIN Player p ON pc.id_player = p.id
WHERE p.FirstName = 'Magnus' AND p.LastName = 'Carlsen'
ORDER BY c.comp_date;

