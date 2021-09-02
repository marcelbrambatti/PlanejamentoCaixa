unit dmParams;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider, Data.DB, Data.SqlExpr, Dialogs;

type
  TdtmParams = class(TDataModule)
    sqlParams: TSQLQuery;
    dspParams: TDataSetProvider;
    cdsParams: TClientDataSet;
    sqlParamsid: TIntegerField;
    sqlParamsFornecedor: TIntegerField;
    sqlParamsEstabelecimento: TIntegerField;
    sqlParamsEspecie: TStringField;
    sqlParamsContaFluxo: TIntegerField;
    cdsParamsid: TIntegerField;
    cdsParamsFornecedor: TIntegerField;
    cdsParamsEstabelecimento: TIntegerField;
    cdsParamsEspecie: TStringField;
    cdsParamsContaFluxo: TIntegerField;
    sqlBuscaParam: TSQLQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    StringField1: TStringField;
    IntegerField4: TIntegerField;
    sqlBuscaParamidcontafluxo: TIntegerField;
    sqlBuscaParamdescricao: TStringField;
    sqlBuscaParamconta: TStringField;
    cdsBuscaParam: TClientDataSet;
    cdsBuscaParamid: TIntegerField;
    cdsBuscaParamFornecedor: TIntegerField;
    cdsBuscaParamEstabelecimento: TIntegerField;
    cdsBuscaParamEspecie: TStringField;
    cdsBuscaParamContaFluxo: TIntegerField;
    dspBuscaParam: TDataSetProvider;
    cdsBuscaParamidcontafluxo: TIntegerField;
    cdsBuscaParamdescricao: TStringField;
    cdsBuscaParamconta: TStringField;
    sqlParamsadded_at: TSQLTimeStampField;
    cdsParamsadded_at: TSQLTimeStampField;
    sqlContasFluxo: TSQLQuery;
    sqlContasFluxoid: TIntegerField;
    sqlContasFluxoconta: TStringField;
    sqlContasFluxonivel: TIntegerField;
    dspContasFluxo: TDataSetProvider;
    cdsContasFluxo: TClientDataSet;
    cdsContasFluxoid: TIntegerField;
    cdsContasFluxoconta: TStringField;
    cdsContasFluxonivel: TIntegerField;
    cdsParamsDesContaFluxo: TStringField;
    sqlParamstitulo: TStringField;
    sqlParamsserie: TStringField;
    sqlParamsparcela: TStringField;
    cdsParamstitulo: TStringField;
    cdsParamsserie: TStringField;
    cdsParamsparcela: TStringField;
    sqlBuscaParamtitulo: TStringField;
    sqlBuscaParamserie: TStringField;
    sqlBuscaParamparcela: TStringField;
    sqlBuscaParamadded_at: TSQLTimeStampField;
    cdsBuscaParamtitulo: TStringField;
    cdsBuscaParamserie: TStringField;
    cdsBuscaParamparcela: TStringField;
    cdsBuscaParamadded_at: TSQLTimeStampField;
    procedure cdsParamsAfterPost(DataSet: TDataSet);
    procedure cdsParamsReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsParamsAfterDelete(DataSet: TDataSet);
    procedure cdsParamsNewRecord(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Parametrizar(Forn, Estab: integer; Esp, Serie, Titulo, Parcela: string; ContaFluxo: integer);
    function getMatriz(): string;
  end;

var
  dtmParams: TdtmParams;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses dmConexao;

{$R *.dfm}

procedure TdtmParams.cdsParamsAfterDelete(DataSet: TDataSet);
begin
  cdsParams.ApplyUpdates(-1);
end;

procedure TdtmParams.cdsParamsAfterPost(DataSet: TDataSet);
begin
  cdsParams.ApplyUpdates(-1);
end;

procedure TdtmParams.cdsParamsNewRecord(DataSet: TDataSet);
begin
  cdsParamsid.Value := dtmConexao.getPrimaryKey('params', 'id');
end;

procedure TdtmParams.cdsParamsReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  ShowMessage(E.Message);
  Action := raCancel;
end;

procedure TdtmParams.DataModuleCreate(Sender: TObject);
begin
  cdsContasFluxo.Close;
  cdsContasFluxo.Open;
  cdsParams.Close;
  cdsParams.Open;
  cdsBuscaParam.Close;
  cdsBuscaParam.Open;
end;

function TdtmParams.getMatriz: string;
var
  matriz: TStringList;
begin
  matriz := TStringList.Create;
  with matriz do
  begin
    Clear;
    add('SSSSSS');
    add('SSSSSN');
    add('SSSSNS');
    add('SSSNSS');
    add('SSNSSS');
    add('SNSSSS');
    add('NSSSSS');
    add('SSSSNN');
    add('SSSNSN');
    add('SSSNNS');
    add('SSNSSN');
    add('SSNSNS');
    add('SSNNSS');
    add('SNSSSN');
    add('SNSSNS');
    add('SNSNSS');
    add('SNNSSS');
    add('NSSSSN');
    add('NSSSNS');
    add('NSSNSS');
    add('NSNSSS');
    add('NNSSSS');
    add('SSSNNN');
    add('SSNSNN');
    add('SSNNSN');
    add('SSNNNS');
    add('SNSSNN');
    add('SNSNSN');
    add('SNSNNS');
    add('SNNSSN');
    add('SNNSNS');
    add('SNNNSS');
    add('NSSSNN');
    add('NSSNSN');
    add('NSSNNS');
    add('NSNSSN');
    add('NSNSNS');
    add('NSNNSS');
    add('NNSSSN');
    add('NNSSNS');
    add('NNSNSS');
    add('NNNSSS');
    add('SSNNNN');
    add('SNSNNN');
    add('SNNSNN');
    add('SNNNSN');
    add('SNNNNS');
    add('NSSNNN');
    add('NSNSNN');
    add('NSNNSN');
    add('NSNNNS');
    add('NNSSNN');
    add('NNSNSN');
    add('NNSNNS');
    add('NNNSSN');
    add('NNNSNS');
    add('NNNNSS');
    add('SNNNNN');
    add('NSNNNN');
    add('NNSNNN');
    add('NNNSNN');
    add('NNNNSN');
    add('NNNNNS');
  end;

  result := matriz.Text;
end;

procedure TdtmParams.Parametrizar(Forn, Estab: integer; Esp, Serie, Titulo, Parcela: string; ContaFluxo: integer);
begin
  cdsParams.Append;
  cdsParamsFornecedor.Clear;
  cdsParamsEstabelecimento.Clear;
  cdsParamsEspecie.Clear;
  cdsParamsserie.Clear;
  cdsParamstitulo.Clear;
  cdsParamsparcela.Clear;
  if (Forn <> 0) then
    cdsParamsFornecedor.AsInteger := Forn;
  if (Estab <> 0) then
    cdsParamsEstabelecimento.AsInteger := Estab;
  if Trim(Esp) <> '' then
    cdsParamsEspecie.AsString := Esp;
  if Trim(Serie) <> '' then
    cdsParamsserie.AsString := Serie;
  if Trim(Titulo) <> '' then
    cdsParamstitulo.AsString := Titulo;
  if Trim(Parcela) <> '' then
    cdsParamsparcela.AsString   := Parcela;
  cdsParamsContaFluxo.AsInteger := ContaFluxo;
  cdsParams.Post;
end;

end.
