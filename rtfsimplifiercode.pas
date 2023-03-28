unit rtfsimplifiercode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, FileCtrl;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    LabeledEdit1: TLabeledEdit;
    Button1: TButton;
    Button2: TButton;
    RichEdit1: TRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure LabeledEdit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

procedure window_setup();
begin
 Application.Title:='Rtf simplifier';
 Form1.Caption:='Rtf simplifier 0.8.6';
 Form1.BorderStyle:=bsDialog;
 Form1.Font.Name:=Screen.MenuFont.Name;
 Form1.Font.Size:=14;
end;

procedure interface_setup();
begin
 Form1.RichEdit1.Enabled:=False;
 Form1.RichEdit1.Visible:=False;
 Form1.Button1.ShowHint:=False;
 Form1.Button2.ShowHint:=False;
 Form1.Button2.Enabled:=False;
 Form1.LabeledEdit1.Enabled:=False;
 Form1.StatusBar1.SimplePanel:=True;
 Form1.LabeledEdit1.LabelPosition:=lpLeft;
 Form1.LabeledEdit1.Text:='';
end;

procedure language_setup();
begin
 Form1.Button1.Caption:='Select';
 Form1.Button2.Caption:='Convert';
 Form1.LabeledEdit1.EditLabel.Caption:='Target directory';
 Form1.StatusBar1.SimpleText:='Please select target directory';
end;

procedure setup();
begin
 window_setup();
 interface_setup();
 language_setup();
end;

function get_directory(promt:string):string;
var directory:string;
begin
 directory:='';
 SelectDirectory(promt,'',directory);
 get_directory:=directory;
end;

function get_name(source:string):string;
var amount:LongWord;
begin
 amount:=LastDelimiter('.',source);
 if amount=0 then
 begin
  amount:=Length(source);
 end
 else
 begin
  Dec(amount);
 end;
 get_name:=Copy(source,1,amount);
end;

function convert_rtf(var convertor:TRichEdit;source:string):boolean;
var target:string;
begin
 target:=get_name(source)+'.txt';
 convertor.PlainText:=False;
 convertor.Lines.Clear();
 convertor.Lines.LoadFromFile(source);
 convertor.PlainText:=True;
 convertor.Lines.SaveToFile(target);
 convert_rtf:=FileExists(target);
end;

function batch_convert(var convertor:TRichEdit;directory:string):LongWord;
var amount:LongWord;
var search:TSearchRec;
begin
 amount:=0;
 if FindFirst(directory+PathDelim+'*.rtf',faAnyFile,search)=0 then
 begin
  repeat
   if convert_rtf(convertor,directory+PathDelim+search.Name)=True then Inc(amount);
  until FindNext(search)<>0;
  FindClose(search);
 end;
 batch_convert:=amount;
end;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
 Form1.LabeledEdit1.Text:=get_directory('Select target directory');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 Form1.Button1.Enabled:=False;
 Form1.Button2.Enabled:=False;
 Form1.StatusBar1.SimpleText:='Working... Please wait';
 Form1.StatusBar1.SimpleText:='Amount of converted files: '+IntToStr(batch_convert(Form1.RichEdit1,Form1.LabeledEdit1.Text));
 Form1.Button1.Enabled:=True;
 Form1.Button2.Enabled:=True;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 setup();
end;

procedure TForm1.LabeledEdit1Change(Sender: TObject);
begin
 if Form1.LabeledEdit1.Text<>'' then
 begin
  Form1.Button2.Enabled:=True;
  Form1.StatusBar1.SimpleText:='Ready';
 end;
 
end;

end.
