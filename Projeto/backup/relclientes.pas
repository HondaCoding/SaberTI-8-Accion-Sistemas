unit relClientes;

{$mode ObjFPC}{$H+}

interface

uses
                  Classes, SysUtils, Forms, Controls, Graphics, Dialogs,
		  Buttons, ExtCtrls, ZDataset, LR_DBSet, LR_Class, dm, DB;

type

		  { TrelClientesF }

                  TrelClientesF = class(TForm)
				    BitBtn1: TBitBtn;
				    frDBDataSet1: TfrDBDataSet;
				    frReport1: TfrReport;
				    Panel1: TPanel;
				    qryRelClientes: TZQuery;
				    qryRelClientesclienteid: TLongintField;

						      qryRelClientescpf_cnpj_cliente: TStringField;
				    qryRelClientesnome_cliente: TStringField;
				    qryRelClientestipo_cliente: TStringField;
				    procedure BitBtn1Click(Sender: TObject);
        procedure FormShow(Sender: TObject);
                  private

                  public

                  end;

var
                  relClientesF: TrelClientesF;

implementation

{$R *.lfm}

{ TrelClientesF }

procedure TrelClientesF.FormShow(Sender: TObject);
begin
     qryRelClientes.Open;
end;

procedure TrelClientesF.BitBtn1Click(Sender: TObject);
begin
     frReport1.LoadFromFile('RelClientes.lrf');
     frReport1.PrepareReport;
     frReport1.ShowReport;
end;

end.

