object Form13: TForm13
  Left = 0
  Top = 0
  Caption = #20027#22320#22270#32534#36753
  ClientHeight = 1011
  ClientWidth = 1125
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
  OnResize = FormResize
  PixelsPerInch = 120
  TextHeight = 17
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 242
    Height = 1011
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alLeft
    TabOrder = 0
    object Label1: TLabel
      Left = 31
      Top = 10
      Width = 42
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #25805#20316#23618
    end
    object Button1: TButton
      Left = 31
      Top = 85
      Width = 96
      Height = 43
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #36873#25321#36148#22270
      TabOrder = 0
      OnClick = Button1Click
    end
    object ComboBox1: TComboBox
      Left = 31
      Top = 31
      Width = 159
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
      OnSelect = ComboBox1Select
      Items.Strings = (
        #26410#36873#25321
        #22320#38754
        #34920#38754
        #24314#31569
        #24341#29992#24314#31569
        #20840#37096)
    end
    object GroupBox1: TGroupBox
      Left = 10
      Top = 235
      Width = 224
      Height = 624
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #24403#21069#36148#22270
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 2
      object Label2: TLabel
        Left = 21
        Top = 42
        Width = 56
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #24403#21069#22320#38754
      end
      object Label3: TLabel
        Left = 21
        Top = 116
        Width = 56
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #24403#21069#34920#38754
      end
      object Label4: TLabel
        Left = 21
        Top = 188
        Width = 56
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #24403#21069#24314#31569
      end
      object Label5: TLabel
        Left = 21
        Top = 408
        Width = 56
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #24341#29992#24314#31569
      end
      object Label6: TLabel
        Left = 21
        Top = 67
        Width = 4
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
      end
      object Label7: TLabel
        Left = 21
        Top = 141
        Width = 4
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
      end
      object Label8: TLabel
        Left = 105
        Top = 188
        Width = 4
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
      end
      object Label9: TLabel
        Left = 105
        Top = 408
        Width = 4
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
      end
      object Panel3: TPanel
        Left = 102
        Top = 22
        Width = 111
        Height = 62
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        BevelKind = bkSoft
        BevelWidth = 2
        TabOrder = 0
        object Image2: TImage
          Left = 0
          Top = 0
          Width = 106
          Height = 54
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
        end
      end
      object Panel4: TPanel
        Left = 102
        Top = 98
        Width = 111
        Height = 62
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        BevelKind = bkSoft
        BevelWidth = 2
        TabOrder = 1
        object Image3: TImage
          Left = 0
          Top = 0
          Width = 106
          Height = 54
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
        end
      end
      object Panel5: TPanel
        Left = 18
        Top = 212
        Width = 196
        Height = 188
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        BevelKind = bkSoft
        BevelWidth = 2
        TabOrder = 2
        object Image4: TImage
          Left = 0
          Top = 0
          Width = 190
          Height = 179
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
        end
      end
      object Panel6: TPanel
        Left = 18
        Top = 432
        Width = 196
        Height = 188
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        BevelKind = bkSoft
        BevelWidth = 2
        TabOrder = 3
        object Image5: TImage
          Left = 0
          Top = 0
          Width = 190
          Height = 179
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
        end
      end
    end
    object Button2: TButton
      Left = 31
      Top = 136
      Width = 96
      Height = 43
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #20445#23384#25991#20214
      TabOrder = 3
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 31
      Top = 187
      Width = 96
      Height = 43
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #23548#20986#22320#22270
      TabOrder = 4
      OnClick = Button3Click
    end
    object CheckBox1: TCheckBox
      Left = 140
      Top = 95
      Width = 95
      Height = 23
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #26356#22810#35774#32622
      TabOrder = 5
      OnClick = CheckBox1Click
    end
  end
  object Panel2: TPanel
    Left = 242
    Top = 0
    Width = 883
    Height = 1011
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    TabOrder = 1
    object Panel7: TPanel
      Left = 1
      Top = 1
      Width = 881
      Height = 105
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      TabOrder = 0
      Visible = False
      object RadioGroup1: TRadioGroup
        Left = 21
        Top = 12
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
    object Panel9: TPanel
      Left = 1
      Top = 106
      Width = 881
      Height = 904
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      OnResize = Panel9Resize
      object Image1: TImage
        Left = 0
        Top = 0
        Width = 855
        Height = 853
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        OnDragDrop = Image1DragDrop
        OnDragOver = Image1DragOver
        OnMouseDown = Image1MouseDown
        OnMouseMove = Image1MouseMove
        OnMouseUp = Image1MouseUp
        ExplicitWidth = 854
        ExplicitHeight = 843
      end
      object ScrollBar2: TScrollBar
        Left = 855
        Top = 0
        Width = 26
        Height = 853
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alRight
        Kind = sbVertical
        LargeChange = 10
        PageSize = 0
        TabOrder = 0
        OnChange = ScrollBar2Change
      end
      object StatusBar1: TStatusBar
        Left = 0
        Top = 874
        Width = 881
        Height = 30
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Panels = <>
      end
      object ScrollBar1: TScrollBar
        Left = 0
        Top = 853
        Width = 881
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alBottom
        LargeChange = 10
        PageSize = 0
        TabOrder = 2
        OnChange = ScrollBar1Change
      end
    end
  end
  object Button5: TButton
    Left = 149
    Top = 136
    Width = 75
    Height = 43
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #23548#20837#22270#22359
    TabOrder = 2
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 149
    Top = 187
    Width = 73
    Height = 43
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #23548#20986#22270#22359
    TabOrder = 3
    OnClick = Button6Click
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 25
    OnTimer = Timer1Timer
    Left = 200
    Top = 16
  end
  object OpenDialog1: TOpenDialog
    Left = 144
    Top = 8
  end
  object SaveDialog1: TSaveDialog
    Left = 144
    Top = 56
  end
end
