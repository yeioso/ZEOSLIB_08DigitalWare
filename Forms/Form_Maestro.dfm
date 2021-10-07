object FrMaestro: TFrMaestro
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FrMaestro'
  ClientHeight = 404
  ClientWidth = 499
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 499
    Height = 83
    Align = alTop
    TabOrder = 0
    object lbCode: TLabel
      Left = 16
      Top = 8
      Width = 33
      Height = 13
      Caption = 'lbCode'
    end
    object lbName: TLabel
      Left = 161
      Top = 8
      Width = 31
      Height = 13
      Caption = 'Label1'
    end
    object lbField3: TLabel
      Left = 304
      Top = 8
      Width = 31
      Height = 13
      Caption = 'Label1'
    end
    object CODE: TDBEdit
      Left = 16
      Top = 21
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object NAME: TDBEdit
      Left = 160
      Top = 21
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object FIELD3: TDBEdit
      Left = 304
      Top = 21
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object NAVEGADOR: TDBNavigator
      Left = 1
      Top = 57
      Width = 497
      Height = 25
      Align = alBottom
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 83
    Width = 499
    Height = 280
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 497
      Height = 278
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
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          Width = 100
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 363
    Width = 499
    Height = 41
    Align = alBottom
    TabOrder = 2
    object BTNOK: TBitBtn
      Left = 32
      Top = 8
      Width = 105
      Height = 25
      Caption = 'SELECCIONAR'
      ModalResult = 1
      TabOrder = 0
    end
    object BTNCANCEL: TBitBtn
      Left = 376
      Top = 8
      Width = 99
      Height = 25
      Caption = 'CANCELAR'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
