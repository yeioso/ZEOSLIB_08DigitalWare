unit Utils.Log;

interface


//Procedure UtLog_User(Const pUser : String);
Procedure UtLog_Execute(Const pMensaje : String; Const pExt : String = '');

implementation

Uses
  SyncObjs,
  Winapi.Windows,
  System.StrUtils,
  System.SysUtils,
  Utils.Functions,
  Generics.Defaults,
  Generics.Collections;

Const
  LINE_START = '<-----!';
  LINE_FINISH = '!----->';
  LIMIT_SIZE_FILE = (1024 * 1024) * 10;//10 Megas

Type
  TRecLog = Class
    Private
      FUSER : String;
    Public
      Class Procedure Execute(Const pMensaje : String);
  End;
//  TRecLogs = TList<TRecLog>;
//
//  TLog = Class
//    Private
//      cs  : TCriticalSection;
//      FInfo : TRecLogs;
//      FIndice : Integer;
//      Function Exists(Const pUser : String) : Boolean;
//    Public
//      Property Info : TRecLogs Read FInfo Write FInfo;
//      Property Indice : Integer Read FIndice;
//      Constructor Create;
//      Destructor Destroy;
//      Procedure Restart;
//      Function Search(Const pUser : String): Boolean;
//  End;

//Var
//  gLogs : TLog;

{ TLog }
//constructor TLog.Create;
//begin
//  cs  := TCriticalSection.Create;
//  FInfo := TRecLogs.Create;
//end;
//
//Function TLog.Search(Const pUser : String): Boolean;
//Var
//  Target: TRecLog;
//  Comparer: IComparer<TRecLog>;
//  Comparison: TComparison<TRecLog>;
//Begin
//  cs.Enter;
//  try
//    Self.FInfo.Sort(TComparer<TRecLog>.Construct(Function(Const Left, Right : TRecLog) : integer
//              begin
//                Result := Left.FUSER - Right.FUSER;
//              end));
//    Comparison := Function(Const Left, Right: TRecLog): Integer
//                  begin
//                    Result := Left.FUSER - Right.FUSER;
//                  end;
//    Target := TRecLog.Create;
//    Target.FUSER := pUser;
//    Comparer := TComparer<TRecLog>.Construct(Comparison);
//    Result := Self.FInfo.BinarySearch(Target, FIndice, Comparer);
//    FreeAndNil(Target);
//  Finally
//    cs.Leave;
//  end;
//End;
//
//destructor TLog.Destroy;
//begin
//  Restart;
//  FreeAndNil(FInfo);
//  FreeAndNil(cs);
//end;
//
//Function TLog.Exists(Const pUser : String) : Boolean;
//Begin
//  Result := False;
//  If Assigned(FInfo)  Then
//    Result := Search(pUser);
//End;
//
//Function TLog.Load(pCnx : TECGDBConnect) : Boolean;
//Var
//  lI : TRec_Cfg_Approve;
//  lSQL : TECGDBQuery;
//begin
//  Result := False;
//  Self.Restart;
//  Try
//    lSQL := TECGDBQuery.Create;
//    lSQL.SetConnect(pCnx);
//    lSQL.SetSQLCls;
//    lSQL.SetSQLAdd(' SELECT * FROM ecgts.dbo.cfg_Approve (nolock) ');
//    lSQL.SetSQLAdd(' order by ID_STATUS desc ');
//    If lSQL.Open Then
//    Begin
//      lSQL.First;
//      While Not lSQL.Eof Do
//      Begin
//        lI := TRec_Cfg_Approve.Create;
//        lI.NAME    := lSQL.getStr('NAME'     );
//        lI.TIMEOUT := lSQL.GetInt('TIME_OUT' );
//        lI.STATUS  := lSQL.GetInt('ID_STATUS');
//        Self.FInfo.Add(lI);
//        lSQL.Next;
//      End;
//    End;
//    lSQL.Close;
//    Result := Self.FInfo.Count > 0;
//  Finally
//    FreeAndNil(lSQL);
//  End;
//End;
//
//procedure TLog.Restart;
//Var
//  lItem : TRec_Cfg_Approve;
//begin
//  For lItem In Self.FInfo Do
//    lItem.Free;
//  Self.FInfo.Clear;
//end;


Class Procedure TRecLog.Execute(Const pMensaje : String);
var
  F : TextFile;
  lI : Integer;
  lAux : String;
  FFILE : String;
  FLINE : String;
  Mutex : THandle;
  lCopied : Boolean;
  SearchRec: TSearchRec;

  Function GetFileName : Boolean;
  Var
    lPath : String;
    lFile : String;
  Begin
    lFile := ChangeFileExt(ExtractFileName(GetModuleName(HInstance)), '.log');
    lPath := ExtractFilePath(GetModuleName(HInstance));
    lPath := IncludeTrailingBackslash(lPath + 'Log'                          );
    lPath := IncludeTrailingBackslash(lPath + FormatDateTime('YYYYMMDD', Now));
    Result := ForceDirectories(lPath);
//    If Not Vacio(FUSER) Then
    FFILE := lPath + lFile;
//    Else
//      FFILE := lPath + Validar_Contenido_Texto(FUSER) + lFile;
  End;

begin
  FLINE := Copy(FormatDateTime('HH:NN:SS.ZZZ', Now) + ' ->        ', 01, 20) + pMensaje;
  If GetFileName Then
  Begin
    // Creamos un mutex, usando como identificador unico la ruta completa del ejecutable
    Mutex:= CreateMutex(nil,FALSE, PChar(StringReplace(ExtractFilePath(FFILE),'\','/',[rfReplaceAll])));
    if Mutex <> 0 then
    begin
      // Esperamos nuestro turno para escribir
      WaitForSingleObject(Mutex, INFINITE);
      try
        // Comprobamos el tamaño del archivo
        If FindFirst(FFILE, faAnyFile, SearchRec) = 0 Then
        begin
          // Si es mayor de un mega lo copiamos a (nombre).log.1
          If SearchRec.Size > (LIMIT_SIZE_FILE) Then
          Begin
            lI := 0;
            lCopied := False;
            Repeat
              Inc(lI);
              lAux := FFile + '.' + Justificar(IntToStr(lI), '0', 5);
              if FindFirst(lAux, faAnyFile, SearchRec) <> 0 then
              Begin
                MoveFileEx(PChar(FFile),PChar(lAux), MOVEFILE_REPLACE_EXISTING);
                lCopied := True;
              End;
            Until lCopied;
          End;
          System.SysUtils.FindClose(SearchRec);
        end;
        try
          AssignFile(F, FFile);
          {$I-}
            Append(F);
          if IOResult <> 0 then
            Rewrite(F);
          {$I+}
          if IOResult = 0 then
          begin
            Writeln(F, FLINE);
            CloseFile(F);
          end;
        except
          //
        end;
      finally
        ReleaseMutex(Mutex);
        CloseHandle(Mutex);
      end;
    end;
  End;
end;

//procedure UtLog_User(Const pUser : String);
//Begin
//  gLog.FUSER := pUser;
//End;

procedure UtLog_Execute(Const pMensaje : String; Const pExt : String = '');
Begin
  TRecLog.Execute(pMensaje);
End;

//Initialization
//  UtLog_Machine := Depurar_Texto_Valido(Retornar_Maquina);

//Initialization
//  gLogs := TLogs.Create;
//
//Finalization
//  If Assigned(gLogs) Then
//    FreeAndNil(gLogs);

end.
