object Form14: TForm14
  Left = 0
  Top = 0
  Caption = #25351#20196#32534#36753
  ClientHeight = 279
  ClientWidth = 791
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 120
  TextHeight = 17
  object Label1: TLabel
    Left = 21
    Top = 21
    Width = 28
    Height = 17
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #20154#21517
  end
  object Label2: TLabel
    Left = 188
    Top = 21
    Width = 28
    Height = 17
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #23545#35805
  end
  object Label3: TLabel
    Left = 565
    Top = 21
    Width = 56
    Height = 17
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #23545#35805#20301#32622
  end
  object ComboBox1: TComboBox
    Left = 9
    Top = 52
    Width = 148
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Style = csDropDownList
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 0
  end
  object ComboBox2: TComboBox
    Left = 188
    Top = 52
    Width = 347
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Style = csDropDownList
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 1
    OnSelect = ComboBox2Select
  end
  object Button1: TButton
    Left = 146
    Top = 209
    Width = 148
    Height = 43
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 2
  end
  object Button2: TButton
    Left = 471
    Top = 209
    Width = 148
    Height = 43
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 188
    Top = 94
    Width = 347
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 4
  end
  object Button3: TButton
    Left = 314
    Top = 146
    Width = 95
    Height = 33
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #20462#25913#23545#35805
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 188
    Top = 146
    Width = 94
    Height = 33
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #22686#21152#23545#35805
    TabOrder = 6
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 439
    Top = 146
    Width = 96
    Height = 33
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #21024#38500#23545#35805
    TabOrder = 7
    OnClick = Button5Click
  end
  object ComboBox3: TComboBox
    Left = 565
    Top = 52
    Width = 210
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Style = csDropDownList
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 8
    Items.Strings = (
      '0'#23545#35805#26694#19978#65292#22836#20687#24038#19978
      '1'#23545#35805#26694#19979#65292#22836#20687#21491#19979
      '2'#23545#35805#26694#19978#65292#19981#26174#31034#22836#20687
      '3'#23545#35805#26694#19979#65292#19981#26174#31034#22836#20687
      '4'#23545#35805#26694#19978#65292#22836#20687#21491#19978
      '5'#23545#35805#26694#19979#65292#22836#20687#24038#19979)
  end
end
