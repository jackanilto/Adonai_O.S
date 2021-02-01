object FrmPesquisa: TFrmPesquisa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Formul'#225'rio de Pesquisa'
  ClientHeight = 395
  ClientWidth = 827
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gridOS: TDBGrid
    Left = 8
    Top = 135
    Width = 809
    Height = 120
    DataSource = DM.DSOs
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NUMOS'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATAENTRA'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TEL'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NSERIE1'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NSERIE2'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NSERIE3'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENDERECO'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMPLEMENTO'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BAIRRO'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIDADE'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SERVICO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POSICAO'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATAFECHA'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GARANTIA'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNPJCPF'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTATO'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID'
        Width = 60
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 8
    Top = 16
    Width = 809
    Height = 65
    TabOrder = 1
    object Label1: TLabel
      Left = 408
      Top = 4
      Width = 84
      Height = 13
      Caption = 'Consultar Nome::'
    end
    object LabelCONS_SERIAL: TLabel
      Left = 210
      Top = 5
      Width = 103
      Height = 13
      Caption = 'Consultar N'#186' de Serie'
    end
    object Label2: TLabel
      Left = 8
      Top = 4
      Width = 69
      Height = 13
      Caption = 'Consutar O.S.'
    end
    object EditBUSCAR: TEdit
      Left = 408
      Top = 23
      Width = 265
      Height = 21
      TabOrder = 0
      OnChange = EditBUSCARChange
    end
    object EditCONS_OS: TEdit
      Left = 210
      Top = 23
      Width = 180
      Height = 21
      TabOrder = 1
      OnChange = EditCONS_OSChange
    end
    object Edit1: TEdit
      Left = 8
      Top = 23
      Width = 150
      Height = 21
      TabOrder = 2
    end
  end
end
