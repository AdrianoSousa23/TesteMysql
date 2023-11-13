create database teste;
use teste;
CREATE TABLE `bairro` (
  `id_bairro` int(11) NOT NULL DEFAULT '0',
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`id_bairro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `bairro` WRITE;
/*!40000 ALTER TABLE `bairro` DISABLE KEYS */;

INSERT INTO `bairro` (`id_bairro`, `nome`)
VALUES
	(1,'Mooca'),
	(2,'Ipiranga'),
	(3,'Vila Hamburguesa'),
	(4,'Lapa'),
	(5,'Campo Belo');

/*!40000 ALTER TABLE `bairro` ENABLE KEYS */;
UNLOCK TABLES;




# Dump of table carro
# ------------------------------------------------------------

DROP TABLE IF EXISTS `carro`;

CREATE TABLE `carro` (
  `id_carro` int(11) NOT NULL DEFAULT '0',
  `modelo` varchar(255) NOT NULL,
  `fk_cliente` int(11) NOT NULL,
  PRIMARY KEY (`id_carro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `carro` WRITE;
/*!40000 ALTER TABLE `carro` DISABLE KEYS */;

INSERT INTO `carro` (`id_carro`, `modelo`, `fk_cliente`)
VALUES
	(1,'Fiat',1),
	(2,'Mercedes',2),
	(3,'Honda',3),
	(4,'Toyota',4),
	(5,'Lada',1);

/*!40000 ALTER TABLE `carro` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table casa
# ------------------------------------------------------------

DROP TABLE IF EXISTS `casa`;

CREATE TABLE `casa` (
  `id_casa` int(11) NOT NULL DEFAULT '0',
  `cor` varchar(255) NOT NULL,
  `fk_cliente` int(11) NOT NULL,
  `fk_bairro` int(11) NOT NULL,
  PRIMARY KEY (`id_casa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `casa` WRITE;
/*!40000 ALTER TABLE `casa` DISABLE KEYS */;

INSERT INTO `casa` (`id_casa`, `cor`, `fk_cliente`, `fk_bairro`)
VALUES
	(1,'Vermelho',1,1),
	(2,'Roxo',2,2),
	(3,'Azul',3,3),
	(4,'Rosa',4,4),
	(5,'Laranja',5,5);

/*!40000 ALTER TABLE `casa` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cliente
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL DEFAULT '0',
  `nome` varchar(255) NOT NULL,
  `sobrenome` varchar(255) NOT NULL,
  `data_nascimento` date NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;

INSERT INTO `cliente` (`id_cliente`, `nome`, `sobrenome`, `data_nascimento`)
VALUES
	(1,'Fernando','Soares','1985-04-19'),
	(2,'Bruno','Campos','1988-06-02'),
	(3,'Fernanda','Figo','1989-07-20'),
	(4,'Arthur','Siqueira','1990-03-14'),
	(5,'Joao','Garcia','1943-02-19');

/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

select cliente.nome as NomeDoCliente, carro.modelo as ModeloDoCarro, casa.cor as CorDaCasa, bairro.nome as Bairro 
from cliente cliente join carro carro on cliente.id_cliente = carro.fk_cliente
join casa casa on cliente.id_cliente = casa.fk_cliente
join bairro bairro on casa.fk_bairro = bairro.id_bairro;