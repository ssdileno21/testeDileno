unit uPedidoItem;

interface

uses
  System.Generics.Collections;

type
  TPedidoItem = class
  private
    FIdItem: Integer;
    FNumeroPedido: Integer;
    FCodigoProduto: Integer;
    FDescricaoProduto: string;
    FQuantidade: Integer;
    FValorUnitario: Currency;
    FValorTotal: Currency; // Adicione esta linha
    FItens: TObjectList<TPedidoItem>;
    procedure SetQuantidade(const Value: Integer);
    procedure SetValorUnitario(const Value: Currency);
    procedure CalcularValorTotal;
  public
    property IdItem: Integer read FIdItem write FIdItem;
    property NumeroPedido: Integer read FNumeroPedido write FNumeroPedido;
    property CodigoProduto: Integer read FCodigoProduto write FCodigoProduto;
    property DescricaoProduto: string read FDescricaoProduto write FDescricaoProduto;
    property Quantidade: Integer read FQuantidade write SetQuantidade;
    property ValorUnitario: Currency read FValorUnitario write SetValorUnitario;
    property ValorTotal: Currency read FValorTotal; // Adicione esta linha
    property Itens: TObjectList<TPedidoItem> read FItens;

    constructor Create(aCodigoProduto: Integer; aDescricaoProduto: string;
      aQuantidade: Integer; aValorUnitario: Currency);
    destructor Destroy; override;

    procedure AtualizarQuantidade(aNovaQuantidade: Integer);
    procedure AtualizarValorUnitario(aNovoValorUnitario: Currency);
    procedure AdicionarItem(aItem: TPedidoItem);
    procedure RemoverItem(aItem: TPedidoItem);
    function GetValorTotalItens: Currency;
  end;

implementation

{ TPedidoItem }

procedure TPedidoItem.AdicionarItem(aItem: TPedidoItem);
begin
  FItens.Add(aItem);
end;

procedure TPedidoItem.AtualizarQuantidade(aNovaQuantidade: Integer);
begin
  FQuantidade := aNovaQuantidade;
  CalcularValorTotal;
end;

procedure TPedidoItem.AtualizarValorUnitario(aNovoValorUnitario: Currency);
begin
  FValorUnitario := aNovoValorUnitario;
  CalcularValorTotal;
end;

procedure TPedidoItem.CalcularValorTotal;
begin
  FValorTotal := FQuantidade * FValorUnitario; // Atualize o cálculo do valor total
end;

constructor TPedidoItem.Create(aCodigoProduto: Integer; aDescricaoProduto: string;
  aQuantidade: Integer; aValorUnitario: Currency);
begin
  FCodigoProduto := aCodigoProduto;
  FDescricaoProduto := aDescricaoProduto;
  FQuantidade := aQuantidade;
  FValorUnitario := aValorUnitario;
  FItens := TObjectList<TPedidoItem>.Create;
  CalcularValorTotal; // Calcule o valor total na criação
end;

destructor TPedidoItem.Destroy;
begin
  FItens.Free;
  inherited;
end;

function TPedidoItem.GetValorTotalItens: Currency;
var
  Item: TPedidoItem;
begin
  Result := 0;
  for Item in FItens do
    Result := Result + (Item.Quantidade * Item.ValorUnitario);
end;

procedure TPedidoItem.RemoverItem(aItem: TPedidoItem);
begin
  FItens.Remove(aItem);
end;

procedure TPedidoItem.SetQuantidade(const Value: Integer);
begin
  FQuantidade := Value;
  CalcularValorTotal;
end;

procedure TPedidoItem.SetValorUnitario(const Value: Currency);
begin
  FValorUnitario := Value;
  CalcularValorTotal;
end;

end.

