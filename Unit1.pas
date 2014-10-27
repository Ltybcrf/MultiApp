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

function GetExternalIP:String;
var IdHttp1:TIdHttp;
    s:String;
begin
 s:='0.0.0.0';
 IdHttp1:=TIdHttp.Create(nil);
 try
 s:= IdHttp1.Get('http://checkip.dyndns.org');
 s:=copy(s,Pos(':',s)+2,20);
 s:=copy(s,1,Pos('<',s)-1);
 finally
 FreeAndNil(IdHttp1);
 end;
 Result:=s;
end;


procedure TForm1.Button1Click(Sender: TObject);
begin
StatusBar1.SimpleText:='Please Wait';
RichEdit1.Text:=idhttp1.Get('http://api.hackertarget.com/whois/?q=' + Edit1.Text);
StatusBar1.SimpleText:='Done';
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
StatusBar1.SimpleText:='Please Wait';
Edit2.Text:=GetExternalIP;
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
