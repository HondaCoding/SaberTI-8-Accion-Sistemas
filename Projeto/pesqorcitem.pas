unit PesqOrcItem;

{$mode ObjFPC}{$H+}

interface

uses
                  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs,
		  ExtCtrls, StdCtrls, Buttons, DBGrids, DBCtrls, PesqOrcItemProd, dm;

type

		  { TPesqOrcItemF }

                  TPesqOrcItemF = class(TForm)
				    btnCancelar: TBitBtn;
				    btnInserir: TBitBtn;
				    edtProduto: TDBEdit;
				    edtDescProduto: TDBEdit;
				    edtQtde: TDBEdit;
				    edtVlrUnit: TDBEdit;
				    edtVlrTotal: TDBEdit;
				    dsPesqOrcItem: TDataSource;
				    Label1: TLabel;
				    Label2: TLabel;
				    Label3: TLabel;
				    Label4: TLabel;
				    Label5: TLabel;
				    Panel1: TPanel;
				    SpeedButton1: TSpeedButton;
				    procedure btnCancelarClick(Sender: TObject);
        procedure btnInserirClick(Sender: TObject);
				    procedure edtQtdeExit(Sender: TObject);
        procedure SpeedButton1Click(Sender: TObject
						      );
                  private
                         procedure SomaItens;
                  public
                  end;

var
                  PesqOrcItemF: TPesqOrcItemF;

implementation
uses
    CadOrcamento;
{$R *.lfm}

{ TPesqOrcItemF }

procedure TPesqOrcItemF.SpeedButton1Click(Sender: TObject);
begin
     PesqOrcItemProdF := TPesqOrcItemProdF.Create(Self);
     PesqOrcItemProdF.ShowModal;
end;

procedure TPesqOrcItemF.btnInserirClick(Sender: TObject);
begin
     dmF.qryOrcamentoItem.Post;
     SomaItens;

     PesqOrcItemF.Close;
end;

procedure TPesqOrcItemF.SomaItens;
begin
  if not (dmF.qryOrcamento.State in [dsEdit, dsInsert]) then
     dmF.qryOrcamento.Edit;

  if not (dmF.qryOrcamentoItem.State in [dsEdit, dsInsert]) then
     dmF.qryOrcamentoItem.Edit;

  //Vai pro Primeiro
  dmF.qryOrcamentoItem.First;
  dmF.qryOrcamentovl_total_orcamento.AsFloat := 0;  ///////////////////
  while not dmF.qryOrcamentoItem.Eof do
  begin
    dmF.qryOrcamentovl_total_orcamento.AsFloat := dmF.qryOrcamentovl_total_orcamento.AsFloat + dmF.qryOrcamentoItemvl_total.AsFloat;
    dmF.qryOrcamentoItem.next;
  end;
end;

procedure TPesqOrcItemF.btnCancelarClick(Sender: TObject);
begin
     if edtQtde.Field.AsString = '' then
        begin
             edtQtde.Field.AsString := '0';
	end;
     dmF.qryOrcamentoItem.Cancel;
     PesqOrcItemF.Close;
end;

procedure TPesqOrcItemF.edtQtdeExit(Sender: TObject);    // Calcular Qtde * Valor Unit
var
     total, x, y : Double;
begin
     if edtQtde.Field.AsString <> '' then
     begin
          x := StrToFloat(edtQtde.Text);
          y := StrToFloat(edtVlrUnit.Text);

          total := x * y;

          dmF.qryOrcamentoItemvl_total.AsString := FloatToStr(total);
     end;
end;

end.

