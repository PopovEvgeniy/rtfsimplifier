object MainWindow: TMainWindow
  Left = 0
  Top = 0
  Caption = 'Rtf simplifier'
  ClientHeight = 180
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object OperationStatus: TStatusBar
    Left = 0
    Top = 161
    Width = 442
    Height = 19
    Panels = <>
  end
  object DirectoryField: TLabeledEdit
    Left = 158
    Top = 26
    Width = 131
    Height = 21
    EditLabel.Width = 78
    EditLabel.Height = 13
    EditLabel.Caption = 'Target directory'
    LabelPosition = lpLeft
    TabOrder = 1
    OnChange = DirectoryFieldChange
  end
  object SelectButton: TButton
    Left = 306
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Select'
    TabOrder = 2
    OnClick = SelectButtonClick
  end
  object ConvertButton: TButton
    Left = 158
    Top = 115
    Width = 75
    Height = 25
    Caption = 'Convert'
    TabOrder = 3
    OnClick = ConvertButtonClick
  end
  object RtfConverter: TRichEdit
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
  object DeleteCheckBox: TCheckBox
    Left = 8
    Top = 72
    Width = 425
    Height = 17
    Caption = 'Delete the source document after conversion'
    TabOrder = 5
  end
end
