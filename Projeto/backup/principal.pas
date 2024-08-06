unit Principal;

{$mode objfpc}{$H+}

interface

uses
                  Classes, SysUtils, Forms, Controls, Graphics, Dialogs,
                  ComCtrls, Menus, ExtCtrls, StdCtrls, CadCategoria, CadCliente,
                  CadProduto, CadUsuario, CadOrcamento, relClientes, Sobre, relProdutos, relCategorias;

type

		  { TPrincipalF }

                  TPrincipalF = class(TForm)
                    Image1: TImage;
                    Label1: TLabel;
				    MainMenu1: TMainMenu;
				    MenuItem1: TMenuItem;
				    MenuItem10: TMenuItem;
				    MenuItem11: TMenuItem;
				    MenuItem12: TMenuItem;
				    MenuItem13: TMenuItem;
				    MenuItem2: TMenuItem;
				    MenuItem3: TMenuItem;
				    MenuItem4: TMenuItem;
				    MenuItem5: TMenuItem;
				    MenuItem6: TMenuItem;
				    MenuItem7: TMenuItem;
				    MenuItem8: TMenuItem;
				    MenuItem9: TMenuItem;
				    mnCadastro: TMenuItem;
                                    Panel1: TPanel;
                                    procedure MenuItem10Click(Sender: TObject);
                                    procedure MenuItem11Click(Sender: TObject);
                                    procedure MenuItem13Click(Sender: TObject);
        procedure MenuItem14Click(Sender: TObject);
        procedure MenuItem1Click(Sender: TObject);
				    procedure MenuItem2Click(Sender: TObject);
				    procedure MenuItem3Click(Sender: TObject);
				    procedure MenuItem4Click(Sender: TObject);
                                    procedure MenuItem7Click(Sender: TObject);
				    procedure MenuItem8Click(Sender: TObject);
				    procedure MenuItem9Click(Sender: TObject);
        procedure mnCadastroClick(Sender: TObject);
                  private

                  public

                  end;

var
                  PrincipalF: TPrincipalF;

implementation

{$R *.lfm}

{ TPrincipalF }

procedure TPrincipalF.mnCadastroClick(Sender: TObject);
begin

end;

procedure TPrincipalF.MenuItem1Click(Sender: TObject);// CadCategoria
begin
     CadCategoriaF := TCadCategoriaF.Create(Self);
     CadCategoriaF.ShowModal;
end;

procedure TPrincipalF.MenuItem14Click(Sender: TObject);
begin

end;

procedure TPrincipalF.MenuItem10Click(Sender: TObject);
begin
     relClientesF := TrelClientesF.Create(Self);
     relClientesF.ShowModal;
end;

procedure TPrincipalF.MenuItem11Click(Sender: TObject);
begin
     relProdutosF := TrelProdutosF.Create(Self);
     relProdutosF.ShowModal;
end;

procedure TPrincipalF.MenuItem13Click(Sender: TObject);
begin
     relCategoriasF := TrelCategoriasF.Create(Self);
     relCategoriasF.ShowModal;
end;

procedure TPrincipalF.MenuItem2Click(Sender: TObject); // CadCliente
begin
     CadClienteF := TCadClienteF.Create(Self);
     CadClienteF.ShowModal;
end;

procedure TPrincipalF.MenuItem3Click(Sender: TObject); // CadProduto
begin
     CadProdutoF := TCadProdutoF.Create(Self);
     CadProdutoF.ShowModal;
end;

procedure TPrincipalF.MenuItem4Click(Sender: TObject); // CadUsuario
begin
     CadUsuarioF := TCadUsuarioF.Create(Self);
     CadUsuarioF.ShowModal;
end;

procedure TPrincipalF.MenuItem7Click(Sender: TObject);   // Sobre
begin
     SobreF := TSobreF.Create(Self);
     SobreF.ShowModal;
end;

procedure TPrincipalF.MenuItem8Click(Sender: TObject);
begin
     Application.Terminate;
end;

procedure TPrincipalF.MenuItem9Click(Sender: TObject);  // Vendas - orçamento
begin
     CadOrcamentoF := TCadOrcamentoF.Create(Self);
     CadOrcamentoF.ShowModal;
end;

end.

