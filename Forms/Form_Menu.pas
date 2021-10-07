unit Form_Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Samples.Spin, Vcl.Samples.Gauges,
  Vcl.ExtCtrls, Process.Salarial_Semanal, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls,
  Process.CRUD_Clientes, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFrMenu = class(TForm)
    PAGINAS: TPageControl;
    PAG_FIBONACCI: TTabSheet;
    PAG_SALARIAL: TTabSheet;
    PAG_CRUD: TTabSheet;
    RESULTADO_FIBONACCI: TMemo;
    lbInfo: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    NUMERO_BASE: TSpinEdit;
    Panel2: TPanel;
    SALARIO: TSpinEdit;
    TOPE: TSpinEdit;
    NOVEDAD: TSpinEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BTNRESTART: TSpeedButton;
    BTNFIBONACCI: TSpeedButton;
    BTNCALCULAR: TSpeedButton;
    RESULTADO_SALARIAL: TListBox;
    BTNNOVEDAD: TSpeedButton;
    Label5: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    NUMERO_DOCUMENTO: TDBEdit;
    FECHA_DOCUMENTO: TDBEdit;
    CODIGO_CLIENTE: TDBEdit;
    VALOR: TDBEdit;
    NAVEGADOR_ENC: TDBNavigator;
    NOMBRE_CLIENTE: TDBEdit;
    BtnCliente: TSpeedButton;
    DBGrid1: TDBGrid;
    NAVEGADOR_DET: TDBNavigator;
    Label10: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BTNFIBONACCIClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BTNCALCULARClick(Sender: TObject);
    procedure BTNRESTARTClick(Sender: TObject);
    procedure BTNNOVEDADClick(Sender: TObject);
    procedure RESULTADO_SALARIALDblClick(Sender: TObject);
    procedure BtnClienteClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    FCRUD_Clientes : TCRUD_Clientes;
    FSalarial_Semanal : TSalarial_Semanal;
    Procedure Load_Info_Salarial;
    Procedure PROGRESO_FIBONACCI(Sender: TObject);
    Procedure EVENTO_DATACHANGE(Sender: TObject);
  public
    { Public declarations }
  end;

var
  FrMenu: TFrMenu;

implementation
{$R *.dfm}
Uses
  Form_Maestro,
  Form_Novedad,
  TBLNM0000.Info,
  Utils.Functions,
  Utils.Fibonacci;

Procedure TFrMenu.PROGRESO_FIBONACCI(Sender: TObject);
Begin
  If Sender Is TFibonacci Then
  Begin
    lbInfo.Caption := (Sender As TFibonacci).ESTADO;
    RESULTADO_FIBONACCI.Lines.Text := (Sender As TFibonacci).RESULTADO;
    Application.ProcessMessages;
  End;
End;

Procedure TFrMenu.EVENTO_DATACHANGE(Sender: TObject);
Begin
  VALOR.Enabled := False;
  BtnCliente.Enabled := FCRUD_Clientes.ENC.DS.State In [dsInsert, dsEdit];
  NOMBRE_CLIENTE.Enabled := False;
  NUMERO_DOCUMENTO.Enabled := False;
  CODIGO_CLIENTE.Enabled := FCRUD_Clientes.ENC.DS.State In [dsInsert, dsEdit];
  FECHA_DOCUMENTO.Enabled := FCRUD_Clientes.ENC.DS.State In [dsInsert, dsEdit];
  NAVEGADOR_DET.Visible := (FCRUD_Clientes.ENC.QR.RecordCount > 0) And (Not (FCRUD_Clientes.ENC.DS.State In [dsInsert, dsEdit]));

End;

procedure TFrMenu.RESULTADO_SALARIALDblClick(Sender: TObject);
Var
  lHoras : Double;
  lNombre : String;
begin
  If RESULTADO_SALARIAL.ItemIndex > -1 Then
  Begin
    lHoras := TItem_Semanal(RESULTADO_SALARIAL.Items.Objects[RESULTADO_SALARIAL.ItemIndex]).HORAS;
    lNombre := TItem_Semanal(RESULTADO_SALARIAL.Items.Objects[RESULTADO_SALARIAL.ItemIndex]).NOMBRE;
    If Form_Novedad_Show(lNombre, lHoras) Then
    Begin
      TItem_Semanal(RESULTADO_SALARIAL.Items.Objects[RESULTADO_SALARIAL.ItemIndex]).HORAS  := lHoras;
      TItem_Semanal(RESULTADO_SALARIAL.Items.Objects[RESULTADO_SALARIAL.ItemIndex]).NOMBRE := lNombre;
      RESULTADO_SALARIAL.Items.Clear;
      Load_Info_Salarial;
    End;
  End;
end;

procedure TFrMenu.BTNCALCULARClick(Sender: TObject);
begin
  FSalarial_Semanal.TOPE := TOPE.Value;
  FSalarial_Semanal.SALARIO := SALARIO.Value;
  FSalarial_Semanal.NOVEDAD := NOVEDAD.Value;
  RESULTADO_SALARIAL.Items.Clear;
  FSalarial_Semanal.Calcular_Salarios;
  Load_Info_Salarial;
  ShowMessage('Salarios calculados');
