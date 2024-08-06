unit relCategorias;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  LR_DBSet, LR_Class, ZDataset, dm;

type

  { TrelCategoriasF }

  TrelCategoriasF = class(TForm)
    BitBtn1: TBitBtn;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    Panel1: TPanel;
    qryRelCategorias: TZQuery;
    qryRelCategoriascategoriaprodutoid: TLongintField;
    qryRelCategoriasds_categoria_produto: TStringField;
    procedure BitBtn1Click(Sender: TObject);
  private

  public

  end;

var
  relCategoriasF: TrelCategoriasF;

implementation

{$R *.lfm}

{ TrelCategoriasF }

procedure TrelCategoriasF.BitBtn1Click(Sender: TObject);
begin
     frReport1.LoadFromFile('RelCategorias.lrf');
     frReport1.PrepareReport;
     frReport1.ShowReport;
end;

end.

