unit Utils.Conexion;

interface

Uses
  DB,
  AdoDB,
  System.Classes;

Const
  ID_SQLSERVER = 'STANDARD';
  ID_FIREBIRD  = 'FIREBIRD';
  ID_MYSQL     = 'MYSQL';
  ID_ORACLE    = 'ORACLE';

Type
  TArray_String = Array Of String;
  TTIPO_CONEXION = (Conn_SQLSERVER, Conn_FIREBIRD, Conn_MYSQL, Conn_ORACLE);

  TQUERY = Class(TADOQuery)
     Constructor Create(AOwner: TComponent); Override;
     Destructor Destroy; Override;
  End;

  TDATADB = Class
    Private
      FQR : TQUERY;
      FDS : TDataSource;
      FFIELD : String;
      FWHERE : String;
      FSELECT : String;
      FFILTER : String;
      FORDER_BY : String;
    Public
      Property QR : TQUERY Read FQR Write FQR;
      Property DS : TDataSource Read FDS Write FDS;
      Property FIELD : String Read FFIELD Write FFIELD;
      Property WHERE : String Read FWHERE Write FWHERE;
      Property FILTER : String Read FFILTER Write FFILTER;
      Property SELECT : String Read FSELECT Write FSELECT;
      Property ORDER_BY : String Read FORDER_BY Write FORDER_BY;
      Constructor Create;
      Destructor Destroy;
  End;

  TConexion = Class(TADOConnection)
    Private
      FAUX : TQUERY;
      FSQL : TQUERY;
      FTablas : TStringList;
      FTYPE_CNX : TTIPO_CONEXION;
      FServer : String;
      FDatabase : String;
      FUser : String;
      FPassword : String;
      Function Evaluation(Const pField, pValue : String) : String;
    Public
      Property AUX : TQUERY Read FAUX Write FAUX;
      Property SQL : TQUERY Read FSQL Write FSQL;
      Property Tablas : TStringList Read FTablas Write FTablas;
      Property TYPE_CNX : TTIPO_CONEXION Read FTYPE_CNX Write FTYPE_CNX;
      Property Database : String Read FDatabase;
      Constructor Create(AOwner: TComponent); override;
      Destructor Destroy; override;
      procedure SetConnection(pValue: TTIPO_CONEXION);
      Procedure SetMask(pField : TField; pMask : String);
      Function TableExists(Const pTableName : String) : Boolean;
      function Record_Exists(const pTableName: String): Boolean;
      function Connect(const pActive : Boolean; Const pCS : String = ''): Boolean;
      Function Start_MSSQL(Const pActive : Boolean): Boolean;
      Procedure SetServer  (Const pValue : String);
      Procedure SetDatabase(Const pValue : String);
      Procedure SetUser    (Const pValue : String);
      Procedure SetPassword(Const pValue : String);
      Function Is_Number(pDataType : TFieldType) : Boolean;
      Function Data_Exists(Const pTablename: String; Const pFields, pValues: TArray_String; Const pSource : String) : Boolean;
      Function Max_Value(Const pTablename: String; Const pFields, pValues: TArray_String; Const pResult, pSource: String) : String;
      Function Next(Const pTablename : String; Const pPrefix : Char; Const pPK, pField, pValue : TArray_String; Const pMaxWidth : Integer) : String;
      Function Get_ValueString(Const pTablename: String; Const pFields, pValues, pResult : TArray_String; Const pSource: String) : String;
      Function Get_ValueDouble(Const pTablename: String; Const pFields, pValues, pResult : TArray_String; Const pSource: String) : Double;
      Function No_Lock : String;
      Function Exec_SQL(Const pSQL, pSource: String) : Boolean;
      Procedure CreateLookUp(pQr, pLookup : TDATADB; Const pFieldName, pKeyField, pLookupKeyFields, pLookupResultField : String; Const pSize : Integer);
      Procedure CreateFieldFloat(pQr : TDATADB; Const pFieldName : String);
      Procedure CreateFieldString(pQr : TDATADB; Const pFieldName : String; Const pSize : Integer);
      Procedure CreateFieldInteger(pQr : TDATADB; Const pFieldName : String);
      Procedure SetFields(pQr : TQuery; Const pTable : String);
      Procedure SetCalculate(pQr : TQuery; Const pName : String; pSize : Integer; pDataType : TFieldType);
  End;

