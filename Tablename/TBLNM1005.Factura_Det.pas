unit TBLNM1005.Factura_Det;

interface
Uses
  Utils.Conexion;

Function Create_Tabla_Factura_Det(pSQl : TQuery) : Boolean;

implementation

Uses
  Utils.Log,
  TBLNM0000.Info,
  System.SysUtils,
  Utils.Homologacion;

Function Create_Tabla_Factura_Det(pSQl : TQuery) : Boolean;
Begin
  Result := True;
  If Not gConexion.TableExists(Retornar_Info_Tabla(Id_Tabla_Factura_Det).Name) Then
  Begin
    Try
      pSQl.SQL.Clear;
      pSQl.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Tabla_Factura_Det).Name + ' ' );
      pSQl.SQL.Add('   (  '                                                                  );
      pSQl.SQL.Add('      NUMERO_DOCUMENTO ' + FnReturn_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      pSQl.SQL.Add('      CODIGO_PRODUCTO '  + FnReturn_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      pSQl.SQL.Add('      FECHA_DOCUMENTO '  + FnReturn_Type(TYPE_VARCHAR) + ' (010) ' + ', ');
      pSQl.SQL.Add('      CANTIDAD '          + FnReturn_Type(TYPE_FLOAT ) + ' '       + ', ');
      pSQl.SQL.Add('      VALOR '            + FnReturn_Type(TYPE_FLOAT  ) + ' '       + ', ');
      pSQl.SQL.Add('      TAG_INFO '         + FnReturn_Type(TYPE_INT    ) + ' '       + ', ');
      pSQl.SQL.Add('      PRIMARY KEY (NUMERO_DOCUMENTO, CODIGO_PRODUCTO) '            + ', ');
      pSQl.SQL.Add(' ' + FOREINGKEY(Retornar_Info_Tabla(Id_Tabla_Factura_Det).Fk[01], 'NUMERO_DOCUMENTO', Retornar_Info_Tabla(Id_Tabla_Factura_Enc).Name, 'NUMERO_DOCUMENTO') + ', ');
      pSQl.SQL.Add(' ' + FOREINGKEY(Retornar_Info_Tabla(Id_Tabla_Factura_Det).Fk[02], 'CODIGO_PRODUCTO' , Retornar_Info_Tabla(Id_Tabla_Producto   ).Name, 'CODIGO_PRODUCTO' ) + ' ' );
      pSQl.SQL.Add('   ) ');
      pSQl.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        UtLog_Execute(' Tabla ' + Retornar_Info_Tabla(Id_Tabla_Factura_Det).Name + ', Create_Tabla_Factura_Det, ' + E.Message);
      End;
    End;
  End;
End;

end.
