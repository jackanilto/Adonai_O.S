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
    procedure EditVALORChange(Sender: TObject);
    procedure EditVALORKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmOS: TFrmOS;
  // VAR PARA PROCEDURE FORMATA MOEDAS
   s : string;
   v : double;
   I : integer;


implementation

{$R *.dfm}

procedure TFrmOS.btnSAIRClick(Sender: TObject);
begin
FrmOS.Close;
end;

procedure TFrmOS.EditVALORChange(Sender: TObject);
// trabalhando com valor de moeda

begin
   //1º Passo : se o edit estiver vazio, nada pode ser feito.
   If (Editvalor.Text = emptystr) then
      Editvalor.Text := '0,00';

   //2º Passo : obter o texto do edit, SEM a virgula e SEM o ponto decimal:
   s := '';
   for I := 1 to length(Editvalor.Text) do
   if (Editvalor.text[I] in ['0'..'9']) then
      s := s + Editvalor.text[I];

   //3º Passo : fazer com que o conteúdo do edit apresente 2 casas decimais:
   v := strtofloat(s);
   v := (v /100); // para criar 2 casa decimais

   //4º Passo : Formata o valor de (V) para aceitar valores do tipo 0,10.
   Editvalor.text := FormatFloat('###,##0.00',v);
   Editvalor.SelStart := Length(Editvalor.text);
end;

procedure TFrmOS.EditVALORKeyPress(Sender: TObject; var Key: Char);
begin
     if NOT (Key in ['0'..'9', #8, #9]) then
     key := #0;
     //Função posiciona o cursor sempre a direita como nos Caixas Eletronicos
     Editvalor.selstart := Length(Editvalor.text);
end;

end.
