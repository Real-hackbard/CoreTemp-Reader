object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'CoreTemp Reader'
  ClientHeight = 602
  ClientWidth = 921
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 15
  object GroupBox1: TGroupBox
    Left = 8
    Top = 71
    Width = 905
    Height = 506
    Caption = ' Core Temp Reader '
    TabOrder = 0
    DesignSize = (
      905
      506)
    object Label9: TLabel
      Left = 48
      Top = 48
      Width = 60
      Height = 15
      Alignment = taRightJustify
      Caption = 'Processor  :'
    end
    object Label10: TLabel
      Left = 34
      Top = 111
      Width = 74
      Height = 15
      Alignment = taRightJustify
      Caption = 'Main Core(s) :'
    end
    object Label11: TLabel
      Left = 66
      Top = 153
      Width = 42
      Height = 15
      Alignment = taRightJustify
      Caption = 'CPU(s) :'
    end
    object Label12: TLabel
      Left = 45
      Top = 174
      Width = 63
      Height = 15
      Alignment = taRightJustify
      Caption = 'CPU speed :'
    end
    object Label13: TLabel
      Left = 49
      Top = 195
      Width = 59
      Height = 15
      Alignment = taRightJustify
      Caption = 'FSB speed :'
    end
    object Label14: TLabel
      Left = 51
      Top = 216
      Width = 57
      Height = 15
      Alignment = taRightJustify
      Caption = 'Multiplier :'
    end
    object Label15: TLabel
      Left = 84
      Top = 237
      Width = 24
      Height = 15
      Alignment = taRightJustify
      Caption = 'VID :'
    end
    object Label16: TLabel
      Left = 114
      Top = 48
      Width = 18
      Height = 15
      Hint = 'Processor Name'
      Caption = 'n/a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label17: TLabel
      Left = 114
      Top = 111
      Width = 18
      Height = 15
      Hint = 'The number of main cores in the CPU.'
      Caption = 'n/a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label18: TLabel
      Left = 114
      Top = 153
      Width = 18
      Height = 15
      Hint = 'The number of CPU(s) on the motherboard.'
      Caption = 'n/a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label19: TLabel
      Left = 114
      Top = 174
      Width = 18
      Height = 15
      Hint = 'CPU clock frequency.'
      Caption = 'n/a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label20: TLabel
      Left = 114
      Top = 195
      Width = 18
      Height = 15
      Caption = 'n/a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label21: TLabel
      Left = 114
      Top = 216
      Width = 18
      Height = 15
      Hint = 
        'The CPU multiplier determines the final clock frequency of your ' +
        'processor.'
      Caption = 'n/a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label22: TLabel
      Left = 114
      Top = 237
      Width = 18
      Height = 15
      Hint = 
        'Voltage Identification Definition, displays the processor voltag' +
        'e.'
      Caption = 'n/a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label1: TLabel
      Left = 60
      Top = 317
      Width = 48
      Height = 15
      Anchors = [akLeft, akBottom]
      Caption = 'Core (1) :'
      Enabled = False
    end
    object Label2: TLabel
      Left = 60
      Top = 338
      Width = 48
      Height = 15
      Anchors = [akLeft, akBottom]
      Caption = 'Core (2) :'
      Enabled = False
    end
    object Label3: TLabel
      Left = 60
      Top = 359
      Width = 48
      Height = 15
      Anchors = [akLeft, akBottom]
      Caption = 'Core (3) :'
      Enabled = False
    end
    object Label4: TLabel
      Left = 60
      Top = 380
      Width = 48
      Height = 15
      Anchors = [akLeft, akBottom]
      Caption = 'Core (4) :'
      Enabled = False
    end
    object Label5: TLabel
      Left = 60
      Top = 401
      Width = 48
      Height = 15
      Anchors = [akLeft, akBottom]
      Caption = 'Core (5) :'
      Enabled = False
    end
    object Label6: TLabel
      Left = 60
      Top = 422
      Width = 48
      Height = 15
      Anchors = [akLeft, akBottom]
      Caption = 'Core (6) :'
      Enabled = False
    end
    object Label7: TLabel
      Left = 60
      Top = 443
      Width = 48
      Height = 15
      Anchors = [akLeft, akBottom]
      Caption = 'Core (7) :'
      Enabled = False
    end
    object Label8: TLabel
      Left = 60
      Top = 464
      Width = 48
      Height = 15
      Anchors = [akLeft, akBottom]
      Caption = 'Core (8) :'
      Enabled = False
    end
    object Label32: TLabel
      Left = 35
      Top = 25
      Width = 49
      Height = 17
      Caption = 'CPU(s) :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label105: TLabel
      Left = 121
      Top = 293
      Width = 55
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Sensors :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label106: TLabel
      Left = 280
      Top = 293
      Width = 42
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Temp :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label107: TLabel
      Left = 385
      Top = 293
      Width = 45
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Usage :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label108: TLabel
      Left = 513
      Top = 293
      Width = 57
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Options :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label100: TLabel
      Left = 505
      Top = 318
      Width = 102
      Height = 15
      Anchors = [akLeft, akBottom]
      Caption = 'Temperature Scale :'
    end
    object Label101: TLabel
      Left = 528
      Top = 347
      Width = 79
      Height = 15
      Anchors = [akLeft, akBottom]
      Caption = 'Measurement :'
    end
    object Label23: TLabel
      Left = 712
      Top = 48
      Width = 18
      Height = 15
      Hint = 'Motherboard Name & Model Designation'
      Caption = 'n/a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label29: TLabel
      Left = 672
      Top = 27
      Width = 34
      Height = 15
      Caption = 'BIOS :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label30: TLabel
      Left = 630
      Top = 48
      Width = 76
      Height = 15
      Caption = 'Motherboard :'
    end
    object Label31: TLabel
      Left = 658
      Top = 69
      Width = 48
      Height = 15
      Caption = 'Product :'
    end
    object Label34: TLabel
      Left = 712
      Top = 69
      Width = 18
      Height = 15
      Hint = 'Motherboard product name.'
      Caption = 'n/a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label35: TLabel
      Left = 663
      Top = 90
      Width = 43
      Height = 15
      Caption = 'Vendor :'
    end
    object Label36: TLabel
      Left = 636
      Top = 111
      Width = 70
      Height = 15
      Caption = 'UEFI Version :'
    end
    object Label37: TLabel
      Left = 712
      Top = 90
      Width = 18
      Height = 15
      Caption = 'n/a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label38: TLabel
      Left = 712
      Top = 111
      Width = 18
      Height = 15
      Caption = 'n/a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label39: TLabel
      Left = 653
      Top = 132
      Width = 53
      Height = 15
      Caption = 'Identifier :'
    end
    object Label40: TLabel
      Left = 712
      Top = 132
      Width = 18
      Height = 15
      Hint = 'Motherboard product identifier'
      Caption = 'n/a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label41: TLabel
      Left = 648
      Top = 153
      Width = 58
      Height = 15
      Caption = 'BIOS Date :'
    end
    object Label42: TLabel
      Left = 712
      Top = 153
      Width = 18
      Height = 15
      Caption = 'n/a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label43: TLabel
      Left = 606
      Top = 174
      Width = 100
      Height = 15
      Caption = 'BIOS Release Date :'
    end
    object Label44: TLabel
      Left = 712
      Top = 174
      Width = 18
      Height = 15
      Caption = 'n/a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label45: TLabel
      Left = 665
      Top = 195
      Width = 41
      Height = 15
      Caption = 'Family :'
    end
    object Label46: TLabel
      Left = 712
      Top = 195
      Width = 18
      Height = 15
      Caption = 'n/a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label103: TLabel
      Left = 506
      Top = 453
      Width = 101
      Height = 15
      Anchors = [akLeft, akBottom]
      Caption = 'Monitoring Speed :'
    end
    object Label104: TLabel
      Left = 846
      Top = 453
      Width = 37
      Height = 15
      Anchors = [akLeft, akBottom]
      Caption = '100 ms'
    end
    object Label49: TLabel
      Left = 712
      Top = 216
      Width = 18
      Height = 15
      Caption = 'n/a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label50: TLabel
      Left = 600
      Top = 216
      Width = 106
      Height = 15
      Caption = 'Bios Serial Number :'
    end
    object Label102: TLabel
      Left = 563
      Top = 376
      Width = 44
      Height = 15
      Anchors = [akLeft, akBottom]
      Caption = 'Priotity :'
    end
    object Label52: TLabel
      Left = 13
      Top = 69
      Width = 95
      Height = 15
      Caption = 'Processor Family :'
    end
    object Label53: TLabel
      Left = 114
      Top = 69
      Width = 18
      Height = 15
      Caption = 'n/a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label54: TLabel
      Left = 114
      Top = 132
      Width = 18
      Height = 15
      Hint = 
        'The number of multi-core processor units combined into main core' +
        's.'
      Caption = 'n/a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label55: TLabel
      Left = 44
      Top = 132
      Width = 64
      Height = 15
      Caption = 'Multi-Core :'
    end
    object Label56: TLabel
      Left = 73
      Top = 258
      Width = 35
      Height = 15
      Caption = 'Id Nr. :'
    end
    object Label57: TLabel
      Left = 114
      Top = 258
      Width = 18
      Height = 15
      Caption = 'n/a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label27: TLabel
      Left = 414
      Top = 48
      Width = 55
      Height = 15
      Caption = 'Page Size :'
    end
    object Label28: TLabel
      Left = 475
      Top = 48
      Width = 18
      Height = 15
      Caption = 'n/a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label47: TLabel
      Left = 383
      Top = 69
      Width = 86
      Height = 15
      Caption = 'Lowest address :'
    end
    object Label48: TLabel
      Left = 475
      Top = 69
      Width = 18
      Height = 15
      Caption = 'n/a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label51: TLabel
      Left = 379
      Top = 90
      Width = 90
      Height = 15
      Caption = 'Highest address :'
    end
    object Label58: TLabel
      Left = 475
      Top = 90
      Width = 18
      Height = 15
      Caption = 'n/a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label59: TLabel
      Left = 663
      Top = 237
      Width = 43
      Height = 15
      Caption = 'OEMID :'
    end
    object Label60: TLabel
      Left = 712
      Top = 237
      Width = 18
      Height = 15
      Caption = 'n/a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label61: TLabel
      Left = 399
      Top = 111
      Width = 70
      Height = 15
      Caption = 'Active Mask :'
    end
    object Label62: TLabel
      Left = 475
      Top = 111
      Width = 18
      Height = 15
      Hint = 
        'CPU mask identifies the processors currently capable of executin' +
        'g tasks.'
      Caption = 'n/a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label63: TLabel
      Left = 381
      Top = 132
      Width = 88
      Height = 15
      Caption = 'Virtual Memory :'
    end
    object Label64: TLabel
      Left = 475
      Top = 132
      Width = 18
      Height = 15
      Caption = 'n/a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label26: TLabel
      Left = 24
      Top = 90
      Width = 84
      Height = 15
      Caption = 'Processor Type :'
    end
    object Label25: TLabel
      Left = 114
      Top = 90
      Width = 18
      Height = 15
      Hint = 'The model and architecture of a processor.'
      Caption = 'n/a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label24: TLabel
      Left = 419
      Top = 153
      Width = 50
      Height = 15
      Caption = 'Revision :'
    end
    object Label33: TLabel
      Left = 475
      Top = 153
      Width = 18
      Height = 15
      Caption = 'n/a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object ProgressBar1: TProgressBar
      Left = 114
      Top = 316
      Width = 150
      Height = 20
      Anchors = [akLeft, akBottom]
      TabOrder = 0
    end
    object Panel1: TPanel
      Left = 270
      Top = 316
      Width = 100
      Height = 20
      Anchors = [akLeft, akBottom]
      BevelOuter = bvLowered
      Caption = '0,00 '#176'C'
      Ctl3D = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
    end
    object ProgressBar2: TProgressBar
      Left = 114
      Top = 338
      Width = 150
      Height = 20
      Anchors = [akLeft, akBottom]
      TabOrder = 2
    end
    object Panel2: TPanel
      Left = 270
      Top = 338
      Width = 100
      Height = 20
      Anchors = [akLeft, akBottom]
      BevelOuter = bvLowered
      Caption = '0,00 '#176'C'
      Ctl3D = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
    end
    object ProgressBar3: TProgressBar
      Left = 114
      Top = 359
      Width = 150
      Height = 20
      Anchors = [akLeft, akBottom]
      TabOrder = 4
    end
    object Panel3: TPanel
      Left = 270
      Top = 359
      Width = 100
      Height = 20
      Anchors = [akLeft, akBottom]
      BevelOuter = bvLowered
      Caption = '0,00 '#176'C'
      Ctl3D = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 5
    end
    object ProgressBar4: TProgressBar
      Left = 114
      Top = 380
      Width = 150
      Height = 20
      Anchors = [akLeft, akBottom]
      TabOrder = 6
    end
    object ProgressBar5: TProgressBar
      Left = 114
      Top = 401
      Width = 150
      Height = 20
      Anchors = [akLeft, akBottom]
      TabOrder = 7
    end
    object Panel4: TPanel
      Left = 270
      Top = 380
      Width = 100
      Height = 20
      Anchors = [akLeft, akBottom]
      BevelOuter = bvLowered
      Caption = '0,00 '#176'C'
      Ctl3D = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 8
    end
    object Panel5: TPanel
      Left = 270
      Top = 401
      Width = 100
      Height = 20
      Anchors = [akLeft, akBottom]
      BevelOuter = bvLowered
      Caption = '0,00 '#176'C'
      Ctl3D = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 9
    end
    object ProgressBar6: TProgressBar
      Left = 114
      Top = 422
      Width = 150
      Height = 20
      Anchors = [akLeft, akBottom]
      TabOrder = 10
    end
    object Panel6: TPanel
      Left = 270
      Top = 422
      Width = 100
      Height = 20
      Anchors = [akLeft, akBottom]
      BevelOuter = bvLowered
      Caption = '0,00 '#176'C'
      Ctl3D = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 11
    end
    object ProgressBar7: TProgressBar
      Left = 114
      Top = 443
      Width = 150
      Height = 20
      Anchors = [akLeft, akBottom]
      TabOrder = 12
    end
    object Panel7: TPanel
      Left = 270
      Top = 443
      Width = 100
      Height = 20
      Anchors = [akLeft, akBottom]
      BevelOuter = bvLowered
      Caption = '0,00 '#176'C'
      Ctl3D = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 13
    end
    object ProgressBar8: TProgressBar
      Left = 114
      Top = 464
      Width = 150
      Height = 20
      Anchors = [akLeft, akBottom]
      TabOrder = 14
    end
    object Panel8: TPanel
      Left = 270
      Top = 466
      Width = 100
      Height = 20
      Anchors = [akLeft, akBottom]
      BevelOuter = bvLowered
      Caption = '0,00 '#176'C'
      Ctl3D = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 15
    end
    object Panel10: TPanel
      Left = 376
      Top = 316
      Width = 60
      Height = 20
      Anchors = [akLeft, akBottom]
      BevelOuter = bvLowered
      Caption = '0 %'
      Ctl3D = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 16
    end
    object Panel11: TPanel
      Left = 376
      Top = 338
      Width = 60
      Height = 20
      Anchors = [akLeft, akBottom]
      BevelOuter = bvLowered
      Caption = '0 %'
      Ctl3D = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 17
    end
    object Panel12: TPanel
      Left = 376
      Top = 359
      Width = 60
      Height = 20
      Anchors = [akLeft, akBottom]
      BevelOuter = bvLowered
      Caption = '0 %'
      Ctl3D = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 18
    end
    object Panel13: TPanel
      Left = 376
      Top = 380
      Width = 60
      Height = 20
      Anchors = [akLeft, akBottom]
      BevelOuter = bvLowered
      Caption = '0 %'
      Ctl3D = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 19
    end
    object Panel14: TPanel
      Left = 376
      Top = 401
      Width = 60
      Height = 20
      Anchors = [akLeft, akBottom]
      BevelOuter = bvLowered
      Caption = '0 %'
      Ctl3D = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 20
    end
    object Panel15: TPanel
      Left = 376
      Top = 422
      Width = 60
      Height = 20
      Anchors = [akLeft, akBottom]
      BevelOuter = bvLowered
      Caption = '0 %'
      Ctl3D = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 21
    end
    object Panel16: TPanel
      Left = 376
      Top = 443
      Width = 60
      Height = 20
      Anchors = [akLeft, akBottom]
      BevelOuter = bvLowered
      Caption = '0 %'
      Ctl3D = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 22
    end
    object Panel17: TPanel
      Left = 376
      Top = 466
      Width = 60
      Height = 20
      Anchors = [akLeft, akBottom]
      BevelOuter = bvLowered
      Caption = '0 %'
      Ctl3D = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 23
    end
    object ComboBox1: TComboBox
      Left = 613
      Top = 315
      Width = 108
      Height = 23
      Style = csDropDownList
      Anchors = [akLeft, akBottom]
      ItemIndex = 0
      TabOrder = 24
      Text = 'Celsius'
      OnChange = ComboBox1Change
      Items.Strings = (
        'Celsius'
        'Fahrenheit')
    end
    object ComboBox2: TComboBox
      Left = 613
      Top = 344
      Width = 108
      Height = 23
      Style = csDropDownList
      Anchors = [akLeft, akBottom]
      ItemIndex = 0
      TabOrder = 25
      Text = 'General'
      Items.Strings = (
        'General'
        'Exponent'
        'Fixed'
        'Number')
    end
    object CheckBox2: TCheckBox
      Left = 513
      Top = 414
      Width = 146
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'CPU Speed Monitoring'
      Checked = True
      State = cbChecked
      TabOrder = 26
      OnClick = CheckBox2Click
    end
    object ScrollBar1: TScrollBar
      Left = 613
      Top = 453
      Width = 227
      Height = 15
      Anchors = [akLeft, akBottom]
      Max = 1000
      Min = 1
      PageSize = 0
      Position = 1
      TabOrder = 27
      OnChange = ScrollBar1Change
    end
    object ComboBox3: TComboBox
      Left = 613
      Top = 373
      Width = 108
      Height = 23
      Style = csDropDownList
      Anchors = [akLeft, akBottom]
      ItemIndex = 1
      TabOrder = 28
      Text = 'Normal'
      OnChange = ComboBox3Change
      Items.Strings = (
        'Low'
        'Normal'
        'High'
        'Real-Time')
    end
  end
  object Panel9: TPanel
    Left = 0
    Top = 0
    Width = 921
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    Caption = 'CoreTemp Reader'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Impact'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitWidth = 917
    object Label69: TLabel
      Left = 315
      Top = 52
      Width = 286
      Height = 13
      Caption = 'Measure the temperature of your cores using CoreTemp'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object CheckBox1: TCheckBox
      Left = 42
      Top = 17
      Width = 175
      Height = 17
      Caption = 'Start Temperature Monitoring'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = CheckBox1Click
    end
    object BitBtn1: TBitBtn
      Left = 880
      Top = 29
      Width = 25
      Height = 25
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Images = ImageList1
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object CheckBox3: TCheckBox
      Left = 42
      Top = 40
      Width = 141
      Height = 17
      Hint = 'Closes Core Temp when the monitoring program is shut down.'
      Caption = 'Close CoreTemp by end'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 583
    Width = 921
    Height = 19
    Panels = <
      item
        Text = 'Monitoring :'
        Width = 75
      end
      item
        Text = 'off'
        Width = 30
      end
      item
        Text = 'Errors :'
        Width = 50
      end
      item
        Text = 'none.'
        Width = 350
      end
      item
        Text = 'Reason :'
        Width = 55
      end
      item
        Text = 'none.'
        Width = 50
      end>
    ExplicitTop = 582
    ExplicitWidth = 917
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 688
    Top = 16
  end
  object ImageList1: TImageList
    Left = 624
    Top = 16
    Bitmap = {
      494C010102000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000F911D000F911D00138D23000F821C0008721000087210000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000006780E0006780E000874120006680D0003570600035706000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000025AE
      390025AE390067CC83006FD2930058CC830037C26C002AB65B001B9A3A000B6A
      15000B6A15000000000000000000000000000000000000000000000000001399
      2300139923004CBD690054C57A003EBD690021B1510017A341000D822300044F
      0900044F09000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000025AE390071D2
      8C00BCEDD2009BE5BA005FD38D0042C9770033C76C002CC565002AC65B0020BE
      49000F8522000A6A1500000000000000000000000000000000001399230056C5
      7300AAE7C50083DDA70044C674002ABA5C001EB7510018B54A0017B6410010AC
      3000066B1100034F090000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000025AE390084D89F00D2F4
      E10082DBA40038C670006DD49500FFFFFF00CDF1DA0022BD4D001DBB45001BBD
      400016BD34000A7F1500056009000000000000000000139923006ACC8800C5F0
      D80068D08E0022B655002CBA5C00BAEACC0070D3920011AB34000EA92D000DAB
      28000AAB1F000365090001450300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000025AE3900DBF7EA0080DA
      A30028C0630030C3690072D69900FFFFFF00C9EFD3000FB422000EB4250014B7
      300011B727000BB61C0005600900000000000000000013992300D0F4E30066CF
      8C0016AF48001DB24F00A4E3BC00FFFFFF00F0FBF30041BD4E0005A0130009A4
      1C0007A4150004A30D0001450300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000032B74E00ADE8C500AFE8C60036C4
      6D002FC2670038C56F0071D69800FFFFFF00C7EED0000AB21A000BB31B000AB2
      1F000BB21C0009B91A0008911300044906001DA4350098E1B5009AE1B60020B4
      52001CB14D0095DEB000FFFFFF00FFFFFF00FFFFFF00F3FBF40041BD4B00039E
      0F00049E0D0003A60C0003780800013002000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000025AE3900CCF2DE006BD4930039C5
      6F0053CD820038C56F0072D69900FFFFFF00C8EFD2000CB31C0011B4210028BC
      360007B1160008B4180009B01800055B090013992300BDEED40050C77A001CB2
      4F008EDCAB00FFFFFF00FAFEFB00FCFFFE00F7FCF800FCFEFC00F4FCF60048C0
      5200029D0A0003A00B00039C0B00014103000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000025AE3900BAEDD10052CC8100BCEC
      CE00F7FDF90070D6970064D28C00FFFFFF00C5EED0000AB219009ADFA000DFF5
      E10008B1170007B2160009B31A00066C0C0013992300A7E7C40038BD670095DE
      B000FFFFFF00E2F7EA0082D9A000FFFFFF00B7E9C50075D07D00FFFFFF00E9F8
      EA00039D0A00029E0A00039F0C00025104000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000025AE3900A6E7C20044C97800ABE6
      C200FFFFFF00E8F8EE0092DFA800FFFFFF00C7EECF008DDB9500FFFFFF00EEFA
      EF0009B2190009B3190009B31900066C0C001399230090E0B1002CBA5D00ABE6
      C100F4FCF7004FC675003EBF5E00FFFFFF00B4E7BD00039E0C0082D58900D5F2
      D800039E0C00039F0C00039F0C00025104000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000025AE390091E2B30049CA7B002DC2
      63009CE2B200FFFFFF00FBFEFB00FDFEFD00F8FDF900FDFEFD00F7FDF80063CE
      6D0009B2190009B4190009B11900055E0A001399230078D99F0030BB60001FB4
      4E002DB8530011AB340041C05B00FFFFFF00ADE5B200039E0C0007A0100016AA
      2000039E0C0003A00C00039D0C00014303000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000024A3420064D4920048CB780024BE
      560022BC4B009FE2B100FFFFFF00FFFFFF00FFFFFF00F6FCF7005ACB650009B2
      190009B2190009B81A0007961400044C0600138C2A0049C779002FBC5D0013AC
      3C0010A931000FAA300041BF5B00FFFFFF00ADE5B200039E0C00039E0C00039E
      0C00039E0C0003A50C00027E0900013302000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002FB1570039CB6A0023BC
      4D001DBA410020BD4800ACE5B800FFFFFF00F2FBF30058CB630009B2190009B2
      190009B4190009B91A0005680C0000000000000000001B9D3D0023BC4F0012AA
      34000EA729000FAA2E0041BF5800FFFFFF00AFE5B400039E0C00039E0C00039E
      0C0003A00C0003A60C00014D0400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002FB1570021B649001FC1
      460018B736001AB93E002EBF4C00BCEAC1006FD2790009B2190009B2190009B3
      190009BA1A000783100005680C0000000000000000001B9D3D0011A330000FB0
      2D000BA420000CA6270041BF5700FFFFFF00B1E6B600039E0C00039E0C00039F
      0C0003A70C0002690600014D0400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000F7C1F0016AE
      340014C0300010BA290011B82B000AB41A0008B4190009B51A0009B81A0009BA
      1A0007841000044D06000000000000000000000000000000000006620F000A99
      1F0009AF1C0006A7160007A5180003A00C0003A00C0003A10C0003A50C0003A7
      0C00026A06000134020000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000A85
      17000A85170008A3170008B1190009B3190009B3190008AB1700089413000667
      0C0006670C00000000000000000000000000000000000000000000000000036B
      0A00036B0A00038C0A00039D0C00039F0C00039F0C0003960A00037B0800024C
      0400024C04000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000005610A0005610A00066D0D0005650B00045D0900045D09000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000014603000146030002520500014A040001420300014203000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00F81FF81F00000000E007E00700000000
      C003C00300000000800180010000000080018001000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000080018001000000008001800100000000C003C00300000000
      E007E00700000000F81FF81F0000000000000000000000000000000000000000
      000000000000}
  end
end
