unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Button4: TButton;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    procedure Teste;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;



implementation

{$R *.dfm}
uses
  System.Threading;

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  sleep(10000);

  Label1.Caption := DateTimeToStr(Now);

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  TTask.Run(
    procedure
    begin
      sleep(10000);
      TThread.Synchronize(TThread.CurrentThread,
        procedure
        begin
          Label1.Caption := DateTimeToStr(Now);
        end);
    end);

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Teste;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  ShowMessage('teste');
end;

procedure TForm1.Teste;
begin
  Label1.Caption := 'teste';
end;

end.
