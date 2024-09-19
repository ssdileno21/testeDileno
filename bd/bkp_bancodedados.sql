-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           4.0.26-nt - Official MySQL binary
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES latin1 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Copiando estrutura para tabela testedileno.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `codigo` int(11) NOT NULL auto_increment,
  `nome` varchar(100) NOT NULL default '',
  `cidade` varchar(50) NOT NULL default '',
  `uf` char(2) NOT NULL default '',
  PRIMARY KEY  (`codigo`),
  KEY `idx_cliente_nome` (`nome`)
) TYPE=MyISAM;

-- Copiando dados para a tabela testedileno.clientes: 20 rows
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`codigo`, `nome`, `cidade`, `uf`) VALUES
	(1, 'João Silva', 'São Paulo', 'SP'),
	(2, 'Maria Oliveira', 'Rio de Janeiro', 'RJ'),
	(3, 'Carlos Pereira', 'Belo Horizonte', 'MG'),
	(4, 'Claudia Lima', 'Fortaleza', 'CE'),
	(5, 'Ana Souza', 'Curitiba', 'PR'),
	(6, 'Bruno Costa', 'Salvador', 'BA'),
	(7, 'Fernanda Alves', 'Porto Alegre', 'RS'),
	(8, 'Pedro Rocha', 'Recife', 'PE'),
	(9, 'Daniela Freitas', 'Brasília', 'DF'),
	(10, 'Luciana Dias', 'Manaus', 'AM'),
	(11, 'Ricardo Mendes', 'Florianópolis', 'SC'),
	(12, 'Paula Gonçalves', 'Campinas', 'SP'),
	(13, 'Maria João', 'Curitiba', 'PR'),
	(14, 'João Maria', 'Salvador', 'BA'),
	(15, 'Fernanda Maria', 'Porto Alegre', 'RS'),
	(16, 'Maria Fernanda', 'Recife', 'PE'),
	(17, 'Carla Freitas', 'Sete Lagoas', 'DF'),
	(18, 'Joana Dias', 'Santa Luzia', 'MG'),
	(19, 'Lara Mendes', 'Pedro Leopoldo', 'MG'),
	(20, 'Gonçalves Dias', 'Bebedouro', 'SP');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Copiando estrutura para tabela testedileno.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `PedidoID` int(11) NOT NULL auto_increment,
  `DataEmissao` datetime NOT NULL default '0000-00-00 00:00:00',
  `CodigoCliente` varchar(20) NOT NULL default '',
  `ValorTotal` decimal(10,2) NOT NULL default '0.00',
  PRIMARY KEY  (`PedidoID`),
  KEY `idx_codigo_cliente` (`CodigoCliente`)
) TYPE=MyISAM;

-- Copiando dados para a tabela testedileno.pedido: 0 rows
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;

-- Copiando estrutura para tabela testedileno.pedidoitens
CREATE TABLE IF NOT EXISTS `pedidoitens` (
  `ID` int(11) NOT NULL auto_increment,
  `NumeroPedido` int(11) default NULL,
  `CodigoProduto` int(11) default NULL,
  `Quantidade` int(11) default NULL,
  `ValorUnitario` decimal(10,2) default NULL,
  `ValorTotal` decimal(10,2) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `idx_numero_pedido` (`NumeroPedido`),
  KEY `idx_codigo_produto` (`CodigoProduto`)
) TYPE=MyISAM;

-- Copiando dados para a tabela testedileno.pedidoitens: 0 rows
/*!40000 ALTER TABLE `pedidoitens` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidoitens` ENABLE KEYS */;

-- Copiando estrutura para tabela testedileno.produtos
CREATE TABLE IF NOT EXISTS `produtos` (
  `codigo` int(11) NOT NULL auto_increment,
  `descricao` varchar(100) NOT NULL default '',
  `preco_venda` decimal(10,2) NOT NULL default '0.00',
  PRIMARY KEY  (`codigo`),
  KEY `idx_produto_descricao` (`descricao`)
) TYPE=MyISAM;

-- Copiando dados para a tabela testedileno.produtos: 20 rows
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` (`codigo`, `descricao`, `preco_venda`) VALUES
	(1, 'Teclado Mecânico', 250.00),
	(2, 'Mouse Gamer', 120.00),
	(3, 'Monitor LED 24"', 700.00),
	(4, 'Impressora Multifuncional', 400.00),
	(5, 'Notebook i5', 3200.00),
	(6, 'Smartphone Android', 1500.00),
	(7, 'Cadeira Gamer', 950.00),
	(8, 'HD Externo 1TB', 350.00),
	(9, 'SSD 512GB', 550.00),
	(10, 'Placa Mãe ATX', 780.00),
	(11, 'Memória RAM 16GB', 650.00),
	(12, 'Fonte 500W', 320.00),
	(13, 'Câmera de Segurança Wi-Fi', 360.00),
	(14, 'Adaptador HDMI para VGA', 45.00),
	(15, 'Roteador Wireless Dual Band', 260.00),
	(16, 'Carregador Portátil 10000mAh', 140.00),
	(17, 'Tablet Android 10.1 Polegadas', 890.00),
	(18, 'Controle para Console', 250.00),
	(19, 'Smartwatch à Prova D’Água', 390.00),
	(20, 'Suporte de Monitor com Ajuste de Altura', 150.00);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
