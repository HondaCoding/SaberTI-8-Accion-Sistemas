unit PesqOrcItemProd;

{$mode ObjFPC}{$H+}

interface

uses
                  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs,
		  DBGrids, ExtCtrls, StdCtrls, Buttons, dm;

type

		  { TPesqOrcItemProdF }

                  TPesqOrcItemProdF = class(TForm)
                    DBGrid1: TDBGrid;
				    dsProdutos: TDataSource;
				    edtBuscar: TEdit;
				    Label1: TLabel;
				    Panel1: TPanel;
				    SpeedButton1: TSpeedButton;
                                    SpeedButton2: TSpeedButton;
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
                  PesqOrcItemProdF: TPesqOrcItemProdF;

implementation
uses PesqOrcItem;
{$R *.lfm}

{ TPesqOrcItemProdF }

procedure TPesqOrcItemProdF.DBGrid1DblClick(Sender: TObject);
begin
     PesqOrcItemF.edtProduto.Text:= dmF.qryPesqOrcItemProdprodutoid.AsString;
     PesqOrcItemF.edtDescProduto.Text:= dmF.qryPesqOrcItemProdds_produto.AsString;
     PesqOrcItemF.edtVlrUnit.Text:= dmF.qryPesqOrcItemProdvl_venda_produto.AsString;
     PesqOrcItemProdF.Close;
end;

procedure TPesqOrcItemProdF.FormShow(Sender: TObject);
begin
     dmF.qryPesqOrcItemProd.Open;
end;

procedure TPesqOrcItemProdF.SpeedButton1Click(Sender: TObject);     // Buscar
begin
     dmF.qryPesqOrcItemProd.Close;
     dmF.qryPesqOrcItemProd.SQL.Clear;
     dmF.qryPesqOrcItemProd.SQL.Text:= 'select produtoid, ds_produto, vl_venda_produto  from produto p ' +
                               'WHERE ds_produto LIKE ' + QuotedStr('%' + edtBuscar.Text + '%');
     dmF.qryPesqOrcItemProd.Open;
end;

procedure TPesqOrcItemProdF.SpeedButton2Click(Sender: TObject);
begin
     dmF.qryPesqOrcItemProd.Close;
     dmF.qryPesqOrcItemProd.SQL.Text:= 'select produtoid, ds_produto, vl_venda_produto  from produto p';
     dmF.qryPesqOrcItemProd.Open;
     edtBuscar.Clear;
end;

end.

