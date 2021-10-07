unit TBLNM0000.Info;

interface
Uses
  Classes,
  Generics.Collections;

Const
  Id_Tabla_Cliente     = 001;
  Id_Tabla_Producto    = 002;
  Id_Tabla_Factura_Enc = 003;
  Id_Tabla_Factura_Det = 004;

Type
 TA_PK = Array Of String;
 TInfo_Tabla = Class
   Id        : Integer;
   Name      : String ;
   Caption   : String ;
   CodeField : String ;
   NameField : String ;
   Menu      : Boolean;
   Proceso   : Boolean;
   Fk        : Array[1..15] Of String;
   Pk        : TA_PK;
 End;
 TInfo_Tablas = TList<TInfo_Tabla>;
Function Retornar_Id_Tabla(pTableName : String) : Integer;
Function Retornar_Id_Caption(pTableName : String) : Integer;
Function Retornar_Id_Field(pCodeField : String) : Integer;
Function Retornar_Info_Tabla(pId : Integer) : TInfo_Tabla;
Procedure Retornar_Caption_Tablas(pTablas : TStrings);
Procedure Retornar_Name_Tablas(pTablas : TStrings);
Var
  gInfo_Tablas : TInfo_Tablas;
implementation
Uses
  SysUtils,
  Utils.Functions,
  Generics.Defaults;

Procedure Cargar_Tablas(pId : Integer; pName, pCaption : String; pMenu, pProceso : Boolean; pPK : TA_PK);
Var
  lI : Integer;
  lItem : TInfo_Tabla;
Begin
  lItem := TInfo_Tabla.Create;
  lItem.Id      := pId   ;
  lItem.Name    := pName;
  lItem.Name    := 'T' + Justificar(IntToStr(pId), '0', 3) + '_' + pName;
  lItem.Caption := pCaption;
  lItem.Menu    := pMenu   ;
  lItem.Pk      := pPK     ;
  For lI := 1 To 15 Do
  Begin
    Randomize;
    lItem.Fk[lI] := 'FK' + IntToStr(pId) + '_INDX' + IntToStr(lI) + 'RND' + IntToStr(Random(1000));
  End;
  gInfo_Tablas.Add(lItem);
End;
Procedure Preparar_Tablas;
Begin
  Cargar_Tablas(Id_Tabla_Cliente    , 'CLIENTE'    , 'Cliente'           , True, False, ['CODIGO_CLIENTE'  ]);
  Cargar_Tablas(Id_Tabla_Producto   , 'PRODUCTO'   , 'Producto'          , True, False, ['CODIGO_PRODUCTO' ]);
  Cargar_Tablas(Id_Tabla_Factura_Enc, 'FACTURA_ENC', 'Factura Encabezado', True, False, ['NUMERO_DOCUMENTO']);
  Cargar_Tablas(Id_Tabla_Factura_Det, 'FACTURA_DET', 'Factura Detalle'   , True, False, ['NUMERO_DOCUMENTO', 'CODIGO_PRODUCTO']);
End;
Procedure UtInfoTablas_Sort(pLista : TInfo_Tablas);
Begin
  pLista.Sort(TComparer<TInfo_Tabla>.Construct(
              Function(const Item1,Item2:TInfo_Tabla): Integer
              Begin
                Result := Item1.Id - Item2.Id;
              End)
              );
End;
Function UtInfoTablas_Search(pLista : TInfo_Tablas; Const pId : Integer; Var pIndex : Integer) : Boolean;
Var
  lTarget: TInfo_Tabla;
  lComparer: IComparer<TInfo_Tabla>;
  lComparison: TComparison<TInfo_Tabla>;
Begin
  lComparison := Function(const Left, Right: TInfo_Tabla) : Integer
  Begin
    Result := Left.Id - Right.Id;
  End;
  lComparer := TComparer<TInfo_Tabla>.Construct(lComparison);
  lTarget := TInfo_Tabla.Create;
  lTarget.Id  := pId;
  Result := pLista.BinarySearch(lTarget, pIndex, lComparer);
  lTarget.Free;
End;
Function Retornar_Id_Tabla(pTableName : String) : Integer;
Var
  lI : Integer;
Begin
  lI := 0;
  Result := -1;
  While (0 < gInfo_Tablas.Count) And (Result = -1) Do
  Begin
    If AnsiUpperCase(gInfo_Tablas[lI].Name) = AnsiUpperCase(pTableName) then
      Result := lI;
    Inc(lI);
  End;
End;
Function Retornar_Id_Caption(pTableName : String) : Integer;
Var
  lI : Integer;
Begin
  lI := 0;
  Result := -1;
  While (0 < gInfo_Tablas.Count) And (Result = -1) Do
  Begin
    If AnsiUpperCase(gInfo_Tablas[lI].Caption) = AnsiUpperCase(pTableName) then
      Result := lI;
    Inc(lI);
  End;
End;
Function Retornar_Id_Field(pCodeField : String) : Integer;
Var
  lI : Integer;
Begin
  lI := 0;
  Result := -1;
  While (0 < gInfo_Tablas.Count) And (Result = -1) Do
  Begin
    If AnsiUpperCase(gInfo_Tablas[lI].CodeField) = AnsiUpperCase(pCodeField) then
      Result := lI;
    Inc(lI);
  End;
End;
Function Retornar_Info_Tabla(pId : Integer) : TInfo_Tabla;
Var
  lIndex : Integer;
Begin
  Result := Nil;
  If UtInfoTablas_Search(gInfo_Tablas,  pId, lIndex) Then
    Result := gInfo_Tablas[lIndex];
End;
Procedure Retornar_Info_Tablas(pLista : TStringList; pInfo, pLimiteIni, pLimiteFin : Integer);
Var
  lI : Integer;
Begin
  pLista.Clear;
  For lI := 0 To gInfo_Tablas.Count-1 Do
  Begin
    Case pInfo Of
      1 : pLista.Add(gInfo_Tablas[lI].Caption);
      2 : pLista.Add(gInfo_Tablas[lI].Name   );
    End;
  End;
End;
Procedure Retornar_Caption_Tablas(pTablas : TStrings);
Var
  lI : Integer;
Begin
  pTablas.Clear;
  For lI := 0 To gInfo_Tablas.Count-1 Do
    pTablas.Add(Retornar_Info_Tabla(lI).Caption);
End;
Procedure Retornar_Name_Tablas(pTablas : TStrings);
Var
  lI : Integer;
Begin
  pTablas.Clear;
  For lI := 0 To gInfo_Tablas.Count-1 Do
    pTablas.Add(Retornar_Info_Tabla(lI).Name);
End;
Initialization
  gInfo_Tablas := TInfo_Tablas.Create;
  Preparar_Tablas;
end.