Var
  gConexion : TConexion;
  gConnectionString : String;
  gTipo_Conexion : TTIPO_CONEXION;

  Function Return_Type_Connection(pCadena : String) : TTIPO_CONEXION;
  Procedure Configurar_Conexion_Segura(pSender : TObject);
  Function Hay_Conexion(pConnectionString : String) : Boolean;
  Function Iniciar_Conexion(pConnectionString : String) : Boolean;

implementation

Uses
  Utils.Log,
  System.Math,
  Utils.Functions,
  System.SysUtils,
  System.StrUtils,
  Utils.Homologacion;

{ TQUERY }

constructor TQUERY.Create(AOwner: TComponent);
begin
  Inherited;
  If Assigned(gConexion) Then
  Begin
    Self.Connection := gConexion;
  End;
end;

destructor TQUERY.Destroy;
begin
  If Self.Active Then
    Self.Active := False;
  Inherited;
end;

Function Return_Type_Connection(pCadena : String) : TTIPO_CONEXION;
Begin
  Result := Conn_SQLSERVER;
  If pCadena = ID_ORACLE Then
    Result := Conn_ORACLE
  Else
    If pCadena = ID_FIREBIRD Then
      Result := Conn_FIREBIRD
    Else
      If pCadena = ID_MYSQL Then
        Result := Conn_MYSQL;
End;

Function CursorType_Standard : TCursorType;
Begin
  Result := ctDynamic;
  if gTipo_Conexion = Conn_ORACLE then
    Result := ctStatic;
End;

Function CursorLocation_Standar : TCursorLocation;
Begin
  Result := clUseClient;
End;

Procedure Configurar_Conexion_Segura(pSender : TObject);
Begin
  If Assigned(gConexion) Then
  Begin
    If Not gConexion.Connected Then
      gConexion.Connected := True;
  End;

  If (Not (pSender Is TADOTable)) And (Not (pSender Is TADOQuery)) And (Not (pSender Is TADODataSet)) Then
    Exit;
  if (pSender Is TADOTable) Then
  Begin
    (pSender As TADOTable).Connection := gConexion;
    (pSender As TADOTable).CommandTimeout := 0;
    (pSender As TADOTable).CursorType := CursorType_Standard;
    (pSender As TADOTable).CursorLocation := CursorLocation_Standar;
  End;

  if (pSender Is TQUERY) Then
  Begin
    (pSender As TQUERY).Connection := gConexion;
    (pSender As TQUERY).CommandTimeout := 0;
    (pSender As TQUERY).CursorType := CursorType_Standard;
    (pSender As TQUERY).CursorLocation := CursorLocation_Standar;
  End;


  If (pSender Is TADOQuery) then
  Begin
    (pSender As TADOQuery).Prepared := True;
    (pSender As TADOQuery).Connection := gConexion;
    (pSender As TADOQuery).CommandTimeout := 0;
    (pSender As TADOQuery).CursorType := CursorType_Standard;
    (pSender As TADOQuery).CursorLocation := CursorLocation_Standar;
  End;

  If (pSender Is TADODataSet) then
  Begin
    (pSender As TADODataSet).Prepared := True;
    (pSender As TADODataSet).Connection := gConexion;
    (pSender As TADODataSet).CommandTimeout := 0;
    (pSender As TADODataSet).CursorType := CursorType_Standard;
    (pSender As TADODataSet).CursorLocation := CursorLocation_Standar;
  End;
End;

//Provider=SQLOLEDB.1;Password=0;Persist Security Info=True;User ID=sa;Initial Catalog=Winpos;Data Source=ASE\ASE

Function Hay_Conexion(pConnectionString : String) : Boolean;
Var
  lConn : TADOConnection;
Begin
  lConn := Nil;
  Result := True;
  Try
    lConn := TADOConnection.Create(Nil);
    lConn.LoginPrompt := False;
    lConn.ConnectionString := pConnectionString;
    lConn.Connected := True ;
    lConn.Connected := False;
    lConn.Free;
  Except
    On E : Exception Do
    Begin
      If Assigned(lConn) Then
        lConn.Free;
      Result := False;
      UtLog_Execute('UtConexion, Hay_Conexion, ' + E.Message);
    End;
  End;
End;