end;

procedure TFrMenu.BtnClienteClick(Sender: TObject);
Var
  lReturn : String;
begin
  If (FCRUD_Clientes.ENC.DS.State In [dsInsert, dsEdit]) And Form_Maestro_Show(Id_Tabla_Cliente, lReturn) Then
  Begin
    FCRUD_Clientes.ENC.QR.FieldByName('CODIGO_CLIENTE').AsString := lReturn;
  End;
end;

procedure TFrMenu.BTNFIBONACCIClick(Sender: TObject);
Var
  lF : TFibonacci;
begin
  Try
    lF := TFibonacci.Create;
    lF.EVENTO := PROGRESO_FIBONACCI;
    lF.Calculate(NUMERO_BASE.Value);
    FreeAndNil(lF);
    ShowMessage('Fibonacci generado');
  Except
    On E: Exception Do
      ShowMessage(E.Message);
  End;
  lbInfo.Caption := '';
end;

procedure TFrMenu.BTNNOVEDADClick(Sender: TObject);
Var
  lHoras : Double;
  lNombre : String;
begin
  If Form_Novedad_Show(lNombre, lHoras) Then
  Begin
    FSalarial_Semanal.Add_Novedad(lNombre, lHoras);
    RESULTADO_SALARIAL.Items.Clear;
    Load_Info_Salarial;
  End;
end;

Procedure TFrMenu.Load_Info_Salarial;
Var
  lI : Integer;
  lT : String;
Begin
  For lI := 0 To FSalarial_Semanal.Items_Semanal.Count-1 Do
  Begin
    lT := 'Al Empleado ' +
           Trim(FSalarial_Semanal.Items_Semanal[lI].NOMBRE) +
          ' se le debe pagar la suma de ' +
           FormatFloat('###,###,###, ##0', FSalarial_Semanal.Items_Semanal[lI].TOTAL) +
           ' pesos.';
    RESULTADO_SALARIAL.Items.AddObject(lT, FSalarial_Semanal.Items_Semanal[lI]);
  End;
End;

procedure TFrMenu.BTNRESTARTClick(Sender: TObject);
begin
  RESULTADO_SALARIAL.Items.Clear;
  FSalarial_Semanal.Restart;
end;

procedure TFrMenu.DBGrid1DblClick(Sender: TObject);
Var
  lCantidad : String;
begin
  If FCRUD_Clientes.DET.DS.State In [dsInsert, dsEdit] Then
    If FCRUD_Clientes.DET.QR.RecordCount > 0 Then
    Begin
      lCantidad := FCRUD_Clientes.DET.QR.FieldByName('CANTIDAD').AsString;
      If InputQuery('CANTIDAD', 'CANTIDAD', lCantidad) Then
      Begin
        FCRUD_Clientes.DET.QR.FieldByName('CANTIDAD').AsFloat := SetToFloat(lCantidad);
        FCRUD_Clientes.DET.QR.FieldByName('VALOR').AsFloat := FCRUD_Clientes.DET.QR.FieldByName('VALOR_PRODUCTO').AsFloat * FCRUD_Clientes.DET.QR.FieldByName('CANTIDAD').AsFloat;
      End;
    End;
end;

procedure TFrMenu.FormCreate(Sender: TObject);
begin
  Self.Caption := 'Menu Principal';
  lbInfo.Caption := '';
  RESULTADO_FIBONACCI.Lines.Clear;
  FCRUD_Clientes := TCRUD_Clientes.Create;
  FSalarial_Semanal := TSalarial_Semanal.Create;

  FCRUD_Clientes.EVENTO_DATACHANGE := EVENTO_DATACHANGE;
  EVENTO_DATACHANGE(Nil);

  DBGrid1.DataSource := FCRUD_Clientes.DET.DS;
  NAVEGADOR_DET.DataSource := FCRUD_Clientes.DET.DS;

  VALOR.DataSource := FCRUD_Clientes.ENC.DS;
  NAVEGADOR_ENC.DataSource := FCRUD_Clientes.ENC.DS;
  CODIGO_CLIENTE.DataSource := FCRUD_Clientes.ENC.DS;
  NOMBRE_CLIENTE.DataSource := FCRUD_Clientes.ENC.DS;
  FECHA_DOCUMENTO.DataSource := FCRUD_Clientes.ENC.DS;
  NUMERO_DOCUMENTO.DataSource := FCRUD_Clientes.ENC.DS;
End;

procedure TFrMenu.FormDestroy(Sender: TObject);
begin
  If Assigned(FCRUD_Clientes) Then
    FreeAndNil(FCRUD_Clientes);

  If Assigned(FSalarial_Semanal) Then
    FreeAndNil(FSalarial_Semanal);
end;

end.
