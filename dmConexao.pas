unit dmConexao;

interface

uses
  System.SysUtils, System.Classes, Data.DBXMySQL, Data.DB, Data.SqlExpr, Data.DBXCommon,
  Vcl.Forms, Vcl.Dialogs, Data.FMTBcd;

const
  ARQUIVO_NAO_ENCONTRADO = 'Arquivo de configuração não encontrado.';
  ERRO_AO_CONECTAR = 'Não foi possível conectar ao banco de dados.';
  INICIE_TRANSACAO = 'Inicie uma transação antes de executar essa ação.';
  TRANSACAO_ATIVA = 'Já existe uma transação ativa.';

type
  TdtmConexao = class(TDataModule)
    SQLConnection1: TSQLConnection;
    sqlPrimaryKey: TSQLQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    transacao: TDBXTransaction;
    procedure OpenConnection;
  public
    { Public declarations }
    // Transação
    function transacaoAtiva: boolean;
    procedure iniciarTransacao;
    procedure cancelarTransacao;
    procedure gravarTransacao;
    function getPrimaryKey(table, field: string): integer;
  end;

var
  dtmConexao: TdtmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

{ TdtmConexao }

procedure TdtmConexao.cancelarTransacao;
begin
  if not transacaoAtiva then
  begin
    MessageDlg(INICIE_TRANSACAO, mtInformation, [mbOK], 0, mbOK);
    exit;
  end;
  SQLConnection1.RollbackFreeAndNil(transacao);
end;

procedure TdtmConexao.DataModuleCreate(Sender: TObject);
begin
  OpenConnection;
end;

function TdtmConexao.getPrimaryKey(table, field: string): integer;
begin
  try
    sqlPrimaryKey.Close;
    sqlPrimaryKey.SQL.Clear;
    sqlPrimaryKey.SQL.Add('select max(' + field + ')+1  id from ' + table + ';');
    sqlPrimaryKey.Open;
    if sqlPrimaryKey.Fields[0].IsNull then
      result := 1
    else
      result := sqlPrimaryKey.Fields[0].AsInteger;
  finally
    sqlPrimaryKey.Close;
  end;
end;

procedure TdtmConexao.gravarTransacao;
begin
  if not transacaoAtiva then
  begin
    MessageDlg(INICIE_TRANSACAO, mtInformation, [mbOK], 0, mbOK);
    exit;
  end;
  SQLConnection1.CommitFreeAndNil(transacao);
end;

procedure TdtmConexao.iniciarTransacao;
begin
  if transacaoAtiva then
  begin
    MessageDlg(TRANSACAO_ATIVA, mtInformation, [mbOK], 0, mbOK);
    exit;
  end;
  transacao := SQLConnection1.BeginTransaction;
end;

function TdtmConexao.transacaoAtiva: boolean;
begin
  result := SQLConnection1.InTransaction;
end;

procedure TdtmConexao.OpenConnection;
begin
  if not FileExists('./properties.db') then
  begin
    MessageDlg(ARQUIVO_NAO_ENCONTRADO, mtError, [mbOK], 0, mbOK);
    Application.Terminate;
  end;

  try
    SQLConnection1.CloneConnection;
    SQLConnection1.Params.LoadFromFile('./properties.db');
    SQLConnection1.Open;
  except
    on e:exception do
    begin
      MessageDlg(ERRO_AO_CONECTAR + ' ' + e.Message, mtError, [mbOK], 0, mbOK);
      Application.Terminate;
    end;
  end;
end;

end.
