unit Utils.Functions;

interface
Procedure Next_Value(Var pValue : String);
Function Vacio(pCadena : String) : Boolean;
Function Justificar(pCadena : String; pCharacter : Char; pLong : Integer; pPlace : Char = 'D') : String ;

implementation
Uses
  System.SysUtils;


Procedure Next_Alpha(Var pValue : String; pIndex : Integer);
Var
  lOrd : Integer;
Begin
  If pIndex <= 0 Then
    Exit;
    lOrd := Ord(pValue[pIndex]);
    Inc(lOrd);
    Case lOrd Of
      58 : Begin
             lOrd := 48;
             pValue[pIndex] := Char(lOrd);
             Next_Alpha(pValue, pIndex-1);
           End;
      91 : Begin
             lOrd := 65;
             pValue[pIndex] := Char(lOrd);
             Next_Alpha(pValue, pIndex-1);
           End;
      Else  pValue[pIndex] := Char(lOrd);
    End;
End;

Procedure Next_Value(Var pValue : String);
Var
  lI : Integer;
  lStr : String;
  lInt : String;
  lOrd : Integer;
  lEnd : Boolean;
//  lPosIni : Integer;
Begin
  If pValue = '' Then
    Exit;
  lStr := '';
  lInt := '';
  For lI := 0 to Length(pValue) Do
    Case Ord(pValue[lI]) Of
       48..57 : lInt := lInt + pValue[lI];
       65..90 : lStr := lStr + pValue[lI];
    End;
//  lPosIni := Pos(Char(90), pValue);
  If (lInt = StringOfChar(Char(57), Length(lInt))) And (Trim(lInt) <> '') Then
  Begin
    lStr := lStr + Char(65);
    pValue := Copy(lStr + StringOfChar(Char(48), Length(pValue)), 1, Length(pValue))
  End
  Else
    If (pValue[Length(pValue)] = Char(90)) Then
    Begin
      lEnd := False;
      lI := Length(pValue);
      While (Not lEnd) And (lI > 0) Do
      Begin
        If pValue[lI] = Char(90) then
          pValue[lI] := Char(48)
        Else
          lEnd := True;
        Dec(lI);
      End;

      lEnd := False;
      lI := Length(pValue);
      While (lI > 0) And (Not lEnd) Do
      Begin
        If (Ord(pValue[lI]) In [65..90]) Then
        Begin
          lOrd := Ord(pValue[lI]);
          Inc(lOrd);
          pValue[lI] := Char(lOrd);
          lEnd := True;
        End;
        Dec(lI);
      End;
    End
    Else
      Next_Alpha(pValue, Length(pValue));
End;

Function Vacio(pCadena : String) : Boolean;
Begin
  Result := Trim(pCadena) = '';
End;

Function Justificar(pCadena : String; pCharacter : Char; pLong : Integer; pPlace : Char = 'D') : String ;
Var
  lDiferencia : Integer;
  lLong : Integer ;
  lCadena : String;
Begin
  lCadena := Trim(pCadena) ;
  lLong := Length(lCadena) ;
  If lLong < pLong Then
  Begin
    lDiferencia := pLong - lLong;
    If UpCase(pPlace) = 'I' Then
      lCadena := lCadena + StringofChar(pCharacter, lDiferencia)
    Else
      lCadena := stringofchar(pCharacter, lDiferencia) + lCadena;
  End ;
  Result := lCadena;
End;

end.
