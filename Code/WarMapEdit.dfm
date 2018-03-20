object Form11: TForm11
  Left = 0
  Top = 0
  Caption = #25112#26007#22320#22270#32534#36753
  ClientHeight = 880
  ClientWidth = 1166
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 211
    Height = 847
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alLeft
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
    object Label1: TLabel
      Left = 42
      Top = 90
      Width = 42
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #25805#20316#23618
    end
    object Label2: TLabel
      Left = 42
      Top = 27
      Width = 56
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #22320#22270#32534#21495
    end
    object Label3: TLabel
      Left = 52
      Top = 387
      Width = 84
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #24403#21069#22320#38754#36148#22270
    end
    object Label4: TLabel
      Left = 52
      Top = 523
      Width = 56
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #24403#21069#24314#31569
    end
    object Label5: TLabel
      Left = 52
      Top = 408
      Width = 16
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '    '
    end
    object Label6: TLabel
      Left = 52
      Top = 543
      Width = 12
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '   '
    end
    object ComboBox1: TComboBox
      Left = 42
      Top = 52
      Width = 127
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 0
      OnSelect = ComboBox1Select
    end
    object ComboBox2: TComboBox
      Left = 42
      Top = 115
      Width = 127
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ItemIndex = 0
      TabOrder = 1
      Text = #26410#36873#25321
      OnSelect = ComboBox2Select
      Items.Strings = (
        #26410#36873#25321
        #22320#38754
        #24314#31569
        #20840#37096)
    end
    object Button1: TButton
      Left = 34
      Top = 180
      Width = 148
      Height = 36
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #36873#25321#36148#22270
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 34
      Top = 221
      Width = 148
      Height = 35
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #28155#21152#22320#22270#21040#26368#21518
      TabOrder = 3
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 34
      Top = 262
      Width = 148
      Height = 34
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #21024#38500#26368#21518#19968#20010#22320#22270
      TabOrder = 4
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 34
      Top = 340
      Width = 148
      Height = 35
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #20445#23384#25991#20214
      TabOrder = 5
      OnClick = Button4Click
    end
    object Panel2: TPanel
      Left = 34
      Top = 432
      Width = 157
      Height = 82
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      BevelKind = bkSoft
      BevelWidth = 2
      TabOrder = 6
      object Image2: TImage
        Left = 2
        Top = 2
        Width = 149
        Height = 74
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        ExplicitLeft = 3
        ExplicitTop = 3
        ExplicitWidth = 146
        ExplicitHeight = 72
      end
    end
    object Panel3: TPanel
      Left = 34
      Top = 569
      Width = 156
      Height = 218
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      BevelKind = bkSoft
      BevelWidth = 2
      TabOrder = 7
      object Image3: TImage
        Left = 2
        Top = 2
        Width = 148
        Height = 210
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        ExplicitLeft = 3
        ExplicitTop = 3
        ExplicitWidth = 145
        ExplicitHeight = 208
      end
    end
    object Button5: TButton
      Left = 34
      Top = 299
      Width = 75
      Height = 36
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #23548#20837#22270#22359
      TabOrder = 8
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 109
      Top = 299
      Width = 73
      Height = 36
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #23548#20986#22270#22359
      TabOrder = 9
      OnClick = Button6Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 847
    Width = 1166
    Height = 33
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Panels = <>
  end
  object Panel4: TPanel
    Left = 211
    Top = 0
    Width = 955
    Height = 847
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    TabOrder = 2
    object ScrollBox1: TScrollBox
      Left = 1
      Top = 107
      Width = 953
      Height = 739
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      TabOrder = 0
      object Image1: TImage
        Left = 0
        Top = 0
        Width = 3269
        Height = 1831
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ParentCustomHint = False
        OnDragDrop = Image1DragDrop
        OnDragOver = Image1DragOver
        OnMouseDown = Image1MouseDown
        OnMouseMove = Image1MouseMove
        OnMouseUp = Image1MouseUp
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 953
      Height = 106
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      TabOrder = 1
      Visible = False
      object RadioGroup1: TRadioGroup
        Left = 21
        Top = 13
        Width = 127
        Height = 85
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #36148#22270#27169#24335#36873#25321
        ItemIndex = 0
        Items.Strings = (
          #21407#22987'rle'#36148#22270
          'PNG'#25171#21253
          'PNG'#25991#20214#22841)
        TabOrder = 0
        OnClick = RadioGroup1Click
      end
    end
  end
  object CheckBox1: TCheckBox
    Left = 51
    Top = 150
    Width = 95
    Height = 23
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #26356#22810#35774#32622
    TabOrder = 3
    OnClick = CheckBox1Click
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 25
    OnTimer = Timer1Timer
    Left = 128
    Top = 8
  end
  object OpenDialog1: TOpenDialog
    Top = 48
  end
  object SaveDialog1: TSaveDialog
    Left = 8
  end
end
