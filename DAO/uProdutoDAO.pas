unit uProdutoDAO;

interface

uses FireDAC.Comp.Client, UConfigDatabase, FireDAC.VCLUI.Wait, SysUtils,
Dialogs;

type
  TProdutoDAO = class
  private
    FConn: TFDConnection;
    FConfig: TConfigDatabase;
    procedure TesteConexao;
  public
    constructor Create;
    destructor Destroy; override;
    function ObterPrecoVenda(CodigoProduto: Integer): Currency;
    function ObterDescricaoProduto(CodigoProduto: Integer) : string;
  end;

implementation

uses
  Data.DB;

{ TProdutoDAO }

constructor TProdutoDAO.Create;
begin
  inherited Create;
  FConfig := TConfigDatabase.Create;
  FConn := FConfig.GetConnection;
  FConn.Connected := True;
end;

destructor TProdutoDAO.Destroy;
begin
  FConn.Free;
  inherited;
end;

function TProdutoDAO.ObterDescricaoProduto(CodigoProduto: Integer): string;
begin
  Result := '';
end;

function TProdutoDAO.ObterPrecoVenda(CodigoProduto: Integer): Currency;
var
  FDQuery: TFDQuery;
begin
    {TesteConexao;
    if not FConn.Connected then
      raise Exception.Create('Conexão com o banco de dados não está ativa.');}

  Result := -1;
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := FConn;
    FDQuery.SQL.Text := 'SELECT preco_venda FROM produtos '+
                        'WHERE codigo = :CodigoProduto';
    FDQuery.ParamByName('CodigoProduto').AsInteger := CodigoProduto;
    FDQuery.Open;

    if not FDQuery.IsEmpty then
      Result := FDQuery.FieldByName('preco_venda').AsCurrency;
  finally
    FDQuery.Free;
  end;

end;

procedure TProdutoDAO.TesteConexao;
var
  FDQuery: TFDQuery;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := FConn;
    FDQuery.SQL.Text := 'SELECT 1';
    FDQuery.Open;

    if not FDQuery.IsEmpty then
      ShowMessage('Conexão e query OK');
  finally
    FDQuery.Free;
  end;

end;

end.
