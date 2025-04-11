unit rtfsimplifiercode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, FileCtrl;

type
  TMainWindow = class(TForm)
    OperationStatus: TStatusBar;
    DirectoryField: TLabeledEdit;
    SelectButton: TButton;
    ConvertButton: TButton;
    RtfConverter: TRichEdit;
    DeleteCheckBox: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure DirectoryFieldChange(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure ConvertButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var MainWindow: TMainWindow;

implementation

procedure window_setup();
begin
 Application.Title:='Rtf simplifier';
 MainWindow.Caption:='Rtf simplifier 0.9.1';
 MainWindow.BorderStyle:=bsDialog;
 MainWindow.Font.Name:=Screen.MenuFont.Name;
 MainWindow.Font.Size:=14;
end;

procedure interface_setup();
begin
 MainWindow.RtfConverter.Enabled:=False;
 MainWindow.RtfConverter.Visible:=False;
 MainWindow.SelectButton.ShowHint:=False;
 MainWindow.ConvertButton.ShowHint:=False;
 MainWindow.ConvertButton.Enabled:=False;
 MainWindow.DirectoryField.Enabled:=False;
 MainWindow.DeleteCheckBox.Checked:=False;
 MainWindow.OperationStatus.SimplePanel:=True;
 MainWindow.DirectoryField.LabelPosition:=lpLeft;
 MainWindow.DirectoryField.Text:='';
end;

procedure language_setup();
begin
 MainWindow.SelectButton.Caption:='Select';
 MainWindow.ConvertButton.Caption:='Convert';
 MainWindow.DirectoryField.EditLabel.Caption:='Target directory';
 MainWindow.DeleteCheckBox.Caption:='Delete the source document after conversion';
 MainWindow.OperationStatus.SimpleText:='Please select the target directory';
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

procedure TMainWindow.SelectButtonClick(Sender: TObject);
begin
 MainWindow.DirectoryField.Text:=get_directory('Select the target directory');
end;

procedure TMainWindow.ConvertButtonClick(Sender: TObject);
begin
 MainWindow.SelectButton.Enabled:=False;
 MainWindow.ConvertButton.Enabled:=False;
 MainWindow.OperationStatus.SimpleText:='Working... Please wait';
 MainWindow.OperationStatus.SimpleText:='Amount of the converted files: '+IntToStr(batch_convert(MainWindow.RtfConverter,MainWindow.DirectoryField.Text,MainWindow.DeleteCheckBox.Checked));
 MainWindow.SelectButton.Enabled:=True;
 MainWindow.ConvertButton.Enabled:=True;
end;

procedure TMainWindow.FormCreate(Sender: TObject);
begin
 setup();
end;

procedure TMainWindow.DirectoryFieldChange(Sender: TObject);
begin
 if MainWindow.DirectoryField.Text<>'' then
 begin
  MainWindow.ConvertButton.Enabled:=True;
  MainWindow.OperationStatus.SimpleText:='Ready';
 end;
 
end;

end.
