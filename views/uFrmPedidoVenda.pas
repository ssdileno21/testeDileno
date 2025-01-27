unit uFrmPedidoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Data.DB, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, FireDAC.Comp.Client, uPedidoController, uPedidoItemController,
  System.Generics.Collections, uPedido, uPedidoItem,

  FireDAC.VCLUI.Wait;


type
  TStatusTela = (stInicial, stNovoPedido, stPedidoGravado, stPedidoCancelado,
                 stInserirProduto);

  TFrmPedidoVenda = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    dbgridProdutos: TDBGrid;
    dbnProdutos: TDBNavigator;
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    edtProdutoQtd: TEdit;
    edtProdutoVlrUnitario: TEdit;
    gbProduto: TGroupBox;
    edtProduto: TEdit;
    edtDescricao: TEdit;
    btnProdutoGravar: TButton;
    Panel4: TPanel;
    lbValorTotalPedido: TLabel;
    Label4: TLabel;
    Panel5: TPanel;
    Label6: TLabel;
    Label5: TLabel;
    edtNumPedido: TEdit;
    DateTimePicker1: TDateTimePicker;
    Label7: TLabel;
    Label8: TLabel;
    edtCodCliente: TEdit;
    Label9: TLabel;
    edtVlrPedido: TEdit;
    Panel6: TPanel;
    btnListarPedidos: TButton;
    btnCancelar: TButton;
    btnExcluirPedido: TButton;
    btnGravarPedido: TButton;
    btnNovoPedido: TButton;
    Listagem: TTabSheet;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    procedure btnGravarPedidoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNovoPedidoClick(Sender: TObject);
    procedure btnProdutoGravarClick(Sender: TObject);
    procedure edtProdutoChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    FPedidoController: TPedidoController;
    FPedidoItemController: TPedidoItemController;
    FItens: TObjectList<TPedidoItem>;

    procedure InicializarController;
    procedure AtualizarInterface(Status: TStatusTela);

    procedure AtualizarGrid;
    procedure AtualizarValorTotal;
    procedure AtualizarValorProduto;

    procedure LimparCampos;

    function ValidarCamposPedido: Boolean;
    function ValidarCamposItem: Boolean;
    procedure RegisterFDGUIxWaitCursor;
  public
    { Public declarations }
    destructor Destroy; override;
  end;

var
  frmPedidoVenda: TFrmPedidoVenda;

implementation

{$R *.dfm}

procedure TFrmPedidoVenda.AtualizarGrid;
begin
  // Implementar a atualiza��o da grid com os itens do pedido
end;

procedure TFrmPedidoVenda.AtualizarInterface(Status: TStatusTela);
begin
  case Status of
    stInicial:
      begin
        LimparCampos;
        PageControl1.ActivePageIndex := 0;
        DateTimePicker1.Date := Now;
        edtNumPedido.Enabled := False;
        edtNumPedido.Text := '';
        edtProduto.Enabled := False;
        edtProdutoQtd.Enabled := False;
        edtProdutoVlrUnitario.Enabled := False;
        btnProdutoGravar.Enabled := False;
        btnGravarPedido.Enabled := False;
        btnCancelar.Enabled := False;
        btnNovoPedido.Enabled := True;
        btnExcluirPedido.Enabled := True;
        btnListarPedidos.Enabled := True;
        edtVlrPedido.Enabled := True;
      end;

    stNovoPedido:
      begin
        LimparCampos;
        PageControl1.ActivePageIndex := 0;
        edtNumPedido.Enabled := False;
        edtNumPedido.Text := '';
        DateTimePicker1.Date := Date;
        edtProduto.Enabled := True;
        edtProdutoQtd.Enabled := True;
        edtProdutoVlrUnitario.Enabled := False;
        btnProdutoGravar.Enabled := False;
        btnGravarPedido.Enabled := True;
        btnCancelar.Enabled := True;
        btnNovoPedido.Enabled := False;
        btnExcluirPedido.Enabled := False;
        btnListarPedidos.Enabled := False;
        edtVlrPedido.Enabled := False;
      end;

    stInserirProduto:
    begin
      edtProduto.Text := '';
      edtDescricao.Text := '';
      edtProdutoQtd.Text := '';
      edtProdutoVlrUnitario.Text := '';
      btnProdutoGravar.Enabled := False;
    end;

    stPedidoGravado, stPedidoCancelado:
      begin
        AtualizarInterface(stInicial);
      end;
  end;
end;

procedure TFrmPedidoVenda.AtualizarValorProduto;
var
  Preco: Currency;
begin
  try
    Preco := FPedidoItemController.BuscarPrecoProduto(StrToIntDef(edtProduto.Text, 0));
    edtProdutoVlrUnitario.Text := FormatFloat('0.00', Preco);
  except
    on E: Exception do
      ShowMessage('Erro ao buscar pre�o do produto: ' + E.Message);
  end;
end;

procedure TFrmPedidoVenda.AtualizarValorTotal;
var
  Total: Currency;
  Item: TPedidoItem;
