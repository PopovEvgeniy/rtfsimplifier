object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Rtf simplifier'
  ClientHeight = 180
  ClientWidth = 393
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 161
    Width = 393
    Height = 19
    Panels = <>
  end
  object LabeledEdit1: TLabeledEdit
    Left = 158
    Top = 26
    Width = 131
    Height = 21
    EditLabel.Width = 78
    EditLabel.Height = 21
    EditLabel.Caption = 'Target directory'
    LabelPosition = lpLeft
    TabOrder = 1
    Text = ''
    OnChange = LabeledEdit1Change
  end
  object Button1: TButton
    Left = 306
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Select'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 158
    Top = 115
    Width = 75
    Height = 25
    Caption = 'Convert'
    TabOrder = 3
    OnClick = Button2Click
  end
  object RichEdit1: TRichEdit
    Left = 249
    Top = 117
    Width = 19
    Height = 25
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Ri'
      'ch'
      'Ed'
      'it1')
    ParentFont = False
    TabOrder = 4
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 72
    Width = 373
    Height = 17
    Caption = 'Delete source document after conversion'
    TabOrder = 5
  end
end
