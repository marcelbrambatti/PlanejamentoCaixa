unit frmCadParams;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TformCadParams = class(TForm)
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCadParams: TformCadParams;

implementation

{$R *.dfm}

uses dmParams;

procedure TformCadParams.FormShow(Sender: TObject);
begin
  with dtmParams do
  begin
    cdsContasFluxo.Close;
    cdsContasFluxo.Open;
    cdsParams.Close;
    cdsParams.Open;
    cdsBuscaParam.Close;
    cdsBuscaParam.Open;
  end;
end;

end.
