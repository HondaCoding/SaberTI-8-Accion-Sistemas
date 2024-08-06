unit CadCategoria;

{$mode ObjFPC}{$H+}

interface

uses
                  Classes, SysUtils, Forms, Controls, Graphics, Dialogs,
		  StdCtrls, DBCtrls, Buttons, CadModelo, dm;

type

		  { TCadCategoriaF }

                  TCadCategoriaF = class(TCadModeloF)
				    btnEditar: TButton;
				    DBEdit1: TDBEdit;
				    DBEdit2: TDBEdit;
				    DBNavigator1: TDBNavigator;
				    edtBuscar: TEdit;
				    Label2: TLabel;
				    Label3: TLabel;
				    radioBtnId: TRadioButton;
				    radioBtnDesc: TRadioButton;
				    SpeedButton1: TSpeedButton;
				    procedure btnBuscarClick(Sender: TObject);
        procedure btnCancelarClick(Sender: TObject);
				    procedure btnEditarClick(Sender: TObject);
        procedure btnExcluirClick(Sender: TObject);
	procedure btnFecharClick(Sender: TObject);
        procedure btnGravarClick(Sender: TObject);
        procedure btnNovoClick(Sender: TObject);
        procedure DBGrid1DblClick(Sender: TObject);
	procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
	procedure FormShow(Sender: TObject);
	procedure SpeedButton1Click(Sender: TObject);
                  private

                  public

                  end;

var
                  CadCategoriaF: TCadCategoriaF;

implementation

{$R *.lfm}

{ TCadCategoriaF }

procedure TCadCategoriaF.DBGrid1DblClick(Sender: TObject);
begin
     PageControl1.ActivePage := tbCadastro;
end;

procedure TCadCategoriaF.FormClose(Sender: TObject;
		  var CloseAction: TCloseAction);
begin
                  CloseAction:= caFree;
end;

procedure TCadCategoriaF.FormShow(Sender: TObject);
begin
     PageControl1.ActivePage := tbPesquisa;
     dmF.qryCategoria.Open;
end;

procedure TCadCategoriaF.SpeedButton1Click(Sender: TObject);   // REFRESH
begin
     dmF.qryCategoria.Close;
     dmF.qryCategoria.SQL.Text:= 'select * from categoria_produto';
     dmF.qryCategoria.Open;
     edtBuscar.Clear;
end;

procedure TCadCategoriaF.btnNovoClick(Sender: TObject);      // Novo
begin
     dmF.qryCategoria.Insert;
     PageControl1.ActivePage := tbCadastro;

     if DBEdit2.CanFocus then
     DBEdit2.SetFocus;
end;

procedure TCadCategoriaF.btnGravarClick(Sender: TObject);    // Gravar
begin
     dmF.qryCategoria.Post;
     PageControl1.ActivePage := tbPesquisa;
end;

procedure TCadCategoriaF.btnExcluirClick(Sender: TObject);    // Excluir
begin
     If  MessageDlg('Deseja excluir o registro?', mtWarning,[mbyes,mbno],0)=mryes then
     begin
          dmF.qryCategoria.delete;
          PageControl1.ActivePage := tbPesquisa;
     end;
end;

procedure TCadCategoriaF.btnFecharClick(Sender: TObject);    // Fechar
begin
     dmF.qryCategoria.Close;
     CadCategoriaF.Close;
end;

procedure TCadCategoriaF.btnCancelarClick(Sender: TObject);   // Cancelar
begin
     dmF.qryCategoria.Cancel;
     PageControl1.ActivePage := tbPesquisa;
end;

procedure TCadCategoriaF.btnBuscarClick(Sender: TObject);   // Buscar
begin
     if radioBtnDesc.Checked then
     begin
          dmF.qryCategoria.Close;
	  dmF.qryCategoria.SQL.Clear;
	  dmF.qryCategoria.SQL.Text:= 'select * from categoria_produto '+
	                              'WHERE ds_categoria_produto LIKE ' + QuotedStr(UpperCase('%' + edtBuscar.Text + '%'));
	  dmF.qryCategoria.Open;
     end
     else if (radioBtnId.Checked) AND (edtBuscar.Text <> '') then
     begin
          dmF.qryCategoria.Close;
	  dmF.qryCategoria.SQL.Clear;
	  dmF.qryCategoria.SQL.Text:= 'select * from categoria_produto '+
	                              'WHERE categoriaprodutoid = ' + QuotedStr(edtBuscar.Text);
	  dmF.qryCategoria.Open;
     end
end;

procedure TCadCategoriaF.btnEditarClick(Sender: TObject);   // Editar
begin
     dmF.qryCategoria.Edit;
     PageControl1.ActivePage := tbPesquisa;
end;

end.

