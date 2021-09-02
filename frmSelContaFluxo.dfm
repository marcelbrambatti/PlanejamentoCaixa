object formSelContaFluxo: TformSelContaFluxo
  Left = 0
  Top = 0
  Caption = 'Sele'#231#227'o da Conta de Fluxo de Caixa'
  ClientHeight = 335
  ClientWidth = 491
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 11
    Top = 216
    Width = 463
    Height = 50
  end
  object Bevel1: TBevel
    Left = 11
    Top = 16
    Width = 463
    Height = 192
  end
  object Label1: TLabel
    Left = 20
    Top = 222
    Width = 66
    Height = 13
    Caption = 'Conta Fluxo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edContaFluxo: TDBLookupComboBox
    Left = 20
    Top = 239
    Width = 445
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    KeyField = 'id'
    ListField = 'conta'
    ListSource = dsContasFluxo
    ParentFont = False
    TabOrder = 0
  end
  object edFornecedor: TEdit
    Left = 20
    Top = 41
    Width = 445
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object edEstab: TEdit
    Left = 20
    Top = 90
    Width = 445
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object edEspecie: TEdit
    Left = 20
    Top = 135
    Width = 445
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object Panel1: TPanel
    Left = 0
    Top = 289
    Width = 491
    Height = 46
    Align = alBottom
    TabOrder = 4
    ExplicitTop = 334
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
      Default = True
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
  object chkFornec: TCheckBox
    Left = 20
    Top = 23
    Width = 97
    Height = 17
    Caption = 'Fornecedor'
    TabOrder = 5
  end
  object chkEstab: TCheckBox
    Left = 20
    Top = 73
    Width = 97
    Height = 17
    Caption = 'Estabelecimento'
    TabOrder = 6
  end
  object chkEspecie: TCheckBox
    Left = 20
    Top = 117
    Width = 141
    Height = 17
    Caption = 'Esp'#233'cie do Documento'
    TabOrder = 7
  end
  object edTitulo: TEdit
    Left = 20
    Top = 181
    Width = 141
    Height = 17
    Enabled = False
    TabOrder = 8
  end
  object chkTitulo: TCheckBox
    Left = 20
    Top = 162
    Width = 86
    Height = 17
    Caption = 'T'#237'tulo'
    TabOrder = 9
  end
  object edSerie: TEdit
    Left = 242
    Top = 181
    Width = 58
    Height = 17
    Enabled = False
    TabOrder = 10
  end
  object chkSerie: TCheckBox
    Left = 242
    Top = 162
    Width = 58
    Height = 17
    Caption = 'S'#233'rie'
    TabOrder = 11
  end
  object edParcela: TEdit
    Left = 173
    Top = 181
    Width = 58
    Height = 17
    Enabled = False
    TabOrder = 12
  end
  object chkParcela: TCheckBox
    Left = 173
    Top = 162
    Width = 58
    Height = 17
    Caption = 'Parc'
    TabOrder = 13
  end
  object sqlContasFluxo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select id, descricao as conta, nivel'
      'from contasfluxo'
      'order by conta')
    SQLConnection = dtmConexao.SQLConnection1
    Left = 310
    Top = 25
    object sqlContasFluxoid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object sqlContasFluxoconta: TStringField
      FieldName = 'conta'
      Size = 153
    end
    object sqlContasFluxonivel: TIntegerField
      FieldName = 'nivel'
    end
  end
  object dspContasFluxo: TDataSetProvider
    DataSet = sqlContasFluxo
    Left = 325
    Top = 45
  end
  object cdsContasFluxo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContasFluxo'
    Left = 340
    Top = 65
    object cdsContasFluxoid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cdsContasFluxoconta: TStringField
      FieldName = 'conta'
      Size = 153
    end
    object cdsContasFluxonivel: TIntegerField
      FieldName = 'nivel'
    end
  end
  object dsContasFluxo: TDataSource
    DataSet = cdsContasFluxo
    Left = 360
    Top = 85
  end
end
