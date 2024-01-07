set search_path to szlaki_gorskie;
-- Czas przejścia pomiędzy dwoma punktami
SELECT czas_wejscia, czas_zejscia
FROM Szlak
WHERE punkt_startowy = 1 AND punkt_koncowy = 2;
-- Czas przejścia pomiędzy dwoma punkami z punktami pośrednimi (schroniska, szczyt)
SELECT SUM(czas_wejscia) as czas_wejscia, SUM(czas_zejscia) as czas_zejscia
FROM Szlak
WHERE punkt_startowy IN (1, 2, 4, 5) AND punkt_koncowy IN (2, 3, 4, 5);