Function Iniciar_Conexion(pConnectionString : String) : Boolean;
Begin
  Result := False;
  Try
    If Hay_Conexion(pConnectionString) Then
    Begin
      If Not Assigned(gConexion) Then
        gConexion := TConexion.Create(Nil);
      If gConexion.Connected Then
        gConexion.Connected := False;
      gConexion.ConnectionString := pConnectionString;
      gConexion.ConnectOptions := coAsyncConnect;
      gConexion.Mode := cmReadWrite;
      gConexion.LoginPrompt := False;
      gConexion.CommandTimeout := 0;
      gConexion.Connected := True;
      Result := gConexion.Connected;
      If Result Then
        gConexion.GetTableNames(gConexion.FTablas);
    End;
  Except
    On E : Exception Do
    Begin
     UtLog_Execute('UtConexion, Iniciar_Conexion, ' + E.Message);
    End;
  End;
End;

{ TConexion }
constructor TConexion.Create(AOwner: TComponent);
begin
  inherited;
  Self.LoginPrompt := False;
  FTablas := TStringList.Create;
  FSQL := TQUERY.Create(Nil);
  FSQL.Connection := Self;
  FAUX := TQUERY.Create(Nil);
  FAUX.Connection := Self;
end;

Procedure TConexion.CreateLookUp(pQr, pLookup : TDATADB; Const pFieldName, pKeyField, pLookupKeyFields, pLookupResultField : String; Const pSize : Integer);
Var
  lField : TStringField;
Begin
  lField := TStringField.Create(pQr.FQR);
  lField.FieldName := pFieldName;
  lField.DataSet := pQr.FQR;
  lField.Lookup := True;
  lField.FieldKind := fkLookup;
  lField.KeyFields := pKeyField; // Campo de la tabla base en el que se basa la búsqueda
  lField.LookupDataSet := pLookup.FQR; // Tabla de búsqueda
  lField.LookupKeyFields := pLookupKeyFields; // Campos de la tabla de búsqueda que se corresponden con los KeyFields de la tabla base
  lField.LookupResultField := pLookupResultField; // Campo de la tabla de búsqueda que se toma
  (*
  FieldName := 'Campo de búsqueda';
  Lookup := True;
  FieldKind := fkLookup;
  KeyFields := 'Producto'; // Campo de la tabla base en el que se basa la búsqueda
  LookupDataSet := pLookup.FQR; // Tabla de búsqueda
  LookupKeyFields := 'Codigo'; // Campos de la tabla de búsqueda que se corresponden con los KeyFields de la tabla base
  LookupResultField := 'Descripcion'; // Campo de la tabla de búsqueda que se toma
  *)
//  pQr.FQR.FieldDefs.Add(lField.FieldName, ftString, pSize, False);
//  pQr.FQR.Fields.Add(lField);
End;

Procedure TConexion.CreateFieldFloat(pQr : TDATADB; Const pFieldName : String);
Var
  lField : TFloatField;
Begin
  If pQr.FQR.FindField(pFieldName) = Nil Then
  Begin
    lField := TFloatField.Create(pQr.FQR);
    lField.FieldName := pFieldName;
    lField.DataSet := pQr.FQR;
    lField.Lookup := True;
    lField.FieldKind := fkData;
    pQr.FQR.FieldDefs.Add(lField.FieldName, ftFloat, 0, False);
    pQr.FQR.Fields.Add(lField);
  End;
End;

Procedure TConexion.CreateFieldString(pQr : TDATADB; Const pFieldName : String; Const pSize : Integer);
Var
  lField : TStringField;
Begin
  If pQr.FQR.FindField(pFieldName) = Nil Then
  Begin
    lField := TStringField.Create(pQr.FQR);
    lField.FieldName := pFieldName;
    lField.DataSet := pQr.FQR;
    lField.Lookup := True;
    lField.FieldKind := fkData;
    pQr.FQR.FieldDefs.Add(lField.FieldName, ftString, pSize, False);
    pQr.FQR.Fields.Add(lField);
  End;
End;

Procedure TConexion.CreateFieldInteger(pQr : TDATADB; Const pFieldName : String);
Var
  lField : TIntegerField;
Begin
  If pQr.FQR.FindField(pFieldName) = Nil Then
  Begin
    lField := TIntegerField.Create(pQr.FQR);
    lField.FieldName := pFieldName;
    lField.DataSet := pQr.FQR;
    lField.Lookup := True;
    lField.FieldKind := fkData;
    pQr.FQR.FieldDefs.Add(lField.FieldName, ftInteger, 0, False);
    pQr.FQR.Fields.Add(lField);
  End;
