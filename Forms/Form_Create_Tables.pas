unit Form_Create_Tables;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, CheckLst, ComCtrls, Buttons;

type
  TFrForm_Create_Tables = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    pfArchivos: TCheckListBox;
    Progreso: TProgressBar;
    BtnCrear: TSpeedButton;
    BtnSalir: TSpeedButton;
    lbInformacion: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnSalirClick(Sender: TObject);
    procedure BtnCrearClick(Sender: TObject);
  Protected
  private
    { Private declarations }
    lCorrecto : Boolean;
    Procedure Crear_Tablas;
  public
    { Public declarations }
  end;

Function Create_Tables : Boolean;

implementation
{$R *.dfm}

Uses
  Utils.Log,
  TBLNM0000.Info,
  Utils.Conexion,
  Utils.Functions,
  TBLNM1002.Cliente,
  TBLNM1003.Producto,
  TBLNM1004.Factura_Enc,
  TBLNM1005.Factura_Det;

procedure TFrForm_Create_Tables.BtnCrearClick(Sender: TObject);
begin
  Crear_Tablas;
end;

procedure TFrForm_Create_Tables.BtnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFrForm_Create_Tables.FormCreate(Sender: TObject);
Var
  lI : Integer;
  lStr : String;
begin
  lCorrecto := False;
  lbInformacion.Caption := '';
  Self.FormStyle := fsNormal;
  Self.WindowState := wsNormal;
  Self.BorderStyle := bsDialog;
  Retornar_Caption_Tablas(pfArchivos.Items);
  For lI := 0 To pfArchivos.Items.Count-1 Do
  Begin
    lStr := TInfo_Tabla(pfArchivos.Items.Objects[lI]).Name;
    pfArchivos.ItemEnabled[lI] := Not gConexion.TableExists(lStr);
    If pfArchivos.ItemEnabled[lI] Then
      pfArchivos.Checked[lI] := True;
  End;
end;

Procedure TFrForm_Create_Tables.Crear_Tablas;
Var
  lI : Integer;
  lOk : Boolean;
Begin
  lOk := True;
  Progreso.Min := 0;
  Progreso.Max := pfArchivos.Items.Count;
  Try
    For lI := 0 To pfArchivos.Items.Count-1 Do
    Begin
      If lOk Then
      Begin
        Progreso.StepIt;
        lbInformacion.Caption := 'Procesando ' + Trim(pfArchivos.Items[lI]) + '...';
        If pfArchivos.Checked[lI] Then
        Begin
          Case TInfo_Tabla(pfArchivos.Items.Objects[lI]).Id Of
            Id_Tabla_Cliente         : Create_Tabla_Cliente    (gConexion.AUX);
            Id_Tabla_Producto        : Create_Tabla_Producto   (gConexion.AUX);
            Id_Tabla_Factura_Enc     : Create_Tabla_Factura_Enc(gConexion.AUX);
            Id_Tabla_Factura_Det     : Create_Tabla_Factura_Det(gConexion.AUX);
          End;
        End;
      End;
    End;
  Except
    On E : Exception Do
    Begin
      UtLog_Execute('Crear_Tablas ', 'TFrForm_Create_Tables.Crear_Tablas, ' + E.Message);
    End;
  End;
  If lOk Then
    lbInformacion.Caption := '';
  lCorrecto := lOk;
  If lCorrecto Then
    ShowMessage('Proceso Terminado')
  Else
    ShowMessage('Existe problemas al crear los archivos');
  Close;
End;

Function Create_Tables : Boolean;
Var
  FrForm_Create_Tables: TFrForm_Create_Tables;
Begin
  FrForm_Create_Tables := TFrForm_Create_Tables.Create(Nil);
  FrForm_Create_Tables.ShowModal;
  Result := FrForm_Create_Tables.lCorrecto;
  FrForm_Create_Tables.Free;
End;

end.