begin
  Total := 0;
  for Item in FItens do
    Total := Total + (Item.Quantidade * Item.ValorUnitario);

  edtVlrPedido.Text := CurrToStr(Total);
  lbValorTotalPedido.Caption := CurrToStr(Total);
end;

procedure TFrmPedidoVenda.btnCancelarClick(Sender: TObject);
begin
  AtualizarInterface(stPedidoCancelado);
end;

procedure TFrmPedidoVenda.btnGravarPedidoClick(Sender: TObject);
var
  Pedido: TPedido;
begin
  Pedido := TPedido.Create;
  try
    if not ValidarCamposPedido then
      Exit;

    Pedido.Numero := StrToInt(edtNumPedido.Text);
    Pedido.DataEmissao := DateTimePicker1.Date;
    Pedido.Cliente := StrToIntDef(edtCodCliente.Text,0);
    Pedido.Cliente := StrToInt(edtCodCliente.Text);
    Pedido.ValorTotal := StrToCurr(edtVlrPedido.Text);

    FPedidoController.GravarPedido(Pedido);

    ShowMessage('Pedido gravado com sucesso!');

    AtualizarInterface(stInicial);
  finally
    Pedido.Free;
  end;
end;

procedure TFrmPedidoVenda.btnNovoPedidoClick(Sender: TObject);
begin
  AtualizarInterface(stNovoPedido);
end;

procedure TFrmPedidoVenda.btnProdutoGravarClick(Sender: TObject);
var
  PedidoItem: TPedidoItem;
begin
  if not ValidarCamposItem then
  begin
    ShowMessage('Preencha todos os campos obrigat�rios do item.');
    Exit;
  end;

  try
    PedidoItem := TPedidoItem.Create(
      StrToInt(edtProduto.Text),
      edtDescricao.Text,
      StrToInt(edtProdutoQtd.Text),
      StrToCurr(edtProdutoVlrUnitario.Text)
    );

    FItens.Add(PedidoItem);

    AtualizarGrid;
    AtualizarValorTotal;
    AtualizarInterface(stInserirProduto);
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao adicionar item: ' + E.Message);
    end;
  end;
end;

destructor TFrmPedidoVenda.Destroy;
begin
  FPedidoController.Free;
  FItens.Free;
  inherited Destroy;
end;

procedure TFrmPedidoVenda.edtProdutoChange(Sender: TObject);
begin
  if edtProduto.Text <> '' then
  begin
    AtualizarValorProduto;
    edtDescricao.Enabled := False;
    edtProdutoQtd.Enabled := True;
    btnProdutoGravar.Enabled := (edtProdutoQtd.Text <> '') and
      (edtProdutoVlrUnitario.Text <> '');
  end
  else
    AtualizarInterface(stInserirProduto);
end;

procedure TFrmPedidoVenda.FormCreate(Sender: TObject);
begin
  RegisterFDGUIxWaitCursor;
  InicializarController;
  AtualizarInterface(stInicial);
end;

procedure TFrmPedidoVenda.InicializarController;
begin
  FPedidoController := TPedidoController.Create;
  FPedidoItemController := TPedidoItemController.Create;
  FItens := TObjectList<TPedidoItem>.Create;
end;

procedure TFrmPedidoVenda.LimparCampos;
begin
  edtNumPedido.Clear;
  edtCodCliente.Clear;
  edtVlrPedido.Clear;
  edtProduto.Clear;
  edtDescricao.Clear;
  edtProdutoQtd.Clear;
  edtProdutoVlrUnitario.Clear;
  lbValorTotalPedido.Caption := '0,00';
end;

procedure TFrmPedidoVenda.RegisterFDGUIxWaitCursor;
begin
  //TFDGUIxWaitCursor.Create(nil);
end;

function TFrmPedidoVenda.ValidarCamposItem: Boolean;
var
  ValorUnitario: Currency;
begin
  Result := True;

  if Trim(edtProduto.Text) = '' then
  begin
    ShowMessage('O c�digo do produto � obrigat�rio.');
    edtProduto.SetFocus;
    Result := False;
    Exit;
  end;

  if Trim(edtDescricao.Text) = '' then
  begin
    ShowMessage('A descri��o do produto � obrigat�ria.');
    edtDescricao.SetFocus;
    Result := False;
    Exit;
  end;

  if StrToIntDef(edtProdutoQtd.Text,0) = 0 then
  begin
    ShowMessage('Informe uma quantidade v�lida.');
    Result := False;
    Exit;
  end;
end;

function TFrmPedidoVenda.ValidarCamposPedido: Boolean;
begin
  Result := True;

  if Trim(edtNumPedido.Text) = '' then
  begin
    ShowMessage('O n�mero do pedido � obrigat�rio.');
    edtNumPedido.SetFocus;
    Result := False;
    Exit;
  end;

  if Trim(edtCodCliente.Text) = '' then
  begin
    ShowMessage('O c�digo do cliente � obrigat�rio.');
    edtCodCliente.SetFocus;
    Result := False;
    Exit;
  end;
end;

end.

