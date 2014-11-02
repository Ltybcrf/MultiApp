unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Vcl.StdCtrls,
  IdAntiFreezeBase, Vcl.IdAntiFreeze;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Edit1: TEdit;
    Button1: TButton;
    RichEdit1: TRichEdit;
    IdHTTP1: TIdHTTP;
    IdAntiFreeze1: TIdAntiFreeze;
    StatusBar1: TStatusBar;
    TabSheet2: TTabSheet;
    Edit2: TEdit;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
StatusBar1.SimpleText:='Please Wait';
RichEdit1.Text:=idhttp1.Get('http://api.hackertarget.com/whois/?q=' + Edit1.Text);
StatusBar1.SimpleText:='Done';
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
StatusBar1.SimpleText:='Please Wait';
Edit2.Text:=idhttp1.Get('http://ip.telize.com/');
StatusBar1.SimpleText:='Done';
end;

procedure TForm1.TabSheet1Show(Sender: TObject);
begin
form1.Constraints.MinHeight := 337;
form1.Constraints.MinWidth := 635;
form1.Constraints.MaxHeight := 0;
form1.Constraints.MaxWidth := 0;
end;

procedure TForm1.TabSheet2Show(Sender: TObject);
begin
form1.Constraints.MinHeight := 150;
form1.Constraints.MinWidth := 200;
form1.Constraints.MaxHeight := 150;
form1.Constraints.MaxWidth := 200;
end;

end.
