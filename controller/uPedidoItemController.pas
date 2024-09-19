unit uPedidoItemController;

interface

uses
  uPedidoItem, uPedidoItemDAO, uProdutoDAO;

type
  TPedidoItemController = class
  private
    FPedidoItem: TPedidoItem;
    FPedidoItemDAO: TPedidoItemDAO;
    FProdutoDAO: TProdutoDAO;
  public
    constructor Create;
    destructor Destroy; override;

    procedure GravarPedidoItem(CodigoProduto: Integer; Quantidade: Integer);
    procedure ExcluirProduto(CodigoProduto: Integer);
    function BuscarPrecoProduto(CodigoProduto: Integer): Currency;
    procedure AtualizarItem(CodigoProduto: Integer; Quantidade: Integer);
    function RetornaValorTotal: Currency;
  end;

implementation

constructor TPedidoItemController.Create;
begin
  FPedidoItem := TPedidoItem.Create(0, '', 0, 0); // Initialize with default values
  FPedidoItemDAO := TPedidoItemDAO.Create;
  FProdutoDAO := TProdutoDAO.Create;
end;

destructor TPedidoItemController.Destroy;
begin
  FPedidoItem.Free;
  FPedidoItemDAO.Free;
  FProdutoDAO.Free;
  inherited;
end;

procedure TPedidoItemController.ExcluirProduto(CodigoProduto: Integer);
begin
  FPedidoItem.CodigoProduto := CodigoProduto;
  FPedidoItemDAO.ExcluiPedidoItem(FPedidoItem);
end;

procedure TPedidoItemController.GravarPedidoItem(CodigoProduto: Integer; Quantidade: Integer);
begin
  FPedidoItem.CodigoProduto := CodigoProduto;
  FPedidoItem.Quantidade := Quantidade;
  FPedidoItem.AtualizarValorUnitario(BuscarPrecoProduto(CodigoProduto));
  FPedidoItemDAO.GravarPedidoItemProduto(FPedidoItem);
end;

function TPedidoItemController.RetornaValorTotal: Currency;
begin
  Result := FPedidoItem.GetValorTotalItens;
end;

function TPedidoItemController.BuscarPrecoProduto(CodigoProduto: Integer): Currency;
begin
  Result := FProdutoDAO.ObterPrecoVenda(CodigoProduto);
end;

procedure TPedidoItemController.AtualizarItem(CodigoProduto: Integer; Quantidade: Integer);
begin
  FPedidoItem.CodigoProduto := CodigoProduto;
  FPedidoItem.Quantidade := Quantidade;
  FPedidoItem.AtualizarValorUnitario(BuscarPrecoProduto(CodigoProduto));
end;

end.

