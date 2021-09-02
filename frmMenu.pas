unit frmMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TformMenu = class(TForm)
    cdsDados: TClientDataSet;
    DataSource1: TDataSource;
    MainMenu1: TMainMenu;
    CarregarDados1: TMenuItem;
    itemImportarPagtos: TMenuItem;
    OpenDialog1: TOpenDialog;
    DBGrid1: TDBGrid;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    ParametrizarEsp1: TMenuItem;
    ProcessarParmetros1: TMenuItem;
    ParametrizarEsp2: TMenuItem;
    Pendentes1: TMenuItem;
    Exportar1: TMenuItem;
    GerarCSV1: TMenuItem;
    Fechar1: TMenuItem;
    ProgressBar1: TProgressBar;
    Cadastros1: TMenuItem;
    ContasFluxo1: TMenuItem;
    Parmetros1: TMenuItem;
    AbrirContasdeFluxo1: TMenuItem;
    Parametrizar1: TMenuItem;
    Processarpendentes1: TMenuItem;
    procedure itemImportarPagtosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ParametrizarItemClick(Sender: TObject);
    procedure ProcessarParmetros1Click(Sender: TObject);
    procedure Pendentes1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Fechar1Click(Sender: TObject);
    procedure ContasFluxo1Click(Sender: TObject);
    procedure Parmetros1Click(Sender: TObject);
    procedure GerarCSV1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Processarpendentes1Click(Sender: TObject);
  private
    { Private declarations }
    procedure LoadFromFileCSV(FileName: string; hasHeader: boolean);
    procedure SaveToFileCSV(FileName: string);
    procedure ProcessarRegistros;
  public
    { Public declarations }
  end;

var
  formMenu: TformMenu;

implementation

{$R *.dfm}

uses frmSelContaFluxo, dmParams, dmConexao, dmContaFluxo, frmCadContaFluxo, frmCadParams, frmLocaliza;

procedure TformMenu.ParametrizarItemClick(Sender: TObject);
var
  fornec, estab: Integer;
  espec, serie, titulo, parcela: string;
begin
  formSelContaFluxo := TformSelContaFluxo.Create(self);
  try
    with formSelContaFluxo do
    begin
      edFornecedor.Text := cdsDados.FieldByName('NomeAbreviado').AsString;
      fornec            := 0;
      edEstab.Text      := cdsDados.FieldByName('Estabelecimento').AsString;
      estab             := 0;
      edEspecie.Text    := cdsDados.FieldByName('EspecieDocumento').AsString;
      espec             := '';
      edTitulo.Text     := cdsDados.FieldByName('Titulo').AsString;
      titulo            := '';
      edParcela.Text    := cdsDados.FieldByName('Parcela').AsString;
      parcela           := '';
      edSerie.Text      := cdsDados.FieldByName('SerieDocumento').AsString;
      serie             := '';

      if ShowModal = mrOk then
      begin
        if not dtmConexao.transacaoAtiva then
          dtmConexao.iniciarTransacao;

        if chkFornec.Checked then
          fornec := cdsDados.FieldByName('Fornecedor').AsInteger;
        if chkEstab.Checked then
          estab := cdsDados.FieldByName('Estabelecimento').AsInteger;
        if chkEspecie.Checked then
          espec := cdsDados.FieldByName('EspecieDocumento').AsString;
        if chkTitulo.Checked then
          titulo := cdsDados.FieldByName('Titulo').AsString;
        if chkSerie.Checked then
          serie := cdsDados.FieldByName('SerieDocumento').AsString;
        if chkParcela.Checked then
          parcela := cdsDados.FieldByName('Parcela').AsString;

        dtmParams.Parametrizar(fornec, estab, espec, serie, titulo, parcela, cdsContasFluxoid.AsInteger);
        StatusBar1.Panels[0].Text := 'Parametrizado!';
      end
      else
        StatusBar1.Panels[0].Text := 'Cancelado!';
    end;
  finally
    if dtmConexao.transacaoAtiva then
      dtmConexao.gravarTransacao;
    FreeAndNil(formSelContaFluxo);
  end;

end;

procedure TformMenu.Parmetros1Click(Sender: TObject);
begin
  formCadParams := TformCadParams.Create(self);
  try
    formCadParams.ShowModal;
  finally
    FreeAndNil(formCadParams);
  end;
end;

procedure TformMenu.Pendentes1Click(Sender: TObject);
begin
  cdsDados.Filtered := not cdsDados.Filtered;
  if cdsDados.Filtered then
    Pendentes1.Caption := 'Mostrar todos...'
  else
    Pendentes1.Caption      := 'Mostrar Pendentes...';
  StatusBar1.Panels[1].Text := IntToStr(cdsDados.RecordCount) + ' registro(s).';
end;

