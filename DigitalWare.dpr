program DigitalWare;

uses
  Vcl.Forms,
  Utils.Sesion,
  Form_Menu in 'Forms\Form_Menu.pas' {FrMenu};

{$R *.res}

begin
  Application.Initialize;
  If Iniciar_Sesion Then
  Begin
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TFrMenu, FrMenu);
    Application.Run;
  End;
  Application.Terminate;
end.
