program DesafioNPI;

uses
  Forms,
  unit_menu in 'unit_menu.pas' {form_menu},
  unit_socio in 'unit_socio.pas' {form_socios},
  unit_pesquisa in 'unit_pesquisa.pas' {form_pesquisa},
  unit_dependentes in 'unit_dependentes.pas' {form_dependentes};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tform_menu, form_menu);
  Application.CreateForm(Tform_socios, form_socios);
  Application.CreateForm(Tform_pesquisa, form_pesquisa);
  Application.CreateForm(Tform_dependentes, form_dependentes);
  Application.Run;
end.
