unit Process.CRUD_Clientes;

interface
Uses
  Data.DB,
  Utils.Conexion,
  System.Classes;

Type
  TCRUD_Clientes = Class
    Private
      FENC : TDATADB;
      FDET : TDATADB;
      FPROCESANDO : Boolean;
      Function Abrir_Enc : Boolean;
      Function Abrir_Det : Boolean;
      Procedure DataChange_Enc(Sender: TObject; Field: TField);
      Procedure StateChange_Enc(Sender: TObject);
      procedure CalcFields_Enc(DataSet: TDataSet);
      procedure CalcFields_Det(DataSet: TDataSet);
      procedure NewRecord_Enc(DataSet: TDataSet);
      procedure NewRecord_Det(DataSet: TDataSet);
    Public
      EVENTO_DATACHANGE : TNotifyEvent;
      Property ENC : TDATADB Read FENC Write FENC;
      Property DET : TDATADB Read FDET Write FDET;
      Constructor Create;
      Destructor Destroy;
  End;


implementation
Uses
  Dialogs,
  Variants,
  Utils.Log,
  Form_Maestro,
  TBLNM0000.Info,
  System.SysUtils,
  Utils.Functions,
  Utils.Homologacion;

{ TCRUD_Clientes }
Constructor TCRUD_Clientes.Create;
Begin
  FPROCESANDO := False;
  Try
    FENC := TDATADB.Create;
    FDET := TDATADB.Create;

    FENC.DS.AutoEdit := False;
    FDET.DS.AutoEdit := False;

    FENC.DS.OnDataChange := DataChange_Enc;
    FENC.QR.OnCalcFields := CalcFields_Enc;
    FENC.QR.OnNewRecord  := NewRecord_Enc ;

    FDET.QR.OnCalcFields := CalcFields_Det;
    FDET.QR.OnNewRecord  := NewRecord_Det ;

    Abrir_Enc;
    Abrir_Det;
  Except
    On E : Exception Do
     UtLog_Execute('TCRUD_Clientes.Create, ' + E.Message);
  End;
End;

Procedure TCRUD_Clientes.DataChange_Enc(Sender: TObject; Field: TField);
Begin
  If FPROCESANDO Then
    Exit;
  FPROCESANDO := True;
  Try
    If Assigned(EVENTO_DATACHANGE) Then
      EVENTO_DATACHANGE(Sender);
    If FENC.QR.Active And (FENC.QR.RecordCount > 0) Then
      Abrir_Det;
  Except
    On E : Exception Do
     UtLog_Execute('TCRUD_Clientes.DataChange_Enc, ' + E.Message);
  End;
  FPROCESANDO := False;
End;

Procedure TCRUD_Clientes.StateChange_Enc(Sender: TObject);
Begin

End;

procedure TCRUD_Clientes.CalcFields_Enc(DataSet: TDataSet);
Begin
  Try
    FENC.QR.FieldByName('NOMBRE_CLIENTE').AsString := gConexion.Get_ValueString(Retornar_Info_Tabla(Id_Tabla_Cliente).Name, ['CODIGO_CLIENTE'], [FENC.QR.FieldByName('CODIGO_CLIENTE').AsString], ['NOMBRE'], 'TCRUD_Clientes.DataChange_Enc');
  Except
    On E : Exception Do
     UtLog_Execute('TCRUD_Clientes.CalcFields_Enc, ' + E.Message);
  End;
End;

procedure TCRUD_Clientes.CalcFields_Det(DataSet: TDataSet);
Begin
  Try
    FDET.QR.FieldByName('NOMBRE_PRODUCTO').AsString := gConexion.Get_ValueString(Retornar_Info_Tabla(Id_Tabla_Producto).Name, ['CODIGO_PRODUCTO'], [FDET.QR.FieldByName('CODIGO_PRODUCTO').AsString], ['NOMBRE'], 'TCRUD_Clientes.CalcFields_Det');
    FDET.QR.FieldByName('VALOR_PRODUCTO').AsFloat := gConexion.Get_ValueDouble(Retornar_Info_Tabla(Id_Tabla_Producto).Name, ['CODIGO_PRODUCTO'], [FDET.QR.FieldByName('CODIGO_PRODUCTO').AsString], ['VALOR'], 'TCRUD_Clientes.CalcFields_Det');
  Except
    On E : Exception Do
     UtLog_Execute('TCRUD_Clientes.CalcFields_Det, ' + E.Message);
  End;
End;

Procedure TCRUD_Clientes.NewRecord_Enc(DataSet: TDataSet);
Begin
  Try
    FENC.QR.FieldByName('NUMERO_DOCUMENTO').AsString := gConexion.Next(Retornar_Info_Tabla(Id_Tabla_Factura_Enc).Name, '0', ['NUMERO_DOCUMENTO'], [], [], FENC.QR.FieldByName('NUMERO_DOCUMENTO').Size);
    FENC.QR.FieldByName('FECHA_DOCUMENTO' ).AsString := FormatDateTime('YYYY-MM-DD', Now);
  Except
    On E : Exception Do
     UtLog_Execute('TCRUD_Clientes.NewRecord_Enc, ' + E.Message);
  End;
