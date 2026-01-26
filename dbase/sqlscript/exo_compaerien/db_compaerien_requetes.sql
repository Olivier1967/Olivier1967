-- 1 Quels sont les vols au départ de Paris entre 12h et 14h ?
SELECT vol_id, vol_villeDepart, vol_heureDepart 
FROM vol
WHERE vol_villeDepart = 'paris' AND (vol_heureDepart BETWEEN '12' AND '14');

--2 Quels sont les pilotes dont le nom commence par "S"
SELECT pil_id, pil_nom
FROM pilote
WHERE pil_nom LIKE '%s%';

-- 3 Pour chaque ville, donner le nombre et les capacités minimum et maximum des avions qui s'y trouvent.
SELECT distinct av_localisation, MAX(av_capacite) AS maxCapacite, MIN(av_capacite) AS minCapacite, COUNT(av_type) AS nbAvions
FROM avion
GROUP BY av_localisation;


-- 4 Pour chaque ville, donner la capacité moyenne des avions qui s'y trouvent et cela par type d'avion.

5
Quelle est la capacité moyenne des avions pour chaque ville ayant plus de 1 avion ?
6
Quels sont les noms des pilotes qui habitent dans la ville de localisation d'un Airbus
7
Quels sont les noms des pilotes qui conduisent un Airbus et qui habitent dans la ville de localisation d'un Airbus ?
8
Quels sont les noms des pilotes qui conduisent un Airbus ou qui habitent dans la ville de localisation d'un Airbus ?