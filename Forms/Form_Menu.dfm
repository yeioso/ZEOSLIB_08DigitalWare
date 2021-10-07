object FrMenu: TFrMenu
  Left = 0
  Top = 0
  Caption = 'FrMenu'
  ClientHeight = 404
  ClientWidth = 862
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lbInfo: TLabel
    Left = 0
    Top = 0
    Width = 862
    Height = 19
    Align = alTop
    Alignment = taCenter
    Caption = 'lbInfo'
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    ExplicitWidth = 48
  end
  object PAGINAS: TPageControl
    Left = 0
    Top = 19
    Width = 862
    Height = 385
    ActivePage = PAG_FIBONACCI
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 386
    object PAG_FIBONACCI: TTabSheet
      Caption = 'FIBONACCI'
      object RESULTADO_FIBONACCI: TMemo
        Left = 0
        Top = 71
        Width = 854
        Height = 286
        Align = alClient
        Lines.Strings = (
          'RESULTADO_FIBONACCI')
        TabOrder = 0
        ExplicitHeight = 287
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 854
        Height = 71
        Align = alTop
        BorderStyle = bsSingle
        TabOrder = 1
        object Label1: TLabel
          Left = 16
          Top = 11
          Width = 190
          Height = 13
          Caption = 'Ingrese el numero para generar la serie'
        end
        object BTNFIBONACCI: TSpeedButton
          Left = 212
          Top = 30
          Width = 93
          Height = 22
          Caption = 'GENERAR'
          OnClick = BTNFIBONACCIClick
        end
        object NUMERO_BASE: TSpinEdit
          Left = 16
          Top = 30
          Width = 190
          Height = 22
          MaxValue = 9999
          MinValue = 0
          TabOrder = 0
          Value = 0
        end
      end
    end
    object PAG_SALARIAL: TTabSheet
      Caption = 'CALCULO SALARIO SEMANAL'
      ImageIndex = 1
      object Label5: TLabel
        Left = 0
        Top = 73
        Width = 854
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 'DOBLE CLIC EN EL ITEM PARA EDITAR LA INFORMACION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 303
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 854
        Height = 73
        Align = alTop
        BorderStyle = bsSingle
        TabOrder = 0
        object Label2: TLabel
          Left = 8
          Top = 11
          Width = 83
          Height = 13
          Caption = 'Valor Hora Basica'
        end
        object Label3: TLabel
          Left = 512
          Top = 11
          Width = 96
          Height = 13
          Caption = 'Valor Hora Novedad'
        end
        object Label4: TLabel
          Left = 271
          Top = 11
          Width = 69
          Height = 13
          Caption = 'Tope de horas'
        end
        object BTNRESTART: TSpeedButton
          Left = 8
          Top = 36
          Width = 217
          Height = 22
          Caption = 'REINICIAR INFORMACION'
          OnClick = BTNRESTARTClick
        end
        object BTNCALCULAR: TSpeedButton
          Left = 271
          Top = 36
          Width = 209
          Height = 22
          Caption = 'CALCULAR SALARIO'
          OnClick = BTNCALCULARClick
        end
        object BTNNOVEDAD: TSpeedButton
          Left = 512
          Top = 36
          Width = 226
          Height = 22
          Caption = 'ADICIONAR NOVEDAD'
          OnClick = BTNNOVEDADClick
        end
        object SALARIO: TSpinEdit
          Left = 104
          Top = 8
          Width = 121
          Height = 22
          MaxValue = 1000000
          MinValue = 0
          TabOrder = 0
          Value = 15000
        end
        object TOPE: TSpinEdit
          Left = 359
          Top = 8
          Width = 121
          Height = 22
          MaxValue = 100
          MinValue = 0
          TabOrder = 1
          Value = 35
        end
        object NOVEDAD: TSpinEdit
          Left = 617
          Top = 8
          Width = 121
          Height = 22
          MaxValue = 1000000
          MinValue = 0
          TabOrder = 2
          Value = 19000
        end
      end
      object RESULTADO_SALARIAL: TListBox
        Left = 0
        Top = 86
        Width = 854
        Height = 271
        Align = alClient
        ItemHeight = 13
        TabOrder = 1
        OnDblClick = RESULTADO_SALARIALDblClick
        ExplicitHeight = 272
      end
    end
    object PAG_CRUD: TTabSheet
      Caption = 'CRUD CLIENTES. MANEJO DE BASE DE DATOS'
      ImageIndex = 2
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 854
        Height = 113
        Align = alTop
        BorderStyle = bsSingle
        TabOrder = 0
        object Label6: TLabel
          Left = 8
          Top = 8
          Width = 109
          Height = 13
          Caption = 'Numero de Documento'
        end
        object Label7: TLabel
          Left = 344
          Top = 8
          Width = 29
          Height = 13
          Caption = 'Fecha'
        end
        object Label8: TLabel
          Left = 8
          Top = 32
          Width = 33
          Height = 13
          Caption = 'Cliente'
        end
        object Label9: TLabel
          Left = 344
          Top = 32
          Width = 24
          Height = 13
          Caption = 'Valor'
        end
        object BtnCliente: TSpeedButton
          Left = 276
          Top = 32
          Width = 23
          Height = 21
          Cursor = crHandPoint
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFE7E6E5999792807E7AA2A09AF4F4F4FFFFFFFF
            FFFFFFFFFFFFFFFFE2E2E08F8E897F7C79ABAAA5F8F8F7FFFFFFE0DFDD36322C
            3442555D6C872B38515C584EF7F7F6FFFFFFFFFFFFD8D7D533322C45526D6874
            87272D3A5C584FFBFBFB7675731F47A55B91FF5188FF4F83FF142777B5B3AAFF
            FFFFFFFFFF7E7C79294BB96D9FFF679CFF679FFF15336CB5B1AC6F72760838D0
            1C4BFF2C53F91A42FF051A95ACAA9EFFFFFFFFFFFF7878792045DA2A5EFF3B6B
            FF2D6BFF00329EAEAAA2C6C3BD1E24421B27A22734B815208E1F1E20B7B7B3FF
            FFFFFFFFFF84837C292A3D364ABA3D52CE0C2192333645F0EFEAF5F5F57F7D77
            56554C64636037352C050500D6D6D6FFFFFFFFFFFF95959503010044433B6664
            6156544B9C9B97FFFFFFF1F1F16060605858587A7A791F201F0A0A0ADADBDBFF
            FFFFFFFFFFA4A5A500000040403F7878775151507D7E7EFFFFFFFFFFFF656464
            474747929191515151000000000000D4D4D49191910000000000006B6C6C6D6D
            6D3F3F3F8D8C8CFFFFFFFFFFFFAEAEAE3636365C5C5C40404010101000000094
            94944545450000001616164B4A4A4A4B4B3C3C3CD7D8D8FFFFFFFFFFFFEAEAEA
            5F5F5F5352524949493939392020207272723434342A2A2A3E3E3E4C4C4C5655
            55757575FEFEFEFFFFFFFFFFFFFFFFFFB0B0B07A7A7A7576765F5F5F58585843
            43434040405B5B5B6061617474747C7C7CD1D1D1FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFA5A5A59696968989897979796464645858587E7E7E8888888C8D8DBCBC
            BCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4C4C43938384E4E4EA1A2A27E
            7F7F787878959595414141484848EAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFCECECEBABABAFCFCFCDEDEDEE6E6E6EFEFEFB2B2B2DFDFDFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = BtnClienteClick
        end
        object NUMERO_DOCUMENTO: TDBEdit
          Left = 128
          Top = 5
          Width = 145
          Height = 21
          DataField = 'NUMERO_DOCUMENTO'
          Enabled = False
          TabOrder = 0
        end
        object FECHA_DOCUMENTO: TDBEdit
          Left = 384
          Top = 5
          Width = 145
          Height = 21
          DataField = 'FECHA_DOCUMENTO'
          TabOrder = 1
        end
        object CODIGO_CLIENTE: TDBEdit
          Left = 128
          Top = 32
          Width = 145
          Height = 21
          DataField = 'CODIGO_CLIENTE'
          TabOrder = 2
        end
        object VALOR: TDBEdit
          Left = 384
          Top = 30
          Width = 145
          Height = 21
          DataField = 'VALOR'
          TabOrder = 3
        end
        object NAVEGADOR_ENC: TDBNavigator
          Left = 1
          Top = 83
          Width = 848
          Height = 25
          Align = alBottom
          TabOrder = 4
          ExplicitLeft = 112
          ExplicitTop = 80
          ExplicitWidth = 240
        end
        object NOMBRE_CLIENTE: TDBEdit
          Left = 8
          Top = 54
          Width = 521
          Height = 21
          DataField = 'NOMBRE_CLIENTE'
          TabOrder = 5
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 113
        Width = 854
        Height = 244
        Align = alClient
        BorderStyle = bsSingle
        TabOrder = 1
        ExplicitTop = 71
        ExplicitHeight = 65
        object Label10: TLabel
          Left = 1
          Top = 201
          Width = 848
          Height = 13
          Align = alBottom
          Alignment = taCenter
          Caption = 
            'Doble clic sobre el registro para editar la cantidad en modo edi' +
            'ci'#243'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 375
        end
        object DBGrid1: TDBGrid
          Left = 1
          Top = 1
          Width = 848
          Height = 200
          Align = alClient
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = DBGrid1DblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO_PRODUCTO'
              Title.Caption = 'C'#243'digo'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_PRODUCTO'
              Title.Caption = 'Descripci'#243'n'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 250
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'CANTIDAD'
              Title.Alignment = taRightJustify
              Title.Caption = 'Cantidad'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 100
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'VALOR_PRODUCTO'
              Title.Alignment = taRightJustify
              Title.Caption = 'Vlr. Unitario'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 100
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'VALOR'
              Title.Alignment = taRightJustify
              Title.Caption = 'Total'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 100
              Visible = True
            end>
        end
        object NAVEGADOR_DET: TDBNavigator
          Left = 1
          Top = 214
          Width = 848
          Height = 25
          Align = alBottom
          TabOrder = 1
          ExplicitLeft = 112
          ExplicitTop = 80
          ExplicitWidth = 240
        end
      end
    end
  end
end
