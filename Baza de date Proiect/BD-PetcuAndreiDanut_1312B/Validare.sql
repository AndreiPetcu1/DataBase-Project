-- Script de testare pentru operatiile de vizualizare si validare

-- Vizualizari
-- 1. Afisarea clientilor, detalii despre varsta si masinile asociate acestora, excluzand cheile primare/straine irelevante.
-- Cerinta: Demonstram corelatia intre clienti, detalii clienti si masini.
SELECT 
    c.nume_client AS "Nume Client", 
    dc.varsta AS "Varsta", 
    m.marca_auto AS "Marca Masina", 
    m.model_auto AS "Model Masina"
FROM 
    client c
    JOIN detalii_client dc ON c.id_client = dc.client_id_client
    JOIN masina m ON c.id_client = m.client_id_client;

-- 2. Afisarea programarilor masinilor in service si mecanicii responsabili.
-- Cerinta: Demonstreaza utilizarea JOIN intre programari, masini si mecanici.
SELECT 
    dp.data_programare AS "Data Programare", 
    m.marca_auto || ' ' || m.model_auto AS "Masina",
    mec.rating_mecanic AS "Rating Mecanic"
FROM 
    data_programare dp
    JOIN masina m ON dp.masina_id_masina = m.id_masina
    JOIN mecanic mec ON mec.masina_id_masina = m.id_masina;

-- 3. Afisarea problemelor, costurilor si termenelor limita pentru masini.
-- Cerinta: Vizualizare a relatiilor dintre probleme si masini.
SELECT 
    m.marca_auto || ' ' || m.model_auto AS "Masina", 
    p.problema AS "Problema", 
    p.cost AS "Cost (RON)", 
    p.termen_finalizare_problema AS "Termen Finalizare"
FROM 
    problema p
    JOIN masina m ON p.masina_id_masina = m.id_masina;

-- 1.1. Încercarea de a insera un client cu un ID duplicat (client.id_client - PK).
INSERT INTO client (id_client, nume_client, grad_satisfactie_client)
VALUES (1, 'Client Test', 8);
--ORA-00001: unique constraint (BD170.CLIENT_PK) violated

-- 1.2. Încercarea de a insera o programare cu un ID duplicat (data_programare.id_programare - PK).
INSERT INTO data_programare (id_programare, data_programare, masina_id_masina)
VALUES (1, SYSDATE, 1);
--ORA-00001: unique constraint (BD170.DATA_PROGRAMARE__IDX) violated

-- 1.3. Încercarea de a insera detalii pentru un client cu un CNP duplicat (detalii_client.cnp - PK).
INSERT INTO detalii_client (cnp, varsta, email, client_id_client)
VALUES ('1234567890123', 30, 'email2@test.com', 1);
--ORA-00001: unique constraint (BD170.DETALII_CLIENT__IDX) violated

-- 1.4. Încercarea de a insera o mașină cu un ID duplicat (masina.id_masina - PK).
INSERT INTO masina (id_masina, marca_auto, model_auto, data_intrare_masina_service, client_id_client)
VALUES (1, 'Dacia', 'Logan', SYSDATE, 1);
--ORA-00001: unique constraint (BD170.MASINA__IDX) violated

-- 1.5. Încercarea de a insera un mecanic cu un ID duplicat (mecanic.id_mecanic - PK).
INSERT INTO mecanic (id_mecanic, rating_mecanic, masina_id_masina)
VALUES (1, 8, 1);
--ORA-00001: unique constraint (BD170.MECANIC__IDX) violated

-- 1.6. Încercarea de a insera o problemă cu un ID duplicat (problema.id_problema - PK).
INSERT INTO problema (id_problema, cost, problema, termen_finalizare_problema, masina_id_masina)
VALUES (1, 500, 'Problemă Duplicată', SYSDATE + 7, 1);
--ORA-00001: unique constraint (BD170.PROBLEMA_PK) violated

-- 2.1. Încercarea de a insera un client fără nume (client.nume_client - NN).
INSERT INTO client (id_client, grad_satisfactie_client)
VALUES (2, 9);
--ORA-01400: cannot insert NULL into ("BD170"."CLIENT"."NUME_CLIENT")

-- 2.2. Încercarea de a insera o mașină fără marcă (masina.marca_auto - NN).
INSERT INTO masina (id_masina, model_auto, data_intrare_masina_service, client_id_client)
VALUES (2, 'Logan', SYSDATE, 1);
--ORA-01400: cannot insert NULL into ("BD170"."MASINA"."MARCA_AUTO")

-- 3.1. Încercarea de a insera detalii pentru un client deja existent (detalii_client.client_id_client - UK).
INSERT INTO detalii_client (cnp, varsta, email, client_id_client)
VALUES ('1234567890123', 25, 'email@test.com', 1);
--ORA-00001: unique constraint (BD170.DETALII_CLIENT__IDX) violated

-- 3.2. Încercarea de a insera o programare pentru o mașină deja programată (data_programare.masina_id_masina - UK).
INSERT INTO data_programare (id_programare, data_programare, masina_id_masina)
VALUES (1, SYSDATE, 1);
--ORA-00001: unique constraint (BD170.DATA_PROGRAMARE__IDX) violated

-- 4.1. Încercarea de a insera un client cu un grad de satisfacție în afara intervalului [1, 10] (client.grad_satisfactie_client - CK).
INSERT INTO client (id_client, nume_client, grad_satisfactie_client)
VALUES (3, 'Client Invalid', 15);
--ORA-02290: check constraint (BD170.CLIENT_GRADSATISFACTIE_CK) violated

-- 4.2. Încercarea de a insera un mecanic cu un rating în afara intervalului [1, 10] (mecanic.rating_mecanic - CK).
INSERT INTO mecanic (id_mecanic, rating_mecanic, masina_id_masina)
VALUES (2, 11, 1);
--ORA-02290: check constraint (BD170.MECANIC_RATINGMECANIC_CK) violated

-- 4.3. Încercarea de a insera o problemă cu un cost negativ (problema.cost - CK).
INSERT INTO problema (id_problema, cost, problema, termen_finalizare_problema, masina_id_masina)
VALUES (1, -100, 'Cost Negativ', SYSDATE + 7, 1);
--ORA-02290: check constraint (BD170.PROBLEMA_COST_CK) violated

-- 5.1. Încercarea de a insera o mașină pentru un client inexistent (masina.client_id_client - FK).
INSERT INTO masina (id_masina, marca_auto, model_auto, data_intrare_masina_service, client_id_client)
VALUES (3, 'Renault', 'Clio', SYSDATE, 999);
--ORA-00001: unique constraint (BD170.MASINA_PK) violated

-- 5.2. Încercarea de a insera o programare pentru o mașină inexistentă (data_programare.masina_id_masina - FK).
INSERT INTO data_programare (id_programare, data_programare, masina_id_masina)
VALUES (2, SYSDATE, 999);
--ORA-00001: unique constraint (BD170.DATA_PROGRAMARE_PK) violated

-- 5.3. Încercarea de a insera o problemă pentru o mașină inexistentă (problema.masina_id_masina - FK).
INSERT INTO problema (id_problema, cost, problema, termen_finalizare_problema, masina_id_masina)
VALUES (2, 300, 'Problema Test', SYSDATE + 7, 999);
--ORA-00001: unique constraint (BD170.PROBLEMA_PK) violated