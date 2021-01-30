unit UDM;

interface

uses
  System.SysUtils, System.Classes, ULogin, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Phys.FB;

type
  TDM = class(TDataModule)
    FDConn: TFDConnection;
    FBDriver: TFDPhysFBDriverLink;
    WaitCursor: TFDGUIxWaitCursor;
    TBL_ACESSO: TFDTable;
    DSAcesso: TDataSource;
    QueryAcesso: TFDQuery;
    TBL_ACESSOID: TIntegerField;
    TBL_ACESSOUSUARIO: TStringField;
    TBL_ACESSOSENHA: TStringField;
    TBL_CLIENTES: TFDTable;
    DSClientes: TDataSource;
    QueryClientes: TFDQuery;
    TBL_CLIENTESID: TIntegerField;
    TBL_CLIENTESNOME: TStringField;
    TBL_CLIENTESENDERECO: TStringField;
    TBL_CLIENTESNUMERO: TStringField;
    TBL_CLIENTESBAIRRO: TStringField;
    TBL_CLIENTESCIDADE: TStringField;
    TBL_CLIENTESESTADO: TStringField;
    TBL_CLIENTESCEP: TStringField;
    TBL_CLIENTESCOMPLEMENTO: TStringField;
    TBL_CLIENTESTELPESSOAL: TStringField;
    TBL_CLIENTESCONTATO1: TStringField;
    TBL_CLIENTESCONTATO2: TStringField;
    TBL_CLIENTESEMAIL: TStringField;
    TBL_CLIENTESCNPJCPF: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  FDConn.Connected := true;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  FDConn.Connected := false;
end;

end.
