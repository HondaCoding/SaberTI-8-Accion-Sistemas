unit CadCliente;

{$mode ObjFPC}{$H+}

interface

uses
                  Classes, SysUtils, Forms, Controls, Graphics, Dialogs,
		  StdCtrls, DBCtrls, Buttons, CadModelo, dm;

type

		  { TCadClienteF }

                  TCadClienteF = class(TCadModeloF)
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
				    radioBtnCPF: TRadioButton;
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
				    procedure PageControl1Change(Sender: TObject
						      );
				    procedure SpeedButton1Click(Sender: TObject
						      );
                  private

                  public

                  end;

var
                  CadClienteF: TCadClienteF;

implementation

{$R *.lfm}

{ TCadClienteF }

procedure TCadClienteF.btnNovoClick(Sender: TObject);   // Novo
begin
     dmF.qryCliente.Insert;
     PageControl1.ActivePage := tbCadastro;

     if DBEdit2.CanFocus then
     DBEdit2.SetFocus;
end;

procedure TCadClienteF.btnGravarClick(Sender: TObject);  // Gravar
begin
     dmF.qryCliente.Post;
     PageControl1.ActivePage := tbPesquisa;
end;

procedure TCadClienteF.btnFecharClick(Sender: TObject);   // Fechar
begin
     dmF.qryCliente.Close;
     CadClienteF.Close;
end;

procedure TCadClienteF.btnExcluirClick(Sender: TObject);       // Excluir
begin
     If  MessageDlg('Deseja excluir o registro?', mtWarning,[mbyes,mbno],0)=mryes then
     begin
          dmF.qryCliente.Delete;
          PageControl1.ActivePage := tbPesquisa;
     end;
end;

procedure TCadClienteF.btnCancelarClick(Sender: TObject);    // Cancelar
begin
     dmF.qryCliente.Cancel;
     PageControl1.ActivePage := tbPesquisa;
end;

procedure TCadClienteF.btnBuscarClick(Sender: TObject);      //  Buscar
begin
     if (radioBtnCPF.Checked) AND (edtBuscar.Text <> '') then
     begin
          dmF.qryCliente.Close;
          dmF.qryCliente.SQL.Clear;
          dmF.qryCliente.SQL.Text:= 'select * from cliente ' +
                                    'WHERE cpf_cnpj_cliente LIKE ' + QuotedStr('%' + edtBuscar.Text + '%');
          dmF.qryCliente.Open;
     end
     else if (radioBtnNome.Checked) AND (edtBuscar.Text <> '') then
     begin
          dmF.qryCliente.Close;
          dmF.qryCliente.SQL.Clear;
          dmF.qryCliente.SQL.Text:= 'select * from cliente ' +
                                    'WHERE nome_cliente LIKE ' + QuotedStr('%' + edtBuscar.Text + '%');
          dmF.qryCliente.Open;
     end
end;

procedure TCadClienteF.DBGrid1DblClick(Sender: TObject);
begin
     PageControl1.ActivePage := tbCadastro;
end;

procedure TCadClienteF.FormClose(Sender: TObject; var CloseAction: TCloseAction
		  );
begin
     CloseAction:= caFree;
end;

procedure TCadClienteF.FormShow(Sender: TObject);
begin
     PageControl1.ActivePage := tbPesquisa;
     dmF.qryCliente.Open;
end;

procedure TCadClienteF.PageControl1Change(Sender: TObject);
begin

end;

procedure TCadClienteF.SpeedButton1Click(Sender: TObject); // REFRESH
begin
     dmF.qryCliente.Close;
     dmF.qryCliente.SQL.Text:= 'select * from cliente';
     dmF.qryCliente.Open;
     edtBuscar.Clear;
end;

end.