End;

Procedure TConexion.SetFields(pQr : TQuery; Const pTable : String);
Var
  lI : Integer;
  lSQL : TQUERY;
  lFieldStr : TStringField;
  lFieldInt : TIntegerField;
  lFieldDbl : TFloatField;
  lFieldMem : TMemoField;
Begin
  Try
    lSQL := TQUERY.Create(Nil);
    lSQL.SQL.Add(' SELECT * FROM ' + pTable + ' ');
    lSQL.Active := True;
    If lSQL.Active Then
    Begin
      For lI := 0 To lSQL.Fields.Count-1 Do
      Begin
        Case lSQL.Fields[lI].DataType Of
          ftString     ,
          ftWideString : Begin
                           lFieldStr := TStringField.Create(pQr);
                           lFieldStr.FieldName := lSQL.Fields[lI].FullName;
                           lFieldStr.FieldKind := lSQL.Fields[lI].FieldKind;
                           lFieldStr.Size      := lSQL.Fields[lI].Size     ;
                           lFieldStr.DataSet   := pQr;
                         End;
          ftInteger     ,
          ftSmallint   : Begin
                           lFieldInt := TIntegerField.Create(pQr);
                           lFieldInt.FieldName := lSQL.Fields[lI].FullName;
                           lFieldInt.FieldKind := lSQL.Fields[lI].FieldKind;
                           lFieldInt.DataSet   := pQr;
                         End;
          ftFloat      : Begin
                           lFieldDbl := TFloatField.Create(pQr);
                           lFieldDbl.FieldName := lSQL.Fields[lI].FullName;
                           lFieldDbl.FieldKind := lSQL.Fields[lI].FieldKind;
                           lFieldDbl.DataSet   := pQr;
                         End;
          ftMemo       : Begin
                           lFieldMem := TMemoField.Create(pQr);
                           lFieldMem.FieldName := lSQL.Fields[lI].FullName;
                           lFieldMem.FieldKind := lSQL.Fields[lI].FieldKind;
                           lFieldMem.DataSet   := pQr;
                         End;
        End;
      End;
    End;
    lSQL.Active := False;
    FreeAndNil(lSQL);
  Except
    On E: Exception Do
    Begin
      UtLog_Execute('TObjForm.SetFields, ' + E.Message);
    End;
  End;
End;

Procedure TConexion.SetCalculate(pQr : TQuery; Const pName : String; pSize : Integer; pDataType : TFieldType);
Var
  lFieldStr : TStringField;
  lFieldInt : TIntegerField;
  lFieldDbl : TFloatField;
  lFieldMem : TMemoField;
Begin
  Try
        Case pDataType Of
          ftString     ,
          ftWideString : Begin
                           lFieldStr := TStringField.Create(pQr);
                           lFieldStr.FieldName  := pName;
                           lFieldStr.FieldKind  := TFieldKind.fkCalculated;
                           lFieldStr.Size       := pSize;
                           lFieldStr.Calculated := True;
                           lFieldStr.DataSet    := pQr;
                         End;
          ftInteger     ,
          ftSmallint   : Begin
                           lFieldInt := TIntegerField.Create(pQr);
                           lFieldInt.FieldName  := pName;
                           lFieldInt.FieldKind  := TFieldKind.fkCalculated;
                           lFieldInt.Calculated := True;
                           lFieldInt.DataSet    := pQr;
                         End;
          ftFloat      : Begin
                           lFieldDbl := TFloatField.Create(pQr);
                           lFieldDbl.FieldName  := pName;
                           lFieldDbl.FieldKind  := TFieldKind.fkCalculated;
                           lFieldDbl.Calculated := True;
                           lFieldDbl.DataSet    := pQr;
                         End;
          ftMemo       : Begin
                           lFieldMem := TMemoField.Create(pQr);
                           lFieldMem.FieldName  := pName;
                           lFieldMem.FieldKind  := TFieldKind.fkCalculated;
                           lFieldMem.Calculated := True;
                           lFieldMem.DataSet    := pQr;
                         End;
        End;
  Except
    On E: Exception Do
    Begin
      UtLog_Execute('TObjForm.SetCalculate, ' + E.Message);
    End;
  End;
