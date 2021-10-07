unit Form_Maestro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Utils.Conexion, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  TFrMaestro = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    lbCode: TLabel;
    lbName: TLabel;
    lbField3: TLabel;
    CODE: TDBEdit;
    NAME: TDBEdit;
    FIELD3: TDBEdit;
    DBGrid1: TDBGrid;
    NAVEGADOR: TDBNavigator;
    BTNOK: TBitBtn;
    BTNCANCEL: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    FID : Integer;
    FSQL : TDATADB;
    Procedure DataChange(Sender: TObject; Field: TField);
    Function Prepare_Interfaz : Boolean;
    procedure BeforePost(DataSet: TDataSet);
  public
    { Public declarations }
  end;

  Function Form_Maestro_Show(Const pId : Integer; Var pReturn : String) : Boolean;

implementation
{$R *.dfm}
Uses
  Utils.Log,
  TBLNM0000.Info,
  Utils.Functions,
  System.StrUtils;

Procedure TFrMaestro.DataChange(Sender: TObject; Field: TField);
Begin
  CODE.Enabled := FSQL.DS.State In [dsInsert];
  NAME.Enabled := FSQL.DS.State In [dsInsert, dsEdit];
  FIELD3.Enabled := FSQL.DS.State In [dsInsert, dsEdit];
End;

procedure TFrMaestro.DBGrid1DblClick(Sender: TObject);
begin
  If Not (FSQL.DS.State In [dsInsert, dsEdit]) And (FSQL.QR.RecordCount > 0) Then
    BTNOK.Click;
end;

procedure TFrMaestro.FormCreate(Sender: TObject);
begin
  FSQL := TDATADB.Create;
  FSQL.QR.BeforePost := BeforePost;
  FSQL.DS.OnDataChange := DataChange;
end;

procedure TFrMaestro.BeforePost(DataSet: TDataSet);
Begin
  If Vacio(FSQL.QR.FieldByName(CODE.DataField).AsString) Then
  Begin
    ShowMessage('Debe ingresar el codigo');
    Abort;
  End;

  If Vacio(FSQL.QR.FieldByName(NAME.DataField).AsString) Then
  Begin
    ShowMessage('Debe ingresar el nombre');
    Abort;
  End;

  If (FID = Id_Tabla_Cliente) And  Vacio(FSQL.QR.FieldByName(FIELD3.DataField).AsString) Then
  Begin
    ShowMessage('Debe ingresar el ' + lbField3.Caption);
    Abort;
  End;

  If (FID = Id_Tabla_Producto) And  (FSQL.QR.FieldByName(FIELD3.DataField).AsFloat < 0) Then
  Begin
    ShowMessage('Debe ingresar el ' + lbField3.Caption);
    Abort;
  End;

  If FSQL.DS.State In [dsInsert] Then
  Begin
    FSQL.QR.FieldByName(CODE.DataField).AsString := Justificar(FSQL.QR.FieldByName(CODE.DataField).AsString, (IfThen(FID = Id_Tabla_Producto, '0', ' '))[1], FSQL.QR.FieldByName(CODE.DataField).Size);
    If gConexion.Data_Exists(Retornar_Info_Tabla(FID).Name, [CODE.DataField], [FSQL.QR.FieldByName(CODE.DataField).AsString], 'TFrMaestro.FormCreate') Then
    Begin
      ShowMessage('ya existe el codigo');
      Abort;
    End;
  End;

  FSQL.QR.FieldByName(NAME.DataField).AsString := AnsiUpperCase(FSQL.QR.FieldByName(NAME.DataField).AsString);

End;

Function TFrMaestro.Prepare_Interfaz : Boolean;
Begin
  Result := False;
  Self.Caption := 'Mastro de datos de ' + Retornar_Info_Tabla(FID).Caption;
  Try
    lbCode.Caption       := 'Código';
    lbName.Caption       := 'Nombre';
    CODE.DataSource      := FSQL.DS;
    NAME.DataSource      := FSQL.DS;
    FIELD3.DataSource    := FSQL.DS;
    DBGrid1.DataSource   := FSQL.DS;
    NAVEGADOR.DataSource := FSQL.DS;
    Case FID Of
      Id_Tabla_Cliente  : Begin
                            CODE.DataField   := 'CODIGO_CLIENTE';
                            NAME.DataField   := 'NOMBRE';
                            FIELD3.DataField := 'DIRECCION';
                            lbField3.Caption := 'Dirección';
                          End;
      Id_Tabla_Producto : Begin
                            CODE.DataField   := 'CODIGO_PRODUCTO';
                            NAME.DataField   := 'NOMBRE';
                            FIELD3.DataField := 'VALOR';
                            lbField3.Caption := 'Valor';
                          End;
    End;
    DBGrid1.Columns[0].Title.Caption := lbCode.Caption  ;
    DBGrid1.Columns[1].Title.Caption := lbName.Caption  ;
    DBGrid1.Columns[2].Title.Caption := lbField3.Caption;

    DBGrid1.Columns[0].FieldName := CODE.DataField  ;
    DBGrid1.Columns[1].FieldName := NAME.DataField  ;
    DBGrid1.Columns[2].FieldName := FIELD3.DataField;

    FSQL.QR.SQL.Add('SELECT * FROM ' + Retornar_Info_Tabla(FID).Name + gConexion.No_Lock);
    FSQL.QR.Active := True;
    Result := FSQL.QR.Active;
    If Result Then
    Begin
      If (FID = Id_Tabla_Producto) Then
        gConexion.SetMask(FSQL.QR.FieldByName('VALOR'), '###,###,###,##0.#0');
    End;
  Except
    On E : Exception Do
     UtLog_Execute('TFrMaestro.Prepare_Interfaz, ' + E.Message);
  End;
End;

procedure TFrMaestro.FormDestroy(Sender: TObject);
begin
  If Assigned(FSQL) Then
    FreeAndNil(FSQL);
end;

Function Form_Maestro_Show(Const pId : Integer; Var pReturn : String) : Boolean;
Var
  FrMaestro : TFrMaestro;
Begin
  pReturn := '';
  FrMaestro := TFrMaestro.Create(Nil);
  FrMaestro.FID := pId;
  Result := FrMaestro.Prepare_Interfaz;
  If Result Then
    Result := FrMaestro.ShowModal = mrOk;
  If Result Then
  Begin
    pReturn := FrMaestro.FSQL.QR.FieldByName(FrMaestro.CODE.DataField).AsString;
  End;
  FreeAndNil(FrMaestro);
End;

end.
