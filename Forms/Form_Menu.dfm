object FrMenu: TFrMenu
  Left = 0
  Top = 0
  Caption = 'FrMenu'
  ClientHeight = 405
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
    Height = 386
    ActivePage = PAG_FIBONACCI
    Align = alClient
    TabOrder = 0
    ExplicitTop = 0
    ExplicitHeight = 366
    object PAG_FIBONACCI: TTabSheet
      Caption = 'FIBONACCI'
      object RESULTADO_FIBONACCI: TMemo
        Left = 0
        Top = 71
        Width = 854
        Height = 287
        Align = alClient
        Lines.Strings = (
          'RESULTADO_FIBONACCI')
        TabOrder = 0
        ExplicitLeft = 16
        ExplicitTop = 80
        ExplicitWidth = 817
        ExplicitHeight = 241
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 854
        Height = 71
        Align = alTop
        BorderStyle = bsSingle
        TabOrder = 1
        ExplicitLeft = 293
        ExplicitTop = 3
        ExplicitWidth = 476
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
        Height = 272
        Align = alClient
        ItemHeight = 13
        TabOrder = 1
        OnDblClick = RESULTADO_SALARIALDblClick
        ExplicitLeft = 416
        ExplicitTop = 152
        ExplicitWidth = 121
        ExplicitHeight = 97
      end
    end
    object PAG_CRUD: TTabSheet
      Caption = 'CRUD CLIENTES. MANEJO DE BASE DE DATOS'
      ImageIndex = 2
    end
  end
end
