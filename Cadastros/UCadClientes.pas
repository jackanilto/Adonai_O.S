unit UCadClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtDlgs, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.AppEvnts, JvExMask, JvToolEdit,
  JvMaskEdit, JvCheckedMaskEdit, JvDatePickerEdit, JvAVICapture, Vcl.Imaging.jpeg, frxDesgn,
  frxClass, frxExportBaseDialog, frxExportPDF, Vcl.DBCtrls;

type
  TFrmCadClientes = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    btnNovo: TBitBtn;
    BtnSalvar: TBitBtn;
    btnEditar: TBitBtn;
    btnDeletar: TBitBtn;
    Label1: TLabel;
    EditNOME: TEdit;
    grid: TDBGrid;
    EditID: TEdit;
    Label2: TLabel;
    edtBuscar: TEdit;
    EditENDERECO: TEdit;
    EditNUMERO: TEdit;
    EditBAIRRO: TEdit;
    EditCIDADE: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EditESTADO: TEdit;
    EditCOMPLEMENTO: TEdit;
    EditTELPESSOAL: TEdit;
    EditCONTATO1: TEdit;
    EditCONTATO2: TEdit;
    Estado: TLabel;
    Label8: TLabel;
    MaskCEP: TMaskEdit;
    LabelCOMPLENENTO: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    EditEMAIL: TEdit;
    Email: TLabel;
    btnCartas: TSpeedButton;
    EditCNPJCPF: TEdit;
    Label11: TLabel;
    procedure btnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gridCellClick(Column: TColumn);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure edtBuscarChange(Sender: TObject);
    procedure gridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

//    procedure btnCANCELARClick(Sender: TObject);

  private
    { Private declarations }
  public
   { Public declarations }
   procedure limparCampos();
   procedure habilitarCampos();
   procedure desabilitarCampos();
   procedure buscarTudo();
   procedure buscarNome();
   procedure associarCampos();
  end;

var
  FrmCadClientes: TFrmCadClientes;
  caminhoImg: string;
  imgPessoa: TPicture;
  alterou: boolean;
// VAR PARA PROCEDURE FORMATA MOEDAS
   s : string;
   v : double;
   I : integer;


implementation

{$R *.dfm}

uses UDM;

procedure TFrmCadClientes.associarCampos;
  begin
     DM.TBL_CLIENTES.FieldByName('NOME').asstring := EditNOME.Text;
     DM.TBL_CLIENTES.FieldByName('ENDERECO').asstring := EditENDERECO.Text;
     DM.TBL_CLIENTES.FieldByName('NUMERO').asstring := EditNUMERO.Text;
     DM.TBL_CLIENTES.FieldByName('BAIRRO').asstring := EditBAIRRO.Text;
     DM.TBL_CLIENTES.FieldByName('CIDADE').asstring := EditCIDADE.Text;
     DM.TBL_CLIENTES.FieldByName('ESTADO').asstring := EditESTADO.Text;
     DM.TBL_CLIENTES.FieldByName('CEP').asstring := MaskCEP.Text;
     DM.TBL_CLIENTES.FieldByName('COMPLEMENTO').asstring := EditCOMPLEMENTO.Text;
     DM.TBL_CLIENTES.FieldByName('TELPESSOAL')  .Value   := EditTELPESSOAL.Text;
     DM.TBL_CLIENTES.FieldByName('CONTATO1')  .Value   := EditCONTATO1.Text;
     DM.TBL_CLIENTES.FieldByName('CONTATO2')  .Value   := EditCONTATO2.Text;
     DM.TBL_CLIENTES.FieldByName('EMAIL')  .asstring   := EditEMAIL                .Text;
     DM.TBL_CLIENTES.FieldByName('CNPJCPF')  .Value   := EditCNPJCPF              .Text;

  end;