procedure TformMenu.ProcessarParmetros1Click(Sender: TObject);
var
  oldFiltered: boolean;
  oldIndex: string;
begin
  oldFiltered              := cdsDados.Filtered;
  oldIndex                 := cdsDados.IndexFieldNames;
  cdsDados.IndexFieldNames := '';
  if Processarpendentes1.Checked then
    cdsDados.Filtered := True;
  try
    ProcessarRegistros;
  finally
    cdsDados.Filtered        := oldFiltered;
    cdsDados.IndexFieldNames := oldIndex;
    if oldFiltered then
      StatusBar1.Panels[1].Text := IntToStr(cdsDados.RecordCount) + ' registro(s).';
  end;
end;

procedure TformMenu.Processarpendentes1Click(Sender: TObject);
begin
  Processarpendentes1.Checked := not Processarpendentes1.Checked;
end;

procedure TformMenu.ContasFluxo1Click(Sender: TObject);
begin
  dtmContaFluxo := TdtmContaFluxo.Create(self);
  try
    formCadContaFluxo := TformCadContaFluxo.Create(self);
    formCadContaFluxo.ShowModal;
  finally
    FreeAndNil(formCadContaFluxo);
    FreeAndNil(dtmContaFluxo);
  end;
end;

procedure TformMenu.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if cdsDados.FieldByName('Processado').asBoolean then
  begin
    DBGrid1.Canvas.Brush.Color := clSilver;
    DBGrid1.Canvas.Font.Color  := clGray;
  end;
  DBGrid1.DefaultDrawDataCell(Rect, DBGrid1.columns[DataCol].field, State);
end;

procedure TformMenu.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (formLocaliza = nil) then
  begin
    formLocaliza := TformLocaliza.Create(self);
    try
      if cdsDados.IndexFieldNames = '' then
      begin
        ShowMessage('Selecione um campo de indexação.');
        exit;
      end;
      formLocaliza.editLocaliza.Text := Key;
      if formLocaliza.ShowModal = mrOk then
        cdsDados.Locate(cdsDados.IndexFieldNames, VarArrayOf([formLocaliza.editLocaliza.Text]),
          [loCaseInsensitive, loPartialKey]);
    finally
      FreeAndNil(formLocaliza);
    end;
  end;
end;

procedure TformMenu.DBGrid1TitleClick(Column: TColumn);
begin
  if cdsDados.Active then
  begin
    if cdsDados.IndexFieldNames = Column.FieldName then
    begin
      cdsDados.IndexFieldNames  := '';
      StatusBar1.Panels[2].Text := 'Não ordenado.';
    end
    else
    begin
      cdsDados.IndexFieldNames  := Column.FieldName;
      StatusBar1.Panels[2].Text := cdsDados.IndexFieldNames;
    end;
  end
  else
    StatusBar1.Panels[2].Text := 'Não ordenado.';
end;

procedure TformMenu.Fechar1Click(Sender: TObject);
begin
  Close;
end;

procedure TformMenu.FormCreate(Sender: TObject);
begin
  cdsDados.Close;
  with cdsDados.FieldDefs do
  begin
    Clear;
    Add('DataPagamento', ftDate);
    Add('Fornecedor', ftInteger);
    Add('NomeAbreviado', ftString, 20);
    Add('Estabelecimento', ftString, 3);
    Add('EspecieDocumento', ftString, 3);
    Add('SerieDocumento', ftString, 5);
    Add('Titulo', ftString, 20);
    Add('Parcela', ftString, 2);
    Add('Portador', ftString, 5);
    Add('TalonarioCheques', ftString, 10);
    Add('ValorMulta', ftCurrency);
    Add('Valorjuros', ftCurrency);
    Add('ValorDesconto', ftCurrency);
    Add('Moeda', ftString, 4);
    Add('Descricao', ftString, 150);
    Add('DataVencimento', ftDate);
    Add('Safra', ftString, 10);
    Add('ContratoGraos', ftString, 10);
    Add('ContratoCartao', ftString, 10);
    Add('NumCheque', ftString, 10);
    Add('ValorCorMonetaria', ftCurrency);
    Add('ValorAbatimento', ftCurrency);
    Add('VlDespBanc', ftCurrency);
    Add('Moeda2', ftString, 4);
    Add('ValorOriginal', ftCurrency);
    Add('ValorPagamento', ftCurrency);
    Add('ValorLiquido', ftCurrency);
    Add('UnidNegocio', ftString, 10);
    // Controle
    Add('Processado', ftBoolean);
    Add('idContaFluxo', ftInteger);
    Add('ContaFluxo', ftString, 20);
    Add('DescricaoFluxo', ftString, 150);
    Add('Regra', ftString, 6);
  end;
  cdsDados.CreateDataSet;
  cdsDados.Filter           := 'Processado = False';
  StatusBar1.Panels[2].Text := 'Não ordenado.';
