object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Rtf simplifier'
  ClientHeight = 162
  ClientWidth = 365
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 143
    Width = 365
    Height = 19
    Panels = <>
    ExplicitTop = 151
    ExplicitWidth = 359
  end
  object LabeledEdit1: TLabeledEdit
    Left = 147
    Top = 58
    Width = 121
    Height = 21
    EditLabel.Width = 78
    EditLabel.Height = 13
    EditLabel.Caption = 'Target directory'
    TabOrder = 1
    OnChange = LabeledEdit1Change
  end
  object Button1: TButton
    Left = 282
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Select'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 158
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Convert'
    TabOrder = 3
    OnClick = Button2Click
  end
  object RichEdit1: TRichEdit
    Left = 254
    Top = 104
    Width = 19
    Height = 25
    Lines.Strings = (
      'Ri'
      'ch'
      'Ed'
      'it1')
    TabOrder = 4
  end
end
