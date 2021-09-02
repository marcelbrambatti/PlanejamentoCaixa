program UnimedFluxo;

uses
  Vcl.Forms,
  frmMenu in 'frmMenu.pas' {formMenu},
  dmConexao in 'dmConexao.pas' {dtmConexao: TDataModule},
  dmParams in 'dmParams.pas' {dtmParams: TDataModule},
  frmSelContaFluxo in 'frmSelContaFluxo.pas' {formSelContaFluxo},
  frmCadContaFluxo in 'frmCadContaFluxo.pas' {formCadContaFluxo},
  dmContaFluxo in 'dmContaFluxo.pas' {dtmContaFluxo: TDataModule},
  frmCadParams in 'frmCadParams.pas' {formCadParams},
  frmLocaliza in 'frmLocaliza.pas' {formLocaliza};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdtmConexao, dtmConexao);
  Application.CreateForm(TdtmParams, dtmParams);
  Application.CreateForm(TformMenu, formMenu);
  Application.Run;
end.
