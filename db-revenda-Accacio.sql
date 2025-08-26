-- Revenda de Vinil Disco
-- os inserts estão genéricos

create table usuario (
	id serial primary key,
	email varchar(50) not null unique,
	senha varchar(30) not null,
	cpf char(11) not null unique,
	nome_completo varchar(55) not null, 
	endereco_id int, foreign key (endereco_id) references endereco(id),
	carrinho_id int, foreign key (carrinho_id) references carrinho(id)
);

create table vinil (
	id serial primary key,
	preco numeric (5,2) not null,
	nome_vinil varchar(30) not null unique,
	data_lancamento date not null check(data_lancamento>'1941-06-21'),
	tamanho float not null,
	genero_musical varchar(30) not null,
	idioma varchar(20) not null
);

create table autor_vinil (
	id serial primary key,
	vinil_id int, foreign key (vinil_id) references vinil(id) ,
	autor_id int, foreign key (autor_id) references autor(id)
)

create table autor (
	id serial primary key,
	compositor varchar (50) not null,
	banda varchar (30) not null,
	nacionalidade varchar(20) not null,
	nascimento date not null,
	falecimento date 
)


create table endereco (
	id serial primary key, 
	cidade varchar(30) not null,
	uf char(2) not null,
	cep char (8) not null,
	bairro varchar(30) not null,
	rua varchar(30) not null,
	ponto_referencia text,
	destinatario varchar(40) not null
);

create table pagamento (
	id serial primary key,
	pix varchar(100),
	boleto varchar (100),
	carrinho_id int, foreign key (carrinho_id) references carrinho(id),
	cartao_id int, foreign key (cartao_id) references cartao(id)
);

create table carrinho (
	id serial primary key,
	vinil_id int, foreign key (vinil_id) references vinil(id)
	
);

create table cartao (
	id serial primary key,
	numero char(19) not null unique,
	validade char(5) not null,
	cvc varchar(4) not null,
	nome varchar(30) not null
);

insert into usuario (id, email, senha, cpf, nome_completo, endereco_id, carrinho_id )
values (1, 'saldanhar494@gmail.com', 'F8NKIJH7','09999172488' ,'Saldanha', 1, 1),
(2, 'saldanhar495@gmail.com', 'FFQWGGVS', '11124172488','Rafael', 2, 2),
(3, 'saldanhar896@gmail.com', 'KSUVMEOS', '08022272488','Gabriel', 3, 3),
(4, 'saldanhar497@gmail.com', 'LFDJSMS0', '08024133388','João', 4, 4),
(5, 'saldanhar498@gmail.com', 'LSORHYMS', '08024172444','Pedro', 5, 5),
(6, 'saldanhar199@gmail.com', 'BASIGMEO', '55024172488','Lucas', 6, 6),
(7, 'saldanhar320@gmail.com', 'PQYDBTKA', '08664172488','Guilherme', 7, 7),
(8, 'saldanhar450@gmail.com', 'CAFERXGI', '08027772488','Ricardo', 8, 8),
(9, 'saldanhar499@gmail.com', 'QURHTJSO', '08024188888','Accácio', 9, 9),
(10, 'saldanhar284@gmail.com', 'HE9VNQLR', '08024172999','Felipe', 10, 10);

insert into vinil  (id, preco, nome_vinil, data_lancamento, tamanho, genero_musical, idioma)
values (1, 99.99, 'Grupo Revelação', '1999-12-31', '9', 'Pagode', 'Portguês' ),
(2, 99.99, 'Samba', '1999-12-31', '9', 'Pagode', 'Portguês' ),
(3, 99.99, 'Ao Vivo No Olimpo', '1999-12-31', '9 ', 'Pagode', 'Portguês' ),
(4, 99.99, 'Novos Tempos', '1999-12-31', '9 ', 'Pagode', 'Portguês' ),
(5, 99.99, 'Palma da Mão', '1999-12-31', '9 ', 'Pagode', 'Portguês' ),
(6, 99.99, 'Velocidade da Luz', '1999-12-31', '9 ', 'Pagode', 'Portguês' ),
(7, 99.99, 'Aventureiro', '1999-12-31', '9 ', 'Pagode', 'Portguês' ),
(8, 99.99, 'Ao Vivo no Morro', '1999-12-31', '9 ', 'Pagode', 'Portguês' ),
(9, 99.99, '360° AO vivo', '1999-12-31', '9 ', 'Pagode', 'Portguês' ),
(10, 99.99, 'Grupo Revelaçãoo', '1999-12-31', '9 ', 'Pagode', 'Portguês' );

insert into autor_vinil ( vinil_id, autor_id)
values (1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);

