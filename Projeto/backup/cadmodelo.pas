unit CadModelo;

{$mode ObjFPC}{$H+}

interface

uses
                  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs,
		  ExtCtrls, StdCtrls, DBGrids, ComCtrls, ZDataset;

type

		  { TCadModeloF }

                  TCadModeloF = class(TForm)
				    btnNovo: TButton;
				    btnFechar: TButton;
				    btnBuscar: TButton;
				    btnGravar: TButton;
				    btnExcluir: TButton;
				    btnCancelar: TButton;
				    dsPrincipal: TDataSource;
				    DBGrid1: TDBGrid;
				    Label1: TLabel;
				    PageControl1: TPageControl;
				    Panel1: TPanel;
				    Panel2: TPanel;
				    Panel3: TPanel;
				    tbPesquisa: TTabSheet;
				    tbCadastro: TTabSheet;
                  private

                  public

                  end;

var
                  CadModeloF: TCadModeloF;

implementation

{$R *.lfm}

end.

