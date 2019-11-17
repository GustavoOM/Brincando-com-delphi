program Teste;

uses
  System.StartUpCopy,
  FMX.Forms,
  uTest in 'uTest.pas' {FrmTeste};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmTeste, FrmTeste);
  Application.Run;
end.