end;

procedure TformMenu.GerarCSV1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    try
      StatusBar1.Panels[0].Text := 'Exportando dados...';
      Application.ProcessMessages;
      SaveToFileCSV(OpenDialog1.FileName);
    finally
      StatusBar1.Panels[0].Text := 'Concluída exportação!';
      StatusBar1.Panels[1].Text := IntToStr(cdsDados.RecordCount) + ' registro(s) exportado(s).';
    end;
  end;
end;

procedure TformMenu.itemImportarPagtosClick(Sender: TObject);
var
  ret: boolean;
begin
  if OpenDialog1.Execute then
  begin
    ret := MessageDlg('O arquivo possui header?', mtConfirmation, [mbYes, mbNo], 0) = mrYes;
    try
      StatusBar1.Panels[0].Text := 'Carregando dados...';
      Application.ProcessMessages;
      LoadFromFileCSV(OpenDialog1.FileName, ret);
    finally
      StatusBar1.Panels[0].Text := 'Concluída carga!';
      StatusBar1.Panels[1].Text := IntToStr(cdsDados.RecordCount) + ' registro(s).';
    end;
  end;
end;

procedure TformMenu.LoadFromFileCSV(FileName: string; hasHeader: boolean);
var
  csv: TextFile;
  Rec: string;
  Fields: TStringList;
  LineNo: Integer;
  i: Integer;
begin
  cdsDados.Close;
  cdsDados.CreateDataSet;
  cdsDados.DisableControls;
  Fields := TStringList.Create;
  try
    Fields.StrictDelimiter := True;
    Fields.Delimiter       := ';';

    AssignFile(csv, FileName);
    try
      Reset(csv);

      LineNo := 0;
      if hasHeader then
        Readln(csv, Rec);
      while not Eof(csv) do
      begin
        Inc(LineNo);

        Readln(csv, Rec);

        Fields.DelimitedText := Rec;
        cdsDados.Append;

        for i := 0 to Fields.Count - 1 do
          try
            cdsDados.Fields[i].Value := Fields[i];
          except
            on E: EDatabaseError do
            begin
              cdsDados.Cancel;
              ShowMessage(Format('Cannot set field "%s" at line %d' + sLineBreak + 'Error: %s',
                [cdsDados.Fields[i].FieldName, LineNo, E.Message]));
              Break;
            end;
          end;

        if cdsDados.State = dsInsert then
          try
            cdsDados.Post;
          except
            on E: EDatabaseError do
            begin
              ShowMessage(Format('Cannot post line %d' + sLineBreak + 'Error: %s', [LineNo, E.Message]));
              cdsDados.Cancel;
            end;
          end;

      end;
    finally
      CloseFile(csv);
    end;
  finally
    Fields.Free;
    cdsDados.EnableControls;
  end;
end;

procedure TformMenu.SaveToFileCSV(FileName: string);
var
  csv: TextFile;
  Rec: string;
  Fields: TStringList;
  LineNo: Integer;
  i: Integer;
begin
  ProgressBar1.Min      := 0;
  ProgressBar1.Max      := cdsDados.RecordCount;
  ProgressBar1.Step     := 1;
  ProgressBar1.Position := 0;
  ProgressBar1.Visible  := True;

  Fields := TStringList.Create;
  try
    AssignFile(csv, FileName);
    try
      Rewrite(csv);
      // LineNo := 0;

      Rec   := '';
      for i := 0 to cdsDados.FieldCount - 1 do
      begin
        Rec := Rec + cdsDados.Fields[i].FieldName;
        if (i <> cdsDados.FieldCount - 1) then
          Rec := Rec + ';';
      end;
      Writeln(csv, Rec);

      cdsDados.First;
      cdsDados.DisableControls;
      while not cdsDados.Eof do
      begin
        Inc(LineNo);
        Rec   := '';
        for i := 0 to cdsDados.FieldCount - 1 do
        begin
          Rec := Rec + cdsDados.Fields[i].AsString;
          if (i <> Fields.Count - 1) then
            Rec := Rec + ';';
        end;
        Writeln(csv, Rec);
        cdsDados.Next;
        ProgressBar1.StepIt;
        Application.ProcessMessages;
      end;

    finally
      cdsDados.EnableControls;
      CloseFile(csv);
    end;
  finally
    ProgressBar1.Visible := False;
    Fields.Free;
  end;
end;

procedure TformMenu.ProcessarRegistros;
var
  fornec, estab: Integer;
  espec, serie, titulo, parcela: string;
  oldIndex, filtro: string;
  mat: TStringList;
  testeFiltro: string;
  atualizado: boolean;
  i: Integer;
