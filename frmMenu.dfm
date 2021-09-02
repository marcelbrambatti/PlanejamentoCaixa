object formMenu: TformMenu
  Left = 0
  Top = 0
  Caption = '[Menu Principal] Parametriza'#231#227'o Fluxo de Caixa'
  ClientHeight = 490
  ClientWidth = 733
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 733
    Height = 454
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnKeyPress = DBGrid1KeyPress
    OnTitleClick = DBGrid1TitleClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 471
    Width = 733
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Bevel = pbNone
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 454
    Width = 733
    Height = 17
    Align = alBottom
    TabOrder = 2
    Visible = False
  end
  object cdsDados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 35
    Top = 20
  end
  object DataSource1: TDataSource
    DataSet = cdsDados
    Left = 110
    Top = 20
  end
  object MainMenu1: TMainMenu
    Left = 255
    Top = 20
    object CarregarDados1: TMenuItem
      Caption = 'Arquivo'
      object itemImportarPagtos: TMenuItem
        Caption = 'Importar Arquivo de Pagamentos...'
        OnClick = itemImportarPagtosClick
      end
      object ProcessarParmetros1: TMenuItem
        Caption = 'Processar Par'#226'metros...'
        OnClick = ProcessarParmetros1Click
      end
      object Processarpendentes1: TMenuItem
        Caption = 'Processar pendentes'
        OnClick = Processarpendentes1Click
      end
    end
    object Parametrizar1: TMenuItem
      Caption = 'Par'#226'metro'
      object ParametrizarEsp2: TMenuItem
        Tag = 7
        Caption = 'Parametrizar...'
        OnClick = ParametrizarItemClick
      end
      object Pendentes1: TMenuItem
        Caption = 'Mostrar Pendentes...'
        OnClick = Pendentes1Click
      end
    end
    object Exportar1: TMenuItem
      Caption = 'Exportar'
      object GerarCSV1: TMenuItem
        Caption = 'Gerar CSV...'
        OnClick = GerarCSV1Click
      end
    end
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object ContasFluxo1: TMenuItem
        Caption = 'Contas Fluxo...'
        OnClick = ContasFluxo1Click
      end
      object Parmetros1: TMenuItem
        Caption = 'Par'#226'metros...'
        OnClick = Parmetros1Click
      end
    end
    object Fechar1: TMenuItem
      Caption = 'Fechar'
      OnClick = Fechar1Click
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Arquivo CSV|*.csv|Arquivo Texto|*.txt|Todos os arquivos|*.*'
    Left = 185
    Top = 20
  end
  object PopupMenu1: TPopupMenu
    Left = 325
    Top = 20
    object ParametrizarEsp1: TMenuItem
      Tag = 7
      Caption = 'Parametrizar...'
      OnClick = ParametrizarItemClick
    end
    object AbrirContasdeFluxo1: TMenuItem
      Caption = 'Abrir Contas de Fluxo...'
      OnClick = ContasFluxo1Click
    end
  end
end
