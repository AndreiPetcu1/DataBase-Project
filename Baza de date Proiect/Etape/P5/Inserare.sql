-- Inserări în tabela client
INSERT INTO client (id_client, nume_client, grad_satisfactie_client) VALUES (1, 'Ion Popescu', 8);
INSERT INTO client (id_client, nume_client, grad_satisfactie_client) VALUES (2, 'Maria Ionescu', 7);
INSERT INTO client (id_client, nume_client, grad_satisfactie_client) VALUES (3, 'Vasile Gheorghe', 9);
INSERT INTO client (id_client, nume_client, grad_satisfactie_client) VALUES (4, 'Ana Dumitrescu', 10);
INSERT INTO client (id_client, nume_client, grad_satisfactie_client) VALUES (5, 'Elena Tudor', 6);
INSERT INTO client (id_client, nume_client, grad_satisfactie_client) VALUES (6, 'George Vasilescu', 5);

-- Inserări în tabela detalii_client
INSERT INTO detalii_client (cnp, varsta, email, client_id_client) VALUES ('1971234567890', 27, 'ion.popescu@example.com', 1);
INSERT INTO detalii_client (cnp, varsta, email, client_id_client) VALUES ('2962234567890', 32, 'maria.ionescu@example.com', 2);
INSERT INTO detalii_client (cnp, varsta, email, client_id_client) VALUES ('1893234567890', 45, 'vasile.gheorghe@example.com', 3);
INSERT INTO detalii_client (cnp, varsta, email, client_id_client) VALUES ('2844234567890', 30, 'ana.dumitrescu@example.com', 4);
INSERT INTO detalii_client (cnp, varsta, email, client_id_client) VALUES ('2875234567890', 38, 'elena.tudor@example.com', 5);
INSERT INTO detalii_client (cnp, varsta, email, client_id_client) VALUES ('1906234567890', 29, 'george.vasilescu@example.com', 6);

-- Inserări în tabela masina
INSERT INTO masina (id_masina, marca_auto, model_auto, data_intrare_masina_service, client_id_client) 
VALUES (1, 'Dacia', 'Logan', TO_DATE('2024-12-01', 'YYYY-MM-DD'), 1);
INSERT INTO masina (id_masina, marca_auto, model_auto, data_intrare_masina_service, client_id_client) 
VALUES (2, 'Renault', 'Clio', TO_DATE('2024-12-02', 'YYYY-MM-DD'), 2);
INSERT INTO masina (id_masina, marca_auto, model_auto, data_intrare_masina_service, client_id_client) 
VALUES (3, 'Ford', 'Focus', TO_DATE('2024-12-03', 'YYYY-MM-DD'), 3);
INSERT INTO masina (id_masina, marca_auto, model_auto, data_intrare_masina_service, client_id_client) 
VALUES (4, 'Volkswagen', 'Golf', TO_DATE('2024-12-04', 'YYYY-MM-DD'), 4);
INSERT INTO masina (id_masina, marca_auto, model_auto, data_intrare_masina_service, client_id_client) 
VALUES (5, 'Toyota', 'Corolla', TO_DATE('2024-12-05', 'YYYY-MM-DD'), 5);
INSERT INTO masina (id_masina, marca_auto, model_auto, data_intrare_masina_service, client_id_client) 
VALUES (6, 'BMW', 'Series 3', TO_DATE('2024-12-06', 'YYYY-MM-DD'), 6);

-- Inserări în tabela mecanic
INSERT INTO mecanic (id_mecanic, rating_mecanic, masina_id_masina) VALUES (1, 9, 1);
INSERT INTO mecanic (id_mecanic, rating_mecanic, masina_id_masina) VALUES (2, 8, 2);
INSERT INTO mecanic (id_mecanic, rating_mecanic, masina_id_masina) VALUES (3, 7, 3);
INSERT INTO mecanic (id_mecanic, rating_mecanic, masina_id_masina) VALUES (4, 10, 4);
INSERT INTO mecanic (id_mecanic, rating_mecanic, masina_id_masina) VALUES (5, 6, 5);
INSERT INTO mecanic (id_mecanic, rating_mecanic, masina_id_masina) VALUES (6, 8, 6);

-- Inserări în tabela data_programare
INSERT INTO data_programare (id_programare, data_programare, masina_id_masina) 
VALUES (1, TO_DATE('2024-12-10', 'YYYY-MM-DD'), 1);
INSERT INTO data_programare (id_programare, data_programare, masina_id_masina) 
VALUES (2, TO_DATE('2024-12-11', 'YYYY-MM-DD'), 2);
INSERT INTO data_programare (id_programare, data_programare, masina_id_masina) 
VALUES (3, TO_DATE('2024-12-12', 'YYYY-MM-DD'), 3);
INSERT INTO data_programare (id_programare, data_programare, masina_id_masina) 
VALUES (4, TO_DATE('2024-12-13', 'YYYY-MM-DD'), 4);
INSERT INTO data_programare (id_programare, data_programare, masina_id_masina) 
VALUES (5, TO_DATE('2024-12-14', 'YYYY-MM-DD'), 5);
INSERT INTO data_programare (id_programare, data_programare, masina_id_masina) 
VALUES (6, TO_DATE('2024-12-15', 'YYYY-MM-DD'), 6);

-- Inserări în tabela problema
INSERT INTO problema (id_problema, cost, problema, termen_finalizare_problema, masina_id_masina) 
VALUES (1, 500, 'Schimbare ulei', TO_DATE('2024-12-20', 'YYYY-MM-DD'), 1);
INSERT INTO problema (id_problema, cost, problema, termen_finalizare_problema, masina_id_masina) 
VALUES (2, 700, 'Reparatie motor', TO_DATE('2024-12-22', 'YYYY-MM-DD'), 2);
INSERT INTO problema (id_problema, cost, problema, termen_finalizare_problema, masina_id_masina) 
VALUES (3, 300, 'Inlocuire anvelope', TO_DATE('2024-12-23', 'YYYY-MM-DD'), 3);
INSERT INTO problema (id_problema, cost, problema, termen_finalizare_problema, masina_id_masina) 
VALUES (4, 400, 'Reparatie frane', TO_DATE('2024-12-24', 'YYYY-MM-DD'), 4);
INSERT INTO problema (id_problema, cost, problema, termen_finalizare_problema, masina_id_masina) 
VALUES (5, 600, 'Vopsitorie', TO_DATE('2024-12-25', 'YYYY-MM-DD'), 5);
INSERT INTO problema (id_problema, cost, problema, termen_finalizare_problema, masina_id_masina) 
VALUES (6, 1000, 'Inlocuire ambreiaj', TO_DATE('2024-12-26', 'YYYY-MM-DD'), 6);