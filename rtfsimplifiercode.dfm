object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Rtf simplifier'
  ClientHeight = 117
  ClientWidth = 384
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
    Top = 98
    Width = 384
    Height = 19
    Panels = <>
  end
  object RichEdit1: TRichEdit
    Left = 264
    Top = 75
    Width = 17
    Height = 17
    Lines.Strings = (
      'Ri'
      'c'
      'h'
      'E'
      'di'
      't1')
    TabOrder = 1
  end
  object LabeledEdit1: TLabeledEdit
    Left = 144
    Top = 24
    Width = 121
    Height = 21
    EditLabel.Width = 61
    EditLabel.Height = 13
    EditLabel.Caption = 'LabeledEdit1'
    TabOrder = 2
    OnChange = LabeledEdit1Change
  end
  object Button1: TButton
    Left = 280
    Top = 22
    Width = 75
    Height = 25
    Caption = 'Select'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 174
    Top = 67
    Width = 75
    Height = 25
    Caption = 'Convert'
    TabOrder = 4
    OnClick = Button2Click
  end
end
