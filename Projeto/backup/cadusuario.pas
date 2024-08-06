unit CadUsuario;

{$mode ObjFPC}{$H+}

interface

uses
                  Classes, SysUtils, Forms, Controls, Graphics, Dialogs,
		  DBCtrls, StdCtrls, Buttons, CadModelo, dm;

type

		  { TCadUsuarioF }

                  TCadUsuarioF = class(TCadModeloF)
				    DBEdit1: TDBEdit;
				    DBEdit2: TDBEdit;
				    DBEdit3: TDBEdit;
				    DBEdit4: TDBEdit;
				    DBNavigator1: TDBNavigator;
				    edtBuscar: TEdit;
				    Label2: TLabel;
				    Label3: TLabel;
				    Label4: TLabel;
				    Label5: TLabel;
				    radioBtnUsuario: TRadioButton;
				    radioBtnNome: TRadioButton;
				    SpeedButton1: TSpeedButton;
				    procedure btnBuscarClick(Sender: TObject);
        procedure btnCancelarClick(Sender: TObject);
        procedure btnExcluirClick(Sender: TObject);
        procedure btnFecharClick(Sender: TObject);
				    procedure btnGravarClick(Sender: TObject);
				    procedure btnNovoClick(Sender: TObject);
				    procedure DBGrid1DblClick(Sender: TObject);
				    procedure FormClose(Sender: TObject;
						      var CloseAction: TCloseAction);
				    procedure FormShow(Sender: TObject);
				    procedure SpeedButton1Click(Sender: TObject
						      );
                  private

                  public

                  end;

var
                  CadUsuarioF: TCadUsuarioF;

implementation

{$R *.lfm}

{ TCadUsuarioF }

procedure TCadUsuarioF.btnFecharClick(Sender: TObject);     // Fechar
begin
     dmF.qryUsuario.Close;
     CadUsuarioF.Close;
end;

procedure TCadUsuarioF.btnExcluirClick(Sender: TObject);    // Excluir
begin
     If  MessageDlg('Deseja excluir o registro?', mtWarning,[mbyes,mbno],0)=mryes then
     begin
          dmF.qryUsuario.Delete;
          PageControl1.ActivePage := tbPesquisa;
     end;
end;

procedure TCadUsuarioF.btnCancelarClick(Sender: TObject);    // Cancelar
begin
     dmF.qryUsuario.Cancel;
     PageControl1.ActivePage := tbPesquisa;
end;

procedure TCadUsuarioF.btnBuscarClick(Sender: TObject);      // Buscar
begin
     if (radioBtnUsuario.Checked) AND (edtBuscar.Text <> '') then
     begin
          dmF.qryUsuario.Close;
          dmF.qryUsuario.SQL.Clear;
          dmF.qryUsuario.SQL.Text:= 'select * from usuarios ' +
                                    'WHERE usuario LIKE ' + QuotedStr(UpperCase('%' + edtBuscar.Text + '%'));
          dmF.qryUsuario.Open;
     end
     else if (radioBtnNome.Checked) AND (edtBuscar.Text <> '') then
     begin
          dmF.qryUsuario.Close;
          dmF.qryUsuario.SQL.Clear;
          dmF.qryUsuario.SQL.Text:= 'select * from usuarios ' +
                                    'WHERE nome_completo LIKE ' + QuotedStr(UpperCase('%' + edtBuscar.Text + '%'));
          dmF.qryUsuario.Open;
     end
end;

procedure TCadUsuarioF.btnGravarClick(Sender: TObject);     // Gravar
begin
     dmF.qryUsuario.Post;
     PageControl1.ActivePage := tbPesquisa;
end;

procedure TCadUsuarioF.btnNovoClick(Sender: TObject);      // Novo
begin
     dmF.qryUsuario.Insert;
     PageControl1.ActivePage := tbCadastro;

     if DBEdit3.CanFocus then
     DBEdit3.SetFocus;
end;

procedure TCadUsuarioF.DBGrid1DblClick(Sender: TObject);
begin
     PageControl1.ActivePage := tbCadastro;
end;

procedure TCadUsuarioF.FormClose(Sender: TObject; var CloseAction: TCloseAction
		  );
begin
                  CloseAction:= caFree;
end;

procedure TCadUsuarioF.FormShow(Sender: TObject);
begin
     PageControl1.ActivePage := tbPesquisa;
     dmF.qryUsuario.Open;
end;

procedure TCadUsuarioF.SpeedButton1Click(Sender: TObject);
begin
     dmF.qryProduto.Close;
     dmF.qryProduto.SQL.Text:= 'select * from produto';
     dmF.qryProduto.Open;
     edtBuscar.Clear;
end;

end.

