object inctGuide: TinctGuide
  Left = 0
  Top = 0
  Caption = #36890#29992#25351#20196#25351#23548
  ClientHeight = 200
  ClientWidth = 800
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 120
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 150
    Width = 800
    Height = 50
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 252
    ExplicitWidth = 633
    object Button1: TButton
      Left = 200
      Top = 6
      Width = 100
      Height = 35
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 500
      Top = 6
      Width = 100
      Height = 35
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 100
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 84
    ExplicitWidth = 633
    ExplicitHeight = 41
  end
  object Panel3: TPanel
    Left = 0
    Top = 100
    Width = 800
    Height = 50
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 202
    ExplicitWidth = 633
    object RadioGroup1: TRadioGroup
      Left = 200
      Top = 2
      Width = 400
      Height = 45
      Caption = #36339#36716#26465#20214
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #28385#36275#26465#20214#36339#36716
        #19981#28385#36275#26465#20214#36339#36716)
      TabOrder = 0
      OnClick = RadioGroup1Click
    end
  end
end
