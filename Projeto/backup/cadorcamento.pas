unit CadOrcamento;

{$mode ObjFPC}{$H+}

interface

uses
                  Classes, SysUtils, Forms, Controls, Graphics, Dialogs,
		  StdCtrls, ExtCtrls, DBGrids, Buttons, DBCtrls, CadModelo, PesqOrcItem, DB, dm, PesqCliente;

type

		  { TCadOrcamentoF }

                  TCadOrcamentoF = class(TCadModeloF)
				    BitBtn1: TBitBtn;
				    BitBtn2: TBitBtn;
				    dsOrcamentoItem: TDataSource;
				    edtID: TDBEdit;
				    edtCliente: TDBEdit;
				    edtDtOrcamento: TDBEdit;
				    edtValidade: TDBEdit;
				    edtTotalOrcamento: TDBEdit;
				    DBGrid2: TDBGrid;
				    edtBuscar: TEdit;
				    Label2: TLabel;
				    Label3: TLabel;
				    Label4: TLabel;
				    Label5: TLabel;
				    Label6: TLabel;
				    lblCliente: TLabel;
				    Panel4: TPanel;
				    SpeedButton1: TSpeedButton;
				    SpeedButton2: TSpeedButton;
				    procedure BitBtn1Click(Sender: TObject);
				    procedure BitBtn2Click(Sender: TObject);
				    procedure btnBuscarClick(Sender: TObject);
				    procedure btnCancelarClick(Sender: TObject);
				    procedure btnExcluirClick(Sender: TObject);
                                    procedure btnFecharClick(Sender: TObject);
				    procedure btnGravarClick(Sender: TObject);
				    procedure btnNovoClick(Sender: TObject);
				    procedure DBGrid1DblClick(Sender: TObject);
				    procedure FormShow(Sender: TObject);
				    procedure SpeedButton1Click(Sender: TObject
						      );
				    procedure SpeedButton2Click(Sender: TObject
						      );
                  private

                  public

                  end;

var
                  CadOrcamentoF: TCadOrcamentoF;

implementation

{$R *.lfm}

{ TCadOrcamentoF }

procedure TCadOrcamentoF.BitBtn1Click(Sender: TObject);   // Adicionar Item      &      mostrar o id do orçamento no Grid do tbCadastro
var
          id : String;
begin
     dmF.qryOrcamentoItem.Insert;
     dmF.qryOrcamentoItemorcamentoid.AsInteger:= dmF.qryOrcamentoorcamentoid.AsInteger;

     DMF.qryGenerica.close;
     DMF.qryGenerica.SQL.Clear;
     DMF.qryGenerica.SQL.Add('SELECT MAX(orcamentoitemid) + 1 PROXCODIGO '+
                                   'FROM orcamento_item');

     DMF.qryGenerica.Open;

     id := DMF.qryGenerica.FieldByName('PROXCODIGO').AsString;

     if id = '' then
        DMF.qryOrcamentoItemorcamentoitemid.AsInteger := 1
     else
         DMF.qryOrcamentoItemorcamentoitemid.AsInteger := StrToInt(id);

     PesqOrcItemF := TPesqOrcItemF.Create(Self);
     PesqOrcItemF.ShowModal;
end;

procedure TCadOrcamentoF.BitBtn2Click(Sender: TObject);   // Excluir Item
begin
     dmF.qryOrcamentoItem.Delete;
end;

procedure TCadOrcamentoF.btnBuscarClick(Sender: TObject);    // Buscar
begin
     dmF.qryOrcamento.Close;
     dmF.qryOrcamento.SQL.Clear;
     dmF.qryOrcamento.SQL.Text:= 'select * from orcamento ' +
                                 'WHERE orcamentoid = ' + QuotedStr(edtBuscar.Text);
     dmF.qryOrcamento.Open;
end;

procedure TCadOrcamentoF.btnCancelarClick(Sender: TObject);  // Cancelar (cancela o orçamento todo)
begin
     If  MessageDlg('Deseja cancelar o orçamento?', mtWarning,[mbyes,mbno],0)=mryes then
     begin
          dmF.qryOrcamento.Delete;
          PageControl1.ActivePage := tbPesquisa;
     end;
end;

procedure TCadOrcamentoF.btnExcluirClick(Sender: TObject);  // Excluir Orçamento
begin
     If  MessageDlg('Deseja excluir o orçamento?', mtWarning,[mbyes,mbno],0)=mryes then
     begin
          dmF.qryOrcamento.Delete;
          PageControl1.ActivePage := tbPesquisa;
     end;
end;

procedure TCadOrcamentoF.btnFecharClick(Sender: TObject);
begin
     dmF.qryOrcamento.Close;
     CadOrcamentoF.Close;
end;

procedure TCadOrcamentoF.btnGravarClick(Sender: TObject);   // Gravar
begin
     dmF.qryOrcamento.Post;
     PageControl1.ActivePage := tbPesquisa;
end;

procedure TCadOrcamentoF.btnNovoClick(Sender: TObject);     // Novo
begin
     dmF.qryOrcamento.Insert;

     dmF.qryOrcamentoItem.Close;
     dmF.qryOrcamentoItem.SQL.Clear;
     dmF.qryOrcamentoItem.SQL.Text:= 'select * from orcamento_item ' +
                                     'WHERE orcamentoid = ' + edtID.Text;
     dmF.qryOrcamentoItem.Open;

     PageControl1.ActivePage := tbCadastro;
     edtDtOrcamento.Text:= DateToStr(Date);
     edtValidade.Text:= DateToStr(Date + 15);
end;

procedure TCadOrcamentoF.DBGrid1DblClick(Sender: TObject);    // Grid doubleclick
begin
     // SELECT DO ORÇAMENTO ESCOLHIDO PARA O GRID DA TELA CADASTRO
     dmF.qryOrcamentoItem.Close;
     dmF.qryOrcamentoItem.SQL.Clear;
     dmF.qryOrcamentoItem.SQL.Text:= 'select * from orcamento_item ' +
                                     'WHERE orcamentoid = ' + dmF.qryOrcamentoorcamentoid.AsString;
     dmF.qryOrcamentoItem.Open;

     // SELECT DO 'NOME_CLIENTE' PARA TELA CADASTRO
     dmF.qryGenerica.Close;
     dmF.qryGenerica.SQL.Clear;
     dmF.qryGenerica.SQL.Text := 'select nome_cliente from cliente ' +
                                 'WHERE clienteid = ' + dmF.qryOrcamentoclienteid.AsString;
     dmF.qryGenerica.Open;

     // MOSTRA O NOME DO CLIENTE NO LABEL DA TELA CADASTRO
     lblCliente.Caption:= dmF.qryGenerica.FieldByName('NOME_CLIENTE').AsString;
     lblCliente.Visible:= True;
     PageControl1.ActivePage := tbCadastro;
end;

procedure TCadOrcamentoF.FormShow(Sender: TObject);
begin
     PageControl1.ActivePage := tbPesquisa;
     dmF.qryOrcamento.Open;
end;

procedure TCadOrcamentoF.SpeedButton1Click(Sender: TObject);    // Pequisa Clientes
begin
     PesqClienteF.ShowModal;
end;

procedure TCadOrcamentoF.SpeedButton2Click(Sender: TObject);    // REFRESH
begin
     dmF.qryOrcamento.Close;
     dmF.qryOrcamento.SQL.Text:= 'select * from orcamento';
     dmF.qryOrcamento.Open;
     edtBuscar.Clear;
end;

end.

