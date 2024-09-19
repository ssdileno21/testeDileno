unit uPedidoController;

interface

uses
  UPedidoDAO, UPedido, System.SysUtils, FireDAC.Comp.Client, Vcl.Dialogs,
  System.Generics.Collections;

type
  TPedidoController = class
  private
    FPedidoDAO: TPedidoDAO;
  public
    constructor Create;
    destructor Destroy; override;

    procedure GravarPedido(Pedido: TPedido);
    procedure ExcluirPedido(Pedido: TPedido);
    procedure CancelarPedido;
    procedure ListarPedidos;
  end;

implementation

{ TPedidoController }

procedure TPedidoController.CancelarPedido;
begin

end;

constructor TPedidoController.Create;
begin
  FPedidoDAO := TPedidoDAO.Create;
end;

destructor TPedidoController.Destroy;
begin
  FPedidoDAO.Free;
  inherited;
end;

procedure TPedidoController.ExcluirPedido(Pedido: TPedido);
begin
  FPedidoDAO.ExcluirPedido(Pedido);
end;

procedure TPedidoController.GravarPedido(Pedido: TPedido);
begin
  FPedidoDAO.GravarPedido(Pedido);
end;

procedure TPedidoController.ListarPedidos;
begin

end;

end.
