-- Tranzacție pentru a adăuga un client, detalii client, o mașină și o programare
BEGIN
    -- Adăugare client
    INSERT INTO client (id_client, nume_client, grad_satisfactie_client)
    VALUES (client_id_client_seq.NEXTVAL, 'Ion Popescu', 9);

    -- Adăugare detalii client
    INSERT INTO detalii_client (cnp, varsta, email, client_id_client)
    VALUES ('1970605123456', 27, 'ion.popescu@gmail.com', client_id_client_seq.CURRVAL);

    -- Adăugare mașină
    INSERT INTO masina (id_masina, marca_auto, model_auto, data_intrare_masina_service, client_id_client)
    VALUES (masina_id_masina_seq.NEXTVAL, 'Dacia', 'Logan', TO_DATE('2025-01-05', 'YYYY-MM-DD'), client_id_client_seq.CURRVAL);

    -- Adăugare programare
    INSERT INTO data_programare (id_programare, data_programare, masina_id_masina)
    VALUES (data_programare_id_programare.NEXTVAL, TO_DATE('2025-01-10', 'YYYY-MM-DD'), masina_id_masina_seq.CURRVAL);

    -- Confirmare tranzacție
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        -- Revertire modificări în caz de eroare
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('A apărut o eroare: ' || SQLERRM);
END;