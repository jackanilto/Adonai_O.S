unit UOrdemServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, JvExMask, JvToolEdit, JvMaskEdit, JvCheckedMaskEdit,
  JvDatePickerEdit;

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
    JvDatePickerEdit1: TJvDatePickerEdit;
    Label2: TLabel;
    EditNOS: TEdit;
    Label8: TLabel;
    EditCONTATO: TEdit;
    Label9: TLabel;
    PanelDadosCliente: TPanel;
    Label10: TLabel;
    PanelDadosOS: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    EditGARANTIA: TEdit;
    EditFECHAMENTO: TEdit;
    cbPOSICAO: TComboBox;
    EditVALOR: TEdit;
    memoSERVICO: TMemo;
    procedure btnSAIRClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmOS: TFrmOS;

implementation

{$R *.dfm}

procedure TFrmOS.btnSAIRClick(Sender: TObject);
begin
FrmOS.Close;
end;

end.
