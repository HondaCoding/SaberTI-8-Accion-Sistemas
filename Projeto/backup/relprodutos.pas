unit relProdutos;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  LR_DBSet, LR_Class, ZDataset, dm;

type

  { TrelProdutosF }

  TrelProdutosF = class(TForm)
    BitBtn1: TBitBtn;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    Panel1: TPanel;
    qryRelProdutos: TZQuery;
    qryRelProdutoscategoriaprodutoid: TLongintField;
    qryRelProdutosds_produto: TStringField;
    qryRelProdutosdt_cadastro_produto: TDateTimeField;
    qryRelProdutosobs_produto: TStringField;
    qryRelProdutosprodutoid: TLongintField;
    qryRelProdutosstatus_produto: TStringField;
    qryRelProdutosvl_venda_produto: TFloatField;
    procedure BitBtn1Click(Sender: TObject);
  private

  public

  end;

var
  relProdutosF: TrelProdutosF;

implementation

{$R *.lfm}

{ TrelProdutosF }

procedure TrelProdutosF.BitBtn1Click(Sender: TObject);
begin
     frReport1.LoadFromFile('RelProdutos.lrf');
     frReport1.PrepareReport;
     frReport1.ShowReport;
end;

end.

