unit frmSelContaFluxo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Datasnap.DBClient, Datasnap.Provider;

type
  TformSelContaFluxo = class(TForm)
    edContaFluxo: TDBLookupComboBox;
    Label1: TLabel;
    edFornecedor: TEdit;
    edEstab: TEdit;
    edEspecie: TEdit;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    sqlContasFluxo: TSQLQuery;
    sqlContasFluxoid: TIntegerField;
    sqlContasFluxoconta: TStringField;
    sqlContasFluxonivel: TIntegerField;
    dspContasFluxo: TDataSetProvider;
    cdsContasFluxo: TClientDataSet;
    cdsContasFluxoid: TIntegerField;
    cdsContasFluxoconta: TStringField;
    cdsContasFluxonivel: TIntegerField;
    dsContasFluxo: TDataSource;
    chkFornec: TCheckBox;
    chkEstab: TCheckBox;
    chkEspecie: TCheckBox;
    edTitulo: TEdit;
    chkTitulo: TCheckBox;
    edSerie: TEdit;
    chkSerie: TCheckBox;
    edParcela: TEdit;
    chkParcela: TCheckBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formSelContaFluxo: TformSelContaFluxo;

implementation

{$R *.dfm}

uses dmConexao;

procedure TformSelContaFluxo.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := ((edContaFluxo.Text <> '') and (ModalResult = mrOk)) or
              (ModalResult = mrCancel);
end;

procedure TformSelContaFluxo.FormCreate(Sender: TObject);
begin
  cdsContasFluxo.Close;
  cdsContasFluxo.Open;
end;

end.
