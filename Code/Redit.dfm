object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'R'#25991#20214#32534#36753
  ClientHeight = 851
  ClientWidth = 1078
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 120
  TextHeight = 17
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1078
    Height = 211
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 31
      Top = 31
      Width = 68
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #25968#25454#21517#31216
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 251
      Top = 31
      Width = 34
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #24207#21495
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 879
      Top = 31
      Width = 68
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #28216#25103#36827#24230
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object ComboBox1: TComboBox
      Left = 31
      Top = 63
      Width = 190
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 0
      OnChange = ComboBox1Change
    end
    object ComboBox2: TComboBox
      Left = 251
      Top = 63
      Width = 200
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
      Left = 502
      Top = 7
      Width = 158
      Height = 44
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #35835#21462#36827#24230
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 690
      Top = 9
      Width = 159
      Height = 45
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #20445#23384#36827#24230
      TabOrder = 3
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 502
      Top = 59
      Width = 158
      Height = 44
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #28155#21152#39033#30446
      TabOrder = 4
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 690
      Top = 59
      Width = 159
      Height = 44
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #21024#38500#39033#30446
      TabOrder = 5
      OnClick = Button4Click
    end
    object ComboBox3: TComboBox
      Left = 879
      Top = 63
      Width = 148
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 6
    end
    object Button5: TButton
      Left = 502
      Top = 111
      Width = 158
      Height = 45
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #23548#20986'Excel'
      TabOrder = 7
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 690
      Top = 111
      Width = 159
      Height = 45
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #23548#20837'Excel'
      TabOrder = 8
      OnClick = Button6Click
    end
    object Button11: TButton
      Left = 502
      Top = 163
      Width = 158
      Height = 45
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #23548#20986'Excel('#24555#36895')'
      TabOrder = 9
      OnClick = Button11Click
    end
    object Button12: TButton
      Left = 690
      Top = 163
      Width = 159
      Height = 45
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #23548#20837'Excel('#24555#36895')'
      TabOrder = 10
      OnClick = Button12Click
    end
  end
  object Panel2: TPanel
    Left = 137
    Top = 211
    Width = 941
    Height = 640
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 1
    object StatusBar1: TStatusBar
      Left = 1
      Top = 614
      Width = 939
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Panels = <>
    end
    object CheckListBox1: TCheckListBox
      Left = 1
      Top = 1
      Width = 939
      Height = 613
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      BevelInner = bvLowered
      BevelOuter = bvRaised
      Ctl3D = True
      Flat = False
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ItemHeight = 17
      ParentCtl3D = False
      TabOrder = 1
      OnClick = CheckListBox1Click
      OnDblClick = CheckListBox1DblClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 211
    Width = 137
    Height = 640
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 2
    object Label3: TLabel
      Left = 14
      Top = 331
      Width = 21
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'To:'
    end
    object Label4: TLabel
      Left = 14
      Top = 268
      Width = 37
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'From:'
    end
    object Button7: TButton
      Left = 14
      Top = 8
      Width = 102
      Height = 43
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #20840#36873
      TabOrder = 0
      OnClick = Button7Click
    end
    object Button8: TButton
      Left = 14
      Top = 63
      Width = 102
      Height = 43
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #20840#19981#36873
      TabOrder = 1
      OnClick = Button8Click
    end
    object Button9: TButton
      Left = 14
      Top = 114
      Width = 102
      Height = 43
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #21453#36873
      TabOrder = 2
      OnClick = Button9Click
    end
    object RadioButton1: TRadioButton
      Left = 14
      Top = 199
      Width = 96
      Height = 32
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #36873#20013#39033#30446
      Checked = True
      TabOrder = 3
      TabStop = True
      OnClick = RadioButton1Click
    end
    object RadioButton2: TRadioButton
      Left = 14
      Top = 229
      Width = 96
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #25351#23450#33539#22260
      TabOrder = 4
    end
    object Edit1: TEdit
      Left = 14
      Top = 293
      Width = 102
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 5
      Text = '0'
      OnKeyPress = Edit1KeyPress
    end
    object Edit2: TEdit
      Left = 14
      Top = 356
      Width = 102
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 6
      Text = '0'
      OnKeyPress = Edit2KeyPress
    end
    object ComboBox4: TComboBox
      Left = 14
      Top = 429
      Width = 106
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ItemIndex = 0
      TabOrder = 7
      Text = '='
      Items.Strings = (
        '='
        '+'
        '-'
        '*'
        '/')
    end
    object Edit3: TEdit
      Left = 14
      Top = 471
      Width = 102
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 8
      Text = '0'
    end
    object Button10: TButton
      Left = 14
      Top = 506
      Width = 102
      Height = 43
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #36171#20540#36873#20013
      TabOrder = 9
      OnClick = Button10Click
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 680
    Top = 72
  end
  object SaveDialog1: TSaveDialog
    Left = 752
    Top = 16
  end
end
