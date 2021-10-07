unit Form_Novedad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.NumberBox;

type
  TFrNovedad = class(TForm)
    NOMBRE: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BTNOK: TBitBtn;
    BTNCANCEL: TBitBtn;
    HORAS: TNumberBox;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
Function Form_Novedad_Show(Var pNombre : String; Var pHoras : Double) : Boolean;

implementation
{$R *.dfm}
Uses
  Utils.Functions;

Function Form_Novedad_Show(Var pNombre : String; Var pHoras : Double) : Boolean;
Var
  FrNovedad : TFrNovedad;
Begin
  FrNovedad := TFrNovedad.Create(Application);
  FrNovedad.NOMBRE.Text := pNombre;
  FrNovedad.HORAS.Value := pHoras ;
  Result := FrNovedad.ShowModal = mrOk;
  If Result Then
  Begin
    pNombre := FrNovedad.NOMBRE.Text;
    pHoras  := FrNovedad.HORAS.Value;
  End;
  FreeAndNil(FrNovedad);
End;

procedure TFrNovedad.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
  If ModalResult = mrOk Then
  Begin
    If Vacio(NOMBRE.Text) Or (HORAS.Value <= 0) Then
    Begin
      ShowMessage('Debe ingresar la informcion valida');
      CanClose := False;
    End;

  End;
end;

end.
