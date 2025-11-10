object form_pesquisa: Tform_pesquisa
  Left = 281
  Top = 154
  Width = 592
  Height = 407
  Caption = 'pesquisa'
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
    Left = 24
    Top = 24
    Width = 240
    Height = 20
    Caption = 'DIGITE O NOME OU PARTE DELE'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Showcard Gothic'
    Font.Style = []
    ParentFont = False
  end
  object edt_nome: TEdit
    Left = 24
    Top = 64
    Width = 297
    Height = 21
    MaxLength = 50
    TabOrder = 0
  end
  object btn_pesquisar: TBitBtn1
    Left = 360
    Top = 56
    Width = 91
    Height = 33
    Caption = 'PESQUISAR'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Showcard Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btn_pesquisarClick
  end
  object btn_limpar: TBitBtn1
    Left = 472
    Top = 56
    Width = 89
    Height = 33
    Caption = 'limpar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Showcard Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btn_limparClick
  end
  object btn_selecionar: TBitBtn1
    Left = 168
    Top = 328
    Width = 89
    Height = 33
    Caption = 'SELECIONAR'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Showcard Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btn_selecionarClick
  end
  object btn_cancelar: TBitBtn1
    Left = 304
    Top = 328
    Width = 89
    Height = 33
    Caption = 'cancelar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Showcard Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btn_cancelarClick
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 112
    Width = 505
    Height = 177
    DataSource = DataSource1
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery_pesquisa
    Left = 16
    Top = 328
  end
  object ADOQuery_pesquisa: TADOQuery
    Connection = form_menu.conexaobd
    Parameters = <>
    Left = 64
    Top = 328
  end
end
