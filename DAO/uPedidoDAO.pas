unit uPedidoDAO;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, UConfigDatabase, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys.PG, FireDAC.Phys.PGDef, uPedido,
  FireDAC.Phys.MySQL;

type
  TPedidoDAO = class
  private
    FConn: TFDConnection;
    FConfig: TConfigDatabase;
  public
    constructor Create;
    destructor Destroy; override;
    procedure GravarPedido(Pedido: TPedido);
    procedure ExcluirPedido(Pedido: TPedido);
    function ListarPedidos: TFDQuery;
  end;

implementation

{ TPedidoDAO }

constructor TPedidoDAO.Create;
begin
  inherited Create;
  FConfig := TConfigDatabase.Create;
  FConn := FConfig.GetConnection;
end;

destructor TPedidoDAO.Destroy;
begin
  FConn.Free;
  inherited;
end;

procedure TPedidoDAO.ExcluirPedido(Pedido: TPedido);
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConn;
    Query.SQL.Text := 'DELETE FROM pedidos WHERE id = :ID';
    Query.ParamByName('ID').AsInteger := Pedido.Numero;
    Query.ExecSQL;
  finally
    Query.Free;
  end;
end;

procedure TPedidoDAO.GravarPedido(Pedido: TPedido);
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConn;
    Query.SQL.Text := 'INSERT INTO pedidos (data, cliente_id, total) VALUES '+
                      '(:Data, :ClienteID, :Total)';
    Query.ParamByName('Data').AsDate := Pedido.DataEmissao;
    Query.ParamByName('ClienteID').AsInteger := Pedido.Cliente;
    Query.ParamByName('Total').AsFloat := Pedido.ValorTotal;
    Query.ExecSQL;
  finally
    Query.Free;
  end;
end;

function TPedidoDAO.ListarPedidos: TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := FConn;
  Result.SQL.Text := 'SELECT * FROM pedidos';
  Result.Open;
end;

end.
