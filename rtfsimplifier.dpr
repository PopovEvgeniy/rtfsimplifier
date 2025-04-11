program rtfsimplifier;

uses
  Forms,
  rtfsimplifiercode in 'rtfsimplifiercode.pas' {MainWindow};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainWindow, MainWindow);
  Application.Run;
end.
