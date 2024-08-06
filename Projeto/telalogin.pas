unit TelaLogin;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBCtrls,
  StdCtrls;

type

  { TTelaLoginF }

  TTelaLoginF = class(TForm)
    Button1: TButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
  private

  public

  end;

var
  TelaLoginF: TTelaLoginF;

implementation

{$R *.lfm}

end.

