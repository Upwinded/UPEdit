object Form3: TForm3
  Left = 0
  Top = 0
  Width = 1126
  Height = 509
  AutoScroll = True
  Caption = 'grp'#26597#30475
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 120
  TextHeight = 17
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1108
    Height = 190
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 388
      Top = 75
      Width = 105
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #36873#25321#24120#29992'grp'#25991#20214
    end
    object Label2: TLabel
      Left = 388
      Top = 135
      Width = 84
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #36873#25321#36148#22270#37096#20998
    end
    object Button1: TButton
      Left = 315
      Top = 78
      Width = 62
      Height = 44
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #25171#24320'idx'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 13
      Top = 82
      Width = 294
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ReadOnly = True
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 13
      Top = 26
      Width = 294
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ReadOnly = True
      TabOrder = 2
    end
    object Button3: TButton
      Left = 315
      Top = 18
      Width = 62
      Height = 43
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #25171#24320'col'
      TabOrder = 3
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 385
      Top = 13
      Width = 70
      Height = 54
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #26174#31034#36148#22270
      TabOrder = 4
      OnClick = Button4Click
    end
    object ComboBox1: TComboBox
      Left = 388
      Top = 99
      Width = 142
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 5
      OnChange = ComboBox1Change
    end
    object ComboBox2: TComboBox
      Left = 388
      Top = 157
      Width = 142
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 6
      OnChange = ComboBox2Change
    end
    object Edit2: TEdit
      Left = 13
      Top = 136
      Width = 294
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ReadOnly = True
      TabOrder = 7
    end
    object Button2: TButton
      Left = 315
      Top = 139
      Width = 62
      Height = 43
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #25171#24320'grp'
      TabOrder = 8
      OnClick = Button2Click
    end
    object RadioGroup1: TRadioGroup
      Left = 819
      Top = 13
      Width = 143
      Height = 164
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'PNG'#22270#29255#32534#36753#26041#24335
      ItemIndex = 0
      Items.Strings = (
        #24635#26159#35810#38382
        #24635#26159#26367#25442'PNG'
        #24635#26159#23384#20026'RLE8')
      TabOrder = 9
      OnClick = RadioGroup1Click
    end
    object Button5: TButton
      Left = 459
      Top = 13
      Width = 70
      Height = 54
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #20445#23384#25991#20214
      TabOrder = 10
      OnClick = Button5Click
    end
    object GroupBox1: TGroupBox
      Left = 970
      Top = 13
      Width = 115
      Height = 169
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #32972#26223#21644#23383#20307#39068#33394
      TabOrder = 11
      object Button6: TButton
        Left = 12
        Top = 22
        Width = 91
        Height = 32
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #26356#25913#32972#26223#33394
        TabOrder = 0
        OnClick = Button6Click
      end
      object Panel3: TPanel
        Left = 12
        Top = 58
        Width = 89
        Height = 27
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        BevelInner = bvLowered
        BevelOuter = bvLowered
        TabOrder = 1
        object Image2: TImage
          Left = 2
          Top = 2
          Width = 85
          Height = 23
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alClient
          OnClick = Image2Click
          ExplicitLeft = 3
          ExplicitTop = 3
          ExplicitWidth = 83
          ExplicitHeight = 22
        end
      end
      object Button7: TButton
        Left = 12
        Top = 90
        Width = 91
        Height = 32
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #26356#25913#23383#20307#33394
        TabOrder = 2
        OnClick = Button7Click
      end
      object Panel4: TPanel
        Left = 12
        Top = 129
        Width = 89
        Height = 27
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        BevelInner = bvLowered
        BevelOuter = bvLowered
        TabOrder = 3
        object Image3: TImage
          Left = 2
          Top = 2
          Width = 85
          Height = 23
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alClient
          OnClick = Image3Click
          ExplicitLeft = 3
          ExplicitTop = 3
          ExplicitWidth = 83
          ExplicitHeight = 21
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 537
      Top = 13
      Width = 274
      Height = 169
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #25209#37327#35774#32622#20559#31227
      TabOrder = 12
      object Label3: TLabel
        Left = 17
        Top = 34
        Width = 46
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'From'#65306
      end
      object Label4: TLabel
        Left = 146
        Top = 34
        Width = 30
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'To'#65306
      end
      object Label5: TLabel
        Left = 21
        Top = 105
        Width = 36
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'X'#20559#31227
      end
      object Label6: TLabel
        Left = 139
        Top = 105
        Width = 36
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Y'#20559#31227
      end
      object Button9: TButton
        Left = 4
        Top = 132
        Width = 81
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #35774#32622#20559#31227
        TabOrder = 0
        OnClick = Button9Click
      end
      object Button8: TButton
        Left = 93
        Top = 132
        Width = 82
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #35774#32622'x'#20559#31227
        TabOrder = 1
        OnClick = Button8Click
      end
      object Button10: TButton
        Left = 183
        Top = 131
        Width = 82
        Height = 34
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #35774#32622'y'#20559#31227
        TabOrder = 2
        OnClick = Button10Click
      end
      object Edit4: TEdit
        Left = 71
        Top = 26
        Width = 68
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 3
        Text = '0'
      end
      object Edit5: TEdit
        Left = 184
        Top = 26
        Width = 68
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 4
        Text = '0'
      end
      object Edit6: TEdit
        Left = 65
        Top = 99
        Width = 68
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 5
        Text = '0'
      end
      object Edit7: TEdit
        Left = 183
        Top = 99
        Width = 68
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 6
        Text = '0'
      end
      object ComboBox3: TComboBox
        Left = 61
        Top = 59
        Width = 156
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
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 190
    Width = 1108
    Height = 274
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    BevelOuter = bvLowered
    Color = clWhite
    DoubleBuffered = True
    ParentBackground = False
    ParentDoubleBuffered = False
    TabOrder = 1
    object Image1: TImage
      Left = 1
      Top = 1
      Width = 1080
      Height = 272
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      OnMouseDown = Image1MouseDown
      OnMouseMove = Image1MouseMove
      OnMouseUp = Image1MouseUp
      OnStartDrag = Image1StartDrag
      ExplicitWidth = 1423
      ExplicitHeight = 424
    end
    object ScrollBar2: TScrollBar
      Left = 1081
      Top = 1
      Width = 26
      Height = 272
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Kind = sbVertical
      LargeChange = 5
      Max = 0
      PageSize = 0
      TabOrder = 0
      OnChange = ScrollBar2Change
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 16
    Top = 160
    object N1: TMenuItem
      Caption = #32534#36753#36148#22270
      OnClick = N1Click
    end
    object PNG2: TMenuItem
      Caption = #29992'PNG'#22270#29255#26367#25442#24403#21069'('#20445#25345'PNG'#26684#24335')'
      OnClick = PNG2Click
    end
    object PNGRLE81: TMenuItem
      Caption = #29992'PNG'#26367#25442','#24182#19988#30452#25509#23384#20026'RLE8'#26684#24335
      OnClick = PNGRLE81Click
    end
    object N3: TMenuItem
      Caption = #22797#21046#24403#21069#36148#22270
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #31896#36148#36148#22270
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #20445#23384#25991#20214
      OnClick = N5Click
    end
    object N7: TMenuItem
      Caption = #25554#20837#36148#22270
      OnClick = N7Click
    end
    object N2: TMenuItem
      Caption = #21024#38500#36148#22270
      OnClick = N2Click
    end
    object N6: TMenuItem
      Caption = #28155#21152#36148#22270#21040#26368#21518
      OnClick = N6Click
    end
    object PNG1: TMenuItem
      Caption = #20840#37096#23548#20986#21040'PNG'
      OnClick = PNG1Click
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 72
    Top = 160
  end
  object ColorDialog1: TColorDialog
    Left = 128
    Top = 160
  end
end
