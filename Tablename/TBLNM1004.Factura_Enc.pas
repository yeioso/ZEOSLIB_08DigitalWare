unit TBLNM1004.Factura_Enc;

interface
Uses
  Utils.Conexion;

Function Create_Tabla_Factura_Enc(pSQl : TQuery) : Boolean;

implementation

Uses
  Utils.Log,
  TBLNM0000.Info,
  System.SysUtils,
  Utils.Homologacion;

Function Create_Tabla_Factura_Enc(pSQl : TQuery) : Boolean;
Begin
  Result := True;
  If Not gConexion.TableExists(Retornar_Info_Tabla(Id_Tabla_Factura_Enc).Name) Then
  Begin
    Try
      pSQl.SQL.Clear;
      pSQl.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Tabla_Factura_Enc).Name + ' ' );
      pSQl.SQL.Add('   (  '                                                                  );
      pSQl.SQL.Add('      NUMERO_DOCUMENTO ' + FnReturn_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      pSQl.SQL.Add('      FECHA_DOCUMENTO '  + FnReturn_Type(TYPE_VARCHAR) + ' (010) ' + ', ');
      pSQl.SQL.Add('      CODIGO_CLIENTE '   + FnReturn_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      pSQl.SQL.Add('      VALOR '            + FnReturn_Type(TYPE_FLOAT  ) + ' '       + ', ');
      pSQl.SQL.Add('      TAG_INFO '         + FnReturn_Type(TYPE_INT    ) + ' '       + ', ');
      pSQl.SQL.Add('      PRIMARY KEY (NUMERO_DOCUMENTO) '                             + ', ');
      pSQl.SQL.Add(' ' + FOREINGKEY(Retornar_Info_Tabla(Id_Tabla_Factura_Enc).Fk[01], 'CODIGO_CLIENTE', Retornar_Info_Tabla(Id_Tabla_Cliente).Name, 'CODIGO_CLIENTE') + ' ');
      pSQl.SQL.Add('   ) ');
      pSQl.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        UtLog_Execute(' Tabla ' + Retornar_Info_Tabla(Id_Tabla_Factura_Enc).Name + ', Create_Tabla_Factura_Enc, ' + E.Message);
      End;
    End;
  End;
End;

end.
