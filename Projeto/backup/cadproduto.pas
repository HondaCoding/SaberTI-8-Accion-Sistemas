unit CadProduto;

{$mode ObjFPC}{$H+}

interface

uses
                  Classes, SysUtils, Forms, Controls, Graphics, Dialogs,
		  DBCtrls, StdCtrls, Buttons, CadModelo, PesqCadProd, dm;

type

		  { TCadProdutoF }

                  TCadProdutoF = class(TCadModeloF)
				    DBComboBox1: TDBComboBox;
				    DBEdit1: TDBEdit;
				    DBEdit2: TDBEdit;
				    DBEdit3: TDBEdit;
				    DBEdit4: TDBEdit;
				    DBEdit5: TDBEdit;
				    DBEdit6: TDBEdit;
				    DBNavigator1: TDBNavigator;
				    edtBuscar: TEdit;
				    Label2: TLabel;
				    Label3: TLabel;
				    Label4: TLabel;
				    Label5: TLabel;
				    Label6: TLabel;
				    Label7: TLabel;
				    Label8: TLabel;
				    SpeedButton1: TSpeedButton;
				    SpeedButton2: TSpeedButton;
				    procedure btnBuscarClick(Sender: TObject);
        procedure btnCancelarClick(Sender: TObject);
        procedure btnExcluirClick(Sender: TObject);
	procedure btnFecharClick(Sender: TObject);
				    procedure btnGravarClick(Sender: TObject);
        procedure btnNovoClick(Sender: TObject);
	procedure DBGrid1DblClick(Sender: TObject);
	procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
	procedure FormShow(Sender: TObject);
	procedure SpeedButton1Click(Sender: TObject);
	procedure SpeedButton2Click(Sender: TObject);
                  private

                  public

                  end;

var
                  CadProdutoF: TCadProdutoF;

implementation

{$R *.lfm}

{ TCadProdutoF }

procedure TCadProdutoF.btnNovoClick(Sender: TObject);  // Novo
begin
     dmF.qryProduto.Insert;
     PageControl1.ActivePage := tbCadastro;
     DBEdit3.Text:= DateToStr(Date);
     if DBEdit3.CanFocus then
     DBEdit5.SetFocus;

end;

procedure TCadProdutoF.DBGrid1DblClick(Sender: TObject);
begin
     PageControl1.ActivePage := tbCadastro;
end;

procedure TCadProdutoF.FormClose(Sender: TObject; var CloseAction: TCloseAction
		  );
begin
                  CloseAction:= caFree;
end;

procedure TCadProdutoF.FormShow(Sender: TObject);
begin
     PageControl1.ActivePage := tbPesquisa;
     dmF.qryProduto.Open;
end;

procedure TCadProdutoF.SpeedButton1Click(Sender: TObject);   // REFRESH
begin
     dmF.qryProduto.Close;
     dmF.qryProduto.SQL.Text:= 'select * from produto';
     dmF.qryProduto.Open;
     edtBuscar.Clear;
end;

procedure TCadProdutoF.SpeedButton2Click(Sender: TObject);
begin
     PesqCadProdF := TPesqCadProdF.Create(Self);
     PesqCadProdF.ShowModal;
end;

procedure TCadProdutoF.btnExcluirClick(Sender: TObject);    // Excluir
begin
     If  MessageDlg('Deseja excluir o registro?', mtWarning,[mbyes,mbno],0)=mryes then
     begin
          dmF.qryProduto.Delete;
          PageControl1.ActivePage := tbPesquisa;
     end;
end;

procedure TCadProdutoF.btnFecharClick(Sender: TObject);     // Fechar
begin
     dmF.qryProduto.Close;
     CadProdutoF.Close;
end;

procedure TCadProdutoF.btnCancelarClick(Sender: TObject);  // Cancelar
begin
     dmF.qryProduto.Cancel;
     PageControl1.ActivePage := tbPesquisa;
end;

procedure TCadProdutoF.btnBuscarClick(Sender: TObject);    // Buscar
begin
     dmF.qryProduto.Close;
     dmF.qryProduto.SQL.Clear;
     dmF.qryProduto.SQL.Text:= 'select * from produto ' +
                               'WHERE ds_produto LIKE ' + QuotedStr(UpperCase('%' + edtBuscar.Text + '%'));
     dmF.qryProduto.Open;
end;

procedure TCadProdutoF.btnGravarClick(Sender: TObject);     // Gravar
begin
     dmF.qryProduto.Post;
     PageControl1.ActivePage := tbPesquisa;
end;

end.

