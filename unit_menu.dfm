object form_menu: Tform_menu
  Left = 431
  Top = 222
  Width = 455
  Height = 301
  Caption = 'menu'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btn_cadsocios: TBitBtn1
    Left = 120
    Top = 40
    Width = 201
    Height = 41
    Caption = 'cadastro de s'#243'cios'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Showcard Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btn_cadsociosClick
  end
  object BitBtn11: TBitBtn1
    Left = 120
    Top = 168
    Width = 201
    Height = 41
    Caption = 'cadastro de dependentes'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Showcard Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn11Click
  end
  object conexaobd: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Persist Security Info=False;User ID=sa;Initi' +
      'al Catalog=Desafio NPI;Data Source=NOTEBOOK01\RONALD'
    Provider = 'SQLOLEDB.1'
    Left = 408
    Top = 8
  end
end
