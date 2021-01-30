program Adonai_OS;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {FrmPrincipal},
  ULogin in 'ULogin.pas' {FrmLogin},
  UDM in 'Database\UDM.pas' {DM: TDataModule},
  UCadClientes in 'Cadastros\UCadClientes.pas' {FrmCadClientes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmCadClientes, FrmCadClientes);
  Application.Run;
end.
