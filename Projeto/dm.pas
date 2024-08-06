unit dm;

{$mode ObjFPC}{$H+}

interface

uses
                  Classes, SysUtils, DB, ZConnection, ZDataset;

type

		  { TdmF }

                  TdmF = class(TDataModule)

						      qryCategoriacategoriaprodutoid: TLongintField;

						      qryCategoriads_categoria_produto: TStringField;

									qryClienteclienteid: TLongintField;

									qryClientecpf_cnpj_cliente: TStringField;

									qryClientenome_cliente: TStringField;

									qryClientetipo_cliente: TStringField;

											qryOrcamentoclienteid: TLongintField;

											qryOrcamentodt_orcamento: TDateTimeField;

											qryOrcamentodt_validade_orcamento: TDateTimeField;

											qryOrcamentoItemorcamentoid: TLongintField;

											qryOrcamentoItemorcamentoitemid: TLongintField;

											qryOrcamentoItemprodutodesc: TStringField;

											qryOrcamentoItemprodutoid: TLongintField;

											qryOrcamentoItemqt_produto: TFloatField;

											qryOrcamentoItemvl_total: TFloatField;

											qryOrcamentoItemvl_unitario: TFloatField;

											qryOrcamentoorcamentoid: TLongintField;

											qryOrcamentovl_total_orcamento: TFloatField;

                                                                        qryPesqOrcItemProdds_produto: TStringField;

                                                                        qryPesqOrcItemProdprodutoid: TLongintField;

                                                                        qryPesqOrcItemProdvl_venda_produto: TFloatField;



											qryProdutocategoriaprodutoid: TLongintField;

											qryProdutods_produto: TStringField;

											qryProdutodt_cadastro_produto: TDateTimeField;

											qryProdutoobs_produto: TStringField;

											qryProdutoprodutoid: TLongintField;

											qryProdutostatus_produto: TStringField;

											qryProdutovl_venda_produto: TFloatField;

											qryUsuarioid: TLongintField;

											qryUsuarionome_completo: TStringField;

											qryUsuariosenha: TStringField;

											qryUsuariousuario: TStringField;
				    ZConnection1: TZConnection;
				    qryCategoria: TZQuery;
				    qryCliente: TZQuery;
				    qryProduto: TZQuery;
				    qryUsuario: TZQuery;
				    qryGenerica: TZQuery;
				    qryOrcamento: TZQuery;
				    qryOrcamentoItem: TZQuery;
                                    qryPesqOrcItemProd: TZQuery;
				    procedure DataModuleCreate(Sender: TObject);
				    procedure qryCategoriaNewRecord(
						      DataSet: TDataSet);
				    procedure qryClienteNewRecord(
						      DataSet: TDataSet);
				    procedure qryOrcamentoNewRecord(
						      DataSet: TDataSet);
				    procedure qryProdutoNewRecord(
						      DataSet: TDataSet);
				    procedure qryUsuarioNewRecord(
						      DataSet: TDataSet);
                  private

                  public

                  end;

var
                  dmF: TdmF;

implementation

{$R *.lfm}

{ TdmF }

procedure TdmF.DataModuleCreate(Sender: TObject);
begin
  ZConnection1.HostName := 'localhost';
  ZConnection1.DataBase := 'postgres';
  ZConnection1.User     := 'postgres';
  ZConnection1.Password := '1234';
  ZConnection1.Port     := 5432;
  ZConnection1.Protocol := 'postgresql';
  ZConnection1.Connected := True;
end;

procedure TdmF.qryCategoriaNewRecord(DataSet: TDataSet);
begin
     qryGenerica.Close;
     qryGenerica.SQL.Clear;
     qryGenerica.SQL.Add('select nextval('+ QuotedStr('categoria_produto_categoriaprodutoid_seq')+') AS CODIGO');
     qryGenerica.Open;

     qryCategoriacategoriaprodutoid.AsInteger:= qryGenerica.FieldByName('CODIGO').AsInteger;
end;

procedure TdmF.qryClienteNewRecord(DataSet: TDataSet);
begin
     qryGenerica.Close;
     qryGenerica.SQL.Clear;
     qryGenerica.SQL.Add('select nextval('+ QuotedStr('cliente_clienteid')+') AS CODIGO');
     qryGenerica.Open;

     qryClienteclienteid.AsInteger:= qryGenerica.FieldByName('CODIGO').AsInteger;
end;

procedure TdmF.qryOrcamentoNewRecord(DataSet: TDataSet);
begin
     qryGenerica.Close;
     qryGenerica.SQL.Clear;
     qryGenerica.SQL.Add('select nextval('+ QuotedStr('orcamento_orcamentoid_seq')+') AS CODIGO');
     qryGenerica.Open;

     qryOrcamentoorcamentoid.AsInteger:= qryGenerica.FieldByName('CODIGO').AsInteger;
end;


procedure TdmF.qryProdutoNewRecord(DataSet: TDataSet);
begin
     qryGenerica.Close;
     qryGenerica.SQL.Clear;
     qryGenerica.SQL.Add('select nextval('+ QuotedStr('produto_produtoid')+') AS CODIGO');
     qryGenerica.Open;

     qryProdutoprodutoid.AsInteger:= qryGenerica.FieldByName('CODIGO').AsInteger;
end;

procedure TdmF.qryUsuarioNewRecord(DataSet: TDataSet);
begin
     qryGenerica.Close;
     qryGenerica.SQL.Clear;
     qryGenerica.SQL.Add('select nextval('+ QuotedStr('usuario_oid')+') AS CODIGO');
     qryGenerica.Open;

     qryUsuarioid.AsInteger:= qryGenerica.FieldByName('CODIGO').AsInteger;
end;

end.

