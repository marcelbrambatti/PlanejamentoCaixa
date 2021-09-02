object dtmParams: TdtmParams
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 468
  Width = 640
  object sqlParams: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select *'
      'from params')
    SQLConnection = dtmConexao.SQLConnection1
    Left = 80
    Top = 50
    object sqlParamsid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object sqlParamsFornecedor: TIntegerField
      FieldName = 'Fornecedor'
    end
    object sqlParamsEstabelecimento: TIntegerField
      FieldName = 'Estabelecimento'
    end
    object sqlParamsEspecie: TStringField
      FieldName = 'Especie'
      Size = 3
    end
    object sqlParamsContaFluxo: TIntegerField
      FieldName = 'ContaFluxo'
    end
    object sqlParamsadded_at: TSQLTimeStampField
      FieldName = 'added_at'
    end
    object sqlParamstitulo: TStringField
      FieldName = 'titulo'
    end
    object sqlParamsserie: TStringField
      FieldName = 'serie'
      Size = 5
    end
    object sqlParamsparcela: TStringField
      FieldName = 'parcela'
      Size = 2
    end
  end
  object dspParams: TDataSetProvider
    DataSet = sqlParams
    Left = 80
    Top = 110
  end
  object cdsParams: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspParams'
    AfterPost = cdsParamsAfterPost
    AfterDelete = cdsParamsAfterDelete
    OnNewRecord = cdsParamsNewRecord
    OnReconcileError = cdsParamsReconcileError
    Left = 80
    Top = 170
    object cdsParamsid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object cdsParamsFornecedor: TIntegerField
      FieldName = 'Fornecedor'
    end
    object cdsParamsEstabelecimento: TIntegerField
      FieldName = 'Estabelecimento'
    end
    object cdsParamsEspecie: TStringField
      FieldName = 'Especie'
      Size = 3
    end
    object cdsParamsContaFluxo: TIntegerField
      FieldName = 'ContaFluxo'
    end
    object cdsParamsadded_at: TSQLTimeStampField
      FieldName = 'added_at'
      ReadOnly = True
    end
    object cdsParamsDesContaFluxo: TStringField
      FieldKind = fkLookup
      FieldName = 'DesContaFluxo'
      LookupDataSet = cdsContasFluxo
      LookupKeyFields = 'id'
      LookupResultField = 'conta'
      KeyFields = 'ContaFluxo'
      Size = 150
      Lookup = True
    end
    object cdsParamstitulo: TStringField
      FieldName = 'titulo'
    end
    object cdsParamsserie: TStringField
      FieldName = 'serie'
      Size = 5
    end
    object cdsParamsparcela: TStringField
      FieldName = 'parcela'
      Size = 2
    end
  end
  object sqlBuscaParam: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'select params.*, contasfluxo.id idcontafluxo, contasfluxo.conta,' +
        ' contasfluxo.descricao'
      'from params'
      'inner join contasfluxo on params.ContaFluxo = contasfluxo.id')
    SQLConnection = dtmConexao.SQLConnection1
    Left = 190
    Top = 50
    object IntegerField1: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object IntegerField2: TIntegerField
      FieldName = 'Fornecedor'
    end
    object IntegerField3: TIntegerField
      FieldName = 'Estabelecimento'
    end
    object StringField1: TStringField
      FieldName = 'Especie'
      Size = 3
    end
    object IntegerField4: TIntegerField
      FieldName = 'ContaFluxo'
    end
    object sqlBuscaParamidcontafluxo: TIntegerField
      FieldName = 'idcontafluxo'
      Required = True
    end
    object sqlBuscaParamdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object sqlBuscaParamconta: TStringField
      FieldName = 'conta'
      Size = 50
    end
    object sqlBuscaParamtitulo: TStringField
      FieldName = 'titulo'
    end
    object sqlBuscaParamserie: TStringField
      FieldName = 'serie'
      Size = 5
    end
    object sqlBuscaParamparcela: TStringField
      FieldName = 'parcela'
      Size = 2
    end
    object sqlBuscaParamadded_at: TSQLTimeStampField
      FieldName = 'added_at'
    end
  end
  object cdsBuscaParam: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBuscaParam'
    AfterPost = cdsParamsAfterPost
    OnReconcileError = cdsParamsReconcileError
    Left = 190
    Top = 170
    object cdsBuscaParamid: TIntegerField
      FieldName = 'id'
    end
    object cdsBuscaParamFornecedor: TIntegerField
      FieldName = 'Fornecedor'
    end
    object cdsBuscaParamEstabelecimento: TIntegerField
      FieldName = 'Estabelecimento'
    end
    object cdsBuscaParamEspecie: TStringField
      FieldName = 'Especie'
      Size = 3
    end
    object cdsBuscaParamContaFluxo: TIntegerField
      FieldName = 'ContaFluxo'
    end
    object cdsBuscaParamidcontafluxo: TIntegerField
      FieldName = 'idcontafluxo'
      Required = True
    end
    object cdsBuscaParamdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object cdsBuscaParamconta: TStringField
      FieldName = 'conta'
      Size = 50
    end
    object cdsBuscaParamtitulo: TStringField
      FieldName = 'titulo'
    end
    object cdsBuscaParamserie: TStringField
      FieldName = 'serie'
      Size = 5
    end
    object cdsBuscaParamparcela: TStringField
      FieldName = 'parcela'
      Size = 2
    end
    object cdsBuscaParamadded_at: TSQLTimeStampField
      FieldName = 'added_at'
    end
  end
  object dspBuscaParam: TDataSetProvider
    DataSet = sqlBuscaParam
    Left = 190
    Top = 110
  end
  object sqlContasFluxo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select id, concat(conta, " - ", descricao) as conta, nivel'
      'from contasfluxo'
      'order by conta')
    SQLConnection = dtmConexao.SQLConnection1
    Left = 295
    Top = 50
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
    Left = 295
    Top = 105
  end
  object cdsContasFluxo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContasFluxo'
    Left = 295
    Top = 170
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
end
