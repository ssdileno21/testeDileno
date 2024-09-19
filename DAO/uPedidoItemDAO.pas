unit uPedidoItemDAO;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, uPedidoItem, uConexao, UConfigDatabase;

type
  TPedidoItemDAO = class
  private
    FConn: TFDConnection;
    FConfig: TConfigDatabase;
  public
    constructor Create;
    destructor Destroy; override;
    procedure GravarPedidoItemProduto(PedidoItem:TPedidoItem);
    procedure ExcluiPedidoItem(PedidoItem:TPedidoItem);
  end;


implementation

{ TPedidoItensDAO }

constructor TPedidoItemDAO.Create;
begin
  inherited Create;
  FConfig := TConfigDatabase.Create;
  FConn := FConfig.GetConnection;
end;

destructor TPedidoItemDAO.Destroy;
begin
  FConn.Free;
  inherited;
end;

procedure TPedidoItemDAO.ExcluiPedidoItem(PedidoItem: TPedidoItem);
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConn;
    Query.SQL.Text := 'DELETE FROM PedidoItens WHERE id = :ID '+
                      'AND NUMEROPEDIDO = :NUMEROPEDIDO'+
                      'AND CODIGOPRODUTO = :CODIGOPRODUTO';

    Query.ParamByName('ID').AsInteger := PedidoItem.IdItem;
    Query.ParamByName('NUMEROPEDIDO').AsInteger := PedidoItem.NumeroPedido;
    Query.ParamByName('CODIGOPRODUTO').AsInteger := PedidoItem.CodigoProduto;
    Query.ExecSQL;
  finally
    Query.Free;
  end;
end;

procedure TPedidoItemDAO.GravarPedidoItemProduto(PedidoItem: TPedidoItem);
var
  FDQuery: TFDQuery;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := FConn;
    FDQuery.SQL.Text := 'INSERT INTO PedidoItens (NumeroPedido, CodigoProduto,'+
                        'Quantidade, ValorUnitario, ValorTotal) ' +
                        'VALUES (:NumeroPedido, :CodigoProduto, :Quantidade, '+
                        ':ValorUnitario, :ValorTotal)';
    FDQuery.ParamByName('NumeroPedido').AsInteger :=  PedidoItem.NumeroPedido;
    FDQuery.ParamByName('CodigoProduto').AsInteger := PedidoItem.CodigoProduto;
    FDQuery.ParamByName('Quantidade').AsInteger := PedidoItem.Quantidade;
    FDQuery.ParamByName('ValorUnitario').AsCurrency := PedidoItem.ValorUnitario;
    FDQuery.ParamByName('ValorTotal').AsCurrency := PedidoItem.ValorTotal;
    FDQuery.ExecSQL;
  finally
    FDQuery.Free;
  end;
end;

end.