End;

Procedure TCRUD_Clientes.NewRecord_Det(DataSet: TDataSet);
Var
  lReturn : String;
Begin
  Try
    FDET.QR.FieldByName('NUMERO_DOCUMENTO').AsString := FENC.QR.FieldByName('NUMERO_DOCUMENTO').AsString;
    If Form_Maestro_Show(Id_Tabla_Producto, lReturn) Then
    Begin
      If Not gConexion.Data_Exists(Retornar_Info_Tabla(Id_Tabla_Factura_Det).Name, ['NUMERO_DOCUMENTO', 'CODIGO_PRODUCTO'], [FENC.QR.FieldByName('NUMERO_DOCUMENTO').AsString, lReturn], 'TCRUD_Clientes.NewRecord_Det') Then
      Begin
        FDET.QR.FieldByName('CODIGO_PRODUCTO').AsString := lReturn;
        lReturn := '0';
        If InputQuery('Cantidad', 'Cantidad', lReturn) Then
        Begin
          FDET.QR.FieldByName('CANTIDAD').AsFloat := SetToFloat(lReturn);
          FDET.QR.FieldByName('VALOR').AsFloat := FDET.QR.FieldByName('VALOR_PRODUCTO').AsFloat * FDET.QR.FieldByName('CANTIDAD').AsFloat;
        End
        Else
        Begin
          FDET.QR.Cancel;
        End;
      End
      Else
      Begin
        FDET.QR.Cancel;
        FDET.QR.Locate('NUMERO_DOCUMENTO;CODIGO_PRODUCTO', VarArrayOf([FENC.QR.FieldByName('NUMERO_DOCUMENTO').AsString, lReturn]), [loCaseInsensitive]);
      End;
    End
    Else
    Begin
      FDET.QR.Cancel;
    End;
  Except
    On E : Exception Do
     UtLog_Execute('TCRUD_Clientes.NewRecord_Det, ' + E.Message);
  End;
End;


Function TCRUD_Clientes.Abrir_Enc : Boolean;
Begin
  Result := False;
  Try
    FENC.QR.Active := False;
    FENC.QR.Fields.Clear;
    FENC.QR.SQL.Clear;
    FENC.QR.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Tabla_Factura_Enc).Name + gConexion.No_Lock);
    FENC.QR.SQL.Add(' ORDER BY NUMERO_DOCUMENTO ');
    gConexion.SetFields(FENC.QR, Retornar_Info_Tabla(Id_Tabla_Factura_Enc).Name);
    gConexion.SetCalculate(FENC.QR, 'NOMBRE_CLIENTE', 100, ftString);
    FENC.QR.Active := True;
    Result := FENC.QR.Active;
    If Result Then
    Begin
      gConexion.SetMask(FENC.QR.FieldByName('VALOR'), '###,###,###,##0.#0');
      FENC.QR.FieldByName('VALOR').ReadOnly := True;
    End;
  Except
    On E : Exception Do
     UtLog_Execute('TCRUD_Clientes.Abrir_Enc, ' + E.Message);
  End;
End;

Function TCRUD_Clientes.Abrir_Det : Boolean;
Begin
  Result := False;
  Try
    FDET.QR.Active := False;
    FDET.QR.Fields.Clear;
    FDET.QR.SQL.Clear;
    FDET.QR.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Tabla_Factura_Det).Name + gConexion.No_Lock);
    FDET.QR.SQL.Add(' WHERE ' + Trim_Sentence('NUMERO_DOCUMENTO') + ' = ' + QuotedStr(Trim(FENC.QR.FieldByName('NUMERO_DOCUMENTO').AsString)));
    FDET.QR.SQL.Add(' ORDER BY CODIGO_PRODUCTO ');
    gConexion.SetFields(FDET.QR, Retornar_Info_Tabla(Id_Tabla_Factura_Det).Name);
    gConexion.SetCalculate(FDET.QR, 'NOMBRE_PRODUCTO', 100, ftString);
    gConexion.SetCalculate(FDET.QR, 'VALOR_PRODUCTO' , 000, ftFloat );
    FDET.QR.Active := True;
    Result := FDET.QR.Active;
    If Result Then
    Begin
      gConexion.SetMask(FDET.QR.FieldByName('VALOR'         ), '###,###,###,##0.#0');
      gConexion.SetMask(FDET.QR.FieldByName('CANTIDAD'      ), '###,###,###,##0.#0');
      gConexion.SetMask(FDET.QR.FieldByName('VALOR_PRODUCTO'), '###,###,###,##0.#0');
    End;
  Except
    On E : Exception Do
     UtLog_Execute('TCRUD_Clientes.Abrir_Det, ' + E.Message);
  End;
End;

Destructor TCRUD_Clientes.Destroy;
Begin
  Try
    If Assigned(FDET) Then
      FreeAndNil(FDET);

    If Assigned(FENC) Then
      FreeAndNil(FENC);
  Except
    On E : Exception Do
     UtLog_Execute('TCRUD_Clientes.Destroy, ' + E.Message);
  End;
End;

end.
