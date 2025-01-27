unit uProduto;

interface

type
  TProduto = class
  private
    FCodigo: Integer;
    FDescricao: string;
    FPrecoVenda: Currency;
  public
    constructor Create(aCodigo: Integer; aDescricao: string; aPrecoVenda:
    Currency);
    property Codigo: Integer read FCodigo write FCodigo;
    property Descricao: string read FDescricao write FDescricao;
    property PrecoVenda: Currency read FPrecoVenda write FPrecoVenda;
  end;

implementation

{ TProduto }

constructor TProduto.Create(aCodigo: Integer; aDescricao: string;
  aPrecoVenda: Currency);
begin
  FCodigo := aCodigo;
  FDescricao := aDescricao;
  FPrecoVenda := aPrecoVenda;
end;

end.
