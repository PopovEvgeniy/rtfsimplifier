unit rtfsimplifiercode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, FileCtrl, Vcl.Mask;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    LabeledEdit1: TLabeledEdit;
    Button1: TButton;
    Button2: TButton;
    RichEdit1: TRichEdit;
    CheckBox1: TCheckBox;
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
 Form1.Caption:='Rtf simplifier 0.8.9';
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
 Form1.CheckBox1.Checked:=False;
 Form1.StatusBar1.SimplePanel:=True;
 Form1.LabeledEdit1.LabelPosition:=lpLeft;
 Form1.LabeledEdit1.Text:='';
end;

procedure language_setup();
begin
 Form1.Button1.Caption:='Select';
 Form1.Button2.Caption:='Convert';
 Form1.LabeledEdit1.EditLabel.Caption:='Target directory';
 Form1.CheckBox1.Caption:='Delete source document after conversion';
 Form1.StatusBar1.SimpleText:='Please select target directory';
end;

procedure setup();
begin
 window_setup();
 interface_setup();
 language_setup();
end;

function get_directory(const promt:string):string;
var directory:string;
begin
 directory:='';
 SelectDirectory(promt,'',directory);
 get_directory:=directory;
end;

function get_name(const source:string):string;
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

function convert_rtf(var convertor:TRichEdit;const source:string):boolean;
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

function is_valid_directory(var search:TSearchRec):boolean;
begin
 is_valid_directory:=((search.Attr and faDirectory)<>0) and (search.Name<>'.') and (search.Name<>'..');
end;

function is_valid_file(var search:TSearchRec):boolean;
begin
 is_valid_file:=((search.Attr and faDirectory)=0) and (ExtractFileExt(search.Name)='.rtf');
end;

function batch_convert(var convertor:TRichEdit;const directory:string;const delete_source:boolean):LongWord;
var amount:LongWord;
var target:string;
var search:TSearchRec;
begin
 amount:=0;
 if FindFirst(directory+PathDelim+'*.*',faAnyFile,search)=0 then
 begin
  repeat
   target:=directory+PathDelim+search.Name;
   if is_valid_file(search)=True then
   begin
    if convert_rtf(convertor,target)=True then
    begin
     Inc(amount);
     if delete_source=True then DeleteFile(target);
    end;
   end;
   if is_valid_directory(search)=True then
   begin
    amount:=amount+batch_convert(convertor,directory,delete_source);
   end;
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
 Form1.StatusBar1.SimpleText:='Amount of converted files: '+IntToStr(batch_convert(Form1.RichEdit1,Form1.LabeledEdit1.Text,Form1.CheckBox1.Checked));
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
