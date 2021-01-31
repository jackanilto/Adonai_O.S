unit UOrdemServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFrmOS = class(TForm)
    Label1: TLabel;
    EditNOME: TEdit;
    Label3: TLabel;
    EditENDERECO: TEdit;
    Label6: TLabel;
    EditNUMERO: TEdit;
    Label5: TLabel;
    EditBAIRRO: TEdit;
    Label4: TLabel;
    EditCIDADE: TEdit;
    Estado: TLabel;
    EditESTADO: TEdit;
    Label7: TLabel;
    EditTELPESSOAL: TEdit;
    Label11: TLabel;
    EditCNPJCPF: TEdit;
    Panel1: TPanel;
    btnSAIR: TSpeedButton;
    Label12: TLabel;
    btnNovo: TBitBtn;
    BtnSalvar: TBitBtn;
    btnEditar: TBitBtn;
    btnDeletar: TBitBtn;
    EditID: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmOS: TFrmOS;

implementation

{$R *.dfm}

end.
