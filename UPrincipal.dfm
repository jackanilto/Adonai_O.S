object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu Principal'
  ClientHeight = 596
  ClientWidth = 1154
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1154
    Height = 89
    Align = alTop
    TabOrder = 0
  end
  object MainMenu1: TMainMenu
    Left = 848
    Top = 136
    object aRQUIVO1: TMenuItem
      Caption = 'Cadastros'
      object NovoCliente1: TMenuItem
        Caption = 'Cliente'
        OnClick = NovoCliente1Click
      end
      object OrdemdeServio1: TMenuItem
        Caption = 'Ordem de Servi'#231'o'
      end
    end
  end
end
