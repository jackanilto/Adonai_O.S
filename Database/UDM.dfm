object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 570
  Width = 914
  object FDConn: TFDConnection
    Params.Strings = (
      'Database=C:\Adonai_O.S\Database\ADONAIOS.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 24
    Top = 8
  end
  object FBDriver: TFDPhysFBDriverLink
    VendorLib = 'C:\Adonai_O.S\Firebird\fbclient.dll'
    Left = 88
    Top = 8
  end
  object WaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 152
    Top = 8
  end
  object TBL_ACESSO: TFDTable
    MasterSource = DSAcesso
    Connection = FDConn
    UpdateOptions.UpdateTableName = 'TBL_ACESSO'
    TableName = 'TBL_ACESSO'
    Left = 48
    Top = 88
    object TBL_ACESSOID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object TBL_ACESSOUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Size = 80
    end
    object TBL_ACESSOSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Size = 80
    end
  end
  object DSAcesso: TDataSource
    DataSet = QueryAcesso
    Left = 48
    Top = 144
  end
  object QueryAcesso: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select * from tbl_acesso')
    Left = 48
    Top = 200
  end
  object TBL_CLIENTES: TFDTable
    Connection = FDConn
    UpdateOptions.UpdateTableName = 'TBL_CLIENTES'
    TableName = 'TBL_CLIENTES'
    Left = 120
    Top = 88
    object TBL_CLIENTESID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object TBL_CLIENTESNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 200
    end
    object TBL_CLIENTESENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 200
    end
    object TBL_CLIENTESNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 200
    end
    object TBL_CLIENTESBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 200
    end
    object TBL_CLIENTESCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 200
    end
    object TBL_CLIENTESESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Size = 200
    end
    object TBL_CLIENTESCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 200
    end
    object TBL_CLIENTESCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 200
    end
    object TBL_CLIENTESTELPESSOAL: TStringField
      FieldName = 'TELPESSOAL'
      Origin = 'TELPESSOAL'
      Size = 200
    end
    object TBL_CLIENTESCONTATO1: TStringField
      FieldName = 'CONTATO1'
      Origin = 'CONTATO1'
      Size = 200
    end
    object TBL_CLIENTESCONTATO2: TStringField
      FieldName = 'CONTATO2'
      Origin = 'CONTATO2'
      Size = 200
    end
    object TBL_CLIENTESEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 200
    end
    object TBL_CLIENTESCNPJCPF: TStringField
      FieldName = 'CNPJCPF'
      Origin = 'CNPJCPF'
      Size = 200
    end
  end
  object DSClientes: TDataSource
    DataSet = QueryClientes
    Left = 120
    Top = 144
  end
  object QueryClientes: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select * from TBL_CLIENTES')
    Left = 120
    Top = 200
  end
end
