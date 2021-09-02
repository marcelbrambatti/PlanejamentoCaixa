object formCadContaFluxo: TformCadContaFluxo
  Left = 0
  Top = 0
  Caption = 'Cadastro de Contas de Fluxo de Caixa'
  ClientHeight = 402
  ClientWidth = 686
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 0
    Width = 686
    Height = 25
    DataSource = DataSource1
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 230
    ExplicitTop = 210
    ExplicitWidth = 240
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 25
    Width = 686
    Height = 377
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
        FieldName = 'conta'
        Title.Caption = 'Conta'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 385
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = dtmContaFluxo.cdsContasFluxo
    Left = 410
    Top = 95
  end
end
