unit UOrdemServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, JvExMask, JvToolEdit, JvMaskEdit, JvCheckedMaskEdit,
  JvDatePickerEdit, UDM, UPesquisa;

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
    SpeedButton1: TSpeedButton;
    EditSERIE1: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    EditSERIE2: TEdit;
    EditSERIE3: TEdit;
    Label22: TLabel;
    procedure btnSAIRClick(Sender: TObject);
    procedure EditVALORChange(Sender: TObject);
    procedure EditVALORKeyPress(Sender: TObject; var Key: Char);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
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
  //DM.TBL_OS.FieldByName('NUMOS')      .AsInteger:= EditNUMOS.Text;
  //DM.TBL_OS.FieldByName('DATAENTRA')  .AsString := dataENTRADA.Date;
  DM.TBL_OS.FieldByName('NOME')       .AsString := EditNOME.Text;
  DM.TBL_OS.FieldByName('TEL')        .AsString := EditTEL.Text;
  DM.TBL_OS.FieldByName('CONTATO')    .AsString := EditCONTATO.Text;
  DM.TBL_OS.FieldByName('CONTATO')    .AsString := EditCONTATO.Text;
  DM.TBL_OS.FieldByName('CNPJCPF')    .AsString := EditCNPJCPF.Text;
  DM.TBL_OS.FieldByName('ENDERECO')   .AsString := EditENDERECO.Text;
  DM.TBL_OS.FieldByName('COMPLEMENTO').AsString := EditCOMPLEMENTO.Text;
  DM.TBL_OS.FieldByName('BAIRRO')     .AsString := EditBAIRRO.Text;
  DM.TBL_OS.FieldByName('CIDADE')     .AsString := EditCIDADE.Text;
  DM.TBL_OS.FieldByName('ESTADO')     .AsString := EditESTADO.Text;
  DM.TBL_OS.FieldByName('SERVICO')    .AsString := memoSERVICO.Text;
  DM.TBL_OS.FieldByName('VALOR')      .AsString := EditVALOR.Text;
  DM.TBL_OS.FieldByName('POSICAO')    .AsString := cbPOSICAO.Text;
  DM.TBL_OS.FieldByName('GARANTIA')   .AsString := EditGARANTIA.Text;
  DM.TBL_OS.FieldByName('NSERIE1')   .AsString := EditSERIE1.Text;
  DM.TBL_OS.FieldByName('NSERIE2')   .AsString := EditSERIE2.Text;
  DM.TBL_OS.FieldByName('NSERIE3')   .AsString := EditSERIE3.Text;
end;

procedure TFrmOS.btnDeletarClick(Sender: TObject);
begin
if Messagedlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
   associarCampos;
    DM.QueryOS.Close;
    DM.QueryOS.SQL.Clear;
    DM.QueryOS.SQL.Add('delete from TBL_OS where ID = :ID');

    DM.QueryOS.ParamByName('ID').Value := editID.Text;
    DM.QueryOS.ExecSql;
//    buscarTudo;
    MessageDlg('Excluido com Sucesso!!', mtInformation, mbOKCancel, 0);
    // destativa a table (solução para atualiza grid em tempo de execução)
    //reativa a table
    //DM.TBL_OS.Active := false;
    //DM.TBL_OS.Active := true;

    EditNOME.Enabled := false;
    btnSalvar.Enabled := false;
    btnEditar.Enabled := false;
    btnDeletar.Enabled := false;
    btnNovo.Enabled := true;
  end;
end;

