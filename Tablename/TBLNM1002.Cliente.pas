unit TBLNM1002.Cliente;

interface
Uses
  Utils.Conexion;

Function Create_Tabla_Cliente(pSQl : TQuery) : Boolean;

implementation

Uses
  Utils.Log,
  TBLNM0000.Info,
  System.SysUtils,
  Utils.Homologacion;

Function Create_Tabla_Cliente(pSQl : TQuery) : Boolean;
Begin
  Result := True;
  If Not gConexion.TableExists(Retornar_Info_Tabla(Id_Tabla_Cliente).Name) Then
  Begin
    Try
      pSQl.SQL.Clear;
      pSQl.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Tabla_Cliente).Name + ' '   );
      pSQl.SQL.Add('   (  '                                                                );
      pSQl.SQL.Add('      CODIGO_CLIENTE ' + FnReturn_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      pSQl.SQL.Add('      NOMBRE '         + FnReturn_Type(TYPE_VARCHAR) + ' (100) ' + ', ');
      pSQl.SQL.Add('      DIRECCION '      + FnReturn_Type(TYPE_VARCHAR) + ' (100) ' + ', ');
      pSQl.SQL.Add('      TAG_INFO '       + FnReturn_Type(TYPE_INT    ) + ' '       + ', ');
      pSQl.SQL.Add('      PRIMARY KEY (CODIGO_CLIENTE) '                             + '  ');
      pSQl.SQL.Add('   ) ');
      pSQl.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        UtLog_Execute(' Tabla ' + Retornar_Info_Tabla(Id_Tabla_Cliente).Name + ', Create_Tabla_Cliente, ' + E.Message);
      End;
    End;
  End;
End;

end.
