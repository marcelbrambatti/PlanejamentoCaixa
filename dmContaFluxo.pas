unit dmContaFluxo;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr, Dialogs;

type
  TdtmContaFluxo = class(TDataModule)
    sqlContasFluxo: TSQLQuery;
    dspContasFluxo: TDataSetProvider;
    cdsContasFluxo: TClientDataSet;
    sqlContasFluxoid: TIntegerField;
    sqlContasFluxoconta: TStringField;
    sqlContasFluxodescricao: TStringField;
    sqlContasFluxonivel: TIntegerField;
    cdsContasFluxoid: TIntegerField;
    cdsContasFluxoconta: TStringField;
    cdsContasFluxodescricao: TStringField;
    procedure cdsContasFluxoReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsContasFluxoAfterPost(DataSet: TDataSet);
    procedure cdsContasFluxoAfterDelete(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsContasFluxoNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmContaFluxo: TdtmContaFluxo;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses dmConexao;

{$R *.dfm}

procedure TdtmContaFluxo.cdsContasFluxoAfterDelete(DataSet: TDataSet);
begin
  cdsContasFluxo.ApplyUpdates(-1);
end;

procedure TdtmContaFluxo.cdsContasFluxoAfterPost(DataSet: TDataSet);
begin
  cdsContasFluxo.ApplyUpdates(-1);
end;

procedure TdtmContaFluxo.cdsContasFluxoNewRecord(DataSet: TDataSet);
begin
  cdsContasFluxoid.Value := dtmConexao.getPrimaryKey('contasfluxo', 'id');
end;

procedure TdtmContaFluxo.cdsContasFluxoReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  ShowMessage(e.Message);
  Action := raCancel;
end;

procedure TdtmContaFluxo.DataModuleCreate(Sender: TObject);
begin
  cdsContasFluxo.Close;
  cdsContasFluxo.Open;
end;

end.
