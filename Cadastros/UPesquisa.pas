unit UPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UDM, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrmPesquisa = class(TForm)
    gridOS: TDBGrid;
    Panel1: TPanel;
    EditBUSCAR: TEdit;
    Label1: TLabel;
    EditCONS_OS: TEdit;
    LabelCONS_SERIAL: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure EditBUSCARChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure buscarTudo();
    PROCEDURE BUSCARNOME();
    PROCEDURE BUSCARNSERIE();
    PROCEDURE BUSCARORDEM();
  end;

var
  FrmPesquisa: TFrmPesquisa;

implementation

{$R *.dfm}

procedure TFrmPesquisa.BUSCARNOME;
begin
  dm.QueryOS.Close;
  dm.QueryOS.SQL.Clear;                                 //add collate win_ptbr para busca CASE INSESITIVE
  dm.QueryOS.SQL.Add('select * from TBL_OS where nome collate win_ptbr LIKE :nome order by nome asc');
  dm.QueryOS.ParamByName('nome').Value := EditBUSCAR.Text + '%';
  dm.QueryOS.Open;
end;

procedure TFrmPesquisa.BUSCARNSERIE;
begin
  dm.QueryOS.Close;
  dm.QueryOS.SQL.Clear;                                 //add collate win_ptbr para busca CASE INSESITIVE
  dm.QueryOS.SQL.Add('select * from TBL_OS where NSERIE collate win_ptbr LIKE :nome order by nome asc');
  dm.QueryOS.ParamByName('nome').Value := EditBUSCAR.Text + '%';
  dm.QueryOS.Open;
end;

procedure TFrmPesquisa.BUSCARORDEM;
begin

end;

procedure TFrmPesquisa.buscarTudo;
begin
  DM.QueryOS.Close;
  DM.QueryOS.SQL.Clear;
  DM.QueryOS.SQL.Add('select * from TBL_OS order by nome asc');
  DM.QueryOS.Open();
end;

procedure TFrmPesquisa.EditBUSCARChange(Sender: TObject);
begin
  BUSCARNOME;
end;

procedure TFrmPesquisa.FormShow(Sender: TObject);
begin
  DM.TBL_OS.Active := false;
  DM.TBL_OS.Active := true;

  buscarTudo;
end;

end.