procedure TFrmCadClientes.btnDeletarClick(Sender: TObject);
begin
if Messagedlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
   associarCampos;
    DM.QueryClientes.Close;
    DM.QueryClientes.SQL.Clear;
    DM.QueryClientes.SQL.Add('delete from TBL_CLIENTES where ID = :ID');

    DM.QueryClientes.ParamByName('ID').Value := editID.Text;
    DM.QueryClientes.ExecSql;
    buscarTudo;
    MessageDlg('Excluido com Sucesso!!', mtInformation, mbOKCancel, 0);
    // destativa a table (solução para atualiza grid em tempo de execução)
    //reativa a table
    DM.TBL_CLIENTES.Active := false;
    DM.TBL_CLIENTES.Active := true;

    EditNOME.Enabled := false;
    btnSalvar.Enabled := false;
    btnEditar.Enabled := false;
    btnDeletar.Enabled := false;
    btnCartas.Enabled := false;
    btnNovo.Enabled := true;
  end;
end;

procedure TFrmCadClientes.btnEditarClick(Sender: TObject);
begin
  if (editNOME.Text <> '') then
    begin
        associarCampos;
        DM.TBL_CLIENTES.Edit;
        DM.QueryClientes.Close;
        DM.QueryClientes.SQL.Clear;

        if alterou = false then
        begin
          DM.QueryClientes.SQL.Add('update TBL_CLIENTES set   NOME = :NOME, '+
         ' ENDERECO          =  :ENDERECO             , '+
         ' NUMERO            =  :NUMERO               , '+
         ' BAIRRO            =  :BAIRRO               , '+
         ' CIDADE            =  :CIDADE               , '+
         ' ESTADO            =  :ESTADO               , '+
         ' CEP               =  :CEP                  , '+
         ' COMPLEMENTO       =  :COMPLEMENTO          , '+
         ' TELPESSOAL        =  :TELPESSOAL           , '+
         ' CONTATO1          =  :CONTATO1             , '+
         ' CONTATO2          =  :CONTATO2             , '+
         ' EMAIL             =  :EMAIL                , '+
         ' where id  = :id');

          end
          else
          begin
          DM.QueryClientes.SQL.Add('update TBL_CLIENTES set   NOME = :NOME, '+
         ' ENDERECO          =  :ENDERECO             , '+
         ' NUMERO            =  :NUMERO               , '+
         ' BAIRRO            =  :BAIRRO               , '+
         ' CIDADE            =  :CIDADE               , '+
         ' ESTADO            =  :ESTADO               , '+
         ' CEP               =  :CEP                  , '+
         ' COMPLEMENTO       =  :COMPLEMENTO          , '+
         ' TELPESSOAL        =  :TELPESSOAL           , '+
         ' CONTATO1          =  :CONTATO1             , '+
         ' CONTATO2          =  :CONTATO2             , '+
         ' EMAIL             =  :EMAIL                , '+
         ' where id  = :id');
        end;


        DM.QueryClientes.ParamByName('NOME').AsString := editNome.Text;
        DM.QueryClientes.ParamByName('ENDERECO').AsString := EditENDERECO.Text;
        DM.QueryClientes.ParamByName('NUMERO').AsString := editNUMERO.Text;
        DM.QueryClientes.ParamByName('BAIRRO').AsString := editBAIRRO.Text;
        DM.QueryClientes.ParamByName('CIDADE').AsString := editCIDADE.Text;
        DM.QueryClientes.ParamByName('ESTADO').AsString := editESTADO.Text;
        DM.QueryClientes.ParamByName('CEP').Value := MaskCEP.Text;
        DM.QueryClientes.ParamByName('COMPLEMENTO').Value := editCOMPLEMENTO.Text;
        DM.QueryClientes.ParamByName('TELPESSOAL').Value := editTELPESSOAL.Text;
        DM.QueryClientes.ParamByName('CONTATO1').Value := editCONTATO1.Text;
        DM.QueryClientes.ParamByName('CONTATO2').Value := editCONTATO2.Text;
        DM.QueryClientes.ParamByName('EMAIL').Value := editEMAIL.Text;
        DM.QueryClientes.ParamByName('CNPJCPF').Value := EditCNPJCPF.Text;
        DM.QueryClientes.ParamByName('id').Value := editID.Text;

        DM.QueryClientes.ExecSql;

        MessageDlg('Editado com Sucesso!!', mtInformation, mbOKCancel, 0);
        buscarTudo;
        desabilitarCampos;
        limparCampos;
        btnSalvar.Enabled := false;
        btnEditar.Enabled := false;
        btnDeletar.Enabled := false;
        btnCartas.Enabled := false;
        btnNovo.Enabled := true;
        grid.Enabled := true;
    end
    else
    begin
    MessageDlg('Preencha os Campos', mtInformation, mbOKCancel, 0);
    end;
