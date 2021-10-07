program DigitalWare;

uses
  Vcl.Forms,
  Form_Menu in 'Forms\Form_Menu.pas' {FrMenu};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrMenu, FrMenu);
  Application.Run;
end.
