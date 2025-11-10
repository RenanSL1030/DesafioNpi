unit unit_menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, BitBtn1, DB, ADODB;

type
  Tform_menu = class(TForm)
    btn_cadsocios: TBitBtn1;
    BitBtn11: TBitBtn1;
    conexaobd: TADOConnection;
    procedure btn_cadsociosClick(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  form_menu: Tform_menu;

implementation

uses unit_socio, unit_dependentes;

{$R *.dfm}

procedure Tform_menu.btn_cadsociosClick(Sender: TObject);
begin
  form_socios.ShowModal;
end;


procedure Tform_menu.BitBtn11Click(Sender: TObject);
begin
  form_dependentes.showmodal;
end;

end.
