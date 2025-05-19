create table conta
	(
	id integer,
	cliente varchar(255) not null,
	saldo numeric(15,2) default 0,
    constraint pk_conta PRIMARY KEY (id) 
	);


insert into conta(id,cliente,saldo)
  values (1,'JOAO',1000),
  (2,'PEDRO',15000),
  (3,'MARIO',450),
  (4,'JOAQUIM',40000);

SELECT * FROM conta;


-- Usuário A

begin;

INSERT INTO conta VALUES (6, 'Daniela', 3000);
SELECT * FROM conta;
commit;

savepoint s1;



rollback to s1;

end;

begin;
UPDATE conta SET saldo = 120 WHERE id = 1;

savepoint s1;

UPDATE conta SET saldo = 120 WHERE id = 2;

rollback to s1;


begin;
INSERT INTO conta VALUES (7, 'Mara', 5000);
rollback;

begin;
UPDATE conta SET cliente = 'João 2' WHERE id = 1;
SELECT * FROM conta;
end;


begin;
UPDATE conta SET cliente = 'João 3' WHERE id = 1;
SELECT * FROM conta;
end;


-- Usuário A

begin;
INSERT INTO conta VALUES (7, 'Mariana', 3000);
SAVEPOINT s1;
UPDATE conta SET saldo = 2000 WHERE id = 2;
SELECT * FROM CONTA;
ROLLBACK TO s1;
SELECT * FROM CONTA;
INSERT INTO CONTA VALUES (8, 'Roberto', 4200);
SELECT * FROM CONTA;
ROLLBACK;

SELECT * FROM CONTA;


begin;
INSERT INTO CONTA VALUES (8, 'Daniela', 5000);
SELECT * FROM CONTA;
commit;