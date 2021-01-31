object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSizeToolWin
  Caption = 'Menu Principal'
  ClientHeight = 452
  ClientWidth = 1017
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
    Width = 1017
    Height = 73
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
        OnClick = OrdemdeServio1Click
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      object Deslogar1: TMenuItem
        Caption = 'Fechar Programa'
        OnClick = Deslogar1Click
      end
      object rocardeUsuario1: TMenuItem
        Caption = 'Trocar de Usuario'
      end
    end
  end
end
