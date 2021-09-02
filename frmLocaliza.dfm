object formLocaliza: TformLocaliza
  Left = 0
  Top = 0
  Caption = 'formLocaliza'
  ClientHeight = 135
  ClientWidth = 485
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 20
    Top = 20
    Width = 41
    Height = 13
    Caption = 'Localizar'
  end
  object editLocaliza: TEdit
    Left = 20
    Top = 39
    Width = 441
    Height = 21
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 89
    Width = 485
    Height = 46
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = -97
    ExplicitTop = 117
    ExplicitWidth = 492
    object Button1: TButton
      Left = 396
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 0
    end
    object Button2: TButton
      Left = 315
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 1
    end
  end
end
