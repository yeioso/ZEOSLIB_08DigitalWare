unit Utils.Sesion;

interface

Function Iniciar_Sesion : Boolean;

implementation

Uses
  Classes,
  SysUtils,
  TBLNM0000.Info,
  Utils.Conexion,
  Utils.Functions,
  Utils.Archivo_Cfg,
  Form_Create_Tables,
  Form_ConnectionString;

Function Hay_Tablas : Boolean;
Var
  lI : Integer;
  lLista : TStringList;
Begin
  lI := 0;
  Result := True;
  lLista := TStringList.Create;
  Retornar_Name_Tablas(lLista);
  While (lI < lLista.Count) And Result Do
  Begin
    Result := gConexion.TableExists(lLista[lI]);
    If Result Then
      Inc(lI);
  End;
  lLista.Free;
End;


Function Iniciar_Sesion : Boolean;
Begin
  Result := FileExists(Get_FileNameCfg);
  If Not Result Then
    Result := Show_ConnectionString;

  Result := FileExists(Get_FileNameCfg);

  If Result Then
    Result := Return_Connection_String(gConnectionString, gTipo_Conexion);

  If Result Then
    Result := Not Vacio(gConnectionString);

  If Result Then
    Result := Hay_Conexion(gConnectionString);

  If Result Then
    Iniciar_Conexion(gConnectionString);

  If Result Then
    If Not Hay_Tablas Then
      Result := Create_Tables;
End;

end.
