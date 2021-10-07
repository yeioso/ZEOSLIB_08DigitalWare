unit Utils.Archivo_Cfg;

interface
Uses
  Utils.Conexion;

Function Get_FileNameCfg : String;
Function Return_Connection_String(Var pConnectionString : String; Var pTypeConnection : TTIPO_CONEXION) : Boolean;
Procedure Salvar_Informacion_Connection(pType, pConnectionString : String);

implementation

Uses
  Classes,
  SysUtils,
  Utils.Log,
  Utils.Functions,
  Utils.Homologacion;

Function Get_FileNameCfg : String;
Begin
  Result := ChangeFileExt(GetModuleName(HInstance), '.cfg');
End;


Function Cargar_Informacion_Connection(Var pConnectionString : String; Var pTypeConnection : TTIPO_CONEXION) : Boolean;
Var
  lOk1 : Boolean;
  lOk2 : Boolean;  
  lArchivo : TStringList;
Begin
  lOk1 := False;
  lOk2 := False;
  pConnectionString := '';
  pTypeConnection := Conn_SQLSERVER;
  lArchivo := TStringList.Create;
  lArchivo.LoadFromFile(Get_FileNameCfg);
  if lArchivo.Count >= 1 then
  Begin
    lOk1 := True;
    pTypeConnection := Return_Type_Connection(lArchivo[0]);
  End;

  if lArchivo.Count >= 2 then
  Begin
    lOk2 := True;
    pConnectionString := Desencripta_Cadena(lArchivo[1]);
  End;

  lArchivo.Clear;
  lArchivo.Free;
  Result := lOk1 And lOk2;
End;

Function Return_Connection_String(Var pConnectionString : String; Var pTypeConnection : TTIPO_CONEXION) : Boolean;
Begin
  pTypeConnection := Conn_SQLSERVER;
  pConnectionString := '';
  Result := FileExists(Get_FileNameCfg);
  if Result then
    Result := Cargar_Informacion_Connection(pConnectionString, pTypeConnection);
End;

Procedure Salvar_Informacion_Connection(pType, pConnectionString : String);
Var
  lArchivo : TStringList;
Begin
  lArchivo := TStringList.Create;
  lArchivo.Clear;
  lArchivo.Add(pType);
  lArchivo.Add(pConnectionString);
  lArchivo.SaveToFile(Get_FileNameCfg);
  lArchivo.Free;
End;

end.
