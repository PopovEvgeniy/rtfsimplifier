program rtfsimplifier;

uses
  Forms,
  rtfsimplifiercode in 'rtfsimplifiercode.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Rtf simplifier';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.