unit frmCadContaFluxo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TformCadContaFluxo = class(TForm)
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCadContaFluxo: TformCadContaFluxo;

implementation

{$R *.dfm}

uses dmContaFluxo;

end.
