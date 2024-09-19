program TesteDileno;

uses
  Vcl.Forms,
  uFrmPedidoVenda in 'views\uFrmPedidoVenda.pas' {Form1},
  uProduto in 'model\uProduto.pas',
  uPedido in 'model\uPedido.pas',
  uCliente in 'model\uCliente.pas',
  uPedidoDAO in 'DAO\uPedidoDAO.pas',
  uPedidoController in 'controller\uPedidoController.pas',
  UConfigDatabase in 'config\UConfigDatabase.pas',
  uPedidoItem in 'model\uPedidoItem.pas',
  uConexao in 'config\uConexao.pas',
  uProdutoDAO in 'DAO\uProdutoDAO.pas',
  uPedidoItemController in 'controller\uPedidoItemController.pas',
  uPedidoItemDAO in 'DAO\uPedidoItemDAO.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPedidoVenda, frmPedidoVenda);
  Application.Run;
end.