end;

procedure TFrmCadClientes.btnNovoClick(Sender: TObject);
begin
  //apos editar um dado esta desbilitando o Edit
  grid.Enabled:=false;
  EditNOME.Enabled := true; // Reabilita Edit
  EditNOME.Text := '';
  EditNOME.SetFocus;
  DM.TBL_CLIENTES.Insert;
  BtnSalvar.Enabled := true;
  btnNovo.Enabled := true;
  btnEditar.Enabled := true;
  btnDeletar.Enabled := false;

end;

procedure TFrmCadClientes.BtnSalvarClick(Sender: TObject);
begin
  if (EditNOME.Text <> '') then
  begin
    associarCampos;
    DM.TBL_CLIENTES.Post;
    MessageDlg('Salvo com Sucesso!!', mtInformation, mbOKCancel, 0);
    buscarTudo;
    desabilitarCampos;
    btnSalvar.Enabled := false;
    btnNovo.Enabled := true;
    btnEditar.Enabled := false;
    btnDeletar.Enabled := false;
    btnCartas.Enabled := false;
    grid.Enabled := true;
    end
    else
    begin
    MessageDlg('Preencha os Campos', mtInformation, mbOKCancel, 0);
  end;
end;

procedure TFrmCadClientes.buscarNome;
begin
  dm.QueryClientes.Close;
  dm.QueryClientes.SQL.Clear;                                 //add collate win_ptbr para busca CASE INSESITIVE
  dm.QueryClientes.SQL.Add('select * from TBL_CLIENTES where nome collate win_ptbr LIKE :nome order by nome asc');
  dm.QueryClientes.ParamByName('nome').Value := edtBuscar.Text + '%';
  dm.QueryClientes.Open;
end;

procedure TFrmCadClientes.buscarTudo;
begin
  DM.QueryClientes.Close;
  DM.QueryClientes.SQL.Clear;
  DM.QueryClientes.SQL.Add('select * from TBL_CLIENTES order by nome asc');
  DM.QueryClientes.Open();
end;

procedure TFrmCadClientes.desabilitarCampos;
begin
limparcampos();
EditNOME.Enabled := false;

end;

procedure TFrmCadClientes.edtBuscarChange(Sender: TObject);
begin
buscarNome;
end;

procedure TFrmCadClientes.FormShow(Sender: TObject);
begin
DM.TBL_CLIENTES.Active := false;
DM.TBL_CLIENTES.Active := true;

buscarTudo;
limparCampos;

btnSalvar.Enabled := false;
btnEditar.Enabled := false;
btnDeletar.Enabled := false;
btnCartas.Enabled := false;
end;

