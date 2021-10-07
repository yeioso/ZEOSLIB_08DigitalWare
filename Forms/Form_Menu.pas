unit Form_Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Samples.Spin, Vcl.Samples.Gauges,
  Vcl.ExtCtrls, Process.Salarial_Semanal, Vcl.Buttons;

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
    procedure FormCreate(Sender: TObject);
    procedure BTNFIBONACCIClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BTNCALCULARClick(Sender: TObject);
    procedure BTNRESTARTClick(Sender: TObject);
    procedure BTNNOVEDADClick(Sender: TObject);
    procedure RESULTADO_SALARIALDblClick(Sender: TObject);
  private
    { Private declarations }
    FSalarial_Semanal : TSalarial_Semanal;
    Procedure Load_Info_Salarial;
    Procedure PROGRESO_FIBONACCI(Sender: TObject);
  public
    { Public declarations }
  end;

var
  FrMenu: TFrMenu;

implementation
{$R *.dfm}
Uses
  Form_Novedad,
  Utils.Fibonacci,
  TBLNM0001.Create;

Procedure TFrMenu.PROGRESO_FIBONACCI(Sender: TObject);
Begin
  If Sender Is TFibonacci Then
  Begin
    lbInfo.Caption := (Sender As TFibonacci).ESTADO;
    RESULTADO_FIBONACCI.Lines.Text := (Sender As TFibonacci).RESULTADO;
    Application.ProcessMessages;
  End;
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

procedure TFrMenu.FormCreate(Sender: TObject);
begin
  lbInfo.Caption := '';
  RESULTADO_FIBONACCI.Lines.Clear;
  FSalarial_Semanal := TSalarial_Semanal.Create;
end;

procedure TFrMenu.FormDestroy(Sender: TObject);
begin
  If Assigned(FSalarial_Semanal) Then
    FreeAndNil(FSalarial_Semanal);
end;

end.
