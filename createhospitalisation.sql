DECLARE
d date; nbj number; tarif number; pat number; serv number; med:number;
BEGIN
FOR i IN 1.. 710314 LOOP
SELECT TO_DATE ( TRUNC( DBMS_RANDOM.VALUE(TO_CHAR(DATE '2014-01-01','J')
,TO_CHAR(DATE '2019-12-31','J') )),'J') into d FROM DUAL;
SELECT trunc(DBMS_RANDOM.VALUE(5000, 100000 ),2) into nbj FROM DUAL;
SELECT floor(DBMS_RANDOM.VALUE(1, 3000 ) ) into tarif FROM DUAL;;
SELECT floor(DBMS_RANDOM.VALUE(1, 110080) ) into pat FROM DUAL;
SELECT floor(DBMS_RANDOM.VALUE(1, 2212) ) into serv FROM DUAL;
SELECT floor(DBMS_RANDOM.VALUE(1, 12300) ) into med FROM DUAL;
INSERT INTO hospitalisation VALUES (i, d,nbj, tarif, pat, serv, med);
END LOOP;
COMMIT;
END;
/