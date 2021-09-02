object formCadParams: TformCadParams
  Left = 0
  Top = 0
  Caption = 'Par'#226'metros'
  ClientHeight = 453
  ClientWidth = 762
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 0
    Width = 762
    Height = 25
    DataSource = DataSource1
    Align = alTop
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 25
    Width = 762
    Height = 428
    Align = alClient
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Fornecedor'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Estabelecimento'
        Title.Caption = 'Estabelec.'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Especie'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'titulo'
        Title.Caption = 'Titulo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'serie'
        Title.Caption = 'Serie'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'parcela'
        Title.Caption = 'Parcela'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ContaFluxo'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DesContaFluxo'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'added_at'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'Adicionada em'
        Title.Color = clSilver
        Width = 120
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = dtmParams.cdsParams
    Left = 480
    Top = 270
  end
end
