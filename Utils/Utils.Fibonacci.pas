unit Utils.Fibonacci;

interface
Uses
  System.Classes;

Type
  TFibonacci = Class
    Private
      Function Recursive(Const pValue : Int64) : Int64;
    Public
      ESTADO : String;
      EVENTO : TNotifyEvent;
      RESULTADO : String;
      Procedure Calculate(Const pValue : Int64);
      Constructor Create;
      Destructor Destroy;
  End;

implementation

Uses
  Vcl.Forms,
  System.StrUtils,
  System.SysUtils;

{ TFibonacci }
Constructor TFibonacci.Create;
Begin
  RESULTADO := '';
End;

Destructor TFibonacci.Destroy;
Begin

End;

Function TFibonacci.Recursive(Const pValue: Int64) : Int64;
Begin
  Case pValue Of
    0 : Result := 0;
    1 : Result := 1;
    2 : Result := 1;
    Else
     Result := Recursive(pValue - 1) + Recursive(pValue - 2);
  End;
End;

Procedure TFibonacci.Calculate(Const pValue : Int64);
Var
  lI : Integer;
Begin
  RESULTADO := '';
  For lI := 0 To pValue Do
  Begin
    ESTADO := FormatFloat('###,###,###,##0', lI) + ' / ' + FormatFloat('###,###,###,##0', pValue) + '...';
    RESULTADO := RESULTADO + IfThen(Trim(RESULTADO) <> '', ', ') + FormatFloat('###,###,###,##0', Recursive(lI));
    If Assigned(EVENTO) Then
    Begin
      EVENTO(Self);
    End;
  End;
End;


end.
