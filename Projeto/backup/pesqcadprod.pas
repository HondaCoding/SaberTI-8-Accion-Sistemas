unit PesqCadProd;

{$mode ObjFPC}{$H+}

interface

uses
                  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs,
		  DBGrids, ExtCtrls, StdCtrls, Buttons, dm;

type

		  { TPesqCadProdF }

                  TPesqCadProdF = class(TForm)
				    dsPesqCadProd: TDataSource;
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
                  PesqCadProdF: TPesqCadProdF;

implementation
uses CadProduto;
{$R *.lfm}

{ TPesqCadProdF }

procedure TPesqCadProdF.DBGrid1DblClick(Sender: TObject);
begin
      CadProdutoF.DBEdit1.Text := dmF.qryCategoriacategoriaprodutoid.asstring;
      PesqCadProdF.Close;
end;

procedure TPesqCadProdF.FormClose(Sender: TObject; var CloseAction: TCloseAction
		  );
begin
                  //CloseAction:=caFree;
end;

procedure TPesqCadProdF.SpeedButton1Click(Sender: TObject);
begin
     dmF.qryCategoria.Close;
     dmF.qryCategoria.SQL.Clear;
     dmF.qryCategoria.SQL.Text:= 'select * from categoria_produto '+
                                 'WHERE ds_categoria_produto LIKE ' + QuotedStr(UpperCase('%' + edtBuscar.Text + '%'));
     dmF.qryCategoria.Open;
end;

end.