End;

procedure TConexion.SetConnection(pValue: TTIPO_CONEXION);
begin
  FTYPE_CNX := pValue;
end;

Procedure TConexion.SetServer  (Const pValue : String);
Begin
  FServer := pValue;
End;

Procedure TConexion.SetDatabase(Const pValue : String);
Begin
  FDatabase := pValue;
End;

Procedure TConexion.SetUser    (Const pValue : String);
Begin
  FUser := pValue;
End;

Procedure TConexion.SetPassword(Const pValue : String);
Begin
  FPassword := pValue;
End;

Procedure TConexion.SetMask(pField : TField; pMask : String);
Var
  lI : Integer;
  lName : String;
Begin
  If (Not Assigned(pField))  Then
    Exit;
   TFloatField  (pField).DisplayFormat := pMask;
   TNumericField(pField).DisplayFormat := pMask;
//   TFloatField  (pField).EditMask      := pMask;
//   TNumericField(pField).EditMask      := pMask;
//   TFloatField  (pField).EditFormat    := pMask;
//   TNumericField(pField).EditFormat    := pMask;
End;

function TConexion.TableExists(const pTableName: String): Boolean;
begin
  Self.GetTableNames(FTablas);
  Result := Assigned(FTablas) And (FTablas.IndexOf(pTableName) > -1);
end;

function TConexion.Record_Exists(Const pTableName: String): Boolean;
Var
  lSQL : TQuery;
Begin
  Result := False;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Active := False;
    Configurar_Conexion_Segura(lSQL);
    lSQL.SQL.Add(' SELECT COUNT(*) AS RESULTADO FROM ' + pTableName + ' ');
    UtLog_Execute('TConexion.Max_Value, ' + lSQL.SQL.Text);
    lSQL.Active := True;
    if lSQL.Active then
      Result := lSQL.FieldByName('RESULTADO').AsInteger > 0;
    lSQL.Active := False;
    FreeAndNil(lSQL);
  Except
    On E : Exception Do
      UtLog_Execute('TConexion.Record_Exists, ' + E.Message);
  End;
End;

Function TConexion.Connect(const pActive : Boolean; Const pCS : String = ''): Boolean;
Var
  lCS : String;
begin
  lCS := 'Provider=SQLOLEDB.1;' +
         'Password=' + FPassword + ';' +
         'Persist Security Info=True;' +
         'User ID=' + FUser + ';' +
         'Initial Catalog=' + FDatabase + ';' +
         'Data Source=' + FServer;
  If Trim(pCS) <> '' Then
    lCS := pCS;
  Self.Connected := False;
  If pActive Then
    Result := Iniciar_Conexion(lCS)
  Else
    Self.Connected := False;
End;

Function TConexion.Start_MSSQL(Const pActive : Boolean): Boolean;
begin
  Result := False;
  If pActive Then
  Begin
    Try
      Self.Connected := False;
      Self.ConnectionString := 'Provider=SQLOLEDB.1;' +
                           'Password=' + FPassword + ';' +
                           'Persist Security Info=True;' +
                           'User ID=' + FUser + ';' +
                           'Initial Catalog=' + FDatabase + ';' +
                           'Data Source=' + FServer;
      Self.Connected := True;
      Result := Self.Connected;
    Except
      On E : Exception Do
        UtLog_Execute('TConexion.Start_MSSQL, ' + E.Message);
    End;
  End
  Else
  Begin
    Self.Connected := False;
    Result := Not Self.Connected;
  End;
End;

Function TConexion.Is_Number(pDataType : TFieldType) : Boolean;
Begin
  Result := pDataType In [ftWord,
                          ftFloat,
                          ftInteger,
                          ftShortint,
                          ftLargeint,
                          ftCurrency,
                          ftSmallint];
End;

Function TConexion.Max_Value(Const pTablename: String; Const pFields, pValues: TArray_String; Const pResult, pSource: String) : String;
Var
  lI : Integer;
  lSQL : TQuery;
  lCadena : String;
