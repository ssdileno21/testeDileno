object frmPedidoVenda: TfrmPedidoVenda
  Left = 0
  Top = 0
  AutoSize = True
  BorderIcons = [biSystemMenu, biMinimize]
  ClientHeight = 490
  ClientWidth = 1063
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 122
    Width = 1057
    Height = 150
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object PageControl1: TPageControl
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 1049
      Height = 142
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Dados do Pedido'
        object Label5: TLabel
          Left = 13
          Top = 21
          Width = 47
          Height = 13
          Caption = 'N'#186' Pedido'
        end
        object Label7: TLabel
          Left = 100
          Top = 21
          Width = 64
          Height = 13
          Caption = 'Data Emiss'#227'o'
        end
        object Label8: TLabel
          Left = 292
          Top = 21
          Width = 59
          Height = 13
          Caption = 'C'#243'd. Cliente'
        end
        object Label9: TLabel
          Left = 379
          Top = 23
          Width = 51
          Height = 13
          Caption = 'Valor Total'
        end
        object edtNumPedido: TEdit
          Left = 13
          Top = 40
          Width = 81
          Height = 21
          TabOrder = 0
        end
        object DateTimePicker1: TDateTimePicker
          Left = 100
          Top = 40
          Width = 186
          Height = 21
          Date = 45552.905582650460000000
          Time = 45552.905582650460000000
          TabOrder = 1
        end
        object edtCodCliente: TEdit
          Left = 292
          Top = 40
          Width = 81
          Height = 21
          TabOrder = 2
        end
        object edtVlrPedido: TEdit
          Left = 379
          Top = 40
          Width = 91
          Height = 21
          TabOrder = 3
        end
      end
      object Listagem: TTabSheet
        Caption = 'Listagem'
        ImageIndex = 1
        object DBNavigator1: TDBNavigator
          AlignWithMargins = True
          Left = 1013
          Top = 3
          Width = 25
          Height = 108
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Align = alRight
          Kind = dbnVertical
          TabOrder = 0
        end
        object DBGrid1: TDBGrid
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 1004
          Height = 108
          Align = alClient
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 278
    Width = 1057
    Height = 152
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object dbgridProdutos: TDBGrid
      AlignWithMargins = True
      Left = 427
      Top = 4
      Width = 595
      Height = 144
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object dbnProdutos: TDBNavigator
      AlignWithMargins = True
      Left = 1028
      Top = 4
      Width = 25
      Height = 144
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alRight
      Kind = dbnVertical
      TabOrder = 1
    end
    object Panel3: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 417
      Height = 144
      Align = alLeft
      TabOrder = 2
      object Label2: TLabel
        Left = 14
        Top = 95
        Width = 56
        Height = 13
        Caption = 'Quantidade'
      end
      object Label3: TLabel
        Left = 101
        Top = 95
        Width = 64
        Height = 13
        Caption = 'Valor Unit'#225'rio'
      end
      object edtProdutoQtd: TEdit
        Left = 14
        Top = 112
        Width = 81
        Height = 21
        TabOrder = 0
      end
      object edtProdutoVlrUnitario: TEdit
        Left = 101
        Top = 112
        Width = 91
        Height = 21
        TabOrder = 1
      end
      object gbProduto: TGroupBox
        Left = 8
        Top = 16
        Width = 403
        Height = 57
        Caption = 'Produto'
        TabOrder = 2
        object edtProduto: TEdit
          Left = 6
          Top = 24
          Width = 81
          Height = 21
          TabOrder = 0
          OnChange = edtProdutoChange
        end
        object edtDescricao: TEdit
          Left = 93
          Top = 24
          Width = 300
          Height = 21
          TabOrder = 1
        end
      end
      object btnProdutoGravar: TButton
        AlignWithMargins = True
        Left = 269
        Top = 94
        Width = 142
        Height = 45
        Caption = 'Gravar [Enter]'
        Style = bsCommandLink
        TabOrder = 3
        OnClick = btnProdutoGravarClick
      end
    end
  end
  object Panel4: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 436
    Width = 1057
    Height = 51
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object lbValorTotalPedido: TLabel
      AlignWithMargins = True
      Left = 1014
      Top = 4
      Width = 39
      Height = 43
      Align = alRight
      Alignment = taRightJustify
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 24
    end
    object Label4: TLabel
      AlignWithMargins = True
      Left = 814
      Top = 4
      Width = 194
      Height = 43
      Align = alRight
      Alignment = taRightJustify
      Caption = 'Valor total do pedido:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 24
    end
  end
  object Panel5: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1057
    Height = 53
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    object Label6: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 1049
      Height = 45
      Align = alClient
      Alignment = taCenter
      Caption = 'Pedido de Venda'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 199
      ExplicitHeight = 33
    end
  end
  object Panel6: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 62
    Width = 1057
    Height = 54
    Align = alTop
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 4
    object btnListarPedidos: TButton
      AlignWithMargins = True
      Left = 580
      Top = 3
      Width = 138
      Height = 46
      Caption = 'Listar Pedidos'
      Style = bsCommandLink
      TabOrder = 0
    end
    object btnCancelar: TButton
      AlignWithMargins = True
      Left = 468
      Top = 4
      Width = 106
      Height = 46
      Caption = 'Cancelar'
      Style = bsCommandLink
      TabOrder = 1
      OnClick = btnCancelarClick
    end
    object btnExcluirPedido: TButton
      AlignWithMargins = True
      Left = 311
      Top = 4
      Width = 138
      Height = 46
      Caption = 'Excluir Pedido'
      Style = bsCommandLink
      TabOrder = 2
    end
    object btnGravarPedido: TButton
      AlignWithMargins = True
      Left = 156
      Top = 4
      Width = 138
      Height = 46
      Caption = 'Gravar Pedido'
      Style = bsCommandLink
      TabOrder = 3
      OnClick = btnGravarPedidoClick
    end
    object btnNovoPedido: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 138
      Height = 46
      Caption = 'Novo Pedido'
      Style = bsCommandLink
      TabOrder = 4
      OnClick = btnNovoPedidoClick
    end
  end
end
