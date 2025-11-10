unit unit_socio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, BitBtn1, DB, ADODB;

type
  Tform_socios = class(TForm)
    edt_nome: TEdit;
    edt_renda: TEdit;
    rd_ativo: TRadioButton;
    btn_novo: TBitBtn1;
    btn_alterar: TBitBtn1;
    btn_excluir: TBitBtn1;
    Label1: TLabel;
    Label2: TLabel;
    ADOQuery_aux: TADOQuery;
    btn_localizar: TBitBtn1;
    btn_salvar: TBitBtn1;
    btn_cancelar: TBitBtn1;
    rd_inativo: TRadioButton;
    procedure edt_nomeKeyPress(Sender: TObject; var Key: Char);
    procedure btn_localizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
  private
  public
    operacao, pk : string;
    procedure desabilita_salvar(Sender : TObject);
    procedure habilita_salvar(Sender : TObject);
    procedure bloqueia_campos;
    procedure libera_campos;
    procedure limpa_campos;
  end;

var
  form_socios: Tform_socios;

implementation

uses unit_menu, unit_pesquisa;

{$R *.dfm}

procedure Tform_socios.edt_nomeKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['A'..'Z','a'..'z', #8, #32]) then
    Key := #0;
end;

procedure Tform_socios.btn_localizarClick(Sender: TObject);
begin
  limpa_campos;
  bloqueia_campos;
  desabilita_salvar(Sender);

  form_pesquisa.sql_pesquisa :=
    'SELECT nome, CASE WHEN ativo = 1 THEN ''Ativo'' ELSE ''Inativo'' END AS status FROM sócios';
  form_pesquisa.ShowModal;

  if form_pesquisa.chave <> '' then
  begin
    pk := form_pesquisa.chave;
    ADOQuery_aux.SQL.Text := 'SELECT * FROM sócios WHERE nome = ' + QuotedStr(pk);
    ADOQuery_aux.Open;

    edt_nome.Text := ADOQuery_aux.FieldByName('nome').AsString;
    edt_renda.Text := ADOQuery_aux.FieldByName('renda').AsString;

    if ADOQuery_aux.FieldByName('ativo').AsBoolean then
      rd_ativo.Checked := True
    else
      rd_inativo.Checked := True;
  end;
end;

procedure Tform_socios.bloqueia_campos;
var
  i: Integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if Components[i] is TEdit then
    begin
      (Components[i] as TEdit).Enabled := False;
      (Components[i] as TEdit).Color := clinfobk;
    end;
  end;
end;

procedure Tform_socios.desabilita_salvar(Sender: TObject);
begin
  btn_novo.Enabled := True;
  btn_salvar.Enabled := False;
  btn_alterar.Enabled := True;
  btn_cancelar.Enabled := False;
  btn_excluir.Enabled := True;

  if Sender = btn_novo then operacao := 'novo'
  else if Sender = btn_salvar then operacao := 'salvar'
  else if Sender = btn_alterar then operacao := 'alterar'
  else if Sender = btn_cancelar then operacao := 'cancelar'
  else if Sender = btn_excluir then operacao := 'excluir';
end;

procedure Tform_socios.habilita_salvar(Sender: TObject);
begin
  btn_novo.Enabled := False;
  btn_salvar.Enabled := True;
  btn_alterar.Enabled := False;
  btn_cancelar.Enabled := True;
  btn_excluir.Enabled := False;

  if Sender = btn_novo then operacao := 'novo'
  else if Sender = btn_salvar then operacao := 'salvar'
  else if Sender = btn_alterar then operacao := 'alterar'
  else if Sender = btn_cancelar then operacao := 'cancelar'
  else if Sender = btn_excluir then operacao := 'excluir';
end;

procedure Tform_socios.libera_campos;
var
  i: Integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if Components[i] is TEdit then
    begin
      (Components[i] as TEdit).Enabled := True;
      (Components[i] as TEdit).Color := clWindow;
    end;
  end;
end;

procedure Tform_socios.limpa_campos;
var
  i: Integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if Components[i] is TEdit then
      (Components[i] as TEdit).Clear;
  end;
end;

procedure Tform_socios.FormShow(Sender: TObject);
begin
  bloqueia_campos;
  limpa_campos;
  desabilita_salvar(Sender);
  rd_ativo.Enabled := False;
  rd_inativo.Enabled := False;
end;

procedure Tform_socios.btn_novoClick(Sender: TObject);
begin
  limpa_campos;
  libera_campos;
  pk := '';
  habilita_salvar(Sender);
  rd_ativo.Enabled := True;
  rd_inativo.Enabled := True;
  rd_ativo.Checked := False;
  rd_inativo.Checked := False;
end;

procedure Tform_socios.btn_salvarClick(Sender: TObject);
var
  ativoValor: Integer;
  rendaValor: Double;
begin
  if (edt_nome.Text = '') or (edt_renda.Text = '') then
  begin
    ShowMessage('Preencha todos os campos');
    Exit;
  end;

  if Length(Trim(edt_nome.Text)) < 5 then
  begin
    ShowMessage('O nome deve ter pelo menos 5 letras!');
    Exit;
  end;

  if not TryStrToFloat(edt_renda.Text, rendaValor) then
  begin
    ShowMessage('Renda inválida! Digite apenas números.');
    Exit;
  end;

  if rendaValor < 0 then
  begin
    ShowMessage('Renda deve ser maior ou igual a zero!');
    Exit;
  end;

  if rd_ativo.Checked then
    ativoValor := 1
  else
    ativoValor := 0;

  ADOQuery_aux.Close;
  ADOQuery_aux.SQL.Clear;

 if operacao = 'novo' then
  ADOQuery_aux.SQL.Text :=
    'INSERT INTO sócios (nome, renda, ativo) VALUES (' +
    QuotedStr(edt_nome.Text) + ', ' +
    StringReplace(FloatToStrF(rendaValor, ffFixed, 15, 2), ',', '.', [rfReplaceAll]) + ', ' +
    IntToStr(ativoValor) + ')'
 else if operacao = 'alterar' then
  ADOQuery_aux.SQL.Text :=
    'UPDATE sócios SET ' +
    'nome = ' + QuotedStr(edt_nome.Text) + ', ' +
    'renda = ' + StringReplace(FloatToStrF(rendaValor, ffFixed, 15, 2), ',', '.', [rfReplaceAll]) + ', ' +
    'ativo = ' + IntToStr(ativoValor) +
    ' WHERE nome = ' + QuotedStr(pk);

  ADOQuery_aux.ExecSQL;

  pk := edt_nome.Text;
  desabilita_salvar(Sender);
  bloqueia_campos;
  rd_ativo.Enabled := False;
  rd_inativo.Enabled := False;
end;

procedure Tform_socios.btn_cancelarClick(Sender: TObject);
begin
  if operacao = 'novo' then
    limpa_campos;
  desabilita_salvar(Sender);
  bloqueia_campos;
end;

procedure Tform_socios.btn_excluirClick(Sender: TObject);
begin
  if pk = '' then
    ShowMessage('Impossível excluir')
  else
  begin
    ADOQuery_aux.SQL.Text := 'DELETE FROM sócios WHERE nome = ' + QuotedStr(pk);
    ADOQuery_aux.ExecSQL;
    pk := '';
    desabilita_salvar(Sender);
    limpa_campos;
    bloqueia_campos;
    rd_ativo.Checked := False;
    rd_inativo.Checked := False;
  end;
end;

procedure Tform_socios.btn_alterarClick(Sender: TObject);
begin
  if pk = '' then
    ShowMessage('Impossível alterar')
  else
  begin
    operacao := 'alterar';
    libera_campos;
    btn_salvar.Enabled := True;
    rd_ativo.Enabled := True;
    rd_inativo.Enabled := True;
    btn_alterar.Enabled := False;
    btn_novo.Enabled := False;
    btn_cancelar.Enabled := True;
    btn_excluir.Enabled := False;
  end;
end;
end.
