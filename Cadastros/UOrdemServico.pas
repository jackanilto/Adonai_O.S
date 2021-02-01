unit UOrdemServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, JvExMask, JvToolEdit, JvMaskEdit, JvCheckedMaskEdit,
  JvDatePickerEdit, UDM;

type
  TFrmOS = class(TForm)
    Label1: TLabel;
    EditNOME: TEdit;
    Label3: TLabel;
    EditENDERECO: TEdit;
    Label6: TLabel;
    EditCOMPLEMENTO: TEdit;
    Label5: TLabel;
    EditBAIRRO: TEdit;
    Label4: TLabel;
    EditCIDADE: TEdit;
    Estado: TLabel;
    EditESTADO: TEdit;
    Label7: TLabel;
    EditTEL: TEdit;
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
    dataENTRADA: TJvDatePickerEdit;
    Label2: TLabel;
    EditNUMOS: TEdit;
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
   procedure limparCampos();
   procedure habilitarCampos();
   procedure desabilitarCampos();
//   procedure buscarTudo();
//   procedure buscarNome();
//   procedure buscarSerial();
//   procedure buscarOS();
   procedure associarCampos();
  end;

var
  FrmOS: TFrmOS;
  // VAR PARA PROCEDURE FORMATA MOEDAS
   s : string;
   v : double;
   I : integer;


implementation

{$R *.dfm}

procedure TFrmOS.associarCampos;
begin
  DM.TBL_OS.FieldByName('NUMOS')      .AsInteger := EditNUMOS.Text;
  DM.TBL_OS.FieldByName('DATAENTRA')  .AsString  := dataENTRADA.Date;
  DM.TBL_OS.FieldByName('NOME')       .AsInteger := EditNOME.Text;
  DM.TBL_OS.FieldByName('TEL')        .AsInteger := EditTEL.Text;
  DM.TBL_OS.FieldByName('CONTATO')    .AsInteger := EditCONTATO.Text;
  DM.TBL_OS.FieldByName('CONTATO')    .AsInteger := EditCONTATO.Text;
  DM.TBL_OS.FieldByName('CNPJCPF')    .AsInteger := EditCNPJCPF.Text;
  DM.TBL_OS.FieldByName('ENDERECO')   .AsInteger := EditENDERECO.Text;
  DM.TBL_OS.FieldByName('COMPLEMENTO').AsInteger := EditCOMPLEMENTO.Text;
  DM.TBL_OS.FieldByName('BAIRRO')     .AsInteger := EditBAIRRO.Text;
  DM.TBL_OS.FieldByName('CIDADE')     .AsInteger := EditCIDADE.Text;
  DM.TBL_OS.FieldByName('ESTADO')     .AsInteger := EditESTADO.Text;
  DM.TBL_OS.FieldByName('SERVICO')    .AsInteger := memoSERVICO.Text;
  DM.TBL_OS.FieldByName('VALOR')      .AsInteger := EditVALOR.Text;
  DM.TBL_OS.FieldByName('POSICAO')    .AsInteger := cbPOSICAO.Text;
  DM.TBL_OS.FieldByName('GARANTIA')   .AsInteger := EditGARANTIA.Text;
end;

procedure TFrmOS.btnSAIRClick(Sender: TObject);
begin
FrmOS.Close;
end;

procedure TFrmOS.desabilitarCampos;
begin
  limparCampos;
  EditNUMOS       .Enabled := False;
  EditNOME        .Enabled := False;
  EditTEL         .Enabled := False;
  EditCONTATO     .Enabled := False;
  EditCNPJCPF     .Enabled := False;
  EditENDERECO    .Enabled := False;
  EditCOMPLEMENTO .Enabled := False;
  EditBAIRRO      .Enabled := False;
  EditCIDADE      .Enabled := False;
  EditESTADO      .Enabled := False;
  memoSERVICO     .Enabled := False;
  EditVALOR       .Enabled := False;
  cbPOSICAO       .Enabled := False;
  EditGARANTIA    .Enabled := False;
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

procedure TFrmOS.habilitarCampos;
begin
  limparCampos;
  EditNUMOS       .Enabled := True;
  EditNOME        .Enabled := True;
  EditTEL         .Enabled := True;
  EditCONTATO     .Enabled := True;
  EditCNPJCPF     .Enabled := True;
  EditENDERECO    .Enabled := True;
  EditCOMPLEMENTO .Enabled := True;
  EditBAIRRO      .Enabled := True;
  EditCIDADE      .Enabled := True;
  EditESTADO      .Enabled := True;
  memoSERVICO     .Enabled := True;
  EditVALOR       .Enabled := True;
  cbPOSICAO       .Enabled := True;
  EditGARANTIA    .Enabled := True;
end;

procedure TFrmOS.limparCampos;
begin
  limparCampos;
  EditNUMOS       .Text  := '';
  EditNOME        .Text  := '';
  EditTEL         .Text  := '';
  EditCONTATO     .Text  := '';
  EditCNPJCPF     .Text  := '';
  EditENDERECO    .Text  := '';
  EditCOMPLEMENTO .Text  := '';
  EditBAIRRO      .Text  := '';
  EditCIDADE      .Text  := '';
  EditESTADO      .Text  := '';
  memoSERVICO     .Text  := '';
  EditVALOR       .Text  := '';
  cbPOSICAO       .Text  := '';
  EditGARANTIA    .Text  := '';
end;

end.
