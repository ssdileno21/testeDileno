unit UConfigDatabase;

interface

uses
  System.IniFiles, System.SysUtils, FireDAC.Comp.Client, FireDAC.Stan.Def,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef;

type
  TConfigDatabase = class
  private
    FDatabase: string;
    FUsername: string;
    FPassword: string;
    FServer: string;
    FPort: Integer;
    FLibPath: string;
    FConnection: TFDConnection;
    procedure ConfigurarConexao;
    procedure LoadFromIni;
  public
    constructor Create;
    destructor Destroy; override;
    function GetConnection: TFDConnection;

    property Database: string read FDatabase;
    property Username: string read FUsername;
    property Password: string read FPassword;
    property Server: string read FServer;
    property Port: Integer read FPort;
    property LibPath: string read FLibPath;
  end;

implementation

{ TConfigDatabase }

constructor TConfigDatabase.Create;
begin
  inherited Create;
  LoadFromIni;
  FConnection := TFDConnection.Create(nil);
end;

destructor TConfigDatabase.Destroy;
begin
  FConnection.Free;
  inherited;
end;

procedure TConfigDatabase.LoadFromIni;
var
  IniFile: TIniFile;
  ConfigFilePath: string;
begin
  ConfigFilePath := ExtractFilePath(ParamStr(0)) + 'config.ini';
  IniFile := TIniFile.Create(ConfigFilePath);
  try
    FDatabase := IniFile.ReadString('DatabaseConfig', 'Database', '');
    FUsername := IniFile.ReadString('DatabaseConfig', 'Username', '');
    FPassword := IniFile.ReadString('DatabaseConfig', 'Password', '');
    FServer := IniFile.ReadString('DatabaseConfig', 'Server', '');
    FPort := IniFile.ReadInteger('DatabaseConfig', 'Port', 3306);
    FLibPath := IniFile.ReadString('DatabaseConfig', 'LibPath', '');
  finally
    IniFile.Free;
  end;
end;

procedure TConfigDatabase.ConfigurarConexao;
begin
  FConnection.Params.DriverID := 'MySQL';
  FConnection.Params.Database := FDatabase;
  FConnection.Params.UserName := FUsername;
  FConnection.Params.Password := FPassword;
  FConnection.Params.Add('Server=' + FServer);
  FConnection.Params.Add('Port=' + IntToStr(FPort));

  FConnection.Params.Add('VendorLib=' + FLibPath + '\libmysql.dll');

  FConnection.DriverName := 'MySQL';
  FConnection.LoginPrompt := False;

  try
    FConnection.Connected := True;
  except
    on E: Exception do
      raise Exception.Create('Erro ao conectar ao banco de dados: ' + E.Message);
  end;
end;


function TConfigDatabase.GetConnection: TFDConnection;
begin
  if not FConnection.Connected then
    ConfigurarConexao;
  Result := FConnection;
end;

end.

