unit Form_ConnectionString;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, ADODB;

type
  TFrForm_ConnectionString = class(TForm)
    Panel1: TPanel;
    GrupoConnection: TGroupBox;
    Panel2: TPanel;
    MemoConnectionString: TMemo;
    pfTipoConexion: TRadioGroup;
    Panel3: TPanel;
    BtnConnectionString: TSpeedButton;
    BtnProbar: TSpeedButton;
    BtnCreacionTablas: TSpeedButton;
    BtnAceptar: TSpeedButton;
    BtnSalir: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnProbarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BtnConnectionStringClick(Sender: TObject);
    procedure BtnSalirClick(Sender: TObject);
    procedure BtnAceptarClick(Sender: TObject);
    procedure BtnCreacionTablasClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  Protected
  private
    { Private declarations }
    FCNX : TADOConnection;
    lAceptado : Boolean;
    Procedure Ejecutar_UDL;
    Procedure Almacenar_ConnectionString(pSave : Boolean);
  public
    { Public declarations }
  end;

var
  FrForm_ConnectionString: TFrForm_ConnectionString;
  Function Show_ConnectionString : Boolean;

implementation
{$R *.dfm}

Uses
  OleDB,
  ComObj,
  Utils.Conexion,
  Utils.Functions,
  Utils.Archivo_Cfg,
  Form_Create_Tables;

Procedure TFrForm_ConnectionString.Almacenar_ConnectionString(pSave : Boolean);
Var
  lID_CONEXION : String;
Begin
  lID_CONEXION := ID_SQLSERVER;
  gTipo_Conexion := Conn_SQLSERVER;
  Case pfTipoConexion.ItemIndex Of
    0 : Begin
          lID_CONEXION := ID_SQLSERVER;
          gTipo_Conexion := Conn_SQLSERVER;
        End;
    1 : Begin
          lID_CONEXION := ID_FIREBIRD;
          gTipo_Conexion := Conn_FIREBIRD;
        End;
    2 : Begin
          lID_CONEXION := ID_MYSQL;
          gTipo_Conexion := Conn_MYSQL;
        End;
    3 : Begin
          lID_CONEXION := ID_ORACLE;
          gTipo_Conexion := Conn_ORACLE;
        End;
  End;
  If pSave then
    Salvar_Informacion_Connection(lID_CONEXION, Encripta_Cadena(FCNX.ConnectionString));
End;

procedure TFrForm_ConnectionString.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (ModalResult = mrOk) Or lAceptado then
  Begin
    CanClose := Hay_Conexion(MemoConnectionString.Lines.Text);
    if CanClose then
      Almacenar_ConnectionString(True);
  End;
end;

procedure TFrForm_ConnectionString.FormCreate(Sender: TObject);
begin
  lAceptado := False;
  FCNX := TADOConnection.Create(Nil);
  Caption := 'Configuración de Conexiones';
  MemoConnectionString.Lines.Clear;
  FCNX.LoginPrompt := False;
  Self.FormStyle := fsNormal;
  Self.WindowState := wsNormal;
  Self.BorderStyle := bsDialog;  
end;

procedure TFrForm_ConnectionString.FormDestroy(Sender: TObject);
begin
  If Assigned(FCNX) Then
  Begin
    FCNX.Connected := False;
    FreeAndNil(FCNX);
  End;
end;

procedure TFrForm_ConnectionString.BtnAceptarClick(Sender: TObject);
begin
  lAceptado := Sino('Está seguro(a) de esta información?');
  if lAceptado then
  Begin
    ModalResult := mrOk;
    Close;
  End;
end;

procedure TFrForm_ConnectionString.BtnConnectionStringClick(Sender: TObject);
begin
  Ejecutar_UDL;
end;

procedure TFrForm_ConnectionString.BtnCreacionTablasClick(Sender: TObject);
begin
  If Hay_Conexion(MemoConnectionString.Lines.Text) Then
  Begin
    If Sino('Está seguro(a) de crear las tablas?') Then
    Begin
      Iniciar_Conexion(MemoConnectionString.Lines.Text);
      Create_Tables;
    End;
  End
  Else
    Mensajes('Conexion no válida');
end;

procedure TFrForm_ConnectionString.BtnProbarClick(Sender: TObject);
begin
  If Hay_Conexion(MemoConnectionString.Lines.Text) Then
    Mensajes('Conexión válida')
  Else
    Mensajes('Conexion no válida');
end;

procedure TFrForm_ConnectionString.BtnSalirClick(Sender: TObject);
begin
  lAceptado := False;
  ModalResult := mrCancel;
  Close;
end;

Procedure TFrForm_ConnectionString.Ejecutar_UDL;
Var
  CS : WideString;
begin
  FCNX.Connected := False;
  MemoConnectionString.Lines.Clear;
  CS := PromptDataSource(Self.Handle, FCNX.ConnectionString);
  FCNX.ConnectionString := CS;
  MemoConnectionString.Lines.Add(CS);
end;

Function Show_ConnectionString : Boolean;
Begin
  FrForm_ConnectionString := TFrForm_ConnectionString.Create(Application);
  Result := (FrForm_ConnectionString.ShowModal = mrOk) Or FrForm_ConnectionString.lAceptado;
  FrForm_ConnectionString.Free;
End;

end.
