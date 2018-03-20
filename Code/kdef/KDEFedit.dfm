object Form7: TForm7
  Left = 0
  Top = 0
  Caption = #23545#35805#20107#20214#32534#36753
  ClientHeight = 815
  ClientWidth = 1276
  Color = clBtnFace
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
  PixelsPerInch = 120
  TextHeight = 17
  object GroupBox1: TGroupBox
    Left = 10
    Top = 10
    Width = 661
    Height = 794
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #27491#22312#32534#36753#20107#20214
    TabOrder = 0
    object ListBox1: TListBox
      Left = 8
      Top = 24
      Width = 643
      Height = 762
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ItemHeight = 18
      MultiSelect = True
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
      OnClick = ListBox1Click
      OnDblClick = ListBox1DblClick
      OnMouseUp = ListBox1MouseUp
    end
  end
  object GroupBox2: TGroupBox
    Left = 679
    Top = 10
    Width = 574
    Height = 169
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #23545#35805#32534#36753
    TabOrder = 1
    object Label2: TLabel
      Left = 21
      Top = 116
      Width = 84
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #26143#21495#38388#38548#23383#25968
    end
    object Edit1: TEdit
      Left = 21
      Top = 67
      Width = 409
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 0
    end
    object Button1: TButton
      Left = 454
      Top = 29
      Width = 106
      Height = 32
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #22686#21152#23545#35805
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 454
      Top = 69
      Width = 106
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #20462#25913#23545#35805
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 454
      Top = 110
      Width = 106
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #21024#38500#23545#35805
      TabOrder = 3
      OnClick = Button3Click
    end
    object Edit2: TEdit
      Left = 144
      Top = 112
      Width = 56
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 4
      Text = '12'
    end
    object ComboBox1: TComboBox
      Left = 21
      Top = 31
      Width = 409
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 5
      OnSelect = ComboBox1Select
    end
    object Button8: TButton
      Left = 324
      Top = 110
      Width = 106
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #20445#23384#23545#35805#25991#20214
      TabOrder = 6
      OnClick = Button8Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 679
    Top = 208
    Width = 430
    Height = 587
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #25351#20196#32534#36753
    TabOrder = 2
    object Label1: TLabel
      Left = 73
      Top = 21
      Width = 70
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #20107#20214#32534#21495#65306
    end
    object Label3: TLabel
      Left = 220
      Top = 94
      Width = 140
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #25351#20196#21442#25968#65292#21452#20987#21487#32534#36753
    end
    object ComboBox2: TComboBox
      Left = 73
      Top = 46
      Width = 305
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 0
      OnSelect = ComboBox2Select
    end
    object Button10: TButton
      Left = 63
      Top = 115
      Width = 116
      Height = 43
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #25554#20837#25351#20196
      TabOrder = 1
      OnClick = Button10Click
    end
    object Button11: TButton
      Left = 63
      Top = 205
      Width = 116
      Height = 43
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #21024#38500#25351#20196
      TabOrder = 2
      OnClick = Button11Click
    end
    object Button12: TButton
      Left = 63
      Top = 293
      Width = 116
      Height = 43
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #28155#21152#20107#20214
      TabOrder = 3
      OnClick = Button12Click
    end
    object Button13: TButton
      Left = 63
      Top = 378
      Width = 116
      Height = 43
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #21024#38500#26368#21518#20107#20214
      TabOrder = 4
      OnClick = Button13Click
    end
    object ListBox2: TListBox
      Left = 220
      Top = 115
      Width = 158
      Height = 336
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ItemHeight = 17
      TabOrder = 5
      OnDblClick = ListBox2DblClick
    end
    object Button15: TButton
      Left = 14
      Top = 174
      Width = 41
      Height = 54
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #19978#31227
      TabOrder = 6
      OnClick = Button15Click
    end
    object Button16: TButton
      Left = 14
      Top = 263
      Width = 41
      Height = 53
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #19979#31227
      TabOrder = 7
      OnClick = Button16Click
    end
    object Button14: TButton
      Left = 220
      Top = 471
      Width = 158
      Height = 43
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #24212#29992#21442#25968#20462#25913
      TabOrder = 8
      OnClick = Button14Click
    end
    object Button17: TButton
      Left = 21
      Top = 460
      Width = 158
      Height = 43
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #22797#21046#21040#21098#20999#26495
      TabOrder = 9
      OnClick = Button17Click
    end
    object Button18: TButton
      Left = 21
      Top = 523
      Width = 158
      Height = 43
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #20174#21098#20999#26495#22797#21046
      TabOrder = 10
      OnClick = Button18Click
    end
  end
  object Button4: TButton
    Left = 897
    Top = 120
    Width = 98
    Height = 33
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #37325#25490#26143#21495
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 1125
    Top = 208
    Width = 116
    Height = 47
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #20445#23384#25991#20214
    TabOrder = 4
    OnClick = Button5Click
  end
  object Button9: TButton
    Left = 1125
    Top = 281
    Width = 116
    Height = 43
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #20851#38381
    TabOrder = 5
    OnClick = Button9Click
  end
  object Memo1: TMemo
    Left = 1125
    Top = 545
    Width = 116
    Height = 179
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 6
    Visible = False
    WordWrap = False
  end
  object Button6: TButton
    Left = 1125
    Top = 347
    Width = 116
    Height = 43
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #23548#20986#23545#35805
    TabOrder = 7
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 1125
    Top = 412
    Width = 116
    Height = 43
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #23548#20986#20107#20214
    TabOrder = 8
    OnClick = Button7Click
  end
  object PopupMenu1: TPopupMenu
    Left = 160
    Top = 48
    object N1: TMenuItem
      Caption = #22797#21046#25351#20196
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #22797#21046#25972#20010#20107#20214
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #31896#36148#25351#20196
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #31896#36148#20107#20214
      OnClick = N4Click
    end
    object N6: TMenuItem
      Caption = #21024#38500#25351#20196
      OnClick = N6Click
    end
    object N7: TMenuItem
      Caption = #25554#20837#25351#20196
      OnClick = N7Click
    end
    object N5: TMenuItem
      Caption = #20462#25913#20840#37096#23545#35805#20154#29289#22836#20687
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 464
    Top = 48
  end
end
