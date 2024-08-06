unit PesqCliente;

{$mode ObjFPC}{$H+}

interface

uses
                  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs,
		  ExtCtrls, DBGrids, Buttons, StdCtrls, dm;

type

		  { TPesqClienteF }

                  TPesqClienteF = class(TForm)
				    dsCliente: TDataSource;
				    DBGrid1: TDBGrid;
				    edtBuscar: TEdit;
				    Label1: TLabel;
				    Panel1: TPanel;
				    SpeedButton1: TSpeedButton;
				    procedure DBGrid1DblClick(Sender: TObject);
				    procedure FormClose(Sender: TObject;
						      var CloseAction: TCloseAction);
				    procedure SpeedButton1Click(Sender: TObject
						      );
                  private

                  public

                  end;

var
                  PesqClienteF: TPesqClienteF;

implementation
uses
    CadOrcamento;
{$R *.lfm}

{ TPesqClienteF }

procedure TPesqClienteF.DBGrid1DblClick(Sender: TObject);
begin
     CadOrcamentoF.edtCliente.Text:= dmF.qryClienteclienteid.AsString;
     CadOrcamentoF.lblCliente.Caption:= dmF.qryCliente.FieldByName('NOME_CLIENTE').AsString;
     CadOrcamentoF.lblCliente.Visible:= True;
     PesqClienteF.Close;
end;

procedure TPesqClienteF.FormClose(Sender: TObject; var CloseAction: TCloseAction
		  );
begin
                  //CloseAction:= caFree;
end;

procedure TPesqClienteF.SpeedButton1Click(Sender: TObject);    // Buscar
begin
     dmF.qryCliente.Close;
     dmF.qryCliente.SQL.Clear;
     dmF.qryCliente.SQL.Text:= 'select * from cliente ' +
                               'WHERE nome_cliente LIKE ' + QuotedStr('%' + edtBuscar.Text + '%');
     dmF.qryCliente.Open;
end;

end.