begin
  ProgressBar1.Min      := 0;
  ProgressBar1.Max      := cdsDados.RecordCount;
  ProgressBar1.Step     := 1;
  ProgressBar1.Position := 0;
  ProgressBar1.Visible  := True;

  mat      := TStringList.Create;
  mat.Text := dtmParams.getMatriz;

  cdsDados.DisableControls;
  oldIndex                 := cdsDados.IndexFieldNames;
  cdsDados.IndexFieldNames := '';
  Application.ProcessMessages;
  try
    with dtmParams do
    begin
      cdsBuscaParam.Close;
      cdsBuscaParam.Open;
      cdsDados.First;
      while not cdsDados.Eof do
      begin
        if not cdsDados.IsEmpty then
        begin
          fornec  := cdsDados.FieldByName('Fornecedor').AsInteger;
          estab   := cdsDados.FieldByName('Estabelecimento').AsInteger;
          espec   := cdsDados.FieldByName('EspecieDocumento').AsString;
          serie   := cdsDados.FieldByName('SerieDocumento').AsString;
          titulo  := cdsDados.FieldByName('Titulo').AsString;
          parcela := cdsDados.FieldByName('Parcela').AsString;

          for i := 0 to mat.Count - 1 do
          begin
            testeFiltro := mat[i];
            if copy(testeFiltro, 1, 1) = 'S' then
              filtro := '(Fornecedor = ' + IntToStr(fornec) + ')'
            else
              filtro := '(Fornecedor IS NULL)';

            if copy(testeFiltro, 2, 1) = 'S' then
              filtro := filtro + ' and (Estabelecimento = ' + IntToStr(estab) + ')'
            else
              filtro := filtro + ' and (Estabelecimento IS NULL)';

            if copy(testeFiltro, 3, 1) = 'S' then
              filtro := filtro + ' and ((Especie = ' + QuotedStr(LowerCase(espec)) + ') or ' + '(Especie = ' +
                QuotedStr(UpperCase(espec)) + '))'
            else
              filtro := filtro + ' and (Especie IS NULL)';

            if copy(testeFiltro, 4, 1) = 'S' then
              filtro := filtro + ' and ((Serie = ' + QuotedStr(LowerCase(serie)) + ') or ' + '(Serie = ' +
                QuotedStr(UpperCase(serie)) + '))'
            else
              filtro := filtro + ' and (Serie IS NULL)';

            if copy(testeFiltro, 5, 1) = 'S' then
              filtro := filtro + ' and ((Titulo = ' + QuotedStr(LowerCase(titulo)) + ') or ' + '(Titulo = ' +
                QuotedStr(UpperCase(titulo)) + '))'
            else
              filtro := filtro + ' and (Titulo IS NULL)';

            if copy(testeFiltro, 6, 1) = 'S' then
              filtro := filtro + ' and ((Parcela = ' + QuotedStr(LowerCase(parcela)) + ') or ' + ' (Parcela = ' +
                QuotedStr(UpperCase(parcela)) + '))'
            else
              filtro := filtro + ' and (Parcela IS NULL)';

            cdsBuscaParam.Filtered := False;
            cdsBuscaParam.Filter   := filtro;
            cdsBuscaParam.Filtered := True;
            if not cdsBuscaParam.IsEmpty then
            begin
              cdsBuscaParam.First;
              Break;
            end;
          end;

          atualizado := False;
          cdsDados.Edit;
          if cdsBuscaParamidcontafluxo.AsInteger <> 0 then
          begin
            cdsDados.FieldByName('Processado').Value       := True;
            cdsDados.FieldByName('idContaFluxo').AsInteger := cdsBuscaParamidcontafluxo.AsInteger;
            cdsDados.FieldByName('ContaFluxo').AsString    := cdsBuscaParamconta.AsString;
            cdsDados.FieldByName('DescricaoFluxo').AsString := cdsBuscaParamdescricao.AsString;
            cdsDados.FieldByName('Regra').AsString := testeFiltro;
            atualizado := True;
          end
          else
          begin
            cdsDados.FieldByName('Processado').Value := False;
            cdsDados.FieldByName('idContaFluxo').Clear;
            cdsDados.FieldByName('ContaFluxo').Clear;
            cdsDados.FieldByName('DescricaoFluxo').Clear;
            cdsDados.FieldByName('Regra').Clear;
          end;
          cdsDados.Post;

        end;
        if cdsDados.Fields[0].AsString = '' then
          cdsDados.Delete
        else
        begin
          if not atualizado or not cdsDados.Filtered then
            cdsDados.Next;
          ProgressBar1.StepIt;
          Application.ProcessMessages;
        end;
      end;
    end;
  finally
    cdsDados.IndexFieldNames := oldIndex;
    cdsDados.EnableControls;
    ProgressBar1.Visible := False;
    FreeAndNil(mat);
  end;
end;

end.
