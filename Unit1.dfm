object Form1: TForm1
  Left = 0
  Top = 0
  Align = alCustom
  Caption = 'Form1'
  ClientHeight = 729
  ClientWidth = 1008
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 1008
    Height = 35
    Align = alTop
    Alignment = taCenter
    Caption = 'OCX Fiscal HASAR - 2da. Generaci'#243'n - Ejemplo de uso'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitWidth = 785
  end
  object LeftPanel: TPanel
    Left = 0
    Top = 35
    Width = 305
    Height = 694
    Align = alLeft
    TabOrder = 0
    ExplicitTop = 0
    ExplicitHeight = 729
    object Descargas: TGroupBox
      Left = 1
      Top = 1
      Width = 303
      Height = 121
      Align = alTop
      Caption = 'DESCARGAR'
      TabOrder = 0
      ExplicitTop = 129
      ExplicitWidth = 263
      object ObtRepLog: TButton
        Left = 2
        Top = 94
        Width = 299
        Height = 25
        Align = alBottom
        Caption = 'LOG INTERNO'
        TabOrder = 0
        OnClick = ObtRepLogClick
        ExplicitWidth = 259
      end
      object ObtRepDoc: TButton
        Left = 2
        Top = 69
        Width = 299
        Height = 25
        Align = alBottom
        Caption = 'REPORTE DOCUMENTOS'
        TabOrder = 1
        OnClick = ObtRepDocClick
        ExplicitWidth = 259
      end
      object ObtRepAudit: TButton
        Left = 2
        Top = 19
        Width = 299
        Height = 25
        Align = alBottom
        Caption = 'CTD (Cinta testigo digital)'
        TabOrder = 2
        OnClick = ObtRepAuditClick
        ExplicitWidth = 259
      end
      object ObtRepElectr: TButton
        Left = 2
        Top = 44
        Width = 299
        Height = 25
        Align = alBottom
        Caption = 'REPORTES ELECTRONICOS'
        TabOrder = 3
        OnClick = ObtRepElectrClick
        ExplicitWidth = 259
      end
    end
    object Miscel: TGroupBox
      Left = 1
      Top = 122
      Width = 303
      Height = 193
      Align = alTop
      Caption = 'Miscel'#225'neas'
      TabOrder = 1
      ExplicitTop = 250
      ExplicitWidth = 263
      object Reimpr: TButton
        Left = 2
        Top = 166
        Width = 299
        Height = 25
        Align = alBottom
        Caption = 'REIMPRESION COMPROBANTE'
        TabOrder = 0
        OnClick = ReimprClick
        ExplicitWidth = 259
      end
      object DocxMail: TButton
        Left = 2
        Top = 141
        Width = 299
        Height = 25
        Align = alBottom
        Caption = 'ENVIAR COMPROBANTE POR CORREO ELECTR.'
        TabOrder = 1
        OnClick = DocxMailClick
        ExplicitWidth = 259
      end
      object BorrarLogo: TButton
        Left = 2
        Top = 116
        Width = 299
        Height = 25
        Align = alBottom
        Caption = 'ELIMINAR LOGO EMISOR'
        TabOrder = 2
        OnClick = BorrarLogoClick
        ExplicitWidth = 259
      end
      object CopiarDoc: TButton
        Left = 2
        Top = 66
        Width = 299
        Height = 25
        Align = alBottom
        Caption = 'COPIAR COMPROBANTE'
        TabOrder = 3
        OnClick = CopiarDocClick
        ExplicitWidth = 259
      end
      object CargaLogo: TButton
        Left = 2
        Top = 16
        Width = 299
        Height = 25
        Align = alBottom
        Caption = 'CARGAR LOGO EMISOR'
        TabOrder = 4
        OnClick = CargaLogoClick
        ExplicitWidth = 259
      end
      object AvanzPap: TButton
        Left = 2
        Top = 41
        Width = 299
        Height = 25
        Align = alBottom
        Caption = 'AVANZAR PAPEL'
        TabOrder = 5
        OnClick = AvanzPapClick
        ExplicitWidth = 259
      end
      object AbrirCaj: TButton
        Left = 2
        Top = 91
        Width = 299
        Height = 25
        Align = alBottom
        Caption = 'ABRIR CAJON DE DINERO'
        TabOrder = 6
        OnClick = AbrirCajClick
        ExplicitWidth = 259
      end
    end
    object Emisor: TGroupBox
      Left = 1
      Top = 315
      Width = 303
      Height = 92
      Align = alTop
      Caption = 'Modificar datos emisor'
      TabOrder = 2
      ExplicitTop = 443
      ExplicitWidth = 263
      object ModifIIBB: TButton
        Left = 2
        Top = 65
        Width = 299
        Height = 25
        Align = alBottom
        Caption = 'INSCRIP. INGRESOS BRUTOS'
        TabOrder = 0
        OnClick = ModifIIBBClick
        ExplicitWidth = 259
      end
      object ModifIniActiv: TButton
        Left = 2
        Top = 15
        Width = 299
        Height = 25
        Align = alBottom
        Caption = 'FECHA INICIO ACTIVIDADES'
        TabOrder = 1
        OnClick = ModifIniActivClick
        ExplicitWidth = 259
      end
      object ModifCateg: TButton
        Left = 2
        Top = 40
        Width = 299
        Height = 25
        Align = alBottom
        Caption = 'RESPONSABILIDAD IVA'
        TabOrder = 2
        OnClick = ModifCategClick
        ExplicitWidth = 259
      end
    end
    object CFG: TGroupBox
      Left = 1
      Top = 407
      Width = 303
      Height = 193
      Align = alTop
      Caption = 'Configurar'
      TabOrder = 3
      ExplicitTop = 535
      ExplicitWidth = 263
      object CfgBaudios: TButton
        Left = 2
        Top = 166
        Width = 299
        Height = 25
        Align = alBottom
        Caption = 'BAUDIOS SERIE RS-232'
        TabOrder = 0
        OnClick = CfgBaudiosClick
        ExplicitWidth = 259
      end
      object CFgZona: TButton
        Left = 2
        Top = 141
        Width = 299
        Height = 25
        Align = alBottom
        Caption = 'ZONAS DE LINEAS DE USUARIO'
        TabOrder = 1
        OnClick = CFgZonaClick
        ExplicitWidth = 259
      end
      object CfgZBorr: TButton
        Left = 2
        Top = 91
        Width = 299
        Height = 25
        Align = alBottom
        Caption = 'LIMITE BORRADO DE '#39'Z'#39
        TabOrder = 2
        OnClick = CfgZBorrClick
        ExplicitWidth = 259
      end
      object CfgServCorreo: TButton
        Left = 2
        Top = 41
        Width = 299
        Height = 25
        Align = alBottom
        Caption = 'SERVIDOR CORREO ELECTRONICO'
        TabOrder = 3
        OnClick = CfgServCorreoClick
        ExplicitWidth = 259
      end
      object CfgRed: TButton
        Left = 2
        Top = 16
        Width = 299
        Height = 25
        Align = alBottom
        Caption = 'CONECTIVIDAD EN RED'
        TabOrder = 4
        OnClick = CfgRedClick
        ExplicitWidth = 259
      end
      object CfgImprFis: TButton
        Left = 2
        Top = 66
        Width = 299
        Height = 25
        Align = alBottom
        Caption = 'IMPRESORA FISCAL COMPORTAMIENTO'
        TabOrder = 5
        OnClick = CfgImprFisClick
        ExplicitWidth = 259
      end
      object CfgFyh: TButton
        Left = 2
        Top = 116
        Width = 299
        Height = 25
        Align = alBottom
        Caption = 'FECHA Y HORA'
        TabOrder = 6
        OnClick = CfgFyhClick
        ExplicitWidth = 259
      end
    end
  end
  object RightPanel: TPanel
    Left = 744
    Top = 35
    Width = 264
    Height = 694
    Align = alRight
    TabOrder = 1
    ExplicitTop = 0
    ExplicitHeight = 729
    object AcumCierres: TGroupBox
      Left = 1
      Top = 1
      Width = 262
      Height = 175
      Align = alTop
      Caption = 'Acumulados y Cierres'
      TabOrder = 0
      ExplicitLeft = -48
      ExplicitTop = 6
      ExplicitWidth = 257
      object Audit: TButton
        Left = 2
        Top = 148
        Width = 258
        Height = 25
        Align = alBottom
        Caption = 'AUDITORIA POR FECHAS'
        TabOrder = 0
        OnClick = AuditClick
        ExplicitWidth = 253
      end
      object CierreZ: TButton
        Left = 2
        Top = 123
        Width = 258
        Height = 25
        Align = alBottom
        Caption = 'INFORME DIARIO DE CIERRE '#39'Z'#39
        TabOrder = 1
        OnClick = CierreZClick
        ExplicitWidth = 253
      end
      object Equis: TButton
        Left = 2
        Top = 73
        Width = 258
        Height = 25
        Align = alBottom
        Caption = 'DETALLE DE VENTAS '#39'X'#39
        TabOrder = 2
        OnClick = EquisClick
        ExplicitWidth = 253
      end
      object ConsCierreZ: TButton
        Left = 2
        Top = 48
        Width = 258
        Height = 25
        Align = alBottom
        Caption = 'CONSULTA ACUMULADOS CIERRE '#39'Z'#39
        TabOrder = 3
        OnClick = ConsCierreZClick
        ExplicitWidth = 253
      end
      object ConsAcumMemoria: TButton
        Left = 2
        Top = 23
        Width = 258
        Height = 25
        Align = alBottom
        Caption = 'CONSULTA ACUMULADOS MEMORIA DE TRABAJO'
        TabOrder = 4
        OnClick = ConsAcumMemoriaClick
        ExplicitWidth = 253
      end
      object ConsAcumComprob: TButton
        Left = 2
        Top = 98
        Width = 258
        Height = 25
        Align = alBottom
        Caption = 'CONSULTA ACUMULADOS COMPROBANTE'
        TabOrder = 5
        OnClick = ConsAcumComprobClick
        ExplicitWidth = 253
      end
    end
    object Consultas: TGroupBox
      Left = 1
      Top = 176
      Width = 262
      Height = 414
      Align = alTop
      Caption = 'Consultar'
      TabOrder = 1
      ExplicitLeft = -17
      ExplicitTop = 179
      ExplicitWidth = 226
      object RangoZ: TButton
        Left = 2
        Top = 387
        Width = 258
        Height = 25
        Align = alBottom
        Caption = 'RANGO  CIERRES '#39'Z'#39
        TabOrder = 0
        OnClick = RangoZClick
        ExplicitWidth = 222
      end
      object ObtStImpr: TButton
        Left = 2
        Top = 337
        Width = 258
        Height = 25
        Align = alBottom
        Caption = 'ULTIMO ESTADO IMPRESORA'
        TabOrder = 1
        OnClick = ObtStImprClick
        ExplicitWidth = 222
      end
      object ObtStFiscal: TButton
        Left = 2
        Top = 287
        Width = 258
        Height = 25
        Align = alBottom
        Caption = 'ULTIMO ESTADO FISCAL'
        TabOrder = 2
        OnClick = ObtStFiscalClick
        ExplicitWidth = 222
      end
      object ConsZona: TButton
        Left = 2
        Top = 237
        Width = 258
        Height = 25
        Align = alBottom
        Caption = 'ZONAS DE LINEAS DE USUARIO'
        TabOrder = 3
        OnClick = ConsZonaClick
        ExplicitWidth = 222
      end
      object ZBorr: TButton
        Left = 2
        Top = 187
        Width = 258
        Height = 25
        Align = alBottom
        Caption = 'LIMITE BORRADO DE '#39'Z'#39
        TabOrder = 4
        OnClick = ZBorrClick
        ExplicitWidth = 222
      end
      object ConsModvers: TButton
        Left = 2
        Top = 137
        Width = 258
        Height = 25
        Align = alBottom
        Caption = 'MODELO Y VERSION'
        TabOrder = 5
        OnClick = ConsModversClick
        ExplicitWidth = 222
      end
      object ConsError: TButton
        Left = 2
        Top = 87
        Width = 258
        Height = 25
        Align = alBottom
        Caption = 'ULTIMO ERROR'
        TabOrder = 6
        OnClick = ConsErrorClick
        ExplicitWidth = 222
      end
      object Subtot: TButton
        Left = 2
        Top = 37
        Width = 258
        Height = 25
        Align = alBottom
        Caption = 'SUBTOTAL'
        TabOrder = 7
        OnClick = SubtotClick
        ExplicitWidth = 222
      end
      object FechaHora: TButton
        Left = 2
        Top = 12
        Width = 258
        Height = 25
        Align = alBottom
        Caption = 'FECHA Y HORA'
        TabOrder = 8
        OnClick = FechaHoraClick
        ExplicitWidth = 222
      end
      object ConsEstado: TButton
        Left = 2
        Top = 62
        Width = 258
        Height = 25
        Align = alBottom
        Caption = 'ESTADO GENERAL'
        TabOrder = 9
        OnClick = ConsEstadoClick
        ExplicitWidth = 222
      end
      object ConsDocAsoc: TButton
        Left = 2
        Top = 112
        Width = 258
        Height = 25
        Align = alBottom
        Caption = 'DOCUMENTOS ASOCIADOS'
        TabOrder = 10
        OnClick = ConsDocAsocClick
        ExplicitWidth = 222
      end
      object ConsCorreo: TButton
        Left = 2
        Top = 162
        Width = 258
        Height = 25
        Align = alBottom
        Caption = 'CONFIGURACION SERV. CORREO ELECTR.'
        TabOrder = 11
        OnClick = ConsCorreoClick
        ExplicitWidth = 222
      end
      object ConsZetas: TButton
        Left = 2
        Top = 212
        Width = 258
        Height = 25
        Align = alBottom
        Caption = 'CAPACIDAD ZETAS'
        TabOrder = 12
        OnClick = ConsZetasClick
        ExplicitWidth = 222
      end
      object Capac: TButton
        Left = 2
        Top = 262
        Width = 258
        Height = 25
        Align = alBottom
        Caption = 'CAPACIDADES IMPRESORA FISCAL'
        TabOrder = 13
        OnClick = CapacClick
        ExplicitWidth = 222
      end
      object DatosIni: TButton
        Left = 2
        Top = 312
        Width = 258
        Height = 25
        Align = alBottom
        Caption = 'DATOS INICIALIZACION'
        TabOrder = 14
        OnClick = DatosIniClick
        ExplicitWidth = 222
      end
      object ConsCfgRed: TButton
        Left = 2
        Top = 362
        Width = 258
        Height = 25
        Align = alBottom
        Caption = 'CONFIGURACION RED'
        TabOrder = 15
        OnClick = ConsCfgRedClick
        ExplicitWidth = 222
      end
    end
    object Protocolos: TGroupBox
      Left = 1
      Top = 590
      Width = 262
      Height = 105
      Align = alTop
      Caption = 'Vinculaci'#243'n'
      TabOrder = 2
      ExplicitLeft = -34
      ExplicitTop = 599
      ExplicitWidth = 235
      object Salir: TButton
        Left = 2
        Top = 78
        Width = 258
        Height = 25
        Align = alBottom
        Caption = 'SALIR DEL PROGRAMA'
        TabOrder = 0
        OnClick = SalirClick
        ExplicitWidth = 231
      end
      object Protocolo: TButton
        Left = 2
        Top = 53
        Width = 258
        Height = 25
        Align = alBottom
        Caption = 'VERIFICAR CONEXION A IMPRESORA FISCAL'
        TabOrder = 1
        OnClick = ProtocoloClick
        ExplicitWidth = 231
      end
      object Cancel: TButton
        Left = 2
        Top = 28
        Width = 258
        Height = 25
        Align = alBottom
        Caption = 'CANCELAR COMPROBANTE'
        TabOrder = 2
        OnClick = CancelClick
        ExplicitWidth = 231
      end
    end
  end
  object CenterPanel: TPanel
    Left = 305
    Top = 35
    Width = 439
    Height = 694
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 268
    ExplicitTop = 0
    ExplicitWidth = 241
    ExplicitHeight = 721
    object DNFH: TGroupBox
      Left = 1
      Top = 1
      Width = 437
      Height = 170
      Align = alTop
      Caption = 'DNFH'
      TabOrder = 0
      ExplicitLeft = 4
      ExplicitTop = 3
      ExplicitWidth = 130
      object Generico: TButton
        Left = 2
        Top = 143
        Width = 433
        Height = 25
        Align = alBottom
        Caption = 'DOCUMENTO GENERICO'
        TabOrder = 0
        OnClick = GenericoClick
        ExplicitWidth = 126
      end
      object PRESUP: TButton
        Left = 2
        Top = 93
        Width = 433
        Height = 25
        Align = alBottom
        Caption = 'PRESUPUESTO '#39'X'#39
        TabOrder = 1
        OnClick = PRESUPClick
        ExplicitWidth = 126
      end
      object DONA: TButton
        Left = 2
        Top = 43
        Width = 433
        Height = 25
        Align = alBottom
        Caption = 'DONACION'
        TabOrder = 2
        OnClick = DONAClick
        ExplicitWidth = 126
      end
      object RBOX: TButton
        Left = 2
        Top = 18
        Width = 433
        Height = 25
        Align = alBottom
        Caption = 'RECIBO '#39'X'#39
        TabOrder = 3
        OnClick = RBOXClick
        ExplicitWidth = 126
      end
      object RTOX: TButton
        Left = 2
        Top = 68
        Width = 433
        Height = 25
        Align = alBottom
        Caption = 'REMITO '#39'X'#39
        TabOrder = 4
        OnClick = RTOXClick
        ExplicitWidth = 126
      end
      object RTOR: TButton
        Left = 2
        Top = 118
        Width = 433
        Height = 25
        Align = alBottom
        Caption = 'REMITO '#39'R'#39
        TabOrder = 5
        OnClick = RTORClick
        ExplicitWidth = 126
      end
    end
    object DF: TGroupBox
      Left = 1
      Top = 171
      Width = 437
      Height = 497
      Align = alTop
      Caption = 'DF (Documentos Fiscales)'
      TabOrder = 1
      ExplicitLeft = 4
      ExplicitTop = 179
      ExplicitWidth = 155
      object Patron: TButton
        Left = 2
        Top = 470
        Width = 433
        Height = 25
        Align = alBottom
        Caption = '--- DOCUMENTO   PATRON ---'
        TabOrder = 0
        OnClick = PatronClick
        ExplicitWidth = 151
      end
      object TiqueNC: TButton
        Left = 2
        Top = 420
        Width = 433
        Height = 25
        Align = alBottom
        Caption = 'TIQUE NC CONS. FINAL'
        TabOrder = 1
        OnClick = TiqueNCClick
        ExplicitWidth = 151
      end
      object Tique: TButton
        Left = 2
        Top = 370
        Width = 433
        Height = 25
        Align = alBottom
        Caption = 'TIQUE CONS. FINAL'
        TabOrder = 2
        OnClick = TiqueClick
        ExplicitWidth = 151
      end
      object TRM: TButton
        Left = 2
        Top = 320
        Width = 433
        Height = 25
        Align = alBottom
        Caption = 'TIQUE RECIBO '#39'M'#39
        TabOrder = 3
        OnClick = TRMClick
        ExplicitWidth = 151
      end
      object TRC: TButton
        Left = 2
        Top = 270
        Width = 433
        Height = 25
        Align = alBottom
        Caption = 'TIQUE RECIBO '#39'C'#39
        TabOrder = 4
        OnClick = TRCClick
        ExplicitWidth = 151
      end
      object TRB: TButton
        Left = 2
        Top = 220
        Width = 433
        Height = 25
        Align = alBottom
        Caption = 'TIQUE RECIBO '#39'B'#39
        TabOrder = 5
        OnClick = TRBClick
        ExplicitWidth = 151
      end
      object TRA: TButton
        Left = 2
        Top = 195
        Width = 433
        Height = 25
        Align = alBottom
        Caption = 'TIQUE RECIBO '#39'A'#39
        TabOrder = 6
        OnClick = TRAClick
        ExplicitWidth = 151
      end
      object TNCM: TButton
        Left = 2
        Top = 145
        Width = 433
        Height = 25
        Align = alBottom
        Caption = 'TIQUE NOTA DE CREDITO '#39'M'#39
        TabOrder = 7
        OnClick = TNCMClick
        ExplicitWidth = 151
      end
      object NCC: TButton
        Left = 2
        Top = 95
        Width = 433
        Height = 25
        Align = alBottom
        Caption = 'TIQUE NOTA DE CREDITO '#39'C'#39
        TabOrder = 8
        OnClick = NCCClick
        ExplicitWidth = 151
      end
      object TNCB: TButton
        Left = 2
        Top = 45
        Width = 433
        Height = 25
        Align = alBottom
        Caption = 'TIQUE NOTA DE CREDITO '#39'B'#39
        TabOrder = 9
        OnClick = TNCBClick
        ExplicitWidth = 151
      end
      object TNCA: TButton
        Left = 2
        Top = 20
        Width = 433
        Height = 25
        Align = alBottom
        Caption = 'TIQUE NOTA DE CREDITO '#39'A'#39
        TabOrder = 10
        OnClick = TNCAClick
        ExplicitWidth = 151
      end
      object TNDM: TButton
        Left = 2
        Top = 70
        Width = 433
        Height = 25
        Align = alBottom
        Caption = 'TIQUE NOTA DE DEBITO '#39'M'#39
        TabOrder = 11
        OnClick = TNDMClick
        ExplicitWidth = 151
      end
      object TNDC: TButton
        Left = 2
        Top = 120
        Width = 433
        Height = 25
        Align = alBottom
        Caption = 'TIQUE NOTA DE DEBITO '#39'C'#39
        TabOrder = 12
        OnClick = TNDCClick
        ExplicitWidth = 151
      end
      object TNDB: TButton
        Left = 2
        Top = 170
        Width = 433
        Height = 25
        Align = alBottom
        Caption = 'TIQUE NOTA DE DEBITO '#39'B'#39
        TabOrder = 13
        OnClick = TNDBClick
        ExplicitWidth = 151
      end
      object TNDA: TButton
        Left = 2
        Top = 245
        Width = 433
        Height = 25
        Align = alBottom
        Caption = 'TIQUE NOTA DE DEBITO '#39'A'#39
        TabOrder = 14
        OnClick = TNDAClick
        ExplicitWidth = 151
      end
      object TFM: TButton
        Left = 2
        Top = 295
        Width = 433
        Height = 25
        Align = alBottom
        Caption = 'TIQUE FACTURA '#39'M'#39
        TabOrder = 15
        OnClick = TFMClick
        ExplicitWidth = 151
      end
      object TFC: TButton
        Left = 2
        Top = 345
        Width = 433
        Height = 25
        Align = alBottom
        Caption = 'TIQUE FACTURA '#39'C'#39
        TabOrder = 16
        OnClick = TFCClick
        ExplicitWidth = 151
      end
      object TFB: TButton
        Left = 2
        Top = 395
        Width = 433
        Height = 25
        Align = alBottom
        Caption = 'TIQUE FACTURA '#39'B'#39
        TabOrder = 17
        OnClick = TFBClick
        ExplicitWidth = 151
      end
      object TFA: TButton
        Left = 2
        Top = 445
        Width = 433
        Height = 25
        Align = alBottom
        Caption = 'TIQUE FACTURA '#39'A'#39
        TabOrder = 18
        OnClick = TFAClick
        ExplicitWidth = 151
      end
    end
  end
end
