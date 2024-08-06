unit relOrcamentos;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  ZDataset, LR_DBSet, LR_Class;

type

  { TrelOrcamentosF }

  TrelOrcamentosF = class(TForm)
    BitBtn1: TBitBtn;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    Panel1: TPanel;
    qryRelOrcamentos: TZQuery;
    procedure BitBtn1Click(Sender: TObject);
  private

  public

  end;

var
  relOrcamentosF: TrelOrcamentosF;

implementation

{$R *.lfm}

{ TrelOrcamentosF }

procedure TrelOrcamentosF.BitBtn1Click(Sender: TObject);
begin
     frReport1.LoadFromFile('RelOrcamentos.lrf');
     frReport1.PrepareReport;
     frReport1.ShowReport;
end;

end.

