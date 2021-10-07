unit Utils.Homologacion;

interface

Uses
  Utils.Conexion;

Const
  Const_ISNULL = ' NULL ';
  Const_NOTNULL = ' NOT NULL ';
  Const_PRIMARY_KEY = 'PRIMARY KEY'; 

Type
 Data_Type_SQL = (TYPE_AUTO_INC, TYPE_VARCHAR, TYPE_FLOAT, TYPE_BIT, TYPE_DATETIME, TYPE_INT, TYPE_TEXT, TYPE_IMAGE, TYPE_BLOB, TYPE_DATE, TYPE_TIME);

Var
  gTipo_Conexion : TTIPO_CONEXION;

Function NoLock_Sentence : String;
Function Top_Sentence(pTop : Integer) : String;
function FnReturn_Type(pType : Data_Type_SQL) : String;
Function FOREINGKEY(pItem, pFieldSource, pTableNameDestiny, pFieldDestiny : String) : String;
Function Trim_Sentence(pField : String) : String;
Function Null_Sentence(pField : String) : String;
Function SubString_Sentence(pValue : String; pPos, pLen : Integer) : String;

implementation

Uses
  ADODB,
  Classes,
  SysUtils;

Function NoLock_Sentence : String;
Begin
  Result :=  ' (NOLOCK) ';
  If gTipo_Conexion = Conn_ORACLE Then
    Result :=  ' '
  Else
    If gTipo_Conexion = Conn_FIREBIRD Then
      Result :=  ' ';
End;

Function Top_Sentence(pTop : Integer) : String;
Begin
  Result :=  ' TOP ' + IntToStr(pTop);
  If gTipo_Conexion = Conn_ORACLE Then
    Result :=  ' TOP ' + IntToStr(pTop)
  Else
    If gTipo_Conexion = Conn_FIREBIRD Then
      Result :=  ' FIRST ' + IntToStr(pTop);
End;

Function FnReturn_Type(pType : Data_Type_SQL) : String;
Begin
  Result := '';
  case pType of
    TYPE_AUTO_INC   : Begin
                        Result := FnReturn_Type(TYPE_INT);
                        If gTipo_Conexion = Conn_SQLSERVER Then
                          Result := ' INT IDENTITY(1,1) ' ;
                      End;
    TYPE_VARCHAR    : Begin
                        Result := 'VARCHAR';
                      End;
    TYPE_FLOAT      : Begin
                        Result := 'FLOAT';
                      End;
    TYPE_BIT        : Begin
                        Result := 'BIT';
                        If gTipo_Conexion = Conn_ORACLE Then
                          Result := 'NUMBER(1)';
                      End;
    TYPE_TIME       : Begin
                        Result := 'DATETIME';
                        If gTipo_Conexion = Conn_ORACLE Then
                          Result := 'TIME'
                        Else
                          If gTipo_Conexion = Conn_FIREBIRD Then
                            Result := 'TIME';
                      End;
    TYPE_DATE       ,
    TYPE_DATETIME   : Begin
                        Result := 'DATETIME';
                        If gTipo_Conexion = Conn_ORACLE Then
                          Result := 'DATE'
                        Else
                          If gTipo_Conexion = Conn_FIREBIRD Then
                            Result := 'DATE';
                      End;
    TYPE_INT        : Begin
                        Result := 'INT';
                        If gTipo_Conexion = Conn_ORACLE Then
                          Result := 'NUMBER(38)';
                      End;
    TYPE_TEXT       : Begin
                        Result := 'TEXT';
                        If gTipo_Conexion = Conn_ORACLE Then
                          Result := 'CLOB'
                        Else
                          If gTipo_Conexion = Conn_FIREBIRD Then
                            Result := 'BLOB';
                      End;
    TYPE_IMAGE      : Begin
                        Result := 'IMAGE';
                        If gTipo_Conexion = Conn_ORACLE Then
                          Result := 'BLOB'
                        Else
                          If (gTipo_Conexion = Conn_FIREBIRD) Or (gTipo_Conexion = Conn_MYSQL) Then
                            Result := 'BLOB';
                      End;
    TYPE_BLOB       : Begin
                        Result := 'TEXT';
                        If (gTipo_Conexion = Conn_FIREBIRD) Or (gTipo_Conexion = Conn_MYSQL) Then
                          Result := 'BLOB';
                      End;
  End;
End;

Function FOREINGKEY(pItem, pFieldSource, pTableNameDestiny, pFieldDestiny : String) : String;
Var
  lInt : Integer;
  lStr : String;
  lName_Constraint : String;
Begin
  Randomize;
  lInt := Random(30);
  Sleep(5);
  lStr := FormatDateTime('YYYYMMDDHHNNSSZZZ', Now);
  lName_Constraint := Copy(pItem + Trim(IntToStr(lInt)) + Trim(pFieldSource), 1, 20);
  lName_Constraint := lStr;
  Result := 'CONSTRAINT ' + 'FK_' + lName_Constraint + ' FOREIGN KEY(' + Trim(pFieldSource) + ')  ' +
            ' REFERENCES ' + pTableNameDestiny + '(' + pFieldDestiny + ')';
End;

Function Return_Type_Connection(pCadena : String) : TTIPO_CONEXION;
Begin
  Result := Conn_SQLSERVER;
  If pCadena = ID_ORACLE Then
    Result := Conn_ORACLE
  Else
    If pCadena = ID_FIREBIRD Then
      Result := Conn_FIREBIRD
    Else
      If pCadena = ID_MYSQL Then
        Result := Conn_MYSQL;
End;

Function Trim_Sentence(pField : String) : String;
Begin
  Result := 'LTRIM(RTRIM(' + TRIM(pField) + '))';
  If gTipo_Conexion = Conn_ORACLE Then
    Result := 'LTRIM(RTRIM(' + TRIM(pField) + '))'
  Else
    If (gTipo_Conexion = Conn_FIREBIRD) Or (gTipo_Conexion = Conn_MYSQL) Then
       Result := 'TRIM(' + TRIM(pField) + ')';
End;

Function Null_Sentence(pField : String) : String;
Begin
  Result := pField + ' IS NULL';
  If gTipo_Conexion = Conn_ORACLE Then
    Result := pField + ' IS NULL'
  Else
    If gTipo_Conexion = Conn_FIREBIRD Then
      Result := pField + ' IS NULL';
End;

Function SubString_Sentence(pValue : String; pPos, pLen : Integer) : String;
Begin
  Result := ' SUBSTRING(' + pValue + ', ' + IntToStr(pPos) + ', ' + IntToStr(pLen) + ')';
  If gTipo_Conexion = Conn_ORACLE Then
    Result := ' SUBSTRING(' + pValue + ', ' + IntToStr(pPos) + ', ' + IntToStr(pLen) + ')'
  Else
    If gTipo_Conexion = Conn_FIREBIRD Then
      Result := ' SUBSTRING(' + pValue + ' FROM ' + IntToStr(pPos) + ' FOR ' + IntToStr(pLen) + ')';
End;



end.