procedure TFrmOS.btnEditarClick(Sender: TObject);
begin
  if (editNOME.Text <> '') then
    begin
        associarCampos;
        DM.TBL_OS.Edit;
        DM.QueryOS.Close;
        DM.QueryOS.SQL.Clear;
        DM.QueryOS.SQL.Add('update TBL_OS set '+
       ' NUMOS             =  :NUMOS                , '+
       ' DATAENTRA         =  :DATAENTRA            , '+
       ' NOME              =  :NOME                 , '+
       ' TEL               =  :TEL                  , '+
       ' CONTATO           =  :CONTATO              , '+
       ' CNPJCPF           =  :CNPJCPF                '+
       ' ENDERECO          =  :ENDERECO             , '+
       ' COMPLEMENTO       =  :COMPLEMENTO          , '+
       ' BAIRRO            =  :BAIRRO               , '+
       ' CIDADE            =  :CIDADE               , '+
       ' ESTADO            =  :ESTADO               , '+
       ' SERVICO           =  :SERVICO              , '+
       ' VALOR             =  :VALOR                , '+
       ' POSICAO           =  :POSICAO              , '+
       ' DATAFECHA         =  :DATAFECHA            , '+
       ' GARANTIA          =  :GARANTIA             , '+
       ' NSERIE1           =  :NSERIE1              , '+
       ' NSERIE2           =  :NSERIE2              , '+
       ' NSERIE3           =  :NSERIE3              , '+
       ' where id  = :id');

        DM.TBL_OS.FieldByName('NOME')       .AsString := EditNOME.Text;
        DM.TBL_OS.FieldByName('TEL')        .AsString := EditTEL.Text;
        DM.TBL_OS.FieldByName('CONTATO')    .AsString := EditCONTATO.Text;
        DM.TBL_OS.FieldByName('CONTATO')    .AsString := EditCONTATO.Text;
        DM.TBL_OS.FieldByName('CNPJCPF')    .AsString := EditCNPJCPF.Text;
        DM.TBL_OS.FieldByName('ENDERECO')   .AsString := EditENDERECO.Text;
        DM.TBL_OS.FieldByName('COMPLEMENTO').AsString := EditCOMPLEMENTO.Text;
        DM.TBL_OS.FieldByName('BAIRRO')     .AsString := EditBAIRRO.Text;
        DM.TBL_OS.FieldByName('CIDADE')     .AsString := EditCIDADE.Text;
        DM.TBL_OS.FieldByName('ESTADO')     .AsString := EditESTADO.Text;
        DM.TBL_OS.FieldByName('SERVICO')    .AsString := memoSERVICO.Text;
        DM.TBL_OS.FieldByName('VALOR')      .AsString := EditVALOR.Text;
        DM.TBL_OS.FieldByName('POSICAO')    .AsString := cbPOSICAO.Text;
        DM.TBL_OS.FieldByName('GARANTIA')   .AsString := EditGARANTIA.Text;
        DM.TBL_OS.FieldByName('NSERIE1')   .AsString := EditSERIE1.Text;
        DM.TBL_OS.FieldByName('NSERIE2')   .AsString := EditSERIE2.Text;
        DM.TBL_OS.FieldByName('NSERIE3')   .AsString := EditSERIE3.Text;
        DM.QueryClientes.ParamByName('id').Value := editID.Text;
        DM.QueryClientes.ExecSql;

        MessageDlg('Editado com Sucesso!!', mtInformation, mbOKCancel, 0);
 //       buscarTudo;
        desabilitarCampos;
        limparCampos;
        btnSalvar.Enabled := false;
        btnEditar.Enabled := false;
        btnDeletar.Enabled := false;
        btnNovo.Enabled := true;
    end
    else
    begin
    MessageDlg('Preencha os Campos', mtInformation, mbOKCancel, 0);
    end;
end;

procedure TFrmOS.btnNovoClick(Sender: TObject);
begin
  EditNOME.Enabled := true; // Reabilita Edit   apos salvar (Editar)
  limparCampos;      // Era EditNOME.Text := '';  troquei por limparCampos
  habilitarCampos;
  EditNOME.SetFocus;
  DM.TBL_OS.Insert;
  BtnSalvar.Enabled := true;
  btnNovo.Enabled := true;
  btnEditar.Enabled := true;
  btnDeletar.Enabled := false;
end;

procedure TFrmOS.btnSAIRClick(Sender: TObject);
begin
FrmOS.Close;
end;

procedure TFrmOS.BtnSalvarClick(Sender: TObject);
begin
  if (EditNOME.Text <> '') then
  begin
    associarCampos;
    DM.TBL_OS.Post;
    MessageDlg('Salvo com Sucesso!!', mtInformation, mbOKCancel, 0);
//    buscarTudo;
    desabilitarCampos;
    btnSalvar.Enabled := false;
    btnNovo.Enabled := true;
    btnEditar.Enabled := false;
    btnDeletar.Enabled := false;
    end
    else
    begin
    MessageDlg('Preencha os Campos', mtInformation, mbOKCancel, 0);
  end;
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
  EditSERIE1      .Enabled := False;
  EditSERIE2      .Enabled := False;
  EditSERIE3      .Enabled := False;
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

procedure TFrmOS.FormShow(Sender: TObject);
begin
DM.TBL_OS.Active := False;
DM.TBL_OS.Active := True;
end;

procedure TFrmOS.habilitarCampos;
begin
  limparCampos;
  //EditNUMOS       .Enabled := True;
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
  EditSERIE1      .Enabled := True;
  EditSERIE2      .Enabled := True;
  EditSERIE3      .Enabled := True;
end;

procedure TFrmOS.limparCampos;
begin
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
  EditSERIE1      .Text  := '';
  EditSERIE2      .Text  := '';
  EditSERIE3      .Text  := '';
end;

procedure TFrmOS.SpeedButton1Click(Sender: TObject);
begin
FrmPesquisa.ShowModal;
end;

end.
