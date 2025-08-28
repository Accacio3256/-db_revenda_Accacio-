--1 - Faça uma consulta filtrando um campo de texto utilizando like;

select usuario.email from usuario where usuario.email like '%9%';

--2 - Execute um comando explain e tire um print (anexe nesta atividade)

--Executado

--3 Crie um index para a coluna que utilizou no filtro acima;

create index indx_email_r on usuario(email);

--4 -  Refaça a consulta e execute o explain novamente. Tire um novo print (anexe neste atividade) e compare com o anterior. Aponte as diferenças

select email from usuario where email like '%9%' ;

explain select * FROM usuario WHERE email = '%9%';

-- o Index deixou as pesquisas mais rápidas, mas em si, a forma de pesquisar permanece a mesma

--5 -  Altere uma coluna de varchar para int, avalie o retorno, inclusive se for erro;

alter table autor
alter column nacionalidade type int

--6 - Altere uma coluna de int para varchar avalie o retorno, inclusive se for erro;

alter table usuario 
alter column endereco_id type varchar

--7 -  Crie um usuário com seu nome e dê todas as permissões de acesso para todas as tabelas

create user Accacio ;
drop user RikPedGabJGLucGuiRafAccDVM;
grant all privileges on database "<db_revenda_Accacio>" to Accacio;

--8 -  Crie um usuário para seu colega apenas com permissão de select em uma das tabelas;

alter user rikpedgabjglucguirafaccdvm with password '1234';
grant select on usuario to RikPedGabJGLucGuiRafAccDVM;

-- 9 - Refaça todos os items no usuário que criou para seu colega, registre tudo que ocorreu (erros e acertos).

-- executou faça uma consulta filtrando o campo de texto -1
-- não executou a criação de index -3
--executou o -4
-- não executou o -5
-- não executou o -6
-- não executou o -7, só a parte do 'grant all privileges on database "<db_revenda_Accacio>" to Accacio; que foi'
-- 8 foi

--10 -  De volta no seu usuário, crie 12 consultas, sendo 3 consultas semelhantes (somente com alteração do tipo de join: inner, left e right). Ou seja, são 4 consultas diferentes, sendo que cada consulta terá 3 versões, uma com cada tipo de join;

select * from endereco e inner join usuario u on u.id = e.id ;

select * from endereco e join usuario u on u.id = e.id;

select * from endereco e left join usuario u on u.id = e.id;

select * from endereco e right join usuario u on u.id = e.id

--

select * from cartao c  left join pagamento p on p.id = c.id;

select * from cartao c  inner join pagamento p on p.id = c.id;

select * from cartao c  right join pagamento p on p.id = c.id;

select * from cartao c join pagamento p on p.id = c.id;

--

select * from vinil v right join carrinho c on c.id = v.id ;

select * from vinil v left join carrinho c on c.id = v.id ;

select * from vinil v inner join carrinho c on c.id = v.id ;

select * from vinil v join carrinho c on c.id = v.id ;

-- Extras (fiz pq eu exagerei na parte - "sendo 3 consultas semelhantes")

select * from autor a join autor_vinil av on av.id = a.id ;

select * from autor a inner join autor_vinil av on av.id = a.id ;

select * from autor a left join autor_vinil av on av.id = a.id ;

select * from autor a right join autor_vinil av on av.id = a.id ;

-- 11 - Atualize vários registros com colunas NULL;

update autor set falecimento = null where autor.id < 3;
update endereco set ponto_referencia = null where endereco.id <3;
update pagamento set boleto = null where pagamento.id <5;

--12 - Execute as consultas com Join novamente, avalie os resultados.

-- Nos resultados dos joins, as datas de falecimento que tinham id <3, ponto de referência de id <3 e boletos de id <5, apareceram como "NULL", já os demais continuaram como anes das alterações