procedure TFrmCadClientes.gridCellClick(Column: TColumn);
begin
  DM.TBL_CLIENTES.Edit;
  DM.QueryClientes.Edit;
  btnEditar.Enabled := true;
  btnDeletar.Enabled := true;
  btnCartas.Enabled := true;
  habilitarCampos;

  if DM.QueryClientes.FieldByName('NOME').Value <> null then
  EditNOME.Text := DM.QueryClientes.FieldByName('NOME').Value;

  if DM.QueryClientes.FieldByName('ENDERECO').Value <> null then
  EditENDERECO.Text := DM.QueryClientes.FieldByName('ENDERECO').Value;

  if DM.QueryClientes.FieldByName('NUMERO').Value <> null then
  EditNUMERO.Text  := DM.QueryClientes.FieldByName('NUMERO').Value;

  if DM.QueryClientes.FieldByName('BAIRRO').Value <> null then
  EditBAIRRO.Text  := DM.QueryClientes.FieldByName('BAIRRO').Value;

  if DM.QueryClientes.FieldByName('CIDADE').Value <> null then
  EditCIDADE.Text  := DM.QueryClientes.FieldByName('CIDADE').Value;

  if DM.QueryClientes.FieldByName('ESTADO').Value <> null then
  EditESTADO.Text  := DM.QueryClientes.FieldByName('ESTADO').Value;

  if DM.QueryClientes.FieldByName('CEP').Value <> null then
  MaskCEP.Text  := DM.QueryClientes.FieldByName('CEP').Value;

  if DM.QueryClientes.FieldByName('COMPLEMENTO').Value <> null then
  EditCOMPLEMENTO.Text  := DM.QueryClientes.FieldByName('COMPLEMENTO').Value;

  if DM.QueryClientes.FieldByName('TELPESSOAL').Value <> null then
  EditTELPESSOAL.Text  := DM.QueryClientes.FieldByName('TELPESSOAL').Value;

  if DM.QueryClientes.FieldByName('CONTATO1').Value <> null then
  EditCONTATO1.Text  := DM.QueryClientes.FieldByName('CONTATO1').Value;

  if DM.QueryClientes.FieldByName('CONTATO2').Value <> null then
  EditCONTATO2.Text  := DM.QueryClientes.FieldByName('CONTATO2').Value;

  if DM.QueryClientes.FieldByName('EMAIL').Value <> null then
  EditEMAIL.Text  := DM.QueryClientes.FieldByName('EMAIL').Value;

  if DM.QueryClientes.FieldByName('CNPJCPF').Value <> null then
  EditCNPJCPF.Text  := DM.QueryClientes.FieldByName('CNPJCPF').Value;

  if DM.QueryClientes.FieldByName('id').Value <> null then
  editID.Text := DM.QueryClientes.FieldByName('ID').Value;

end;

procedure TFrmCadClientes.gridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with grid do
  begin
    if Odd( DM.DSClientes.DataSet.RecNo) then
    //Canvas.Brush.Color := clSilver
      Canvas.Brush.Color := clWindow
    else
    Canvas.Brush.Color := clGradientActiveCaption;
     // Canvas.Brush.Color := clMoneyGreen;

    Canvas.FillRect(Rect);
    DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;
end;

procedure TFrmCadClientes.habilitarCampos;
begin
  limparCampos;
  EditNOME        .Enabled := True;
  EditENDERECO    .Enabled := True;
  EditNUMERO      .Enabled := True;
  EditBAIRRO      .Enabled := True;
  EditCIDADE      .Enabled := True;
  EditESTADO      .Enabled := True;
  MaskCEP         .Enabled := True;
  EditCOMPLEMENTO .Enabled := True;
  EditTELPESSOAL  .Enabled := True;
  EditCONTATO1    .Enabled := True;
  EditCONTATO2    .Enabled := True;
  EditEMAIL       .Enabled := True;
  EditCNPJCPF     .Enabled := True;
end;

procedure TFrmCadClientes.limparCampos;
begin
  EditNOME         .Text  := '';
  EditENDERECO     .Text  := '';
  EditNUMERO       .Text  := '';
  EditBAIRRO       .Text  := '';
  EditCIDADE       .Text  := '';
  EditESTADO       .Text  := '';
  MaskCEP          .Text  := '';
  EditCOMPLEMENTO  .Text  := '';
  EditTELPESSOAL   .Text  := '';
  EditCONTATO1     .Text  := '';
  EditCONTATO2     .Text  := '';
  EditEMAIL        .Text  := '';
  EditCNPJCPF      .Text  := '';
end;

end.
