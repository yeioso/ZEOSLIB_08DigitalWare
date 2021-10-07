unit TBLNM1003.Producto;

interface
Uses
  Utils.Conexion;

Function Create_Tabla_Producto(pSQl : TQuery) : Boolean;

implementation

Uses
  Utils.Log,
  TBLNM0000.Info,
  System.SysUtils,
  Utils.Homologacion;

Function Create_Tabla_Producto(pSQl : TQuery) : Boolean;
Begin
  Result := True;
  If Not gConexion.TableExists(Retornar_Info_Tabla(Id_Tabla_Producto).Name) Then
  Begin
    Try
      pSQl.SQL.Clear;
      pSQl.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Tabla_Producto).Name + ' '   );
      pSQl.SQL.Add('   (  '                                                                 );
      pSQl.SQL.Add('      CODIGO_PRODUCTO ' + FnReturn_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      pSQl.SQL.Add('      NOMBRE '          + FnReturn_Type(TYPE_VARCHAR) + ' (100) ' + ', ');
      pSQl.SQL.Add('      VALOR '           + FnReturn_Type(TYPE_FLOAT  ) + ' '       + ', ');
      pSQl.SQL.Add('      TAG_INFO '        + FnReturn_Type(TYPE_INT    ) + ' '       + ', ');
      pSQl.SQL.Add('      PRIMARY KEY (CODIGO_PRODUCTO) '                             + '  ');
      pSQl.SQL.Add('   ) ');
      pSQl.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        UtLog_Execute(' Tabla ' + Retornar_Info_Tabla(Id_Tabla_Producto).Name + ', Create_Tabla_Producto, ' + E.Message);
      End;
    End;
  End;
End;

end.
