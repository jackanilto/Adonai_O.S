unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, UCadClientes,
  UOrdemServico;

type
  TFrmPrincipal = class(TForm)
    Panel1: TPanel;
    MainMenu1: TMainMenu;
    aRQUIVO1: TMenuItem;
    NovoCliente1: TMenuItem;
    OrdemdeServio1: TMenuItem;
    Sair1: TMenuItem;
    Deslogar1: TMenuItem;
    rocardeUsuario1: TMenuItem;
    procedure NovoCliente1Click(Sender: TObject);
    procedure Deslogar1Click(Sender: TObject);
    procedure OrdemdeServio1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.Deslogar1Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TFrmPrincipal.NovoCliente1Click(Sender: TObject);
begin
FrmCadClientes.ShowModal;
end;


procedure TFrmPrincipal.OrdemdeServio1Click(Sender: TObject);
begin
FrmOS.ShowModal;
end;

end.