Begin
  Result := '';
  lCadena := '';
  If High(pFields) <> High(pValues) Then
    Exit;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Active := False;
    Configurar_Conexion_Segura(lSQL);
    lSQL.SQL.Add(' SELECT MAX( ' + pResult +  ') AS RESULTADO FROM ' + pTableName + ' ');
    For lI := 0 To High(pFields) Do
      If lI = 0 Then
        lCadena := Evaluation(pFields[lI], pValues[lI])
      Else
        lCadena := lCadena + ' AND ' + Evaluation(pFields[lI], pValues[lI]);
    If Trim(lCadena) <> '' Then
      lSQL.SQL.Add(' WHERE ' + lCadena);
    UtLog_Execute('TConexion.Max_Value, ' + pSource + ', ' + lSQL.SQL.Text);
    lSQL.Active := True;
    if lSQL.Active then
      Result := lSQL.FieldByName('RESULTADO').AsString;
    lSQL.Active := False;
    FreeAndNil(lSQL);
  Except
    On E : Exception Do
      UtLog_Execute('TConexion.Max_Value, ' + pSource + ', ' + E.Message);
  End;
End;

Function TConexion.Next(Const pTablename : String; Const pPrefix : Char; Const pPK, pField, pValue : TArray_String; Const pMaxWidth : Integer) : String;
Var
  lI : Integer;
Begin
  Result := Justificar('', pPrefix, pMaxWidth);
  Try
    FSQL.Active := False;
    FSQL.SQL.Clear;
    FSQL.SQL.Add(' SELECT ');
    For lI := Low(pPK) To High(pPK) Do
      FSQL.SQL.Add(' MAX( ' + pPK[lI] + ' ) AS RESULTADO ');
    FSQL.SQL.Add(' FROM ' + pTablename + ' ' + No_Lock + ' ');
    If High(pField) > -1 Then
    Begin
      For lI := Low(pField) To High(pField) Do
        FSQL.SQL.Add(IfThen(lI = Low(pField), ' WHERE ', ' AND ') + Trim_Sentence(pField[lI]) + ' = ' + QuotedStr(Trim(pValue[lI])));
    End;
    FSQL.Active := True;
    If FSQL.Active And (FSQL.RecordCount > 0) And (Not Vacio(FSQL.FieldByName('RESULTADO').AsString)) Then
      Result := FSQL.FieldByName('RESULTADO').AsString;
    FSQL.Active := False;
    FSQL.SQL.Clear;
  Except
    On E: Exception Do
      UtLog_Execute('TConexion.Next, ' + E.Message);
  End;
  Next_Value(Result);
End;

Function TConexion.Get_ValueString(Const pTablename: String; Const pFields, pValues, pResult : TArray_String; Const pSource: String) : String;
Var
  lI : Integer;
  lSQL : TQuery;
  lCadena : String;
Begin
  Result := '';
  lCadena := '';
  If High(pFields) <> High(pValues) Then
    Exit;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Active := False;
    Configurar_Conexion_Segura(lSQL);
    lSQL.SQL.Add(' SELECT * FROM ' + pTableName + ' ');
    For lI := Low(pFields) To High(pFields) Do
      If lI = 0 Then
        lCadena := Evaluation(pFields[lI], pValues[lI])
      Else
        lCadena := lCadena + ' AND ' + Evaluation(pFields[lI], pValues[lI]);
    If Trim(lCadena) <> '' Then
      lSQL.SQL.Add(' WHERE ' + lCadena);
    UtLog_Execute('TConexion.Get_ValueString, ' + pSource + ', ' + lSQL.SQL.Text);
    lSQL.Active := True;
    if lSQL.Active And (lSQL.RecordCount > 0) then
        For lI := Low(pResult) To High(pResult) Do
           Result := Result + lSQL.FieldByName(pResult[lI]).AsString;
    lSQL.Active := False;
    FreeAndNil(lSQL);
  Except
    On E : Exception Do
      UtLog_Execute('TConexion.Get_ValueString, ' + pSource + ', ' + E.Message);
  End;
End;

Function TConexion.Get_ValueDouble(Const pTablename: String; Const pFields, pValues, pResult : TArray_String; Const pSource: String) : Double;
Var
  lI : Integer;
  lSQL : TQuery;
  lCadena : String;
