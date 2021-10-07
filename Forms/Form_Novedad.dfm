object FrNovedad: TFrNovedad
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FrNovedad'
  ClientHeight = 110
  ClientWidth = 261
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 42
    Height = 13
    Caption = 'NOMBRE'
  end
  object Label2: TLabel
    Left = 16
    Top = 43
    Width = 35
    Height = 13
    Caption = 'HORAS'
  end
  object NOMBRE: TEdit
    Left = 64
    Top = 13
    Width = 177
    Height = 21
    TabOrder = 0
  end
  object BTNOK: TBitBtn
    Left = 16
    Top = 77
    Width = 91
    Height = 25
    Caption = 'ACEPTAR'
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 1
  end
  object BTNCANCEL: TBitBtn
    Left = 142
    Top = 77
    Width = 99
    Height = 25
    Cancel = True
    Caption = 'CANCELAR'
    Default = True
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 2
  end
  object HORAS: TNumberBox
    Left = 64
    Top = 40
    Width = 177
    Height = 21
    Alignment = taRightJustify
    Decimal = 0
    Mode = nbmFloat
    TabOrder = 3
  end
end
