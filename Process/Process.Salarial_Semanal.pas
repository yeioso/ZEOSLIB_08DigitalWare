unit Process.Salarial_Semanal;

interface
Uses
  System.Classes,
  Generics.Collections;

Type
  TItem_Semanal = Class
    Private
      FNOMBRE : String;
      FHORAS  : Double;
      FTOTAL  : Double;
    Public
      Property NOMBRE : String Read FNOMBRE Write FNOMBRE;
      Property HORAS  : Double Read FHORAS  Write FHORAS ;
      Property TOTAL  : Double Read FTOTAL ;
      Constructor Create(Const pNombre : String; Const pHoras : Double);
  End;
  TItems_Semanal = TList<TItem_Semanal>;

  TSalarial_Semanal = Class
    Private
      FTOPE : Double;
      FSALARIO : Double;
      FNOVEDAD : Double;
      FItems_Semanal : TItems_Semanal;
    Public
      Property TOPE : Double Read FTOPE Write FTOPE;
      Property SALARIO : Double Read FSALARIO Write FSALARIO;
      Property NOVEDAD : Double Read FNOVEDAD Write FNOVEDAD;
      Property Items_Semanal : TItems_Semanal Read FItems_Semanal;
      Constructor Create;
      Destructor Destroy;
      Procedure Restart;
      Procedure Add_Novedad(Const pNombre : String; Const pHoras : Double);
      Procedure Calcular_Salarios;
  End;

Implementation

Uses
  System.SysUtils;

{ TItem_Semanal }
Constructor TItem_Semanal.Create(const pNombre : String; Const pHoras : Double);
Begin
  FNOMBRE := AnsiUpperCase(Trim(pNombre));
  FHORAS  := pHoras;
End;

{ TSalarial_Semanal }
Procedure TSalarial_Semanal.Add_Novedad(Const pNombre: String; Const pHoras: Double);
Begin
  FItems_Semanal.Add(TItem_Semanal.Create(pNombre, pHoras));
End;

Procedure TSalarial_Semanal.Calcular_Salarios;
Var
  lI : Integer;
Begin
  For lI := 0 To FItems_Semanal.Count-1 Do
  Begin
    If FItems_Semanal[lI].FHORAS <= FTOPE Then
      FItems_Semanal[lI].FTOTAL := FItems_Semanal[lI].FHORAS * FSALARIO
    Else
      FItems_Semanal[lI].FTOTAL := (FTOPE * FSALARIO) + ((FItems_Semanal[lI].FHORAS - FTOPE) * FNOVEDAD);
  End;
End;

Constructor TSalarial_Semanal.Create;
Begin
  FItems_Semanal := TItems_Semanal.Create;
End;

Procedure TSalarial_Semanal.Restart;
Var
  lI : TItem_Semanal;
Begin
  For lI In FItems_Semanal Do
    lI.Free;
  FItems_Semanal.Clear;
End;

Destructor TSalarial_Semanal.Destroy;
Begin
  Restart;
  FreeAndNil(FItems_Semanal);
End;

end.
