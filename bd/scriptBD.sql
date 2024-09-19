CREATE TABLE clientes (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    uf CHAR(2) NOT NULL
);
CREATE INDEX idx_cliente_nome ON clientes(nome);

CREATE TABLE produtos (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(100) NOT NULL,
    preco_venda DECIMAL(10, 2) NOT NULL
);
CREATE INDEX idx_produto_descricao ON produtos(descricao);


INSERT INTO clientes (nome, cidade, uf) VALUES 
('João Silva', 'São Paulo', 'SP'),
('Maria Oliveira', 'Rio de Janeiro', 'RJ'),
('Carlos Pereira', 'Belo Horizonte', 'MG'),
('Claudia Lima', 'Fortaleza', 'CE'),
('Ana Souza', 'Curitiba', 'PR'),
('Bruno Costa', 'Salvador', 'BA'),
('Fernanda Alves', 'Porto Alegre', 'RS'),
('Pedro Rocha', 'Recife', 'PE'),
('Daniela Freitas', 'Brasília', 'DF'),
('Luciana Dias', 'Manaus', 'AM'),
('Ricardo Mendes', 'Florianópolis', 'SC'),
('Paula Gonçalves', 'Campinas', 'SP'),
('Maria João', 'Curitiba', 'PR'),
('João Maria', 'Salvador', 'BA'),
('Fernanda Maria', 'Porto Alegre', 'RS'),
('Maria Fernanda', 'Recife', 'PE'),
('Carla Freitas', 'Sete Lagoas', 'DF'),
('Joana Dias', 'Santa Luzia', 'MG'),
('Lara Mendes', 'Pedro Leopoldo', 'MG'),
('Gonçalves Dias', 'Bebedouro', 'SP');


INSERT INTO produtos (descricao, preco_venda) VALUES 
('Teclado Mecânico', 250.00),
('Mouse Gamer', 120.00),
('Monitor LED 24"', 700.00),
('Impressora Multifuncional', 400.00),
('Notebook i5', 3200.00),
('Smartphone Android', 1500.00),
('Cadeira Gamer', 950.00),
('HD Externo 1TB', 350.00),
('SSD 512GB', 550.00),
('Placa Mãe ATX', 780.00),
('Memória RAM 16GB', 650.00),
('Fonte 500W', 320.00),
('Câmera de Segurança Wi-Fi', 360.00),
('Adaptador HDMI para VGA', 45.00),
('Roteador Wireless Dual Band', 260.00),
('Carregador Portátil 10000mAh', 140.00),
('Tablet Android 10.1 Polegadas', 890.00),
('Controle para Console', 250.00),
('Smartwatch à Prova D’Água', 390.00),
('Suporte de Monitor com Ajuste de Altura', 150.00);

select * from clientes;
select * from produtos;

CREATE TABLE Pedido (
    PedidoID INT AUTO_INCREMENT PRIMARY KEY,
    DataEmissao DATETIME NOT NULL,
    CodigoCliente VARCHAR(20) NOT NULL,
    ValorTotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CodigoCliente) REFERENCES clientes(codigo)
);

CREATE INDEX idx_codigo_cliente ON Pedido(CodigoCliente);

CREATE TABLE PedidoItens (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NumeroPedido INT,                 
    CodigoProduto INT,                
    Quantidade INT,                   
    ValorUnitario DECIMAL(10, 2),
    ValorTotal DECIMAL(10, 2),   
    FOREIGN KEY (NumeroPedido) REFERENCES Pedido(NumeroPedido),
    FOREIGN KEY (CodigoProduto) REFERENCES Produto(Codigo)
);

CREATE INDEX idx_numero_pedido ON PedidoItens (NumeroPedido);

CREATE INDEX idx_codigo_produto ON PedidoItens (CodigoProduto);

select * from Pedido;
select * from PedidoItens;

