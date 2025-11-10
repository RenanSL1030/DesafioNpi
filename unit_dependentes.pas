unit unit_dependentes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, BitBtn1;

type
  Tform_dependentes = class(TForm)
    btn_novo: TBitBtn1;
    btn_cancelar: TBitBtn1;
    btn_excluir: TBitBtn1;
    btn_alterar: TBitBtn1;
    btn_salvar: TBitBtn1;
    Label1: TLabel;
    edt_nome: TEdit;
    Label2: TLabel;
    edt_idade: TEdit;
    edt_socio: TEdit;
    a: TLabel;
    BitBtn11: TBitBtn1;
    btn_socio: TBitBtn1;
    ADOQuery_aux: TADOQuery;
    procedure btn_socioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure edt_nomeKeyPress(Sender: TObject; var Key: Char);
    procedure edt_idadeKeyPress(Sender: TObject; var Key: Char);
  private
  public
    operacao, pk, id: string;
    procedure desabilita_salvar(Sender: TObject);
    procedure habilita_salvar(Sender: TObject);
    procedure bloqueia_campos;
    procedure libera_campos;
    procedure limpa_campos;
  end;

var
  form_dependentes: Tform_dependentes;

implementation

uses unit_socio, unit_menu, unit_pesquisa;

{$R *.dfm}

procedure Tform_dependentes.desabilita_salvar(Sender: TObject);
begin
  btn_novo.Enabled := True;
  btn_salvar.Enabled := False;
  btn_alterar.Enabled := True;
  btn_cancelar.Enabled := False;
  btn_excluir.Enabled := True;
  btn_socio.Enabled := False;

  if Sender = btn_novo then operacao := 'novo'
  else if Sender = btn_salvar then operacao := 'salvar'
  else if Sender = btn_alterar then operacao := 'alterar'
  else if Sender = btn_cancelar then operacao := 'cancelar'
  else if Sender = btn_excluir then operacao := 'excluir';
end;

procedure Tform_dependentes.habilita_salvar(Sender: TObject);
begin
  btn_novo.Enabled := False;
  btn_salvar.Enabled := True;
  btn_alterar.Enabled := False;
  btn_cancelar.Enabled := True;
  btn_excluir.Enabled := False;
  btn_socio.Enabled := True;

  if Sender = btn_novo then operacao := 'novo'
  else if Sender = btn_salvar then operacao := 'salvar'
  else if Sender = btn_alterar then operacao := 'alterar'
  else if Sender = btn_cancelar then operacao := 'cancelar'
  else if Sender = btn_excluir then operacao := 'excluir';
end;

procedure Tform_dependentes.bloqueia_campos;
var i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TEdit then
    begin
      (Components[i] as TEdit).Enabled := False;
      (Components[i] as TEdit).Color := clInfoBk;
    end;
end;

procedure Tform_dependentes.libera_campos;
var i: Integer; nome_obj: string;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TEdit then
    begin
      nome_obj := (Components[i] as TEdit).Name;
      if nome_obj <> 'edt_socio' then
      begin
        (Components[i] as TEdit).Enabled := True;
        (Components[i] as TEdit).Color := clWindow;
      end;
    end;
end;

procedure Tform_dependentes.limpa_campos;
var i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TEdit then
      (Components[i] as TEdit).Clear;
end;

procedure Tform_dependentes.btn_socioClick(Sender: TObject);
begin
  edt_socio.Clear;
  form_pesquisa.sql_pesquisa := 'SELECT * FROM sócios';
  form_pesquisa.ShowModal;

  if form_pesquisa.chave <> '' then
  begin
    id := form_pesquisa.chave;
    ADOQuery_aux.Close;
    ADOQuery_aux.SQL.Text := 'SELECT nome FROM sócios WHERE id = ' + id;
    ADOQuery_aux.Open;
    edt_socio.Text := ADOQuery_aux.FieldByName('nome').AsString;
  end;