insert into autor (id, compositor, banda, nacionalidade, nascimento)
values (1, 'Jonanthan', 'Grupo Revelação', 'Brasileiro', '1970-08-12' ),
(2, 'Jonanthan', 'Grupo Revelação', 'Brasileiro', '1970-08-12' ),
(3, 'Jonanthan', 'Grupo Revelação', 'Brasileiro', '1970-08-12' ),
(4, 'Jonanthan', 'Grupo Revelação', 'Brasileiro', '1970-08-12' ),
(5, 'Jonanthan', 'Grupo Revelação', 'Brasileiro', '1970-08-12' ),
(6, 'Jonanthan', 'Grupo Revelação', 'Brasileiro', '1970-08-12' ),
(7, 'Jonanthan', 'Grupo Revelação', 'Brasileiro', '1970-08-12' ),
(8, 'Jonanthan', 'Grupo Revelação', 'Brasileiro', '1970-08-12' ),
(9, 'Jonanthan', 'Grupo Revelação', 'Brasileiro', '1970-08-12' ),
(10, 'Jonanthan', 'Grupo Revelação', 'Brasileiro', '1970-08-12' );

insert into endereco (id, cidade, uf, cep, bairro, rua, ponto_referencia, destinatario)
values (1, 'Rio de Jarneiro', 'RJ', '12345678', 'Rio de Janeiro' ,'Quinta da Boa Vista', 'Maracanã', 'EU' ),
(2, 'Rio de Jarneiro', 'RJ', '12345678', 'Rio de Janeiro' , 'Quinta da Boa Vista', 'Maracanã', 'EU' ),
(3, 'Rio de Jarneiro', 'RJ', '12345678', 'Rio de Janeiro' , 'Quinta da Boa Vista', 'Maracanã', 'EU' ),
(4, 'Rio de Jarneiro', 'RJ', '12345678', 'Rio de Janeiro' , 'Quinta da Boa Vista', 'Maracanã', 'EU' ),
(5, 'Rio de Jarneiro', 'RJ', '12345678', 'Rio de Janeiro' , 'Quinta da Boa Vista', 'Maracanã', 'EU' ),
(6, 'Rio de Jarneiro', 'RJ', '12345678', 'Rio de Janeiro' , 'Quinta da Boa Vista', 'Maracanã', 'EU' ),
(7, 'Rio de Jarneiro', 'RJ', '12345678', 'Rio de Janeiro' , 'Quinta da Boa Vista', 'Maracanã', 'EU' ),
(8, 'Rio de Jarneiro', 'RJ', '12345678', 'Rio de Janeiro' , 'Quinta da Boa Vista', 'Maracanã', 'EU' ),
(9, 'Rio de Jarneiro', 'RJ', '12345678', 'Rio de Janeiro' , 'Quinta da Boa Vista', 'Maracanã', 'EU' ),
(10, 'Rio de Jarneiro', 'RJ', '12345678', 'Rio de Janeiro' , 'Quinta da Boa Vista', 'Maracanã', 'EU' );

insert into pagamento (id, pix, boleto, carrinho_id, cartao_id )
values (1, '11122233344', 'Finge que aqui tem um boleto', 1,1 ),
(2, '11122233344', 'Finge que aqui tem um boleto', 2,2 ),
(3, '11122233344', 'Finge que aqui tem um boleto', 3,3 ),
(4, '11122233344', 'Finge que aqui tem um boleto', 4,4 ),
(5, '11122233344', 'Finge que aqui tem um boleto', 5,5 ),
(6, '11122233344', 'Finge que aqui tem um boleto', 6,6 ),
(7, '11122233344', 'Finge que aqui tem um boleto', 7,7 ),
(8, '11122233344', 'Finge que aqui tem um boleto', 8,8 ),
(9, '11122233344', 'Finge que aqui tem um boleto', 9,9 ),
(10, '11122233344', 'Finge que aqui tem um boleto', 10,10 );

insert into carrinho (id, vinil_id)
values (1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);

insert into cartao ( id, numero, validade, cvc, nome)
values (1, '4179-6610-9004-9244', '11/27', '716', 'Leigh Ziemann' ),
(2, '1111-6610-9004-9244', '11/27', '711', 'Laoghi iemann' ),
(3, '2222-6610-9004-9244', '11/27', '712', 'Leighy yemann' ),
(4, '3333-6610-9004-9244', '11/27', '713', 'Leugh Ziimann' ),
(5, '4444-6610-9004-9244', '11/27', '714', 'Luugh Zuumann' ),
(6, '5555-6610-9004-9244', '11/27', '715', 'Laagh Zaamann' ),
(7, '6666-6610-9004-9244', '11/27', '717', 'Loogh Ziemonn' ),
(8, '7777-6610-9004-9244', '11/27', '718', 'Leogh Zoemann' ),
(9, '8888-6610-9004-9244', '11/27', '719', 'Lough Zuymann' ),
(10, '9999-6610-9004-9244', '11/27', '116', 'Laigh Zuimann' );

create view view_dos_discos as select vinil.nome_vinil, vinil.genero_musical from vinil join carrinho on carrinho.id = vinil.id ;
select * from view_dos_discos;

create view view_do_usuario as select usuario.nome_completo, usuario.cpf from usuario join pagamento on pagamento.id = usuario.id;

select * from view_do_usuario;

create index inx_vinil_nome on vinil(nome_vinil);

