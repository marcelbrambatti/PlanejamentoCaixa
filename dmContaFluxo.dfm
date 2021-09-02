object dtmContaFluxo: TdtmContaFluxo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 444
  Width = 486
  object sqlContasFluxo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select *'
      'from contasfluxo'
      'order by conta, descricao')
    SQLConnection = dtmConexao.SQLConnection1
    Left = 80
    Top = 50
    object sqlContasFluxoid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Visible = False
    end
    object sqlContasFluxoconta: TStringField
      FieldName = 'conta'
      Size = 50
    end
    object sqlContasFluxodescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object sqlContasFluxonivel: TIntegerField
      FieldName = 'nivel'
    end
  end
  object dspContasFluxo: TDataSetProvider
    DataSet = sqlContasFluxo
    Left = 80
    Top = 105
  end
  object cdsContasFluxo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContasFluxo'
    AfterPost = cdsContasFluxoAfterPost
    AfterDelete = cdsContasFluxoAfterDelete
    OnNewRecord = cdsContasFluxoNewRecord
    OnReconcileError = cdsContasFluxoReconcileError
    Left = 80
    Top = 165
    object cdsContasFluxoid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Visible = False
    end
    object cdsContasFluxoconta: TStringField
      FieldName = 'conta'
      Size = 50
    end
    object cdsContasFluxodescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
  end
end
