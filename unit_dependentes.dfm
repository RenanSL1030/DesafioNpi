object form_dependentes: Tform_dependentes
  Left = 360
  Top = 208
  Width = 665
  Height = 377
  Caption = 'dependentes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 24
    Width = 210
    Height = 23
    Caption = 'NOME DO DEPENDENTE'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Showcard Gothic'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 32
    Top = 104
    Width = 58
    Height = 23
    Caption = 'IDADE'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Showcard Gothic'
    Font.Style = []
    ParentFont = False
  end
  object a: TLabel
    Left = 32
    Top = 184
    Width = 56
    Height = 23
    Caption = 's'#243'cio'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Showcard Gothic'
    Font.Style = []
    ParentFont = False
  end
  object btn_novo: TBitBtn1
    Left = 8
    Top = 296
    Width = 97
    Height = 33
    Caption = 'novo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Showcard Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btn_novoClick
  end
  object btn_cancelar: TBitBtn1
    Left = 416
    Top = 296
    Width = 97
    Height = 33
    Caption = 'cancelar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Showcard Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btn_cancelarClick
  end
  object btn_excluir: TBitBtn1
    Left = 544
    Top = 296
    Width = 97
    Height = 33
    Caption = 'excluir'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Showcard Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btn_excluirClick
  end
  object btn_alterar: TBitBtn1
    Left = 272
    Top = 296
    Width = 97
    Height = 33
    Caption = 'alterar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Showcard Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btn_alterarClick
  end
  object btn_salvar: TBitBtn1
    Left = 136
    Top = 296
    Width = 97
    Height = 33
    Caption = 'salvar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Showcard Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btn_salvarClick
  end
  object edt_nome: TEdit
    Left = 32
    Top = 64
    Width = 353
    Height = 21
    MaxLength = 50
    TabOrder = 5
    OnKeyPress = edt_nomeKeyPress
  end
  object edt_idade: TEdit
    Left = 32
    Top = 144
    Width = 65
    Height = 21
    TabOrder = 6
    OnKeyPress = edt_idadeKeyPress
  end
  object edt_socio: TEdit
    Left = 32
    Top = 216
    Width = 305
    Height = 21
    TabOrder = 7
  end
  object BitBtn11: TBitBtn1
    Left = 400
    Top = 48
    Width = 137
    Height = 33
    Caption = 'localizar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Showcard Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = BitBtn11Click
  end
  object btn_socio: TBitBtn1
    Left = 352
    Top = 200
    Width = 49
    Height = 41
    Caption = '<=='
    TabOrder = 9
    OnClick = btn_socioClick
  end
  object ADOQuery_aux: TADOQuery
    Connection = form_menu.conexaobd
    Parameters = <>
    Left = 616
    Top = 8
  end
end
