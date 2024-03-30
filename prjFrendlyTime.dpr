program prjFrendlyTime;

uses
  System.StartUpCopy,
  FMX.Forms,
  untMain in 'forms\untMain.pas' {frmMain},
  untFunction in 'functions\untFunction.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