end;

procedure Tform_dependentes.FormShow(Sender: TObject);
begin
  pk := '';
  id := '';
  operacao := '';
  limpa_campos;
  bloqueia_campos;
  desabilita_salvar(Sender);
end;

procedure Tform_dependentes.btn_novoClick(Sender: TObject);
begin
  libera_campos;
  limpa_campos;
  pk := '';
  id := '';
  habilita_salvar(Sender);
end;

procedure Tform_dependentes.btn_salvarClick(Sender: TObject);
begin
  if (edt_nome.Text = '') or (edt_idade.Text = '') or (edt_socio.Text = '') then
  begin
    ShowMessage('Preencha todos os campos');
    Exit;
  end;

  if Length(Trim(edt_nome.Text)) < 5 then
  begin
    ShowMessage('O nome deve ter pelo menos 5 letras!');
    Exit;
  end;

  ADOQuery_aux.Close;

  if operacao = 'novo' then
    ADOQuery_aux.SQL.Text := 'INSERT INTO dependentes (nome, idade, id) VALUES (' +
                             QuotedStr(edt_nome.Text) + ', ' + edt_idade.Text + ', ' + id + ')'
  else if operacao = 'alterar' then
    ADOQuery_aux.SQL.Text := 'UPDATE dependentes SET nome = ' + QuotedStr(edt_nome.Text) +
                             ', idade = ' + edt_idade.Text +
                             ', id = ' + id +
                             ' WHERE id_dependente = ' + pk;

  ADOQuery_aux.ExecSQL;
  desabilita_salvar(Sender);
  bloqueia_campos;
end;

procedure Tform_dependentes.btn_alterarClick(Sender: TObject);
begin
  if pk = '' then ShowMessage('Impossível alterar')
  else habilita_salvar(Sender);
  libera_campos;
end;

procedure Tform_dependentes.btn_cancelarClick(Sender: TObject);
begin
  if operacao = 'novo' then limpa_campos;
  desabilita_salvar(Sender);
  bloqueia_campos;
end;

procedure Tform_dependentes.btn_excluirClick(Sender: TObject);
begin
  if pk = '' then
    ShowMessage('Impossível excluir')
  else
  begin
    ADOQuery_aux.Close;
    ADOQuery_aux.SQL.Text := 'DELETE FROM dependentes WHERE id_dependente = ' + pk;
    ADOQuery_aux.ExecSQL;
    pk := '';
    operacao := '';
    limpa_campos;
    bloqueia_campos;
    desabilita_salvar(Sender);
  end;
end;

procedure Tform_dependentes.BitBtn11Click(Sender: TObject);
begin
  limpa_campos;
  bloqueia_campos;
  desabilita_salvar(Sender);

  form_pesquisa.sql_pesquisa := 'SELECT id_dependente, nome, idade, id FROM dependentes';
  form_pesquisa.ShowModal;

  if form_pesquisa.chave <> '' then
  begin
    pk := form_pesquisa.chave;

    ADOQuery_aux.Close;
    ADOQuery_aux.SQL.Text := 'SELECT d.nome, d.idade, s.nome AS nome_socio, d.id ' +
                             'FROM dependentes d ' +
                             'INNER JOIN sócios s ON d.id = s.id ' +
                             'WHERE d.id_dependente = ' + pk;
    ADOQuery_aux.Open;

    edt_nome.Text := ADOQuery_aux.FieldByName('nome').AsString;
    edt_idade.Text := ADOQuery_aux.FieldByName('idade').AsString;
    edt_socio.Text := ADOQuery_aux.FieldByName('nome_socio').AsString;
    id := ADOQuery_aux.FieldByName('id').AsString;
  end;
end;

procedure Tform_dependentes.edt_nomeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['A'..'Z','a'..'z', #8, #32]) then
   key := #0;
end;

procedure Tform_dependentes.edt_idadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

end.
