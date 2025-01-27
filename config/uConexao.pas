unit uConexao;

interface

uses
  FireDAC.Comp.Client, System.IniFiles, System.SysUtils, FireDAC.Phys.MySQL,
  FireDAC.Stan.Def, FireDAC.Stan.Async, FireDAC.DApt;

type
  TConexao = class
  private
    FConn: TFDConnection;
    FConfig: TIniFile;
    procedure ConfigurarConexao;
  public
    constructor Create;
    destructor Destroy; override;
    function ObterConexao: TFDConnection;
  end;

implementation

{ TConexao }

procedure TConexao.ConfigurarConexao;
var
  Database, Username, Password, Server, Port, LibPath: string;
begin
  FConfig := TIniFile.Create('config.ini');
  try
    Database := FConfig.ReadString('Database', 'Name', '');
    Username := FConfig.ReadString('Database', 'Username', '');
    Password := FConfig.ReadString('Database', 'Password', '');
    Server := FConfig.ReadString('Database', 'Server', '');
    Port := FConfig.ReadString('Database', 'Port', '3306');
    LibPath := FConfig.ReadString('Database', 'LibPath', '');

    FConn.Params.Clear;
    FConn.DriverName := 'MySQL';
    FConn.Params.Add('Database=' + Database);
    FConn.Params.Add('User_Name=' + Username);
    FConn.Params.Add('Password=' + Password);
    FConn.Params.Add('Server=' + Server);
    FConn.Params.Add('Port=' + Port);

    //FDriverLink.VendorLib := LibPath;

    FConn.Connected := True;
  finally
    FConfig.Free;
  end;
end;

constructor TConexao.Create;
begin

end;

destructor TConexao.Destroy;
begin

  inherited;
end;

function TConexao.ObterConexao: TFDConnection;
begin

end;

end.
