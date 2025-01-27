unit uPedido;

interface

uses
  uCliente;

type
  TPedido = class
  private
    FNumero: Integer;
    FDataEmissao: TDateTime;
    FCliente: Integer;
    FValorTotal : Currency;
  public
    constructor Create;
    destructor Destroy; override;

    property Numero: Integer read FNumero write FNumero;
    property DataEmissao: TDateTime read FDataEmissao write FDataEmissao;
    property Cliente: Integer read FCliente write FCliente;
    property ValorTotal : Currency read FValorTotal write FValorTotal;
  end;

implementation

{ TPedido }

constructor TPedido.Create;
begin
  //
end;

destructor TPedido.Destroy;
begin
  //
  inherited;
end;

end.