Begin
  Result := 0;
  lCadena := '';
  If High(pFields) <> High(pValues) Then
    Exit;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Active := False;
    Configurar_Conexion_Segura(lSQL);
    lSQL.SQL.Add(' SELECT * FROM ' + pTableName + ' ');
    For lI := Low(pFields) To High(pFields) Do
      If lI = 0 Then
        lCadena := Evaluation(pFields[lI], pValues[lI])
      Else
        lCadena := lCadena + ' AND ' + Evaluation(pFields[lI], pValues[lI]);
    If Trim(lCadena) <> '' Then
      lSQL.SQL.Add(' WHERE ' + lCadena);
    UtLog_Execute('TConexion.Get_ValueDouble, ' + pSource + ', ' + lSQL.SQL.Text);
    lSQL.Active := True;
    if lSQL.Active And (lSQL.RecordCount > 0) then
        For lI := Low(pResult) To High(pResult) Do
           Result := Result + lSQL.FieldByName(pResult[lI]).AsFloat;
    lSQL.Active := False;
    FreeAndNil(lSQL);
  Except
    On E : Exception Do
      UtLog_Execute('TConexion.Get_ValueDouble, ' + pSource + ', ' + E.Message);
  End;
End;

Function TConexion.Exec_SQL(Const pSQL, pSource: String) : Boolean;
Var
  lSQL : TQuery;
Begin
  Result := False;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Active := False;
    Configurar_Conexion_Segura(lSQL);
    lSQL.SQL.Add(pSQL);
    lSQL.ExecSQL;
    Result := True;
    lSQL.Active := False;
    FreeAndNil(lSQL);
  Except
    On E : Exception Do
      UtLog_Execute('TConexion.Exec_SQL, ' + pSource + ', ' + E.Message);
  End;
End;

Function TConexion.Evaluation(Const pField, pValue : String) : String;
Begin
  Result := Trim_Sentence(pField) + ' = ' + QuotedStr(Trim((pValue)));
  If Trim(pValue) = ''  Then
    Result := Result  + ' OR ' + pField  + ' IS NULL '  ;
  Result :=  '(' + Result + ')';
End;

function TConexion.Data_Exists(const pTablename: String; const pFields, pValues: TArray_String; Const pSource : String): Boolean;
Var
  lI : Integer;
  lSQL : TQuery;
  lCadena : String;
Begin
  lCadena := '';
  Result := False;
  If High(pFields) <> High(pValues) Then
    Exit;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Active := False;
    Configurar_Conexion_Segura(lSQL);
    lSQL.SQL.Add(' SELECT * FROM ' + pTableName + ' ');
    For lI := 0 To High(pFields) Do
      If lI = 0 Then
        lCadena := Evaluation(pFields[lI], pValues[lI])
      Else
        lCadena := lCadena + ' AND ' + Evaluation(pFields[lI], pValues[lI]);

    If Trim(lCadena) <> '' Then
      lSQL.SQL.Add(' WHERE ' + lCadena);
    UtLog_Execute('TConexion.Data_Exists, ' + pSource + ', ' + lSQL.SQL.Text);
    lSQL.Active := True;
    if lSQL.Active then
      Result := lSQL.RecordCount > 0;
    lSQL.Active := False;
    FreeAndNil(lSQL);
  Except
    On E : Exception Do
      UtLog_Execute('TConexion.Data_Exists, ' + pSource + ', ' + E.Message);
  End;
End;

Function TConexion.No_Lock : String;
Begin
  Result := ' ';
  If FTYPE_CNX = Conn_SQLSERVER Then
    Result := ' (NOLOCK) ';
End;

destructor TConexion.Destroy;
begin
  If Assigned(FAUX) Then
  Begin
    FAUX.Active := False;
    FreeAndNil(FAUX);
  End;

  If Assigned(FSQL) Then
  Begin
    FSQL.Active := False;
    FreeAndNil(FSQL);
  End;

  If Assigned(FTablas) Then
  Begin
    FTablas.Clear;
    FreeAndNil(FTablas);
  End;
  inherited;
end;

{ TDATADB }

constructor TDATADB.Create;
begin
  FQR := TQUERY.Create(Nil);
  FDS := TDataSource.Create(Nil);
  FDS.DataSet := FQR;
end;

destructor TDATADB.Destroy;
begin
  If Assigned(FQR) Then
  Begin
    FQR.Active := False;
    FreeAndNil(FQR);
  End;
  If Assigned(FDS) Then
    FreeAndNil(FDS);
end;

Initialization
  gConexion := TConexion.Create(Nil);

Finalization
  gConexion.Connect(False);
  FreeAndNil(gConexion);


end.
