DECLARE
l char(10); m number; I number;
begin
for i in 1..350 loop
Select dbms_random.string('U', 8) into l from dual;
Select floor(dbms_random.value(1, 58)) into m from dual;
insert into Ville values(i,l,m);
end loop; commit;
end;
/