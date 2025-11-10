object form_socios: Tform_socios
  Left = 320
  Top = 159
  Width = 697
  Height = 390
  Caption = 'S'#243'cios'
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
    Left = 72
    Top = 32
    Width = 47
    Height = 20
    Caption = 'NOME'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Showcard Gothic'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 72
    Top = 112
    Width = 53
    Height = 20
    Caption = 'renda'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Showcard Gothic'
    Font.Style = []
    ParentFont = False
  end
  object edt_nome: TEdit
    Left = 72
    Top = 64
    Width = 337
    Height = 21
    MaxLength = 50
    TabOrder = 0
    OnKeyPress = edt_nomeKeyPress
  end
  object edt_renda: TEdit
    Left = 72
    Top = 144
    Width = 145
    Height = 21
    TabOrder = 1
  end
  object rd_ativo: TRadioButton
    Left = 80
    Top = 192
    Width = 113
    Height = 17
    Caption = 'ATIVO'
    TabOrder = 2
  end
  object btn_novo: TBitBtn1
    Left = 16
    Top = 304
    Width = 121
    Height = 33
    Caption = 'novo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Showcard Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btn_novoClick
  end
  object btn_alterar: TBitBtn1
    Left = 288
    Top = 304
    Width = 121
    Height = 33
    Caption = 'ALTERAR'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Showcard Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btn_alterarClick
  end
  object btn_excluir: TBitBtn1
    Left = 552
    Top = 304
    Width = 121
    Height = 33
    Caption = 'EXCLUIR'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Showcard Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = btn_excluirClick
  end
  object btn_localizar: TBitBtn1
    Left = 448
    Top = 64
    Width = 91
    Height = 25
    Caption = 'localizar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Showcard Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = btn_localizarClick
  end
  object btn_salvar: TBitBtn1
    Left = 152
    Top = 304
    Width = 121
    Height = 33
    Caption = 'salvar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Showcard Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = btn_salvarClick
  end
  object btn_cancelar: TBitBtn1
    Left = 424
    Top = 304
    Width = 121
    Height = 33
    Caption = 'cancelar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Showcard Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = btn_cancelarClick
  end
  object rd_inativo: TRadioButton
    Left = 80
    Top = 224
    Width = 113
    Height = 17
    Caption = 'INATIVO'
    TabOrder = 9
  end
  object ADOQuery_aux: TADOQuery
    Connection = form_menu.conexaobd
    Parameters = <>
    Left = 560
    Top = 8
  end
end
