unit uCliente;

interface

type
  TCliente = class
  private
    FCodigo: Integer;
    FNome: string;
    FCidade: string;
    FUF: string;
  public
    constructor Create(aCodigo: Integer; aNome, aCidade, aUF: string);
    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: string read FNome write FNome;
    property Cidade: string read FCidade write FCidade;
    property UF: string read FUF write FUF;
  end;

implementation

{ TCliente }

constructor TCliente.Create(aCodigo: Integer; aNome, aCidade, aUF: string);
begin
  FCodigo := aCodigo;
  FNome := aNome;
  FCidade := aCidade;
  FUF := aUF;
end;

end.
