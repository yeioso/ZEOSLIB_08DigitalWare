unit TBLNM0001.Create;

interface

Uses
  Utils.Conexion;

Procedure TBLNM0001_Create_Execute(pCnx : TConexion);

implementation

Uses
  TBLNM0000.Info,
  TBLNM1002.Cliente,
  TBLNM1003.Producto,
  TBLNM1004.Factura_Enc,
  TBLNM1005.Factura_Det;

Procedure TBLNM0001_Create_Execute(pCnx : TConexion);
Begin
  If Create_Tabla_Cliente    (pCnx.AUX) Then
  If Create_Tabla_Producto   (pCnx.AUX) Then
  If Create_Tabla_Factura_Enc(pCnx.AUX) Then
  If Create_Tabla_Factura_Det(pCnx.AUX) Then
  Begin
  End;
End;

end.
