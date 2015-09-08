object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 561
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Descargas: TGroupBox
    Left = 308
    Top = 346
    Width = 145
    Height = 121
    Caption = 'DESCARGAR'
    TabOrder = 0
    object ObtRepLog: TButton
      Left = 2
      Top = 94
      Width = 141
      Height = 25
      Align = alBottom
      Caption = 'LOG INTERNO'
      TabOrder = 0
      ExplicitLeft = 19
      ExplicitTop = 40
      ExplicitWidth = 129
    end
    object ObtRepDoc: TButton
      Left = 2
      Top = 69
      Width = 141
      Height = 25
      Align = alBottom
      Caption = 'REPORTE DOCUMENTOS'
      TabOrder = 1
      ExplicitLeft = 19
      ExplicitTop = 71
      ExplicitWidth = 129
    end
    object ObtRepAudit: TButton
      Left = 2
      Top = 19
      Width = 141
      Height = 25
      Align = alBottom
      Caption = 'CTD (Cinta testigo digital)'
      TabOrder = 2
      ExplicitLeft = 19
      ExplicitTop = 102
      ExplicitWidth = 126
    end
    object ObtRepElectr: TButton
      Left = 2
      Top = 44
      Width = 141
      Height = 25
      Align = alBottom
      Caption = 'REPORTES ELECTRONICOS'
      TabOrder = 3
      ExplicitLeft = 19
      ExplicitTop = 133
      ExplicitWidth = 75
    end
  end
  object Miscel: TGroupBox
    Left = -1
    Top = 0
    Width = 242
    Height = 193
    Caption = 'Miscel'#225'neas'
    TabOrder = 1
    object Reimpr: TButton
      Left = 2
      Top = 166
      Width = 238
      Height = 25
      Align = alBottom
      Caption = 'REIMPRESION COMPROBANTE'
      TabOrder = 0
      ExplicitLeft = 3
      ExplicitTop = 24
      ExplicitWidth = 75
    end
    object DocxMail: TButton
      Left = 2
      Top = 141
      Width = 238
      Height = 25
      Align = alBottom
      Caption = 'ENVIAR COMPROBANTE POR CORREO ELECTR.'
      TabOrder = 1
      ExplicitLeft = 16
      ExplicitTop = 55
      ExplicitWidth = 75
    end
    object BorrarLogo: TButton
      Left = 2
      Top = 116
      Width = 238
      Height = 25
      Align = alBottom
      Caption = 'ELIMINAR LOGO EMISOR'
      TabOrder = 2
      ExplicitLeft = 16
      ExplicitTop = 86
      ExplicitWidth = 75
    end
    object CopiarDoc: TButton
      Left = 2
      Top = 66
      Width = 238
      Height = 25
      Align = alBottom
      Caption = 'COPIAR COMPROBANTE'
      TabOrder = 3
      ExplicitLeft = 16
      ExplicitTop = 117
      ExplicitWidth = 75
    end
    object CargaLogo: TButton
      Left = 2
      Top = 16
      Width = 238
      Height = 25
      Align = alBottom
      Caption = 'CARGAR LOGO EMISOR'
      TabOrder = 4
      ExplicitLeft = 16
      ExplicitTop = 140
      ExplicitWidth = 75
    end
    object AvanzPap: TButton
      Left = 2
      Top = 41
      Width = 238
      Height = 25
      Align = alBottom
      Caption = 'AVANZAR PAPEL'
      TabOrder = 5
      ExplicitLeft = 16
      ExplicitTop = 171
      ExplicitWidth = 75
    end
    object AbrirCaj: TButton
      Left = 2
      Top = 91
      Width = 238
      Height = 25
      Align = alBottom
      Caption = 'ABRIR CAJON DE DINERO'
      TabOrder = 6
      ExplicitLeft = 16
      ExplicitTop = 202
      ExplicitWidth = 75
    end
  end
  object Emisor: TGroupBox
    Left = 151
    Top = 199
    Width = 153
    Height = 92
    Caption = 'Modificar datos emisor'
    TabOrder = 2
    object ModifIIBB: TButton
      Left = 2
      Top = 65
      Width = 149
      Height = 25
      Align = alBottom
      Caption = 'INSCRIP. INGRESOS BRUTOS'
      TabOrder = 0
      ExplicitLeft = 3
      ExplicitTop = 16
      ExplicitWidth = 75
    end
    object ModifIniActiv: TButton
      Left = 2
      Top = 15
      Width = 149
      Height = 25
      Align = alBottom
      Caption = 'FECHA INICIO ACTIVIDADES'
      TabOrder = 1
      ExplicitLeft = 3
      ExplicitTop = 40
      ExplicitWidth = 75
    end
    object ModifCateg: TButton
      Left = 2
      Top = 40
      Width = 149
      Height = 25
      Align = alBottom
      Caption = 'RESPONSABILIDAD IVA'
      TabOrder = 2
      ExplicitLeft = 3
      ExplicitTop = 64
      ExplicitWidth = 75
    end
  end
  object CFG: TGroupBox
    Left = 245
    Top = 0
    Width = 212
    Height = 193
    Caption = 'Configurar'
    TabOrder = 3
    object CfgBaudios: TButton
      Left = 2
      Top = 166
      Width = 208
      Height = 25
      Align = alBottom
      Caption = 'BAUDIOS SERIE RS-232'
      TabOrder = 0
      ExplicitLeft = 3
      ExplicitTop = 16
      ExplicitWidth = 75
    end
    object CFgZona: TButton
      Left = 2
      Top = 141
      Width = 208
      Height = 25
      Align = alBottom
      Caption = 'ZONAS DE LINEAS DE USUARIO'
      TabOrder = 1
      ExplicitLeft = 3
      ExplicitTop = 40
      ExplicitWidth = 75
    end
    object CfgZBorr: TButton
      Left = 2
      Top = 91
      Width = 208
      Height = 25
      Align = alBottom
      Caption = 'LIMITE BORRADO DE '#39'Z'#39
      TabOrder = 2
      ExplicitLeft = 3
      ExplicitTop = 64
      ExplicitWidth = 75
    end
    object CfgServCorreo: TButton
      Left = 2
      Top = 41
      Width = 208
      Height = 25
      Align = alBottom
      Caption = 'SERVIDOR CORREO ELECTRONICO'
      TabOrder = 3
      ExplicitLeft = 3
      ExplicitTop = 88
      ExplicitWidth = 75
    end
    object CfgRed: TButton
      Left = 2
      Top = 16
      Width = 208
      Height = 25
      Align = alBottom
      Caption = 'CONECTIVIDAD EN RED'
      TabOrder = 4
      ExplicitLeft = 3
      ExplicitTop = 112
      ExplicitWidth = 75
    end
    object CfgImprFis: TButton
      Left = 2
      Top = 66
      Width = 208
      Height = 25
      Align = alBottom
      Caption = 'IMPRESORA FISCAL COMPORTAMIENTO'
      TabOrder = 5
      ExplicitLeft = 3
      ExplicitTop = 136
      ExplicitWidth = 75
    end
    object CfgFyh: TButton
      Left = 2
      Top = 116
      Width = 208
      Height = 25
      Align = alBottom
      Caption = 'FECHA Y HORA'
      TabOrder = 6
      ExplicitTop = 167
      ExplicitWidth = 75
    end
  end
  object DNFH: TGroupBox
    Left = 464
    Top = 0
    Width = 130
    Height = 170
    Caption = 'DNFH'
    TabOrder = 4
    object Generico: TButton
      Left = 2
      Top = 143
      Width = 126
      Height = 25
      Align = alBottom
      Caption = 'DOCUMENTO GENERICO'
      TabOrder = 0
      ExplicitLeft = 3
      ExplicitTop = 16
      ExplicitWidth = 75
    end
    object PRESUP: TButton
      Left = 2
      Top = 93
      Width = 126
      Height = 25
      Align = alBottom
      Caption = 'PRESUPUESTO '#39'X'#39
      TabOrder = 1
      ExplicitLeft = 3
      ExplicitTop = 47
      ExplicitWidth = 75
    end
    object DONA: TButton
      Left = 2
      Top = 43
      Width = 126
      Height = 25
      Align = alBottom
      Caption = 'DONACION'
      TabOrder = 2
      ExplicitLeft = 3
      ExplicitTop = 78
      ExplicitWidth = 75
    end
    object RBOX: TButton
      Left = 2
      Top = 18
      Width = 126
      Height = 25
      Align = alBottom
      Caption = 'RECIBO '#39'X'#39
      TabOrder = 3
      ExplicitLeft = 24
      ExplicitTop = 112
      ExplicitWidth = 75
    end
    object RTOX: TButton
      Left = 2
      Top = 68
      Width = 126
      Height = 25
      Align = alBottom
      Caption = 'REMITO '#39'X'#39
      TabOrder = 4
      ExplicitLeft = 24
      ExplicitTop = 136
      ExplicitWidth = 75
    end
    object RTOR: TButton
      Left = 2
      Top = 118
      Width = 126
      Height = 25
      Align = alBottom
      Caption = 'REMITO '#39'R'#39
      TabOrder = 5
      ExplicitLeft = 24
      ExplicitTop = 160
      ExplicitWidth = 75
    end
  end
  object Cancel: TButton
    Left = 295
    Top = 512
    Width = 145
    Height = 25
    Caption = 'CANCELAR COMPROBANTE'
    TabOrder = 5
  end
  object DF: TGroupBox
    Left = 600
    Top = 0
    Width = 155
    Height = 497
    Caption = 'DF (Documentos Fiscales)'
    TabOrder = 6
    object Patron: TButton
      Left = 2
      Top = 470
      Width = 151
      Height = 25
      Align = alBottom
      Caption = '--- DOCUMENTO   PATRON ---'
      TabOrder = 0
      ExplicitLeft = 3
      ExplicitTop = 17
      ExplicitWidth = 75
    end
    object TiqueNC: TButton
      Left = 2
      Top = 420
      Width = 151
      Height = 25
      Align = alBottom
      Caption = 'TIQUE NC CONS. FINAL'
      TabOrder = 1
      ExplicitLeft = 3
      ExplicitTop = 48
      ExplicitWidth = 75
    end
    object Tique: TButton
      Left = 2
      Top = 370
      Width = 151
      Height = 25
      Align = alBottom
      Caption = 'TIQUE CONS. FINAL'
      TabOrder = 2
      ExplicitLeft = 3
      ExplicitTop = 79
      ExplicitWidth = 75
    end
    object TRM: TButton
      Left = 2
      Top = 320
      Width = 151
      Height = 25
      Align = alBottom
      Caption = 'TIQUE RECIBO '#39'M'#39
      TabOrder = 3
      ExplicitLeft = 3
      ExplicitTop = 110
      ExplicitWidth = 75
    end
    object TRC: TButton
      Left = 2
      Top = 270
      Width = 151
      Height = 25
      Align = alBottom
      Caption = 'TIQUE RECIBO '#39'C'#39
      TabOrder = 4
      ExplicitLeft = 3
      ExplicitTop = 141
      ExplicitWidth = 75
    end
    object TRB: TButton
      Left = 2
      Top = 220
      Width = 151
      Height = 25
      Align = alBottom
      Caption = 'TIQUE RECIBO '#39'B'#39
      TabOrder = 5
      ExplicitLeft = 3
      ExplicitTop = 160
      ExplicitWidth = 75
    end
    object TRA: TButton
      Left = 2
      Top = 195
      Width = 151
      Height = 25
      Align = alBottom
      Caption = 'TIQUE RECIBO '#39'A'#39
      TabOrder = 6
      ExplicitLeft = 3
      ExplicitTop = 188
      ExplicitWidth = 75
    end
    object TNCM: TButton
      Left = 2
      Top = 145
      Width = 151
      Height = 25
      Align = alBottom
      Caption = 'TIQUE NOTA DE CREDITO '#39'M'#39
      TabOrder = 7
      ExplicitLeft = 3
      ExplicitTop = 219
      ExplicitWidth = 75
    end
    object NCC: TButton
      Left = 2
      Top = 95
      Width = 151
      Height = 25
      Align = alBottom
      Caption = 'TIQUE NOTA DE CREDITO '#39'C'#39
      TabOrder = 8
      ExplicitLeft = 3
      ExplicitTop = 250
      ExplicitWidth = 75
    end
    object TNCB: TButton
      Left = 2
      Top = 45
      Width = 151
      Height = 25
      Align = alBottom
      Caption = 'TIQUE NOTA DE CREDITO '#39'B'#39
      TabOrder = 9
      ExplicitLeft = 3
      ExplicitTop = 265
      ExplicitWidth = 75
    end
    object TNCA: TButton
      Left = 2
      Top = 20
      Width = 151
      Height = 25
      Align = alBottom
      Caption = 'TIQUE NOTA DE CREDITO '#39'A'#39
      TabOrder = 10
      ExplicitLeft = 16
      ExplicitTop = 296
      ExplicitWidth = 75
    end
    object TNDM: TButton
      Left = 2
      Top = 70
      Width = 151
      Height = 25
      Align = alBottom
      Caption = 'TIQUE NOTA DE DEBITO '#39'M'#39
      TabOrder = 11
      ExplicitLeft = 3
      ExplicitTop = 315
      ExplicitWidth = 75
    end
    object TNDC: TButton
      Left = 2
      Top = 120
      Width = 151
      Height = 25
      Align = alBottom
      Caption = 'TIQUE NOTA DE DEBITO '#39'C'#39
      TabOrder = 12
      ExplicitLeft = 16
      ExplicitTop = 344
      ExplicitWidth = 75
    end
    object TNDB: TButton
      Left = 2
      Top = 170
      Width = 151
      Height = 25
      Align = alBottom
      Caption = 'TIQUE NOTA DE DEBITO '#39'B'#39
      TabOrder = 13
      ExplicitLeft = 24
      ExplicitTop = 376
      ExplicitWidth = 75
    end
    object TNDA: TButton
      Left = 2
      Top = 245
      Width = 151
      Height = 25
      Align = alBottom
      Caption = 'TIQUE NOTA DE DEBITO '#39'A'#39
      TabOrder = 14
      ExplicitLeft = 16
      ExplicitTop = 408
      ExplicitWidth = 75
    end
    object TFM: TButton
      Left = 2
      Top = 295
      Width = 151
      Height = 25
      Align = alBottom
      Caption = 'TIQUE FACTURA '#39'M'#39
      TabOrder = 15
      ExplicitLeft = 3
      ExplicitTop = 432
      ExplicitWidth = 75
    end
    object TFC: TButton
      Left = 2
      Top = 345
      Width = 151
      Height = 25
      Align = alBottom
      Caption = 'TIQUE FACTURA '#39'C'#39
      TabOrder = 16
      ExplicitLeft = 16
      ExplicitTop = 464
      ExplicitWidth = 75
    end
    object TFB: TButton
      Left = 2
      Top = 395
      Width = 151
      Height = 25
      Align = alBottom
      Caption = 'TIQUE FACTURA '#39'B'#39
      TabOrder = 17
      ExplicitLeft = 16
      ExplicitTop = 496
      ExplicitWidth = 75
    end
    object TFA: TButton
      Left = 2
      Top = 445
      Width = 151
      Height = 25
      Align = alBottom
      Caption = 'TIQUE FACTURA '#39'A'#39
      TabOrder = 18
      ExplicitLeft = 48
      ExplicitTop = 512
      ExplicitWidth = 75
    end
  end
end
