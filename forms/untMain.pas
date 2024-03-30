unit untMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.DateTimeCtrls, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfrmMain = class(TForm)
    DateEdit1: TDateEdit;
    TimeEdit1: TTimeEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;

    procedure FTChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses untFunction;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
    DateEdit1.Date := Now; // inicializa com a data atual

    TimeEdit1.Time := Now; // inicializa com a hora atual
end;

procedure TfrmMain.FTChange(Sender: TObject);
var
    vTempo: TDateTime;
begin
    // pega a data e a hora dos campos
    vTempo := DateEdit1.Date + TimeEdit1.Time;

    // exibe o texto no label
    Label1.Text := FriendlyTime(vTempo);
end;

end.

