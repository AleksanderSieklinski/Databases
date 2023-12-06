set search_path to kurs;

CREATE OR REPLACE FUNCTION add_participant_to_course(id_uczestnik INT, id_kurs INT) RETURNS INTEGER AS $$
DECLARE
   max_uczest INT;
   current_uczest INT;
BEGIN
   -- Get the maximum number of participants for the course
   SELECT k.max_uczest INTO max_uczest FROM kurs k WHERE k.id_kurs = add_participant_to_course.id_kurs;
   -- Check if the participant is already assigned to the course
   SELECT COUNT(*) INTO current_uczest FROM uczest_kurs uk WHERE uk.id_uczest = add_participant_to_course.id_uczestnik AND uk.id_kurs = add_participant_to_course.id_kurs;
   IF current_uczest > 0 THEN
      -- Participant is already assigned to the course
      RETURN 1;
   ELSIF current_uczest = 0 AND max_uczest > 0 THEN
      -- Check if there are available spots in the course
      IF (SELECT COUNT(*) FROM uczest_kurs uk WHERE uk.id_kurs = add_participant_to_course.id_kurs) >= max_uczest THEN
         -- No available spots in the course
         RETURN 2;
      ELSE
         -- Add the participant to uczest_kurs table
         INSERT INTO uczest_kurs (id_uczest, id_kurs, oplata, ocena) VALUES (add_participant_to_course.id_uczestnik, add_participant_to_course.id_kurs, 0, 0);
         -- Add the participant to uczest_zaj table for all classes in the course
         INSERT INTO uczest_zaj (id_uczest, id_kurs, id_zaj, obec)
         SELECT add_participant_to_course.id_uczestnik, add_participant_to_course.id_kurs, z.id_zaj, 0
         FROM zajecia z
         WHERE z.id_kurs = add_participant_to_course.id_kurs;
         -- Participant added successfully
         RETURN 0;
      END IF;
   ELSE
      -- Invalid course or participant
      RETURN -1;
   END IF;
END;
$$ LANGUAGE plpgsql;

select add_participant_to_course(1,9);

select imie,nazwisko,id_uczestnik from kurs k join uczest_kurs uk on uk.id_kurs = k.id_kurs join uczestnik u on u.id_uczestnik = uk.id_uczest
where k.id_kurs = 9;

