unit HasarUnit;

interface

uses
  System.SysUtils, System.Classes,HasarArgentina_TLB, System.TypInfo, Winapi.Windows;

type
  Tdm = class(TDataModule)

  private
    { Private declarations }
  public
    { Public declarations }
     procedure CommandAbrirCaj_Click;
procedure CommandAudit_Click;
procedure CommandAvanzPap_Click;
procedure CommandBorrarLogo_Click;
procedure CommandCancel_Click;
procedure CommandCapac_Click;
procedure CommandCargaLogo_Click;
procedure CommandCfgBaudios_Click;
procedure CommandCfgFyh_Click;
procedure CommandCfgImprFis_Click;
procedure CommandCfgRed_Click;
procedure CommandCfgServCorreo_Click;
procedure CommandCfgZBorr_Click;
procedure CommandCFgZona_Click;
procedure CommandCierreZ_Click;
procedure CommandConsAcumComprob_Click;
procedure CommandConsAcumMemoria_Click;
procedure CommandConsCfgRed_Click;
procedure CommandConsCierreZ_Click;
procedure CommandConsCorreo_Click;
procedure CommandConsDocAsoc_Click;
procedure CommandConsError_Click;
procedure CommandConsEstado_Click;
procedure CommandConsModvers_Click;
procedure CommandConsZetas_Click;
procedure CommandConsZona_Click;
procedure CommandCopiarDoc_Click;
procedure CommandDatosIni_Click;
procedure CommandDocxMail_Click;
procedure CommandDONA_Click;
procedure CommandEquis_Click;
procedure CommandFechaHora_Click;
procedure CommandGenerico_Click;
procedure CommandModifCateg_Click;
procedure CommandModifIIBB_Click;
procedure CommandModifIniActiv_Click;
procedure CommandObtRepAudit_Click;
procedure CommandObtRepDoc_Click;
procedure CommandObtRepElectr_Click;
procedure CommandObtRepLog_Click;
procedure CommandObtStFiscal_Click;
procedure CommandObtStImpr_Click;
procedure CommandPatron_Click;
procedure CommandPRESUP_Click;
procedure CommandProtocolo_Click;
procedure CommandRangoZ_Click;
procedure CommandRBOX_Click;
procedure CommandReimpr_Click;
procedure CommandRTOR_Click;
procedure CommandRTOX_Click;
procedure CommandSalir_Click;
procedure CommandSubtot_Click;
procedure CommandTFA_Click;
procedure CommandTFB_Click;
procedure CommandTFC_Click;
procedure CommandTFM_Click;
procedure CommandTique_Click;
procedure CommandTiqueNC_Click;
procedure CommandTNCA_Click;
procedure CommandTNCB_Click;
procedure CommandTNCC_Click;
procedure CommandTNCM_Click;
procedure CommandTNDA_Click;
procedure CommandTNDB_Click;
procedure CommandTNDC_Click;
procedure CommandTNDM_Click;
procedure CommandTRA_Click;
procedure CommandTRB_Click;
procedure CommandTRC_Click;
procedure CommandTRM_Click;
procedure CommandZBorr_Click;

//procedure Form_Load;
//procedure HASARNG_ComandoEnProceso;
//procedure HASARNG_ComandoProcesado;
// HASARNG_EventoImpresora(Estado: EstadoImpresora);
  end;

var
  dm: Tdm;
  HASARNG: TImpresoraFiscalRG3561;
  wideChars   : array[0..11] of WideChar;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

// ====================================================================================================================
// Comando de apertura del cajón de dinero.
// ====================================================================================================================

procedure Tdm.CommandAbrirCaj_Click;
begin

  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('ABRIENDO CAJON DE DINERO...' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    HASARNG.AbrirCajonDinero;
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('CAJON DE DINERO ABIERTO !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Impresión de un informe de aditoría por fechas.
// ====================================================================================================================

procedure Tdm.CommandAudit_Click;
begin

  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('IMPRIMIENDO REPORTE DE AUDITORIA POR FECHAS...' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    HASARNG.ReportarZetasPorFecha(StrToDate('23/02/2015'),
      StrToDate('25/02/2015'), ReporteAuditoriaGlobal);

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('REPORTE IMPRESO !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do

      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Comandos de avance de papel.
// ====================================================================================================================

procedure Tdm.CommandAvanzPap_Click;
begin

  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('AVANZANDO PAPEL...' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    HASARNG.AvanzarPapelAmbasEstaciones(3);
    OutputDebugString(StringToWideChar('3 líneas en tique/rollo testigo.' , wideChars, 12));

    HASARNG.AvanzarPapelEstacionAuditoria(3);
    OutputDebugString(StringToWideChar('3 líneas en rollo testigo, solamente.' , wideChars, 12));

    HASARNG.AvanzarPapelEstacionTique(3);
    OutputDebugString(StringToWideChar('3 líneas en tique, solamente.', wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('FIN DE AVANCE DE PAPEL...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do

      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Se elimina el logo del emisor de la memoria de trabajo de la impresora fiscal.
// ====================================================================================================================

procedure Tdm.CommandBorrarLogo_Click;
begin

  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('ELIMINANDO LOGO DEL EMISOR...' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    HASARNG.EliminarLogoEmisor;

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('LOGO ELIMINADO !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Se cancela el comprobante en curso de emisión.
// ====================================================================================================================

procedure Tdm.CommandCancel_Click;
begin

  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('CANCELANDO COMPROBANTE ABIERTO...' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    HASARNG.Cancelar;

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('CANCELADO !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Consulta de capacidades de la impresora fiscal
// ====================================================================================================================

procedure Tdm.CommandCapac_Click;

var
  respcapac: RespuestaConsultarCapacidadesImpresoraFiscal;

begin
  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('CONSULTANDO CAPACIDADES DE LA IMPRESORA FISCAL...' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    respcapac := HASARNG.ConsultarCapacidadesImpresoraFiscal(AltoLogo,
      EstacionTicket, TiqueFacturaA);
    OutputDebugString(StringToWideChar('Alto logotipo := [' + (respcapac.Valor) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    respcapac := HASARNG.ConsultarCapacidadesImpresoraFiscal(AnchoLogo,
      EstacionTicket, TiqueFacturaA);

    OutputDebugString(StringToWideChar('Ancho logotipo            := [' + (respcapac.Valor) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    respcapac := HASARNG.ConsultarCapacidadesImpresoraFiscal(AnchoRazonSocial,
      EstacionTicket, TiqueFacturaA);

    OutputDebugString(StringToWideChar('Ancho razón social        := [' + (respcapac.Valor) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    respcapac := HASARNG.ConsultarCapacidadesImpresoraFiscal(AnchoTextoFiscal,
      EstacionTicket, TiqueFacturaA);

    OutputDebugString(StringToWideChar('Ancho texto fiscal        := [' + (respcapac.Valor) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    respcapac := HASARNG.ConsultarCapacidadesImpresoraFiscal
      (AnchoTextoLineasUsuario, EstacionTicket, TiqueFacturaA);

    OutputDebugString(StringToWideChar('Ancho líneas usuario      := [' + (respcapac.Valor) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    respcapac := HASARNG.ConsultarCapacidadesImpresoraFiscal(AnchoTextoNoFiscal,
      EstacionTicket, TiqueFacturaA);

    OutputDebugString(StringToWideChar('Ancho texto no fiscal     := [' + (respcapac.Valor) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    respcapac := HASARNG.ConsultarCapacidadesImpresoraFiscal(AnchoTextoVenta,
      EstacionTicket, TiqueFacturaA);

    OutputDebugString(StringToWideChar('Ancho texto venta         := [' + (respcapac.Valor) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    respcapac := HASARNG.ConsultarCapacidadesImpresoraFiscal
      (AnchoTotalImpresion, EstacionTicket, TiqueFacturaA);

    OutputDebugString(StringToWideChar('Ancho total impresión     := [' + (respcapac.Valor) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    respcapac := HASARNG.ConsultarCapacidadesImpresoraFiscal(SoportaCajon,
      EstacionPorDefecto, NoDocumento);

    OutputDebugString(StringToWideChar('Soporta cajón dinero      := [' + (respcapac.Valor) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    respcapac := HASARNG.ConsultarCapacidadesImpresoraFiscal(SoportaEstacion,
      EstacionTicket, TiqueFacturaA);

    OutputDebugString(StringToWideChar('Soporta estación tique    := [' + (respcapac.Valor) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    respcapac := HASARNG.ConsultarCapacidadesImpresoraFiscal(SoportaComprobante,
      EstacionTicket, TiqueFacturaA);

    OutputDebugString(StringToWideChar('Soporta tique factura " A " := [' + (respcapac.Valor) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('FIN DE LA CONSULTA !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Cargar imagen de logotipo del emisor en la memoria de trabajo de la impresora fiscal.
// ====================================================================================================================

procedure Tdm.CommandCargaLogo_Click;
begin
  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('CARGANDO LOGO EMISOR...' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    HASARNG.CargarLogoEmisor(ComienzoCargaLogo,
      '424D9E180000000000003E00000028000000DC010000680000000100010000000000601800000000000000000000000000000000000000000000FFFFFF00FFFF');

    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFF00003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFF0000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFF800000007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFF800000007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFF0FFFFFFC000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFF0FFFFFF00000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFF0FFFFFE00000000001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FE00000000001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFF8000000');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      '000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFF0000000000001FF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFC0000000000000FFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFF800000000000007FFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFF800000000000007FFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFF000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFC000000000000001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFF8000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFF8000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFF00000000000003C07FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFF00000000000007F07FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFF0FFE0000000000000FF81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFF0FFE0000000000000FF81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFF0FFC0000000000003FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFF0FFC0000000000007FE07FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FF80');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      '000000000087FC7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FF8000018000');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      '000FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FF8000018000000FFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      '7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FF0000780000001FFFFE1FFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FF0003000000003FFFFE1FFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FE0000007FFFFFFFFFFE0FFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FE0000007FFFFFFFFFFE0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FE004007FFFFFFFFFFFE0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FE007CFFFFFFFFFFFFF80FFFFFFCFFFF9FBFFFFC7FFC0FFFFDFFFF80FFFFF873FFFC');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      '7FFF1FFFEFFFE00FFFFE00FFE1FE7FC1FEFFFFC07FFFFFFFFFF0FE003FFFFFFFFFFFFFF80FFFFFFCFFFF9FBFFFFC7FFC0FFFFDFFFF80FFFFF873FFFC7FFF1FFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'EFFFE00FFFFE00FFE1FE7FC1FEFFFFC07FFFFFFFFFF0FC003FFFFFFFFFFFFFF807FFFFFCFFFF3FBFFFFCFF80007FFDFFFF0EFFFFF8F3FFF87FFF1FFFEFFE0001');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFE0001FE1FE7FC0FEFFF80007FFFFFFFFF0FC003FFFFFFFFFFFFFF807FFFFFCFFFF3FBFFFFCFF80007FFDFFFF0EFFFFF8F3FFF87FFF1FFFEFFE0001FFE0001F');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'E1FE7FC0FEFFF80007FFFFFFFFF0FC003FFFFFFFFFFF003007FFFFFCFFFF3FBFFFF0FE0FFE1FFDFFFC7E3FFFE0F3FFF87FFF1FFFEFF81FF87F83FF0FE1FE7F80');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FEFFE07FF1FFFFFFFFF0FC000FFFFFFFFFF8000007FFFFFCFFFF3FBFFFF0FE0FFE1FFDFFFC7E3FFFE0F3FFF87FFF1FFFEFF81FF87F83FF0FE1FE7F80FEFFE07F');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'F1FFFFFFFFF0FC000FFFFFFFFFFF000007FFFFFCFFF07FBFFFE3FE7FFF9FFDFFF0FE3FFFE7F3FFE07FFF1FFFEFF8FFFE3F1FFFCFE1FE7F8EFEFFE7FFF9FFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFF0FC000FFFFFFFFFFF000007FFFFFCFFF07FBFFFE3FE7FFF9FFDFFF0FE3FFFE7F3FFE07FFF1FFFEFF8FFFE3F1FFFCFE1FE7F8EFEFFE7FFF9FFFFFFFFF0FC00');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      '07FFFFFFFFFFF00007FFFFFCFFE0FFBFFFEFFCFFFFC7FDFFF0FF07FFC7F3FF047FFF1FFFEFF1FFFE3F1FFFEFE1FE7FBE7EFFCFFFFC3FFFFFFFF0FC0000FFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFC007FFFFFCFFE0FFBFFFEFFCFFFFC7FDFFF0FF07FFC7F3FF047FFF1FFFEFF1FFFE3F1FFFEFE1FE7FBE7EFFCFFFFC3FFFFFFFF0F800001FFFFFFFFFFFE0');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      '03FFFFFCFFEFFFBFFF8FFDFFFFE7FDFFE3FF000007F3FF1C7FFF1FFFEFF1FFFE3F7FFFEFE1FE7FBE7EFFDFFFFE3FFFFFFFF0F800001FFFFFFFFFFFE003FFFFFC');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFEFFFBFFF8FFDFFFFE7FDFFE3FF000007F3FF1C7FFF1FFFEFF1FFFE3F7FFFEFE1FE7FBE7EFFDFFFFE3FFFFFFFF0F8000001FFFFFFFFFFF003FFFFFCFFCFFFBF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FC1FF1FFFFE0FC3F0FFFC0001FF3FE1C7FFF1FFFEFFFFFFE3FFFFFCFE1FE7E3F7EFF9FFFFE0FFFFFFFF0F80000001FFFFFFFFFF003FFFFFCFFCFFFBFFC1FF1FF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFE0FC3F0FFFC0001FF3FE1C7FFF1FFFEFFFFFFE3FFFFFCFE1FE7E3F7EFF9FFFFE0FFFFFFFF0F800000007FFFFFFFFF063FFFFFC7E1FFF87F07FF1FFFFE0FC0F');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      '1FFFC3FF9FF3F8FC7FFF1FFFEFFFFFF07FFFFF0FE1FE7E7F7EFF9FFFFE0FFFFFFFF0FC00000003FFFFFFFFF067FFFFFC7E1FFF87F07FF1FFFFE0FC0F1FFFC3FF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      '9FF3F8FC7FFF1FFFEFFFFFF07FFFFF0FE1FE7E7F7EFF9FFFFE0FFFFFFFF0FC00000003FFFFFFFFF067FFFFFC0C3FFF80000FF1FFFFE0FC041FFFC3FFBFF3F8FC');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      '7FFF1FFFEFFFFC01FFFF003FE1FE7E7F3EFF9FFFFE0FFFFFFFF0FC00000001FFFFFFFFF867FFFFFC0C3FFF80000FF1FFFFE0FC041FFFC3FFBFF3F8FC7FFF1FFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'EFFFFC01FFFF003FE1FE7E7F3EFF9FFFFE0FFFFFFFF0FC00000000FFFFFFF00007FFFFFC0C3FFF80000FF1FFFFE0FC041FFFC3FFBFF3F8FC7FFF1FFFEFFFFC01');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFF003FE1FE7E7F3EFF9FFFFE0FFFFFFFF0FC000000007FFFFFFC0007FFFFFC803FFF87FF83F1FFFFE0FDF0FFFFF8FE3FF3F1FC7FFF1FFFEFFF000FFFE007FF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'E1FE787F3EFF9FFFFE0FFFFFFFF0FC000000007FFFFFFC0007FFFFFC803FFF87FF83F1FFFFE0FDF0FFFFF8FE3FF3F1FC7FFF1FFFEFFF000FFFE007FFE1FE787F');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      '3EFF9FFFFE0FFFFFFFF0FC000000001FFFFFFF0007FFFFFCF1FFFFBFFFE3F1FFFFE0FDF8FFFFF8FE7FF3F7FC7FFF1FFFEFF81FFFFF81FFFFE1FE787FBEFF9FFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FE0FFFFFFFF0FC0000000007FFFFFF8007FFFFFCF1FFFFBFFFE3F1FFFFE0FDF8FFFFF8FE7FF3F7FC7FFF1FFFEFF81FFFFF81FFFFE1FE787FBEFF9FFFFE0FFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFF0FC0000000003FFFFFFC007FFFFFCFC3FFFBFFFF0FDFFFFE7FDFC1FFFFCF07FF3C7FC7FFF1FFFEFF8FFFFFF1FFFFFE1FE79FFBEFFDFFFFE3FFFFFFFF0FC00');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      '00000003FFFFFFC007FFFFFCFC3FFFBFFFF0FDFFFFE7FDFC1FFFFCF07FF3C7FC7FFF1FFFEFF8FFFFFF1FFFFFE1FE79FFBEFFDFFFFE3FFFFFFFF0FE0000000001');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFF00FFFFFFCFE1FFFBFFFF0FCFFFFC7FDFC0FFFFC707FF38FFC7FFF1FFFEFF9FFFFFF1FFFFFE1FE71FF82FFCFFFFC3FFFFFFFF0FE0000000000FFFFFFF8');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      '0FFFFFFCFE1FFFBFFFF0FCFFFFC7FDFC0FFFFC707FF38FFC7FFF1FFFEFF9FFFFFF1FFFFFE1FE71FF82FFCFFFFC3FFFFFFFF0FE00000000003FFFFFFF0FFFFFFC');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFCFFFBFFFF0FCFFFFC7FDFF03FFFC71FFF00FFC7FFF1FFFEFF9FFF87F1FFFCFE1FE71FFC0FFCFFFFC3FFFFFFFF0FF00000000001FFFFFFF9FFFFFFCFFCFFFBF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFF0FCFFFFC7FDFF03FFFC71FFF00FFC7FFF1FFFEFF9FFF87F1FFFCFE1FE71FFC0FFCFFFFC3FFFFFFFF0FF00000000001FFFFFFF9FFFFFFCFFE0FFBFFFE3FE7F');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FF9FFDFFE0FFFF61FFF03FFC7FFF1FFFEFF8FFF87F9FFF1FE1FE07FFC0FFE7FFF9FFFFFFFFF0FF00000000000FFFFFFFFFFFFFFCFFE0FFBFFFE3FE7FFF9FFDFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'E0FFFF61FFF03FFC7FFF1FFFEFF8FFF87F9FFF1FE1FE07FFC0FFE7FFF9FFFFFFFFF0FF800000000007FFFFFFFFFFFFFCFFF07F800003FF03F03FFDFFF07FFF0F');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFF07FFC7E00000FEFFE0781FF81F81FE1FE07FFC0FFF03F83FFFFFFFFF0FF800000000003FFFFFFFFFFFFFCFFF07F800003FF03F03FFDFFF07FFF0FFFF07FFC');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      '7E00000FEFFE0781FF81F81FE1FE07FFC0FFF03F83FFFFFFFFF0FF800000000003FFFFFFFFFFFFFCFFFF3F80001FFF80007FFDFFFC7FFF8FFFF07FFC7E00000F');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'EFFF0007FFE000FFE1FE07FFC0FFF80007FFFFFFFFF0FF800000000000FFFFDFFFFFFFFCFFFF3F80001FFF80007FFDFFFC7FFF8FFFF07FFC7E00000FEFFF0007');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFE000FFE1FE07FFC0FFF80007FFFFFFFFF0FFC000000000007FFFE1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFF0FFE000000000001FFFF1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFF0FFE000000000000FFFF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFF0FFE000000000000FFFF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFF0FFF0000000000007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFF8');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      '000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFC00000000');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      '0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF07FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFC000000000000FFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF07FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFC0000000000007FFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFF0000000000003FFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFF8000000000001FFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFF8000000000001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFF8000000000303FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFC000000000801FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFF01000000603EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFF01000000603EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFF80100007007F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFF0FFFFFFE001FFE003FF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFF0FFFFFFFE0000001FFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFF0FFFFFFFE0000001FFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFE00000FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFF00');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      '3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
    HASARNG.CargarLogoEmisor(CargaLogoEnCurso,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');

    HASARNG.CargarLogoEmisor(FinCargaLogo,
      'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0');

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('LOGO DEL EMISOR CARGADO !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Configurar velocidad de transferencia de información (baudios); del puerto serie RS-232.
// ====================================================================================================================

procedure Tdm.CommandCfgBaudios_Click;
begin
  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('CONFIGURANDO BAUDIOS RS-232...' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    HASARNG.CambiarVelocidadPuerto(Baudrate9600);
    OutputDebugString(StringToWideChar('Baudios := 9600', wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('FIN DE LA CONFIGURACION !...' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Configurar fecha y hora en la impresora fiscal.
// ====================================================================================================================

procedure Tdm.CommandCfgFyh_Click;
begin
  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('CONFIGURANDO FECHA Y HORA...' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    HASARNG.ConfigurarFechaHora(StrToDate('06/03/2015'), StrToDate('10:49:45'));

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('FIN DE LA CONFIGURACION !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Configurar parámetros de comportamiento de la impresora fiscal.
// ====================================================================================================================

procedure Tdm.CommandCfgImprFis_Click;

begin
  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('CONFIGURANDO PARAMETROS IMPRESORA FISCAL...' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    OutputDebugString(StringToWideChar('Borrado automático CTD        := P' , wideChars, 12));
    HASARNG.ConfigurarImpresoraFiscal(BorradoAutomaticoAuditoria, 'P' );
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar('Verificar supera monto máximo := N' , wideChars, 12));
    HASARNG.ConfigurarImpresoraFiscal(ChequeoDesborde, 'N');
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar('Corte de papel                := P' , wideChars, 12));
    HASARNG.ConfigurarImpresoraFiscal(CortePapel, 'P');
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar('Imprimir CAMBIO $0.00         := P' , wideChars, 12));
    HASARNG.ConfigurarImpresoraFiscal(ImpresionCambio, 'P');
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar('Imprimir leyendas opcionales  := P' , wideChars, 12));
    HASARNG.ConfigurarImpresoraFiscal(ImpresionLeyendas, 'P');
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar('Texto saldo  pendientes       := Pendiente de pago' , wideChars, 12));
    HASARNG.ConfigurarImpresoraFiscal(PagoSaldo, 'Pendiente de pago');
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar('Aviso sonoro falta papel      := P' , wideChars, 12));
    HASARNG.ConfigurarImpresoraFiscal(SonidoAviso, 'P');
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    // 'Modificar estos parámetros requiere Cierre 'Z' previo.
    // '------------------------------------------------------
    // 'Debug.Print "Monto limite 'B/C'            = 0.00"
    // 'HASARNG.ConfigurarImpresoraFiscal( LimiteBC, "0.00"
    // ' Debug.Print
    //
    // '    Debug.Print "Tipo de habilitación          = A"
    // '    HASARNG.ConfigurarImpresoraFiscal( TipoHabilitacion, "A"
    // 'Debug.Print

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('FIN DE LA CONFIGURACION !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Configurar parámetros de conectividad en red.
// ====================================================================================================================

procedure Tdm.CommandCfgRed_Click;
begin
  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('CONFIGURANDO PARAMETROS CONECTIVIDAD EN RED...' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    OutputDebugString(StringToWideChar('Dirección IP  := 10.0.7.69' , wideChars, 12));
    OutputDebugString(StringToWideChar('Máscara       := 255.255.255.0' , wideChars, 12));
    OutputDebugString(StringToWideChar('Puerta enlace := 10.0.7.69' , wideChars, 12));
    HASARNG.ConfigurarRed('10.0.7.69', '255.255.255.0', '10.0.7.69' );

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('FIN DE LA CONFIGURACION !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Configurar servidor SMHTP para correo electrónico.
// ====================================================================================================================

procedure Tdm.CommandCfgServCorreo_Click;
begin

  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('CONFIGURANDO SERVIDOR SMTP...' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    OutputDebugString(StringToWideChar('IP SMTP     := 200.80.204.3' , wideChars, 12));
    OutputDebugString(StringToWideChar('Puerto      := 465' , wideChars, 12));
    OutputDebugString(StringToWideChar('Responder a := hasarventas@hasar.com', wideChars, 12));
    HASARNG.ConfigurarServidorCorreo('200.80.204.3', 465,
      'hasarventas@hasar.com' );

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('FIN DE LA CONFIGURACION !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Configurar Cierre 'Z' límite para borrado de la CTD.
// ====================================================================================================================

procedure Tdm.CommandCfgZBorr_Click;
begin

  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('CONFIGURANDO LIMITE BORRADO CTD...' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    OutputDebugString(StringToWideChar('Límite, Cierre " Z " Nro. := 1' , wideChars, 12));
    HASARNG.ConfigurarZetaBorrable(1);

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('FIN DE LA CONFIGURACION !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Impresión del Informe Diario de Cierre 'Z'.
// ====================================================================================================================

procedure Tdm.CommandCFgZona_Click;

var
  estilo: AtributosDeTexto;
begin
  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('CONFIGURANDO ZONAS LINEAS DE USUARIO...' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    estilo.Centrado := True;
    HASARNG.ConfigurarZona(1, estilo, 'Texto línea 1 - Fantasía',
      EstacionTicket, ZonaFantasia);
    HASARNG.ConfigurarZona(2, estilo, 'Texto línea 2 - Fantasía',
      EstacionTicket, ZonaFantasia);

    HASARNG.ConfigurarZona(1, estilo, 'Texto línea 1 - Zona 1 Encabezado',
      EstacionTicket, Zona1Encabezado);
    HASARNG.ConfigurarZona(2, estilo, 'Texto línea 2 - Zona 1 Encabezado',
      EstacionTicket, Zona1Encabezado);
    HASARNG.ConfigurarZona(3, estilo, 'Texto línea 3 - Zona 1 Encabezado',
      EstacionTicket, Zona1Encabezado);

    HASARNG.ConfigurarZona(1, estilo, 'Texto línea 1 - Zona 2 Encabezado',
      EstacionTicket, Zona2Encabezado);
    HASARNG.ConfigurarZona(2, estilo, 'Texto línea 2 - Zona 2 Encabezado',
      EstacionTicket, Zona2Encabezado);
    HASARNG.ConfigurarZona(3, estilo, 'Texto línea 3 - Zona 2 Encabezado',
      EstacionTicket, Zona2Encabezado);

    HASARNG.ConfigurarZona(1, estilo, 'Texto línea 1 - Zona 1 Cola',
      EstacionTicket, Zona1Cola);
    HASARNG.ConfigurarZona(2, estilo, 'Texto línea 2 - Zona 1 Cola',
      EstacionTicket, Zona1Cola);
    HASARNG.ConfigurarZona(3, estilo, 'Texto línea 3 - Zona 1 Cola',
      EstacionTicket, Zona1Cola);
    HASARNG.ConfigurarZona(4, estilo, 'Texto línea 4 - Zona 1 Cola',
      EstacionTicket, Zona1Cola);

    HASARNG.ConfigurarZona(1, estilo, 'Texto línea 1 - Zona 2 Cola',
      EstacionTicket, Zona2Cola);
    HASARNG.ConfigurarZona(2, estilo, 'Texto línea 2 - Zona 2 Cola',
      EstacionTicket, Zona2Cola);
    HASARNG.ConfigurarZona(3, estilo, 'Texto línea 3 - Zona 2 Cola',
      EstacionTicket, Zona2Cola);
    HASARNG.ConfigurarZona(4, estilo, 'Texto línea 4 - Zona 2 Cola',
      EstacionTicket, Zona2Cola);
    HASARNG.ConfigurarZona(5, estilo, 'Texto línea 5 - Zona 2 Cola',
      EstacionTicket, Zona2Cola);
    HASARNG.ConfigurarZona(6, estilo, 'Texto línea 6 - Zona 2 Cola',
      EstacionTicket, Zona2Cola);

    HASARNG.ConfigurarZona(1, estilo, 'Texto línea 1 - Domicilio emisor',
      EstacionTicket, ZonaDomicilioEmisor);
    HASARNG.ConfigurarZona(2, estilo, 'Texto línea 2 - Domicilio emisor',
      EstacionTicket, ZonaDomicilioEmisor);
    HASARNG.ConfigurarZona(3, estilo, 'Texto línea 3 - Domicilio emisor',
      EstacionTicket, ZonaDomicilioEmisor);
    HASARNG.ConfigurarZona(4, estilo, 'Texto línea 4 - Domicilio emisor',
      EstacionTicket, ZonaDomicilioEmisor);

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('FIN de la CONFIGURACION....' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Impresión del Informe Diario de Cierre 'Z'.
// ====================================================================================================================

procedure Tdm.CommandCierreZ_Click;

var
  cierre: RespuestaCerrarJornadaFiscal;

begin
  Try
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('IMPRIMIENDO INFORME DIARIO DE CIERRE " Z ":' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    cierre := HASARNG.CerrarJornadaFiscal(ReporteZ);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    // ?OutputDebugString(StringToWideChar('Reporte...           := [' + FloatToStr(cierre.Reporte) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar('Cierre Nro.          := [' + IntToStr(cierre.Z.Numero) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('Fecha cierre         := [' + DateToStr(cierre.Z.Fecha) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar('DF cancelados        := [' +
      IntToStr(cierre.Z.DF_CantidadCancelados) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('DF emitidos          := [' +
      IntToStr(cierre.Z.DF_CantidadEmitidos) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar('DF total ventas      := [' + FloatToStr(cierre.Z.DF_Total) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('DF total gravado     := [' +
      FloatToStr(cierre.Z.DF_TotalGravado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('DF total IVA         := [' +
      FloatToStr(cierre.Z.DF_TotalIVA) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('DF total no gravado  := [' +
      FloatToStr(cierre.Z.DF_TotalNoGravado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('DF total exento      := [' +
      FloatToStr(cierre.Z.DF_TotalExento) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('DF total tributos    := [' +
      FloatToStr(cierre.Z.DF_TotalTributos) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar('DNFH emitidos        := [' +
      IntToStr(cierre.Z.DNFH_CantidadEmitidos) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('DNFH total acumulado := [' +
      FloatToStr(cierre.Z.DNFH_Total) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar('NC canceladas        := [' +
      IntToStr(cierre.Z.NC_CantidadCancelados) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('NC emitidas          := [' +
      IntToStr(cierre.Z.NC_CantidadEmitidos) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('NC total crédito     := [' + FloatToStr(cierre.Z.NC_Total) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('NC total gravado     := [' +
      FloatToStr(cierre.Z.NC_TotalGravado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('NC total IVA         := [' +
      FloatToStr(cierre.Z.NC_TotalIVA) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('NC total no gravado  := [' +
      FloatToStr(cierre.Z.NC_TotalNoGravado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('NC total exento      := [' +
      FloatToStr(cierre.Z.NC_TotalExento) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('NC total tributos    := [' +
      FloatToStr(cierre.Z.NC_TotalTributos) + ']', wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('INFORME DIARIO DE CIERRE " Z "... IMPRESO !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Consulta de acumulados para determnado comprobante.
// ====================================================================================================================

procedure Tdm.CommandConsAcumComprob_Click;

var
  acomprob: RespuestaConsultarAcumuladosComprobante;

  acomprob2: RespuestaContinuarConsultaAcumulados;

begin
  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('CONSULTANDO ACUMULADOS COMPROBANTE:' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    acomprob := HASARNG.ConsultarAcumuladosComprobante(TiqueFacturaA, 13);

    if (acomprob.Registro = (RegistroFinal)) then
    begin
      OutputDebugString(StringToWideChar('NO HAY INFORMACION DISPONIBLE !...' , wideChars, 12));
      OutputDebugString(StringToWideChar('' , wideChars, 12));

    end;

    Case acomprob.Registro of
      HasarArgentina_TLB.RegistroDetalladoDF:
        begin
          OutputDebugString(StringToWideChar('' , wideChars, 12));
          OutputDebugString(StringToWideChar('TIPO REGISTRO:' , wideChars, 12));
          // ?OutputDebugString(StringToWideChar('[' + (acomprob.Registro) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));
          OutputDebugString(StringToWideChar('DF (Documentos Fiscales);:' , wideChars, 12));
          OutputDebugString(StringToWideChar('-------------------------' , wideChars, 12));
          // ?OutputDebugString(StringToWideChar('DF Tipo comprobante        := [' +FromTiposComprobanteToString(acomprob.RegDF.CodigoComprobante) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF Nro. inicial            := [' +
            IntToStr(acomprob.RegDF.NumeroInicial) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF Nro. final              := [' +
            IntToStr(acomprob.RegDF.NumeroFinal) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF cancelados              := [' +
            IntToStr(acomprob.RegDF.CantidadCancelados) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total ventas            := [' +
            FloatToStr(acomprob.RegDF.Total) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total gravado           := [' +
            FloatToStr(acomprob.RegDF.TotalGravado) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total no gravado        := [' +
            FloatToStr(acomprob.RegDF.TotalNoGravado) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total exento            := [' +
            FloatToStr(acomprob.RegDF.TotalExento) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF IVA 1                   := [' +
            FloatToStr(acomprob.RegDF.AlicuotaIVA_1) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto IVA 1             := [' +
            FloatToStr(acomprob.RegDF.MontoIVA_1) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF base imponible 1        := [' +
            FloatToStr(acomprob.RegDF.MontoNetoSinIVA_1) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF IVA 2                   := [' +
            FloatToStr(acomprob.RegDF.AlicuotaIVA_2) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto IVA 2             := [' +
            FloatToStr(acomprob.RegDF.MontoIVA_2) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF base imponible 2        := [' +
            FloatToStr(acomprob.RegDF.MontoNetoSinIVA_2) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF IVA 3                   := [' +
            FloatToStr(acomprob.RegDF.AlicuotaIVA_3) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto IVA 3             := [' +
            FloatToStr(acomprob.RegDF.MontoIVA_3) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF base imponible 3        := [' +
            FloatToStr(acomprob.RegDF.MontoNetoSinIVA_3) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF IVA 4                   := [' +
            FloatToStr(acomprob.RegDF.AlicuotaIVA_4) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto IVA 4             := [' +
            FloatToStr(acomprob.RegDF.MontoIVA_4) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF base imponible 4        := [' +
            FloatToStr(acomprob.RegDF.MontoNetoSinIVA_4) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF IVA 5                   := [' +
            FloatToStr(acomprob.RegDF.AlicuotaIVA_5) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto IVA 5             := [' +
            FloatToStr(acomprob.RegDF.MontoIVA_5) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF base imponible 5        := [' +
            FloatToStr(acomprob.RegDF.MontoNetoSinIVA_5) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF IVA 6                   := [' +
            FloatToStr(acomprob.RegDF.AlicuotaIVA_6) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto IVA 6             := [' +
            FloatToStr(acomprob.RegDF.MontoIVA_6) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF base imponible 6        := [' +
            FloatToStr(acomprob.RegDF.MontoNetoSinIVA_6) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF IVA 7                   := [' +
            FloatToStr(acomprob.RegDF.AlicuotaIVA_7) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto IVA 7             := [' +
            FloatToStr(acomprob.RegDF.MontoIVA_7) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF base imponible 7        := [' +
            FloatToStr(acomprob.RegDF.MontoNetoSinIVA_7) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF IVA 8                   := [' +
            FloatToStr(acomprob.RegDF.AlicuotaIVA_8) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto IVA 8             := [' +
            FloatToStr(acomprob.RegDF.MontoIVA_8) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF base imponible 8        := [' +
            FloatToStr(acomprob.RegDF.MontoNetoSinIVA_8) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF IVA 9                   := [' +
            FloatToStr(acomprob.RegDF.AlicuotaIVA_9) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto IVA 9             := [' +
            FloatToStr(acomprob.RegDF.MontoIVA_9) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF base imponible 9        := [' +
            FloatToStr(acomprob.RegDF.MontoNetoSinIVA_9) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF IVA 10                  := [' +
            FloatToStr(acomprob.RegDF.AlicuotaIVA_10) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto IVA 10            := [' +
            FloatToStr(acomprob.RegDF.MontoIVA_10) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF base imponible 10       := [' +
            FloatToStr(acomprob.RegDF.MontoNetoSinIVA_10) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total IVA               := [' +
            FloatToStr(acomprob.RegDF.TotalIVA) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF tributo 1               := [' +
            FloatToStr(acomprob.RegDF.CodigoTributo1) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto tributo 1         := [' +
            FloatToStr(acomprob.RegDF.ImporteTributo1) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF tributo 2               := [' +
            FloatToStr(acomprob.RegDF.CodigoTributo2) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto tributo 2         := [' +
            FloatToStr(acomprob.RegDF.ImporteTributo2) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF tributo 3               := [' +
            FloatToStr(acomprob.RegDF.CodigoTributo3) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto tributo 3         := [' +
            FloatToStr(acomprob.RegDF.ImporteTributo3) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF tributo 4               := [' +
            FloatToStr(acomprob.RegDF.CodigoTributo4) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto tributo 4         := [' +
            FloatToStr(acomprob.RegDF.ImporteTributo4) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF tributo 5               := [' +
            FloatToStr(acomprob.RegDF.CodigoTributo5) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto tributo 5         := [' +
            FloatToStr(acomprob.RegDF.ImporteTributo5) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF tributo 6               := [' +
            FloatToStr(acomprob.RegDF.CodigoTributo6) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto tributo 6         := [' +
            FloatToStr(acomprob.RegDF.ImporteTributo6) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF tributo 7               := [' +
            FloatToStr(acomprob.RegDF.CodigoTributo7) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto tributo 7         := [' +
            FloatToStr(acomprob.RegDF.ImporteTributo7) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF tributo 8               := [' +
            FloatToStr(acomprob.RegDF.CodigoTributo8) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto tributo 8         := [' +
            FloatToStr(acomprob.RegDF.ImporteTributo8) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF tributo 9               := [' +
            FloatToStr(acomprob.RegDF.CodigoTributo9) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto tributo 9         := [' +
            FloatToStr(acomprob.RegDF.ImporteTributo9) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF tributo 10              := [' +
            FloatToStr(acomprob.RegDF.CodigoTributo10) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto tributo 10        := [' +
            FloatToStr(acomprob.RegDF.ImporteTributo10) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF tributo 11              := [' +
            FloatToStr(acomprob.RegDF.CodigoTributo11) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto tributo 11        := [' +
            FloatToStr(acomprob.RegDF.ImporteTributo11) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total tributos          := [' +
            FloatToStr(acomprob.RegDF.TotalTributos) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));
        end;
      RegistroDetalladoDNFH:
        begin
          OutputDebugString(StringToWideChar('' , wideChars, 12));
          OutputDebugString(StringToWideChar('TIPO REGISTRO:' , wideChars, 12));
          OutputDebugString(StringToWideChar('[' + FloatToStr(acomprob.Registro) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));

          OutputDebugString(StringToWideChar('DNFH (Documentos No Fiscales Homologados);: :=QUE ACUMULAN:=' , wideChars, 12));

          OutputDebugString(StringToWideChar('---------------------------------------------------------' , wideChars, 12));
          OutputDebugString(StringToWideChar('DNFH Tipo Comprob.         := [' +
            { FromTiposComprobanteToString }
            FloatToStr(acomprob.RegDF.CodigoComprobante) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DNFH Nro. inicial          := [' +
            IntToStr(acomprob.RegDNFH.NumeroInicial) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DNFH Nro. Final            := [' +
            IntToStr(acomprob.RegDNFH.NumeroFinal) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DNFH total acumulado       := [' +
            FloatToStr(acomprob.RegDNFH.Total) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));
        end;
      HasarArgentina_TLB.RegistroDetalladoDNFHNoAcum:
        begin
          OutputDebugString(StringToWideChar('' , wideChars, 12));
          OutputDebugString(StringToWideChar('TIPO REGISTRO:' , wideChars, 12));
          OutputDebugString(StringToWideChar('[' + FloatToStr(acomprob.Registro) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));

          OutputDebugString(StringToWideChar('DNFH (Documentos No Fiscales Homologados);: :=QUE NO ACUMULAN:=' , wideChars, 12));

          OutputDebugString(StringToWideChar('------------------------------------------------------------' , wideChars, 12));
          OutputDebugString(StringToWideChar('Tipo Comprobante := [' +
            { FromTiposComprobanteToString }
            FloatToStr(acomprob.RegDF.CodigoComprobante) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('Nº inicial       := [' +
            IntToStr(acomprob.RegDNFH_NoAcum.NumeroInicial) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('Nº final         := [' +
            IntToStr(acomprob.RegDNFH_NoAcum.NumeroFinal) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));
        end;
      HasarArgentina_TLB.RegistroGlobal:
        begin
          OutputDebugString(StringToWideChar('' , wideChars, 12));
          OutputDebugString(StringToWideChar('TIPO REGISTRO:' , wideChars, 12));
          OutputDebugString(StringToWideChar('[' + FloatToStr(acomprob.Registro) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));
          OutputDebugString(StringToWideChar('INFORMACION GLOBAL:' , wideChars, 12));
          OutputDebugString(StringToWideChar('-------------------' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF cant. cancelados := [' +
            IntToStr(acomprob.RegGlobal.DF_CantidadCancelados) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF cant. emitidos   := [' +
            IntToStr(acomprob.RegGlobal.DF_CantidadEmitidos) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total ventas     := [' +
            FloatToStr(acomprob.RegGlobal.DF_Total) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total gravado    := [' +
            FloatToStr(acomprob.RegGlobal.DF_TotalGravado) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total IVA        := [' +
            FloatToStr(acomprob.RegGlobal.DF_TotalIVA) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total tributos   := [' +
            FloatToStr(acomprob.RegGlobal.DF_TotalTributos) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total no gravado := [' +
            FloatToStr(acomprob.RegGlobal.DF_TotalNoGravado) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total exento     := [' +
            FloatToStr(acomprob.RegGlobal.DF_TotalExento) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total DNFH       := [' +
            FloatToStr(acomprob.RegGlobal.DNFH_Total) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));
        end;
    end;

    acomprob2 := HASARNG.ContinuarConsultaAcumulados;

    while (acomprob2.Registro <> HasarArgentina_TLB.RegistroFinal) do
    begin

      Case acomprob2.Registro of
        HasarArgentina_TLB.RegistroDetalladoDF:
          begin
            OutputDebugString(StringToWideChar('' , wideChars, 12));
            OutputDebugString(StringToWideChar('TIPO REGISTRO:' , wideChars, 12));
            OutputDebugString(StringToWideChar('[' + FloatToStr(acomprob2.Registro) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));
            OutputDebugString(StringToWideChar('DF (Documentos Fiscales);:' , wideChars, 12));
            OutputDebugString(StringToWideChar('-------------------------' , wideChars, 12));
            OutputDebugString(StringToWideChar('DF Tipo comprobante        := [' +
              { FromTiposComprobanteToString }
              FloatToStr(acomprob2.RegDF.CodigoComprobante) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF Nro. inicial            := [' +
              IntToStr(acomprob2.RegDF.NumeroInicial) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF Nro. final              := [' +
              IntToStr(acomprob2.RegDF.NumeroFinal) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF cancelados              := [' +
              IntToStr(acomprob2.RegDF.CantidadCancelados) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total ventas            := [' +
              FloatToStr(acomprob2.RegDF.Total) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total gravado           := [' +
              FloatToStr(acomprob2.RegDF.TotalGravado) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total no gravado        := [' +
              FloatToStr(acomprob2.RegDF.TotalNoGravado) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total exento            := [' +
              FloatToStr(acomprob2.RegDF.TotalExento) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF IVA 1                   := [' +
              FloatToStr(acomprob2.RegDF.AlicuotaIVA_1) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto IVA 1             := [' +
              FloatToStr(acomprob2.RegDF.MontoIVA_1) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF IVA 2                   := [' +
              FloatToStr(acomprob2.RegDF.AlicuotaIVA_2) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto IVA 2             := [' +
              FloatToStr(acomprob2.RegDF.MontoIVA_2) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF IVA 3                   := [' +
              FloatToStr(acomprob2.RegDF.AlicuotaIVA_3) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto IVA 3             := [' +
              FloatToStr(acomprob2.RegDF.MontoIVA_3) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF IVA 4                   := [' +
              FloatToStr(acomprob2.RegDF.AlicuotaIVA_4) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto IVA 4             := [' +
              FloatToStr(acomprob2.RegDF.MontoIVA_4) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF IVA 5                   := [' +
              FloatToStr(acomprob2.RegDF.AlicuotaIVA_5) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto IVA 5             := [' +
              FloatToStr(acomprob2.RegDF.MontoIVA_5) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF IVA 6                   := [' +
              FloatToStr(acomprob2.RegDF.AlicuotaIVA_6) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto IVA 6             := [' +
              FloatToStr(acomprob2.RegDF.MontoIVA_6) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF IVA 7                   := [' +
              FloatToStr(acomprob2.RegDF.AlicuotaIVA_7) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto IVA 7             := [' +
              FloatToStr(acomprob2.RegDF.MontoIVA_7) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF IVA 8                   := [' +
              FloatToStr(acomprob2.RegDF.AlicuotaIVA_8) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto IVA 8             := [' +
              FloatToStr(acomprob2.RegDF.MontoIVA_8) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF IVA 9                   := [' +
              FloatToStr(acomprob2.RegDF.AlicuotaIVA_9) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto IVA 9             := [' +
              FloatToStr(acomprob2.RegDF.MontoIVA_9) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF IVA 10                  := [' +
              FloatToStr(acomprob2.RegDF.AlicuotaIVA_10) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto IVA 10            := [' +
              FloatToStr(acomprob2.RegDF.MontoIVA_10) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total IVA               := [' +
              FloatToStr(acomprob2.RegDF.TotalIVA) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF tributo 1               := [' +
              FloatToStr(acomprob2.RegDF.CodigoTributo1) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto tributo 1         := [' +
              FloatToStr(acomprob2.RegDF.ImporteTributo1) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF tributo 2               := [' +
              FloatToStr(acomprob2.RegDF.CodigoTributo2) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto tributo 2         := [' +
              FloatToStr(acomprob2.RegDF.ImporteTributo2) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF tributo 3               := [' +
              FloatToStr(acomprob2.RegDF.CodigoTributo3) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto tributo 3         := [' +
              FloatToStr(acomprob2.RegDF.ImporteTributo3) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF tributo 4               := [' +
              FloatToStr(acomprob2.RegDF.CodigoTributo4) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto tributo 4         := [' +
              FloatToStr(acomprob2.RegDF.ImporteTributo4) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF tributo 5               := [' +
              FloatToStr(acomprob2.RegDF.CodigoTributo5) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto tributo 5         := [' +
              FloatToStr(acomprob2.RegDF.ImporteTributo5) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF tributo 6               := [' +
              FloatToStr(acomprob2.RegDF.CodigoTributo6) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto tributo 6         := [' +
              FloatToStr(acomprob2.RegDF.ImporteTributo6) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF tributo 7               := [' +
              FloatToStr(acomprob2.RegDF.CodigoTributo7) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto tributo 7         := [' +
              FloatToStr(acomprob2.RegDF.ImporteTributo7) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF tributo 8               := [' +
              FloatToStr(acomprob2.RegDF.CodigoTributo8) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto tributo 8         := [' +
              FloatToStr(acomprob2.RegDF.ImporteTributo8) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF tributo 9               := [' +
              FloatToStr(acomprob2.RegDF.CodigoTributo9) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto tributo 9         := [' +
              FloatToStr(acomprob2.RegDF.ImporteTributo9) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF tributo 10              := [' +
              FloatToStr(acomprob2.RegDF.CodigoTributo10) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto tributo 10        := [' +
              FloatToStr(acomprob2.RegDF.ImporteTributo10) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF tributo 11              := [' +
              FloatToStr(acomprob2.RegDF.CodigoTributo11) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto tributo 11        := [' +
              FloatToStr(acomprob2.RegDF.ImporteTributo11) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total tributos          := [' +
              FloatToStr(acomprob2.RegDF.TotalTributos) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));
          end;
        HasarArgentina_TLB.RegistroDetalladoDNFH:
          begin
            OutputDebugString(StringToWideChar('' , wideChars, 12));
            OutputDebugString(StringToWideChar('TIPO REGISTRO:' , wideChars, 12));
            OutputDebugString(StringToWideChar('[' + FloatToStr(acomprob2.Registro) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));

            OutputDebugString(StringToWideChar('DNFH (Documentos No Fiscales Homologados);: :=QUE ACUMULAN:=' , wideChars, 12));

            OutputDebugString(StringToWideChar('---------------------------------------------------------' , wideChars, 12));
            OutputDebugString(StringToWideChar('DNFH Tipo Comprob.         := [' +
              { FromTiposComprobanteToString }
              FloatToStr(acomprob2.RegDF.CodigoComprobante) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DNFH Nro. inicial          := [' +
              FloatToStr(acomprob2.RegDNFH.NumeroInicial) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DNFH Nro. Final            := [' +
              FloatToStr(acomprob2.RegDNFH.NumeroFinal) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DNFH total acumulado       := [' +
              FloatToStr(acomprob2.RegDNFH.Total) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));
          end;
        HasarArgentina_TLB.RegistroDetalladoDNFHNoAcum:
          begin
            OutputDebugString(StringToWideChar('' , wideChars, 12));
            OutputDebugString(StringToWideChar('TIPO REGISTRO:' , wideChars, 12));
            OutputDebugString(StringToWideChar('[' + FloatToStr(acomprob2.Registro) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));

            OutputDebugString(StringToWideChar('DNFH (Documentos No Fiscales Homologados);: :=QUE NO ACUMULAN:=' , wideChars, 12));

            OutputDebugString(StringToWideChar('------------------------------------------------------------' , wideChars, 12));
            OutputDebugString(StringToWideChar('Tipo Comprobante := [' +
              { FromTiposComprobanteToString }
              FloatToStr(acomprob2.RegDF.CodigoComprobante) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('Nº inicial       := [' +
              FloatToStr(acomprob2.RegDNFH_NoAcum.NumeroInicial) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('Nº final         := [' +
              FloatToStr(acomprob2.RegDNFH_NoAcum.NumeroFinal) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));
          end;
        HasarArgentina_TLB.RegistroGlobal:
          begin
            OutputDebugString(StringToWideChar('' , wideChars, 12));
            OutputDebugString(StringToWideChar('TIPO REGISTRO:' , wideChars, 12));
            OutputDebugString(StringToWideChar('[' + FloatToStr(acomprob2.Registro) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));
            OutputDebugString(StringToWideChar('INFORMACION GLOBAL:' , wideChars, 12));
            OutputDebugString(StringToWideChar('-------------------' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF cant. cancelados := [' +
              FloatToStr(acomprob2.RegGlobal.DF_CantidadCancelados) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF cant. emitidos   := [' +
              FloatToStr(acomprob2.RegGlobal.DF_CantidadEmitidos) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total ventas     := [' +
              FloatToStr(acomprob2.RegGlobal.DF_Total) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total gravado    := [' +
              FloatToStr(acomprob2.RegGlobal.DF_TotalGravado) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total IVA        := [' +
              FloatToStr(acomprob2.RegGlobal.DF_TotalIVA) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total tributos   := [' +
              FloatToStr(acomprob2.RegGlobal.DF_TotalTributos) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total no gravado := [' +
              FloatToStr(acomprob2.RegGlobal.DF_TotalNoGravado) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total exento     := [' +
              FloatToStr(acomprob2.RegGlobal.DF_TotalExento) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total DNFH       := [' +
              FloatToStr(acomprob2.RegGlobal.DNFH_Total) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));
          end;
      end;

      acomprob2 := HASARNG.ContinuarConsultaAcumulados;
    end;

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('NO HAY MAS INFORMACION DISPONIBLE !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('FIN DE LA CONSULTA...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Consulta de acumulados en la memoria de trabajo de la impresora fiscal.
// ====================================================================================================================

procedure Tdm.CommandConsAcumMemoria_Click;

var
  amem: RespuestaConsultarAcumuladosMemoriaDeTrabajo;

  amem2: RespuestaContinuarConsultaAcumulados;
begin
  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('CONSULTANDO ACUMULADOS MEMORIA DE TRABAJO...' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    amem := HASARNG.ConsultarAcumuladosMemoriaDeTrabajo(NoDocumento);

    If (amem.Registro = HasarArgentina_TLB.RegistroFinal) then
    begin
      OutputDebugString(StringToWideChar('' , wideChars, 12));
      OutputDebugString(StringToWideChar('NO HAY INFORMACION DISPONIBLE !...' , wideChars, 12));
      OutputDebugString(StringToWideChar('' , wideChars, 12));

    end;

    Case amem.Registro of
      HasarArgentina_TLB.RegistroDetalladoDF:
        begin
          OutputDebugString(StringToWideChar('' , wideChars, 12));
          OutputDebugString(StringToWideChar('TIPO REGISTRO:' , wideChars, 12));
          OutputDebugString(StringToWideChar('[' + FloatToStr(amem.Registro) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));
          OutputDebugString(StringToWideChar('DF (Documentos Fiscales);:' , wideChars, 12));
          OutputDebugString(StringToWideChar('-------------------------' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF cancelados              := [' +
            FloatToStr(amem.RegDF.CantidadCancelados) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('DF Tipo comprobante        := [' +
            { FromTiposComprobanteToString }
            FloatToStr(amem.RegDF.CodigoComprobante) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF Nro. inicial            := [' +
            FloatToStr(amem.RegDF.NumeroInicial) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF Nro. final              := [' +
            FloatToStr(amem.RegDF.NumeroFinal) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total ventas            := [' +
            FloatToStr(amem.RegDF.Total) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total gravado           := [' +
            FloatToStr(amem.RegDF.TotalGravado) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total no gravado        := [' +
            FloatToStr(amem.RegDF.TotalNoGravado) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total exento            := [' +
            FloatToStr(amem.RegDF.TotalExento) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF IVA 1                   := [' +
            FloatToStr(amem.RegDF.AlicuotaIVA_1) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto IVA 1             := [' +
            FloatToStr(amem.RegDF.MontoIVA_1) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF IVA 2                   := [' +
            FloatToStr(amem.RegDF.AlicuotaIVA_2) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto IVA 2             := [' +
            FloatToStr(amem.RegDF.MontoIVA_2) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF IVA 3                   := [' +
            FloatToStr(amem.RegDF.AlicuotaIVA_3) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto IVA 3             := [' +
            FloatToStr(amem.RegDF.MontoIVA_3) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF IVA 4                   := [' +
            FloatToStr(amem.RegDF.AlicuotaIVA_4) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto IVA 4             := [' +
            FloatToStr(amem.RegDF.MontoIVA_4) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF IVA 5                   := [' +
            FloatToStr(amem.RegDF.AlicuotaIVA_5) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto IVA 5             := [' +
            FloatToStr(amem.RegDF.MontoIVA_5) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF IVA 6                   := [' +
            FloatToStr(amem.RegDF.AlicuotaIVA_6) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto IVA 6             := [' +
            FloatToStr(amem.RegDF.MontoIVA_6) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF IVA 7                   := [' +
            FloatToStr(amem.RegDF.AlicuotaIVA_7) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto IVA 7             := [' +
            FloatToStr(amem.RegDF.MontoIVA_7) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF IVA 8                   := [' +
            FloatToStr(amem.RegDF.AlicuotaIVA_8) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto IVA 8             := [' +
            FloatToStr(amem.RegDF.MontoIVA_8) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF IVA 9                   := [' +
            FloatToStr(amem.RegDF.AlicuotaIVA_9) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto IVA 9             := [' +
            FloatToStr(amem.RegDF.MontoIVA_9) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF IVA 10                  := [' +
            FloatToStr(amem.RegDF.AlicuotaIVA_10) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto IVA 10            := [' +
            FloatToStr(amem.RegDF.MontoIVA_10) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total IVA               := [' +
            FloatToStr(amem.RegDF.TotalIVA) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF tributo 1               := [' +
            FloatToStr(amem.RegDF.CodigoTributo1) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto tributo 1         := [' +
            FloatToStr(amem.RegDF.ImporteTributo1) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF tributo 2               := [' +
            FloatToStr(amem.RegDF.CodigoTributo2) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto tributo 2         := [' +
            FloatToStr(amem.RegDF.ImporteTributo2) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF tributo 3               := [' +
            FloatToStr(amem.RegDF.CodigoTributo3) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto tributo 3         := [' +
            FloatToStr(amem.RegDF.ImporteTributo3) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF tributo 4               := [' +
            FloatToStr(amem.RegDF.CodigoTributo4) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto tributo 4         := [' +
            FloatToStr(amem.RegDF.ImporteTributo4) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF tributo 5               := [' +
            FloatToStr(amem.RegDF.CodigoTributo5) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto tributo 5         := [' +
            FloatToStr(amem.RegDF.ImporteTributo5) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF tributo 6               := [' +
            FloatToStr(amem.RegDF.CodigoTributo6) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto tributo 6         := [' +
            FloatToStr(amem.RegDF.ImporteTributo6) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF tributo 7               := [' +
            FloatToStr(amem.RegDF.CodigoTributo7) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto tributo 7         := [' +
            FloatToStr(amem.RegDF.ImporteTributo7) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF tributo 8               := [' +
            FloatToStr(amem.RegDF.CodigoTributo8) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto tributo 8         := [' +
            FloatToStr(amem.RegDF.ImporteTributo8) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF tributo 9               := [' +
            FloatToStr(amem.RegDF.CodigoTributo9) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto tributo 9         := [' +
            FloatToStr(amem.RegDF.ImporteTributo9) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF tributo 10              := [' +
            FloatToStr(amem.RegDF.CodigoTributo10) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto tributo 10        := [' +
            FloatToStr(amem.RegDF.ImporteTributo10) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF tributo 11              := [' +
            FloatToStr(amem.RegDF.CodigoTributo11) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto tributo 11        := [' +
            FloatToStr(amem.RegDF.ImporteTributo11) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total tributos          := [' +
            FloatToStr(amem.RegDF.TotalTributos) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));
        end;
      HasarArgentina_TLB.RegistroDetalladoDNFH:
        begin
          OutputDebugString(StringToWideChar('' , wideChars, 12));
          OutputDebugString(StringToWideChar('TIPO REGISTRO:' , wideChars, 12));
          OutputDebugString(StringToWideChar('[' + FloatToStr(amem.Registro) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));

          OutputDebugString(StringToWideChar('DNFH (Documentos No Fiscales Homologados);: :=QUE ACUMULAN:=' , wideChars, 12));

          OutputDebugString(StringToWideChar('---------------------------------------------------------' , wideChars, 12));
          OutputDebugString(StringToWideChar('DNFH Tipo Comprob.         := [' +
            { FromTiposComprobanteToString }
            FloatToStr(amem.RegDNFH.CodigoComprobante) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DNFH Nro. inicial          := [' +
            FloatToStr(amem.RegDNFH.NumeroInicial) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DNFH Nro. Final            := [' +
            FloatToStr(amem.RegDNFH.NumeroFinal) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DNFH total acumulado       := [' +
            FloatToStr(amem.RegDNFH.Total) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('' , wideChars, 12));
        end;
      HasarArgentina_TLB.RegistroDetalladoDNFHNoAcum:
        begin
          OutputDebugString(StringToWideChar('' , wideChars, 12));
          OutputDebugString(StringToWideChar('TIPO REGISTRO:' , wideChars, 12));
          OutputDebugString(StringToWideChar('[' + FloatToStr(amem.Registro) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));

          OutputDebugString(StringToWideChar('DNFH (Documentos No Fiscales Homologados);: :=QUE NO ACUMULAN:=' , wideChars, 12));

          OutputDebugString(StringToWideChar('------------------------------------------------------------' , wideChars, 12));
          OutputDebugString(StringToWideChar('Tipo Comprobante := [' +
            { FromTiposComprobanteToString }
            FloatToStr(amem.RegDNFH_NoAcum.CodigoComprobante) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('Nº inicial       := [' +
            FloatToStr(amem.RegDNFH_NoAcum.NumeroInicial) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('Nº final         := [' +
            FloatToStr(amem.RegDNFH_NoAcum.NumeroFinal) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));
        end;
      HasarArgentina_TLB.RegistroGlobal:
        begin
          OutputDebugString(StringToWideChar('' , wideChars, 12));
          OutputDebugString(StringToWideChar('TIPO REGISTRO:' , wideChars, 12));
          OutputDebugString(StringToWideChar('[' + FloatToStr(amem.Registro) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));
          OutputDebugString(StringToWideChar('INFORMACION GLOBAL:' , wideChars, 12));
          OutputDebugString(StringToWideChar('-------------------' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF cant. cancelados := [' +
            FloatToStr(amem.RegGlobal.DF_CantidadCancelados) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF cant. emitidos   := [' +
            FloatToStr(amem.RegGlobal.DF_CantidadEmitidos) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total ventas     := [' +
            FloatToStr(amem.RegGlobal.DF_Total) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total gravado    := [' +
            FloatToStr(amem.RegGlobal.DF_TotalGravado) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total IVA        := [' +
            FloatToStr(amem.RegGlobal.DF_TotalIVA) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total tributos   := [' +
            FloatToStr(amem.RegGlobal.DF_TotalTributos) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total no gravado := [' +
            FloatToStr(amem.RegGlobal.DF_TotalNoGravado) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total exento     := [' +
            FloatToStr(amem.RegGlobal.DF_TotalExento) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total DNFH       := [' +
            FloatToStr(amem.RegGlobal.DNFH_Total) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('' , wideChars, 12));
        end;
    end;

    amem2 := HASARNG.ContinuarConsultaAcumulados;

    while (amem2.Registro <> HasarArgentina_TLB.RegistroFinal) do
    begin

      Case amem2.Registro of
        HasarArgentina_TLB.RegistroDetalladoDF:
          begin
            OutputDebugString(StringToWideChar('' , wideChars, 12));
            OutputDebugString(StringToWideChar('TIPO REGISTRO:' , wideChars, 12));
            OutputDebugString(StringToWideChar('[' + FloatToStr(amem2.Registro) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));
            OutputDebugString(StringToWideChar('DF (Documentos Fiscales);:' , wideChars, 12));
            OutputDebugString(StringToWideChar('-------------------------' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF cancelados              := [' +
              FloatToStr(amem2.RegDF.CantidadCancelados) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('DF Tipo comprobante        := [' +
              { FromTiposComprobanteToString }
              FloatToStr(amem2.RegDF.CodigoComprobante) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF Nro. inicial            := [' +
              FloatToStr(amem2.RegDF.NumeroInicial) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF Nro. final              := [' +
              FloatToStr(amem2.RegDF.NumeroFinal) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total ventas            := [' +
              FloatToStr(amem2.RegDF.Total) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total gravado           := [' +
              FloatToStr(amem2.RegDF.TotalGravado) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total no gravado        := [' +
              FloatToStr(amem2.RegDF.TotalNoGravado) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total exento            := [' +
              FloatToStr(amem2.RegDF.TotalExento) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF IVA 1                   := [' +
              FloatToStr(amem2.RegDF.AlicuotaIVA_1) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto IVA 1             := [' +
              FloatToStr(amem2.RegDF.MontoIVA_1) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF IVA 2                   := [' +
              FloatToStr(amem2.RegDF.AlicuotaIVA_2) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto IVA 2             := [' +
              FloatToStr(amem2.RegDF.MontoIVA_2) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF IVA 3                   := [' +
              FloatToStr(amem2.RegDF.AlicuotaIVA_3) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto IVA 3             := [' +
              FloatToStr(amem2.RegDF.MontoIVA_3) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF IVA 4                   := [' +
              FloatToStr(amem2.RegDF.AlicuotaIVA_4) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto IVA 4             := [' +
              FloatToStr(amem2.RegDF.MontoIVA_4) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF IVA 5                   := [' +
              FloatToStr(amem2.RegDF.AlicuotaIVA_5) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto IVA 5             := [' +
              FloatToStr(amem2.RegDF.MontoIVA_5) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF IVA 6                   := [' +
              FloatToStr(amem2.RegDF.AlicuotaIVA_6) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto IVA 6             := [' +
              FloatToStr(amem2.RegDF.MontoIVA_6) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF IVA 7                   := [' +
              FloatToStr(amem2.RegDF.AlicuotaIVA_7) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto IVA 7             := [' +
              FloatToStr(amem2.RegDF.MontoIVA_7) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF IVA 8                   := [' +
              FloatToStr(amem2.RegDF.AlicuotaIVA_8) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto IVA 8             := [' +
              FloatToStr(amem2.RegDF.MontoIVA_8) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF IVA 9                   := [' +
              FloatToStr(amem2.RegDF.AlicuotaIVA_9) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto IVA 9             := [' +
              FloatToStr(amem2.RegDF.MontoIVA_9) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF IVA 10                  := [' +
              FloatToStr(amem2.RegDF.AlicuotaIVA_10) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto IVA 10            := [' +
              FloatToStr(amem2.RegDF.MontoIVA_10) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total IVA               := [' +
              FloatToStr(amem2.RegDF.TotalIVA) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF tributo 1               := [' +
              FloatToStr(amem2.RegDF.CodigoTributo1) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto tributo 1         := [' +
              FloatToStr(amem2.RegDF.ImporteTributo1) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF tributo 2               := [' +
              FloatToStr(amem2.RegDF.CodigoTributo2) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto tributo 2         := [' +
              FloatToStr(amem2.RegDF.ImporteTributo2) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF tributo 3               := [' +
              FloatToStr(amem2.RegDF.CodigoTributo3) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto tributo 3         := [' +
              FloatToStr(amem2.RegDF.ImporteTributo3) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF tributo 4               := [' +
              FloatToStr(amem2.RegDF.CodigoTributo4) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto tributo 4         := [' +
              FloatToStr(amem2.RegDF.ImporteTributo4) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF tributo 5               := [' +
              FloatToStr(amem2.RegDF.CodigoTributo5) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto tributo 5         := [' +
              FloatToStr(amem2.RegDF.ImporteTributo5) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF tributo 6               := [' +
              FloatToStr(amem2.RegDF.CodigoTributo6) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto tributo 6         := [' +
              FloatToStr(amem2.RegDF.ImporteTributo6) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF tributo 7               := [' +
              FloatToStr(amem2.RegDF.CodigoTributo7) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto tributo 7         := [' +
              FloatToStr(amem2.RegDF.ImporteTributo7) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF tributo 8               := [' +
              FloatToStr(amem2.RegDF.CodigoTributo8) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto tributo 8         := [' +
              FloatToStr(amem2.RegDF.ImporteTributo8) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF tributo 9               := [' +
              FloatToStr(amem2.RegDF.CodigoTributo9) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto tributo 9         := [' +
              FloatToStr(amem2.RegDF.ImporteTributo9) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF tributo 10              := [' +
              FloatToStr(amem2.RegDF.CodigoTributo10) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto tributo 10        := [' +
              FloatToStr(amem2.RegDF.ImporteTributo10) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF tributo 11              := [' +
              FloatToStr(amem2.RegDF.CodigoTributo11) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto tributo 11        := [' +
              FloatToStr(amem2.RegDF.ImporteTributo11) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total tributos          := [' +
              FloatToStr(amem2.RegDF.TotalTributos) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));
          end;
        HasarArgentina_TLB.RegistroDetalladoDNFH:
          begin
            OutputDebugString(StringToWideChar('' , wideChars, 12));
            OutputDebugString(StringToWideChar('TIPO REGISTRO:' , wideChars, 12));
            OutputDebugString(StringToWideChar('[' + FloatToStr(amem2.Registro) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));

            OutputDebugString(StringToWideChar('DNFH (Documentos No Fiscales Homologados);: :=QUE ACUMULAN:=' , wideChars, 12));

            OutputDebugString(StringToWideChar('---------------------------------------------------------' , wideChars, 12));
            OutputDebugString(StringToWideChar('DNFH Tipo Comprob.         := [' +
              { FromTiposComprobanteToString }
              FloatToStr(amem2.RegDNFH.CodigoComprobante) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DNFH Nro. inicial          := [' +
              FloatToStr(amem2.RegDNFH.NumeroInicial) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DNFH Nro. Final            := [' +
              FloatToStr(amem2.RegDNFH.NumeroFinal) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DNFH total acumulado       := [' +
              FloatToStr(amem2.RegDNFH.Total) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));
          end;
        HasarArgentina_TLB.RegistroDetalladoDNFHNoAcum:
          begin
            OutputDebugString(StringToWideChar('' , wideChars, 12));
            OutputDebugString(StringToWideChar('TIPO REGISTRO:' , wideChars, 12));
            OutputDebugString(StringToWideChar('[' + FloatToStr(amem2.Registro) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));

            OutputDebugString(StringToWideChar('DNFH (Documentos No Fiscales Homologados);: :=QUE NO ACUMULAN:=' , wideChars, 12));

            OutputDebugString(StringToWideChar('------------------------------------------------------------' , wideChars, 12));
            OutputDebugString(StringToWideChar('Tipo Comprobante := [' +
              { FromTiposComprobanteToString }
              FloatToStr(amem2.RegDNFH_NoAcum.CodigoComprobante) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('Nº inicial       := [' +
              FloatToStr(amem2.RegDNFH_NoAcum.NumeroInicial) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('Nº final         := [' +
              FloatToStr(amem2.RegDNFH_NoAcum.NumeroFinal) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));
          end;
        HasarArgentina_TLB.RegistroGlobal:
          begin
            OutputDebugString(StringToWideChar('' , wideChars, 12));
            OutputDebugString(StringToWideChar('TIPO REGISTRO:' , wideChars, 12));
            OutputDebugString(StringToWideChar('[' + FloatToStr(amem2.Registro) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));
            OutputDebugString(StringToWideChar('INFORMACION GLOBAL:' , wideChars, 12));
            OutputDebugString(StringToWideChar('-------------------' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF cant. cancelados := [' +
              FloatToStr(amem2.RegGlobal.DF_CantidadCancelados) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF cant. emitidos   := [' +
              FloatToStr(amem2.RegGlobal.DF_CantidadEmitidos) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total ventas     := [' +
              FloatToStr(amem2.RegGlobal.DF_Total) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total gravado    := [' +
              FloatToStr(amem2.RegGlobal.DF_TotalGravado) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total IVA        := [' +
              FloatToStr(amem2.RegGlobal.DF_TotalIVA) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total tributos   := [' +
              FloatToStr(amem2.RegGlobal.DF_TotalTributos) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total no gravado := [' +
              FloatToStr(amem2.RegGlobal.DF_TotalNoGravado) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total exento     := [' +
              FloatToStr(amem2.RegGlobal.DF_TotalExento) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total DNFH       := [' +
              FloatToStr(amem2.RegGlobal.DNFH_Total) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));
          end;
      end;

      amem2 := HASARNG.ContinuarConsultaAcumulados;
    end;

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('NO HAY MAS INFORMACION DISPONIBLE !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('FIN DE LA CONSULTA !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Consultar configuración de conectividad en red.
// ====================================================================================================================

procedure Tdm.CommandConsCfgRed_Click;

var
  cfgred: RespuestaConsultarConfiguracionRed;

begin
  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('CONSULTANDO CONFIGURACION DE RED...' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    cfgred := HASARNG.ConsultarConfiguracionRed;
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('CONFIGURACION DE RED:' , wideChars, 12));
    OutputDebugString(StringToWideChar('Direcc. IP := [' + (cfgred.DireccionIP) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('Gateway    := [' + (cfgred.Gateway) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('Máscara    := [' + (cfgred.Mascara) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('FIN DE LA CONSULTA !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ==================================================================================================================
// Consulta de acumulados para determinado Cierre Diario 'Z' - Memoria fiscal de la impresora fiscal.
// ==================================================================================================================

procedure Tdm.CommandConsCierreZ_Click;

var
  azeta: RespuestaConsultarAcumuladosCierreZeta;

  azeta2: RespuestaContinuarConsultaAcumulados;

begin
  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('CONSULTANDO ACUMULADOS CIERRE " Z "...' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    //?azeta := FloatToStr(HASARNG.ConsultarAcumuladosCierreZeta(ReporteZNumero, 11));

    if (azeta.Registro = HasarArgentina_TLB.RegistroFinal) then
    begin
      OutputDebugString(StringToWideChar('' , wideChars, 12));
      OutputDebugString(StringToWideChar('NO HAY INFORMACION DISPONIBLE !...' , wideChars, 12));
      OutputDebugString(StringToWideChar('' , wideChars, 12));

    end;

    Case azeta.Registro of
      HasarArgentina_TLB.RegistroDetalladoDF:
        begin
          OutputDebugString(StringToWideChar('' , wideChars, 12));
          OutputDebugString(StringToWideChar('TIPO REGISTRO:' , wideChars, 12));
          OutputDebugString(StringToWideChar('[' + FloatToStr(azeta.Registro) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));
          OutputDebugString(StringToWideChar('DF (Documentos Fiscales);:' , wideChars, 12));
          OutputDebugString(StringToWideChar('-------------------------' , wideChars, 12));
          OutputDebugString(StringToWideChar('DF Tipo comprobante        := [' +
            { FromTiposComprobanteToString }
            FloatToStr(azeta.RegDF.CodigoComprobante) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF Nro. inicial            := [' +
            FloatToStr(azeta.RegDF.NumeroInicial) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF Nro. final              := [' +
            FloatToStr(azeta.RegDF.NumeroFinal) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF cancelados              := [' +
            FloatToStr(azeta.RegDF.CantidadCancelados) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total ventas            := [' +
            FloatToStr(azeta.RegDF.Total) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total gravado           := [' +
            FloatToStr(azeta.RegDF.TotalGravado) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total no gravado        := [' +
            FloatToStr(azeta.RegDF.TotalNoGravado) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total exento            := [' +
            FloatToStr(azeta.RegDF.TotalExento) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF IVA 1                   := [' +
            FloatToStr(azeta.RegDF.AlicuotaIVA_1) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto IVA 1             := [' +
            FloatToStr(azeta.RegDF.MontoIVA_1) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF IVA 2                   := [' +
            FloatToStr(azeta.RegDF.AlicuotaIVA_2) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto IVA 2             := [' +
            FloatToStr(azeta.RegDF.MontoIVA_2) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF IVA 3                   := [' +
            FloatToStr(azeta.RegDF.AlicuotaIVA_3) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto IVA 3             := [' +
            FloatToStr(azeta.RegDF.MontoIVA_3) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF IVA 4                   := [' +
            FloatToStr(azeta.RegDF.AlicuotaIVA_4) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto IVA 4             := [' +
            FloatToStr(azeta.RegDF.MontoIVA_4) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF IVA 5                   := [' +
            FloatToStr(azeta.RegDF.AlicuotaIVA_5) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto IVA 5             := [' +
            FloatToStr(azeta.RegDF.MontoIVA_5) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF IVA 6                   := [' +
            FloatToStr(azeta.RegDF.AlicuotaIVA_6) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto IVA 6             := [' +
            FloatToStr(azeta.RegDF.MontoIVA_6) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF IVA 7                   := [' +
            FloatToStr(azeta.RegDF.AlicuotaIVA_7) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto IVA 7             := [' +
            FloatToStr(azeta.RegDF.MontoIVA_7) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF IVA 8                   := [' +
            FloatToStr(azeta.RegDF.AlicuotaIVA_8) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto IVA 8             := [' +
            FloatToStr(azeta.RegDF.MontoIVA_8) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF IVA 9                   := [' +
            FloatToStr(azeta.RegDF.AlicuotaIVA_9) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto IVA 9             := [' +
            FloatToStr(azeta.RegDF.MontoIVA_9) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF IVA 10                  := [' +
            FloatToStr(azeta.RegDF.AlicuotaIVA_10) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto IVA 10            := [' +
            FloatToStr(azeta.RegDF.MontoIVA_10) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total IVA               := [' +
            FloatToStr(azeta.RegDF.TotalIVA) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF tributo 1               := [' +
            FloatToStr(azeta.RegDF.CodigoTributo1) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto tributo 1         := [' +
            FloatToStr(azeta.RegDF.ImporteTributo1) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF tributo 2               := [' +
            FloatToStr(azeta.RegDF.CodigoTributo2) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto tributo 2         := [' +
            FloatToStr(azeta.RegDF.ImporteTributo2) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF tributo 3               := [' +
            FloatToStr(azeta.RegDF.CodigoTributo3) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto tributo 3         := [' +
            FloatToStr(azeta.RegDF.ImporteTributo3) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF tributo 4               := [' +
            FloatToStr(azeta.RegDF.CodigoTributo4) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto tributo 4         := [' +
            FloatToStr(azeta.RegDF.ImporteTributo4) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF tributo 5               := [' +
            FloatToStr(azeta.RegDF.CodigoTributo5) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto tributo 5         := [' +
            FloatToStr(azeta.RegDF.ImporteTributo5) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF tributo 6               := [' +
            FloatToStr(azeta.RegDF.CodigoTributo6) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto tributo 6         := [' +
            FloatToStr(azeta.RegDF.ImporteTributo6) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF tributo 7               := [' +
            FloatToStr(azeta.RegDF.CodigoTributo7) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto tributo 7         := [' +
            FloatToStr(azeta.RegDF.ImporteTributo7) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF tributo 8               := [' +
            FloatToStr(azeta.RegDF.CodigoTributo8) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto tributo 8         := [' +
            FloatToStr(azeta.RegDF.ImporteTributo8) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF tributo 9               := [' +
            FloatToStr(azeta.RegDF.CodigoTributo9) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto tributo 9         := [' +
            FloatToStr(azeta.RegDF.ImporteTributo9) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF tributo 10              := [' +
            FloatToStr(azeta.RegDF.CodigoTributo10) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto tributo 10        := [' +
            FloatToStr(azeta.RegDF.ImporteTributo10) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF tributo 11              := [' +
            FloatToStr(azeta.RegDF.CodigoTributo11) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF monto tributo 11        := [' +
            FloatToStr(azeta.RegDF.ImporteTributo11) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total tributos          := [' +
            FloatToStr(azeta.RegDF.TotalTributos) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));
        end;
      HasarArgentina_TLB.RegistroDetalladoDNFH:
        begin
          OutputDebugString(StringToWideChar('' , wideChars, 12));
          OutputDebugString(StringToWideChar('TIPO REGISTRO:' , wideChars, 12));
          OutputDebugString(StringToWideChar('[' + FloatToStr(azeta.Registro) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));

          OutputDebugString(StringToWideChar('DNFH (Documentos No Fiscales Homologados);: :=QUE ACUMULAN:=' , wideChars, 12));

          OutputDebugString(StringToWideChar('---------------------------------------------------------' , wideChars, 12));
          OutputDebugString(StringToWideChar('DNFH Tipo Comprob.         := [' +
            { FromTiposComprobanteToString }
            FloatToStr(azeta.RegDNFH.CodigoComprobante) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DNFH Nro. inicial          := [' +
            FloatToStr(azeta.RegDNFH.NumeroInicial) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DNFH Nro. Final            := [' +
            FloatToStr(azeta.RegDNFH.NumeroFinal) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DNFH total acumulado       := [' +
            FloatToStr(azeta.RegDNFH.Total) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));
        end;
      HasarArgentina_TLB.RegistroDetalladoDNFHNoAcum:
        begin
          OutputDebugString(StringToWideChar('' , wideChars, 12));
          OutputDebugString(StringToWideChar('TIPO REGISTRO:' , wideChars, 12));
          OutputDebugString(StringToWideChar('[' + FloatToStr(azeta.Registro) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));

          OutputDebugString(StringToWideChar('DNFH (Documentos No Fiscales Homologados);: :=QUE NO ACUMULAN:=' , wideChars, 12));

          OutputDebugString(StringToWideChar('------------------------------------------------------------' , wideChars, 12));
          OutputDebugString(StringToWideChar('Tipo Comprobante := [' +
            { FromTiposComprobanteToString }
            FloatToStr(azeta.RegDNFH_NoAcum.CodigoComprobante) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('Nº inicial       := [' +
            FloatToStr(azeta.RegDNFH_NoAcum.NumeroInicial) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('Nº final         := [' +
            FloatToStr(azeta.RegDNFH_NoAcum.NumeroFinal) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));
        end;
      HasarArgentina_TLB.RegistroGlobal:
        begin
          OutputDebugString(StringToWideChar('' , wideChars, 12));
          OutputDebugString(StringToWideChar('TIPO REGISTRO:' , wideChars, 12));
          OutputDebugString(StringToWideChar('[' + FloatToStr(azeta.Registro) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));
          OutputDebugString(StringToWideChar('INFORMACION GLOBAL:' , wideChars, 12));
          OutputDebugString(StringToWideChar('-------------------' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF cant. cancelados := [' +
            FloatToStr(azeta.RegGlobal.DF_CantidadCancelados) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF cant. emitidos   := [' +
            FloatToStr(azeta.RegGlobal.DF_CantidadEmitidos) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total ventas     := [' +
            FloatToStr(azeta.RegGlobal.DF_Total) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total gravado    := [' +
            FloatToStr(azeta.RegGlobal.DF_TotalGravado) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total IVA        := [' +
            FloatToStr(azeta.RegGlobal.DF_TotalIVA) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total tributos   := [' +
            FloatToStr(azeta.RegGlobal.DF_TotalTributos) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total no gravado := [' +
            FloatToStr(azeta.RegGlobal.DF_TotalNoGravado) + ']' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total exento     := [' +
            FloatToStr(azeta.RegGlobal.DF_TotalExento) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));

          OutputDebugString(StringToWideChar('DF total DNFH       := [' +
            FloatToStr(azeta.RegGlobal.DNFH_Total) + ']' , wideChars, 12));
          OutputDebugString(StringToWideChar('' , wideChars, 12));
        end;
    end;

    azeta2 := HASARNG.ContinuarConsultaAcumulados;

    while (azeta2.Registro <> HasarArgentina_TLB.RegistroFinal) do
    begin

      Case azeta2.Registro of
        HasarArgentina_TLB.RegistroDetalladoDF:
          begin
            OutputDebugString(StringToWideChar('' , wideChars, 12));
            OutputDebugString(StringToWideChar('TIPO REGISTRO:' , wideChars, 12));
            OutputDebugString(StringToWideChar('[' + FloatToStr(azeta2.Registro) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));
            OutputDebugString(StringToWideChar('DF (Documentos Fiscales);:' , wideChars, 12));
            OutputDebugString(StringToWideChar('-------------------------' , wideChars, 12));
            OutputDebugString(StringToWideChar('DF Tipo comprobante        := [' +
              { FromTiposComprobanteToString }
              FloatToStr(azeta2.RegDF.CodigoComprobante) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF Nro. inicial            := [' +
              FloatToStr(azeta2.RegDF.NumeroInicial) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF Nro. final              := [' +
              FloatToStr(azeta2.RegDF.NumeroFinal) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF cancelados              := [' +
              FloatToStr(azeta2.RegDF.CantidadCancelados) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total ventas            := [' +
              FloatToStr(azeta2.RegDF.Total) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total gravado           := [' +
              FloatToStr(azeta2.RegDF.TotalGravado) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total no gravado        := [' +
              FloatToStr(azeta2.RegDF.TotalNoGravado) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total exento            := [' +
              FloatToStr(azeta2.RegDF.TotalExento) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF IVA 1                   := [' +
              FloatToStr(azeta2.RegDF.AlicuotaIVA_1) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto IVA 1             := [' +
              FloatToStr(azeta2.RegDF.MontoIVA_1) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF IVA 2                   := [' +
              FloatToStr(azeta2.RegDF.AlicuotaIVA_2) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto IVA 2             := [' +
              FloatToStr(azeta2.RegDF.MontoIVA_2) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF IVA 3                   := [' +
              FloatToStr(azeta2.RegDF.AlicuotaIVA_3) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto IVA 3             := [' +
              FloatToStr(azeta2.RegDF.MontoIVA_3) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF IVA 4                   := [' +
              FloatToStr(azeta2.RegDF.AlicuotaIVA_4) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto IVA 4             := [' +
              FloatToStr(azeta2.RegDF.MontoIVA_4) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF IVA 5                   := [' +
              FloatToStr(azeta2.RegDF.AlicuotaIVA_5) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto IVA 5             := [' +
              FloatToStr(azeta2.RegDF.MontoIVA_5) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF IVA 6                   := [' +
              FloatToStr(azeta2.RegDF.AlicuotaIVA_6) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto IVA 6             := [' +
              FloatToStr(azeta2.RegDF.MontoIVA_6) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF IVA 7                   := [' +
              FloatToStr(azeta2.RegDF.AlicuotaIVA_7) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto IVA 7             := [' +
              FloatToStr(azeta2.RegDF.MontoIVA_7) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF IVA 8                   := [' +
              FloatToStr(azeta2.RegDF.AlicuotaIVA_8) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto IVA 8             := [' +
              FloatToStr(azeta2.RegDF.MontoIVA_8) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF IVA 9                   := [' +
              FloatToStr(azeta2.RegDF.AlicuotaIVA_9) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto IVA 9             := [' +
              FloatToStr(azeta2.RegDF.MontoIVA_9) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF IVA 10                  := [' +
              FloatToStr(azeta2.RegDF.AlicuotaIVA_10) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto IVA 10            := [' +
              FloatToStr(azeta2.RegDF.MontoIVA_10) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total IVA               := [' +
              FloatToStr(azeta2.RegDF.TotalIVA) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF tributo 1               := [' +
              FloatToStr(azeta2.RegDF.CodigoTributo1) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto tributo 1         := [' +
              FloatToStr(azeta2.RegDF.ImporteTributo1) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF tributo 2               := [' +
              FloatToStr(azeta2.RegDF.CodigoTributo2) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto tributo 2         := [' +
              FloatToStr(azeta2.RegDF.ImporteTributo2) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF tributo 3               := [' +
              FloatToStr(azeta2.RegDF.CodigoTributo3) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto tributo 3         := [' +
              FloatToStr(azeta2.RegDF.ImporteTributo3) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF tributo 4               := [' +
              FloatToStr(azeta2.RegDF.CodigoTributo4) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto tributo 4         := [' +
              FloatToStr(azeta2.RegDF.ImporteTributo4) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF tributo 5               := [' +
              FloatToStr(azeta2.RegDF.CodigoTributo5) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto tributo 5         := [' +
              FloatToStr(azeta2.RegDF.ImporteTributo5) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF tributo 6               := [' +
              FloatToStr(azeta2.RegDF.CodigoTributo6) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto tributo 6         := [' +
              FloatToStr(azeta2.RegDF.ImporteTributo6) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF tributo 7               := [' +
              FloatToStr(azeta2.RegDF.CodigoTributo7) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto tributo 7         := [' +
              FloatToStr(azeta2.RegDF.ImporteTributo7) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF tributo 8               := [' +
              FloatToStr(azeta2.RegDF.CodigoTributo8) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto tributo 8         := [' +
              FloatToStr(azeta2.RegDF.ImporteTributo8) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF tributo 9               := [' +
              FloatToStr(azeta2.RegDF.CodigoTributo9) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto tributo 9         := [' +
              FloatToStr(azeta2.RegDF.ImporteTributo9) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF tributo 10              := [' +
              FloatToStr(azeta2.RegDF.CodigoTributo10) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto tributo 10        := [' +
              FloatToStr(azeta2.RegDF.ImporteTributo10) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF tributo 11              := [' +
              FloatToStr(azeta2.RegDF.CodigoTributo11) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF monto tributo 11        := [' +
              FloatToStr(azeta2.RegDF.ImporteTributo11) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total tributos          := [' +
              FloatToStr(azeta2.RegDF.TotalTributos) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));
          end;
        HasarArgentina_TLB.RegistroDetalladoDNFH:
          begin
            OutputDebugString(StringToWideChar('' , wideChars, 12));
            OutputDebugString(StringToWideChar('TIPO REGISTRO:' , wideChars, 12));
            OutputDebugString(StringToWideChar('[' + FloatToStr(azeta2.Registro) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));

            OutputDebugString(StringToWideChar('DNFH (Documentos No Fiscales Homologados);: :=QUE ACUMULAN:=' , wideChars, 12));

            OutputDebugString(StringToWideChar('---------------------------------------------------------' , wideChars, 12));
            OutputDebugString(StringToWideChar('DNFH Tipo Comprob.         := [' +
              { FromTiposComprobanteToString }
              FloatToStr(azeta2.RegDNFH.CodigoComprobante) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DNFH Nro. inicial          := [' +
              FloatToStr(azeta2.RegDNFH.NumeroInicial) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DNFH Nro. Final            := [' +
              FloatToStr(azeta2.RegDNFH.NumeroFinal) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DNFH total acumulado       := [' +
              FloatToStr(azeta2.RegDNFH.Total) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));
          end;
        HasarArgentina_TLB.RegistroDetalladoDNFHNoAcum:
          begin
            OutputDebugString(StringToWideChar('' , wideChars, 12));
            OutputDebugString(StringToWideChar('TIPO REGISTRO:' , wideChars, 12));
            OutputDebugString(StringToWideChar('[' + FloatToStr(azeta2.Registro) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));

            OutputDebugString(StringToWideChar('DNFH (Documentos No Fiscales Homologados);: :=QUE NO ACUMULAN:=' , wideChars, 12));

            OutputDebugString(StringToWideChar('------------------------------------------------------------' , wideChars, 12));
            OutputDebugString(StringToWideChar('Tipo Comprobante := [' +
              { FromTiposComprobanteToString }
              FloatToStr(azeta2.RegDNFH_NoAcum.CodigoComprobante) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('Nº inicial       := [' +
              FloatToStr(azeta2.RegDNFH_NoAcum.NumeroInicial) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('Nº final         := [' +
              FloatToStr(azeta2.RegDNFH_NoAcum.NumeroFinal) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));
          end;
        HasarArgentina_TLB.RegistroGlobal:
          begin
            OutputDebugString(StringToWideChar('' , wideChars, 12));
            OutputDebugString(StringToWideChar('TIPO REGISTRO:' , wideChars, 12));
            OutputDebugString(StringToWideChar('[' + FloatToStr(azeta2.Registro) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));
            OutputDebugString(StringToWideChar('INFORMACION GLOBAL:' , wideChars, 12));
            OutputDebugString(StringToWideChar('-------------------' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF cant. cancelados := [' +
              IntToStr(azeta2.RegGlobal.DF_CantidadCancelados) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF cant. emitidos   := [' +
              FloatToStr(azeta2.RegGlobal.DF_CantidadEmitidos) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total ventas     := [' +
              FloatToStr(azeta2.RegGlobal.DF_Total) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total gravado    := [' +
              FloatToStr(azeta2.RegGlobal.DF_TotalGravado) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total IVA        := [' +
              FloatToStr(azeta2.RegGlobal.DF_TotalIVA) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total tributos   := [' +
              FloatToStr(azeta2.RegGlobal.DF_TotalTributos) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total no gravado := [' +
              FloatToStr(azeta2.RegGlobal.DF_TotalNoGravado) + ']' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total exento     := [' +
              FloatToStr(azeta2.RegGlobal.DF_TotalExento) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));

            OutputDebugString(StringToWideChar('DF total DNFH       := [' +
              FloatToStr(azeta2.RegGlobal.DNFH_Total) + ']' , wideChars, 12));
            OutputDebugString(StringToWideChar('' , wideChars, 12));
          end;
      end;

      azeta2 := HASARNG.ContinuarConsultaAcumulados;
    end;

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('NO HAY MAS INFORMACION DISPONIBLE !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('FIN DE LA CONSULTA !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Consultar configuración del servidor de correo electrónico.
// ====================================================================================================================

procedure Tdm.CommandConsCorreo_Click;

var
  respcorreo: RespuestaConsultarConfiguracionServidorCorreo;

begin
  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('CONSULTANDO CONFIGURACION DEL SERVIDOR DE CORREO ELECTRONICO...' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    respcorreo := HASARNG.ConsultarConfiguracionServidorCorreo;
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('IP Servidor SMTP     := [' + (respcorreo.DireccionIP) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('Port Servidor SMTP   := [' + IntToStr(respcorreo.Puerto) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('Responder a          := [' +
      (respcorreo.DireccionRemitente) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('FIN DE LA CONSULTA !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Consultar documentos asociados.
// ====================================================================================================================

procedure Tdm.CommandConsDocAsoc_Click;

var
  respdoc: RespuestaConsultarDocumentoAsociado;
begin
  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('CONSULTANDO DOCUMENTOS ASOCIADOS...' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    respdoc := HASARNG.ConsultarDocumentoAsociado(1);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(':=LINEA 1:=' , wideChars, 12));
    OutputDebugString(StringToWideChar('Tipo comprobante := [' +
      { FromTiposComprobanteToString } FloatToStr(respdoc.CodigoComprobante) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Nro. comprobante := [' +IntToStr(respdoc.NumeroPos) + '-' +
      FloatToStr(respdoc.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    respdoc := HASARNG.ConsultarDocumentoAsociado(2);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(':=LINEA 2:=' , wideChars, 12));
    OutputDebugString(StringToWideChar('Tipo comprobante := [' +
      { FromTiposComprobanteToString } FloatToStr(respdoc.CodigoComprobante) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Nro. comprobante := [' +IntToStr(respdoc.NumeroPos) + '-' +
     IntToStr(respdoc.NumeroComprobante) + ']'

      , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('FIN DE LA CONSULTA !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Consultar información último error producido.
// ====================================================================================================================

procedure Tdm.CommandConsError_Click;

var
  resperr: RespuestaConsultarUltimoError;

begin
  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('CONSULTANDO ULTIMO ERROR...' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    resperr := HASARNG.ConsultarUltimoError;
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('ID error := [' + (resperr.UltimoError) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Campo    := [' + IntToStr(resperr.NumeroParametro) + ' :: ' +
      (resperr.NombreParametro) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('Mensaje  := [' + (resperr.Descripcion) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('Contexto := [' + (resperr.Contexto) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('FIN DE LA CONSULTA !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Consultar estado general de la impresora fiscal.
// ====================================================================================================================

procedure Tdm.CommandConsEstado_Click;

var
  respest: RespuestaConsultarEstado;
begin
  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('CONSULTANDO ESTADO GENERAL IMPRESORA FISCAL...' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    respest := HASARNG.ConsultarEstado(NoDocumento);
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar('Tipo Comprobante      := [' + { FromTiposComprobanteToString }
      FloatToStr(respest.CodigoComprobante) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Ultimo Nro.           := [' +
      FloatToStr(respest.NumeroUltimoComprobante) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Cancelados            := [' + FloatToStr(respest.CantidadCancelados) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Emitidos              := [' + FloatToStr(respest.CantidadEmitidos) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('Almacenado en memoria de trabajo...' , wideChars, 12));

    OutputDebugString(StringToWideChar('Código de barras      := [' + BoolToStr(respest.EstadoAuxiliar.CodigoBarrasAlmacenado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Datos del cliente     := [' +
      BoolToStr(respest.EstadoAuxiliar.DatosClienteAlmacenados) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('Memoria de auditoria...' , wideChars, 12));

    OutputDebugString(StringToWideChar('Casi llena            := [' +
      BoolToStr(respest.EstadoAuxiliar.MemoriaAuditoriaCasiLlena) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Llena                 := [' +
      BoolToStr(respest.EstadoAuxiliar.MemoriaAuditoriaLlena) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('Otra info...' , wideChars, 12));

    OutputDebugString(StringToWideChar('Modo entrenamiento    := [' +
      BoolToStr(respest.EstadoAuxiliar.ModoEntrenamiento) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Ult. comprob. cancel. := [' +
      BoolToStr(respest.EstadoAuxiliar.UltimoComprobanteFueCancelado) + ']'

      , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('FIN DE LA CONSULTA !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Consultar información acerca del modelo y versión de la impresora fiscal.
// ====================================================================================================================

procedure Tdm.CommandConsModvers_Click;

var
  resp: RespuestaConsultarVersion;
begin
  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('CONSULTANDO MODELO Y VERSION IMPRESORA FISCAL...' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    resp := HASARNG.ConsultarVersion;
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar('Impresora fiscal  := [' +(resp.NombreProducto) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('Marca             := [' +(resp.Marca) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('Modelo y versión  := [' +(resp.Version) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Fecha firmware    := [' +(resp.FechaFirmware) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('Versión motor     := [' +(resp.VersionMotor) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Versión protocolo := [' + IntToStr(resp.VersionProtocolo) + ']'

      , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('FIN DE LA CONSULTA !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Consultar capacidad de cierres 'Z'.
// ====================================================================================================================

procedure Tdm.CommandConsZetas_Click;

var
  respz: RespuestaConsultarCapacidadZetas;
begin
  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('CONSULTANDO CAPACIDAD CIERRES " Z "...' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    respz := HASARNG.ConsultarCapacidadZetas;
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('Cierres " Z " totales     := [' +
      IntToStr(respz.CantidadDeZetasRemanentes) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('Cierres " Z " realizados  := [' + IntToStr(respz.UltimaZeta) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('Cierres " Z " disponibles := [' +
      IntToStr((respz.CantidadDeZetasRemanentes) - (respz.UltimaZeta)) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('FIN DE LA CONSULTA !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Consultar líneas de usuario, por zona.
// ====================================================================================================================

procedure Tdm.CommandConsZona_Click;

var
  resp: RespuestaConsultarZona;

begin
  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('CONSULTANDO LINEAS DE USUARIO POR ZONA...' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    resp := HASARNG.ConsultarZona(1, EstacionTicket, ZonaFantasia);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(':=LINEA 1 , Fantasía:=' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Borrado     := [' + BoolToStr(resp.Atributos.BorradoTexto) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Centrado    := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Doble ancho := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Negrita     := [' + BoolToStr(resp.Atributos.Negrita) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Texto               := [' +(resp.Descripcion) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('' , wideChars, 12));

    resp := HASARNG.ConsultarZona(2, EstacionTicket, ZonaFantasia);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(':=LINEA 2 , Fantasía:=' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Borrado     := [' + BoolToStr(resp.Atributos.BorradoTexto) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Centrado    := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Doble ancho := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Negrita     := [' + BoolToStr(resp.Atributos.Negrita) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Texto  := [' +(resp.Descripcion) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    resp := HASARNG.ConsultarZona(1, EstacionTicket, Zona1Encabezado);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(':=LINEA 1 , Encabezado 1:=' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Borrado     := [' + BoolToStr(resp.Atributos.BorradoTexto) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Centrado    := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Doble ancho := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Negrita     := [' + BoolToStr(resp.Atributos.Negrita) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Texto  := [' +(resp.Descripcion) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    resp := HASARNG.ConsultarZona(2, EstacionTicket, Zona1Encabezado);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(':=LINEA 2 , Encabezado 1:=' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Borrado     := [' + BoolToStr(resp.Atributos.BorradoTexto) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Centrado    := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Doble ancho := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Negrita     := [' + BoolToStr(resp.Atributos.Negrita) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Texto  := [' +(resp.Descripcion) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    resp := HASARNG.ConsultarZona(3, EstacionTicket, Zona1Encabezado);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(':=LINEA 3 , Encabezado 1:=' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Borrado     := [' + BoolToStr(resp.Atributos.BorradoTexto) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Centrado    := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Doble ancho := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Negrita     := [' + BoolToStr(resp.Atributos.Negrita) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Texto  := [' +(resp.Descripcion) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    resp := HASARNG.ConsultarZona(1, EstacionTicket, Zona2Encabezado);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(':=LINEA 1 , Encabezado 2:=' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Borrado     := [' + BoolToStr(resp.Atributos.BorradoTexto) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Centrado    := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Doble ancho := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Negrita     := [' + BoolToStr(resp.Atributos.Negrita) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Texto  := [' +(resp.Descripcion) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    resp := HASARNG.ConsultarZona(2, EstacionTicket, Zona2Encabezado);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(':=LINEA 2 , Encabezado 2:=' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Borrado     := [' + BoolToStr(resp.Atributos.BorradoTexto) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Centrado    := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Doble ancho := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Negrita     := [' + BoolToStr(resp.Atributos.Negrita) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Texto  := [' +(resp.Descripcion) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    resp := HASARNG.ConsultarZona(3, EstacionTicket, Zona2Encabezado);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(':=LINEA 3 , Encabezado 2:=' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Borrado     := [' + BoolToStr(resp.Atributos.BorradoTexto) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Centrado    := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Doble ancho := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Negrita     := [' + BoolToStr(resp.Atributos.Negrita) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Texto  := [' +(resp.Descripcion) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    resp := HASARNG.ConsultarZona(1, EstacionTicket, Zona1Cola);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(':=LINEA 1 , Cola 1:=' , wideChars, 12));
    OutputDebugString(StringToWideChar('Estilo: Borrado     := [' + BoolToStr(resp.Atributos.BorradoTexto) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Centrado    := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Doble ancho := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Negrita     := [' + BoolToStr(resp.Atributos.Negrita) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Texto  := [' +(resp.Descripcion) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    resp := HASARNG.ConsultarZona(2, EstacionTicket, Zona1Cola);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(':=LINEA 2 , Cola 1:=' , wideChars, 12));
    OutputDebugString(StringToWideChar('Estilo: Borrado     := [' + BoolToStr(resp.Atributos.BorradoTexto) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Centrado    := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Doble ancho := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Negrita     := [' + BoolToStr(resp.Atributos.Negrita) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Texto  := [' +(resp.Descripcion) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    resp := HASARNG.ConsultarZona(3, EstacionTicket, Zona1Cola);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(':=LINEA 3 , Cola 1:=' , wideChars, 12));
    OutputDebugString(StringToWideChar('Estilo: Borrado     := [' + BoolToStr(resp.Atributos.BorradoTexto) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Centrado    := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Doble ancho := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Negrita     := [' + BoolToStr(resp.Atributos.Negrita) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Texto  := [' +(resp.Descripcion) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    resp := HASARNG.ConsultarZona(4, EstacionTicket, Zona1Cola);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(':=LINEA 4 , Cola 1:=' , wideChars, 12));
    OutputDebugString(StringToWideChar('Estilo: Borrado     := [' + BoolToStr(resp.Atributos.BorradoTexto) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Centrado    := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Doble ancho := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Negrita     := [' + BoolToStr(resp.Atributos.Negrita) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Texto  := [' +(resp.Descripcion) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    resp := HASARNG.ConsultarZona(1, EstacionTicket, Zona2Cola);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(':=LINEA 1 , Cola 2:=' , wideChars, 12));
    OutputDebugString(StringToWideChar('Estilo: Borrado     := [' + BoolToStr(resp.Atributos.BorradoTexto) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Centrado    := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Doble ancho := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Negrita     := [' + BoolToStr(resp.Atributos.Negrita) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Texto  := [' +(resp.Descripcion) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    resp := HASARNG.ConsultarZona(2, EstacionTicket, Zona2Cola);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(':=LINEA 2 , Cola 2:=' , wideChars, 12));
    OutputDebugString(StringToWideChar('Estilo: Borrado     := [' + BoolToStr(resp.Atributos.BorradoTexto) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Centrado    := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Doble ancho := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Negrita     := [' + BoolToStr(resp.Atributos.Negrita) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Texto  := [' +(resp.Descripcion) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    resp := HASARNG.ConsultarZona(3, EstacionTicket, Zona2Cola);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(':=LINEA 3 , Cola 2:=' , wideChars, 12));
    OutputDebugString(StringToWideChar('Estilo: Borrado     := [' + BoolToStr(resp.Atributos.BorradoTexto) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Centrado    := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Doble ancho := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Negrita     := [' + BoolToStr(resp.Atributos.Negrita) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Texto  := [' +(resp.Descripcion) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    resp := HASARNG.ConsultarZona(4, EstacionTicket, Zona2Cola);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(':=LINEA 4 , Cola 2:=' , wideChars, 12));
    OutputDebugString(StringToWideChar('Estilo: Borrado     := [' + BoolToStr(resp.Atributos.BorradoTexto) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Centrado    := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Doble ancho := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Negrita     := [' + BoolToStr(resp.Atributos.Negrita) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Texto  := [' +(resp.Descripcion) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    resp := HASARNG.ConsultarZona(5, EstacionTicket, Zona2Cola);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(':=LINEA 5 , Cola 2:=' , wideChars, 12));
    OutputDebugString(StringToWideChar('Estilo: Borrado     := [' + BoolToStr(resp.Atributos.BorradoTexto) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Centrado    := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Doble ancho := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Negrita     := [' + BoolToStr(resp.Atributos.Negrita) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Texto  := [' +(resp.Descripcion) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    resp := HASARNG.ConsultarZona(6, EstacionTicket, Zona2Cola);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(':=LINEA 6 , Cola 2:=' , wideChars, 12));
    OutputDebugString(StringToWideChar('Estilo: Borrado     := [' + BoolToStr(resp.Atributos.BorradoTexto) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Centrado    := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Doble ancho := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Negrita     := [' + BoolToStr(resp.Atributos.Negrita) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Texto  := [' +(resp.Descripcion) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    resp := HASARNG.ConsultarZona(1, EstacionTicket, ZonaDomicilioEmisor);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(':=LINEA 1 , Domicilio emisor:=' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Borrado     := [' + BoolToStr(resp.Atributos.BorradoTexto) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Centrado    := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Doble ancho := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Negrita     := [' + BoolToStr(resp.Atributos.Negrita) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Texto  := [' +(resp.Descripcion) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    resp := HASARNG.ConsultarZona(2, EstacionTicket, ZonaDomicilioEmisor);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(':=LINEA 2 , Domicilio emisor:=' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Borrado     := [' + BoolToStr(resp.Atributos.BorradoTexto) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Centrado    := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Doble ancho := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Negrita     := [' + BoolToStr(resp.Atributos.Negrita) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Texto  := [' +(resp.Descripcion) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    resp := HASARNG.ConsultarZona(3, EstacionTicket, ZonaDomicilioEmisor);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(':=LINEA 3 , Domicilio emisor:=' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Borrado     := [' + BoolToStr(resp.Atributos.BorradoTexto) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Centrado    := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Doble ancho := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Negrita     := [' + BoolToStr(resp.Atributos.Negrita) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Texto  := [' +(resp.Descripcion) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    resp := HASARNG.ConsultarZona(4, EstacionTicket, ZonaDomicilioEmisor);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(':=LINEA 4 , Domicilio emisor:=' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Borrado     := [' + BoolToStr(resp.Atributos.BorradoTexto) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Centrado    := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Doble ancho := [' + BoolToStr(resp.Atributos.Centrado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estilo: Negrita     := [' + BoolToStr(resp.Atributos.Negrita) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Texto  := [' +(resp.Descripcion) + ']'

      , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('FIN DE LA CONSULTA !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Se pide la reimpresión de un comprobante cualquera.
// ====================================================================================================================

procedure Tdm.CommandCopiarDoc_Click;
begin

  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('SOLICITANDO REIMPRESION DE COMPROBANTE...' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    OutputDebugString(StringToWideChar('Copia de Tique Factura " A " Nº 13' , wideChars, 12));
    HASARNG.CopiarComprobante(TiqueFacturaA, 13);

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('COMPROBANTE REIMPRESO !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Consultar datos de inicialización de la impresora fiscal.
// ====================================================================================================================

procedure Tdm.CommandDatosIni_Click;

var
  datosini: RespuestaConsultarDatosInicializacion;
begin
  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('CONSULTANDO DATOS DE INCIALIZACION...' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    datosini := HASARNG.ConsultarDatosInicializacion;
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar('Razón Social      := [' + (datosini.RazonSocial) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('CUIT              := [' + (datosini.Cuit) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('Responsab. IVA    := [' +
      { FromTiposDeResponsabilidadesImpresorToString }
      FloatToStr(datosini.ResponsabilidadIVA) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('Ingr. Brutos      := [' + (datosini.IngBrutos) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Fecha inicio act. := [' + DateToStr(datosini.FechaInicioActividades) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Nro. POS          := [' + IntToStr(datosini.NumeroPos) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('Reg. impr. fiscal := [' + (datosini.Registro) + ']'

      , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('FIN DE LA CONSULTA !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Comando para el envío de comprobantes, por correo electrónico.
// ====================================================================================================================

procedure Tdm.CommandDocxMail_Click;
begin

  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('ENVIANDO COMPROBANTE POR MAIL:' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    OutputDebugString(StringToWideChar('Enviando: Tique Factura " A " Nº 13 :: rcardenes@hasar.com', wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    HASARNG.EnviarDocumentoCorreo(TiqueFacturaA, 13, 'rcardenes@hasar.com');

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('COMPROBANTE ENVIADO !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Impresión de un Comprobante Donación.
// ====================================================================================================================

procedure Tdm.CommandDONA_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('IMPRIMIENDO - COMPROBANTE DONACION:' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      ResponsableInscripto, TipoCUIT, 'Domicilio Cliente...',
      'Domicilio extensión 1...', 'Domicilio extensión 2...',
      'Domicilio extensión 3....' );
    HASARNG.CargarDocumentoAsociado(1, TiqueFacturaA, 2019, 1458);
    HASARNG.CargarBeneficiario('Razón Social Beneficiario...', '00000000000',
      TipoCUIL, 'Domicilio Beneficiario...');
    respabrir := HASARNG.AbrirDocumento(ComprobanteDonacion);

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (abrir); Comprob. Donación Nro.   := [' +
      IntToStr(respabrir.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    HASARNG.ImprimirItem('Monto parcial vuelto...', 1, 10, Exento, 0,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1, '',
      'DONA', Donacion);
    resppago := HASARNG.ImprimirPago('Efectivo...', 10, Pagar, DisplayNo, '',
      Efectivo, 0, '');

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - Pagando... Cambio                 := [' +
      FloatToStr(resppago.Saldo) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    respcierre := HASARNG.CerrarDocumento(0, 'hasarventas@hasar.com');

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (cerrar);Comprobante Donación Nro. := [' +
      IntToStr(respcierre.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - Páginas                           := [' +
      IntToStr(respcierre.CantidadDePaginas) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('COMPROBANTE DONACION IMPRESO !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Impresión del Detalle de ventas (cierre 'X' , wideChars, 12));.
// ====================================================================================================================

procedure Tdm.CommandEquis_Click;

var
  cierre: RespuestaCerrarJornadaFiscal;
begin
  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('DETALLE DE VENTAS:' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    cierre := HASARNG.CerrarJornadaFiscal(ReporteX);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('Reporte...        := [' + FloatToStr(cierre.Reporte) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('Detalle Nro.      := [' + FloatToStr(cierre.X.Numero) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('Fecha inicial     := [' + FloatToStr(cierre.X.FechaInicio) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Hora inicial      := [' + FloatToStr(cierre.X.HoraInicio) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Fecha final       := [' + FloatToStr(cierre.X.FechaCierre) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Hora final        := [' + FloatToStr(cierre.X.HoraCierre) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar('DF Emitidos       := [' +
      FloatToStr(cierre.X.DF_CantidadEmitidos) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('DF total ventas   := [' + FloatToStr(cierre.X.DF_Total) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('DF total IVA      := [' + FloatToStr(cierre.X.DF_TotalIVA) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('DF total tributos := [' +
      FloatToStr(cierre.X.DF_TotalTributos) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar('DNFH emitidos     := [' +
      FloatToStr(cierre.X.DNFH_CantidadEmitidos) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar('NC emitidas       := [' +
      FloatToStr(cierre.X.NC_CantidadEmitidos) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('NC total crédito  := [' + FloatToStr(cierre.X.NC_Total) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('NC total IVA      := [' + FloatToStr(cierre.X.NC_TotalIVA) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('NC total tributos := [' +
      FloatToStr(cierre.X.NC_TotalTributos) + ']'

      , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('DETALLE DE VENTAS IMPRESO !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Impresión de un Documento Genérico.
// ====================================================================================================================

procedure Tdm.CommandFechaHora_Click;

var
  respfyh: RespuestaConsultarFechaHora;
begin
  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('CONSULTA DE FECHA Y HORA:' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    respfyh :=
    HASARNG.ConsultarFechaHora;
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('Fecha := [' + DateToStr(respfyh.Fecha) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('Hora  := [' + TimeToStr(respfyh.Hora) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('FIN DE LA CONSULTA !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
//      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Impresión de un Documento Genérico.
// ====================================================================================================================

procedure Tdm.CommandGenerico_Click;

var
  respabrir: RespuestaAbrirDocumento;

  //resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('IMPRIMIENDO - DOCUMENTO GENERICO:' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      ResponsableInscripto, TipoCUIT, 'Domicilio Cliente...',
      'Domicilio extensión 1...', 'Domicilio extensión 2...',
      'Domicilio extensión 3....');
    HASARNG.CargarDocumentoAsociado(1, FacturaA, 2019, 1458);

    respabrir := HASARNG.AbrirDocumento(Generico);
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - (abrir); Documento Genérico Nro. := [' +
      IntToStr(respabrir.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    estilo.DobleAncho := True;
    HASARNG.ImprimirTextoGenerico(estilo, 'Texto doble ancho.', DisplayNo);

    estilo.DobleAncho := False;
    estilo.Negrita := True;
    HASARNG.ImprimirTextoGenerico(estilo, 'Texto en negrita.', DisplayNo);

    estilo.Negrita := False;
    estilo.Centrado := True;
    HASARNG.ImprimirTextoGenerico(estilo, 'Texto centrado.', DisplayNo);

    estilo.Centrado := False;
    estilo.DobleAncho := True;
    estilo.Negrita := True;
    HASARNG.ImprimirTextoGenerico(estilo, 'Texto doble ancho y en negrita.',
      DisplayNo);

    estilo.Centrado := True;
    estilo.DobleAncho := True;
    estilo.Negrita := False;
    HASARNG.ImprimirTextoGenerico(estilo, 'Texto doble ancho y centrado.',
      DisplayNo);

    estilo.Centrado := True;
    estilo.DobleAncho := False;
    estilo.Negrita := True;
    HASARNG.ImprimirTextoGenerico(estilo, 'Texto en negrita y centrado.',
      DisplayNo);

    estilo.Centrado := True;
    estilo.DobleAncho := True;
    estilo.Negrita := True;
    HASARNG.ImprimirTextoGenerico(estilo, 'Texto dob anch, negr y cent.',
      DisplayNo);

    respcierre := HASARNG.CerrarDocumento(0, 'hasarventas@hasar.com');

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (cerrar);Documento Genérico Nro. := [' +
      IntToStr(respcierre.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - Páginas                         := [' +
      IntToStr(respcierre.CantidadDePaginas) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('DOCUMENTO GENERICO IMPRESO !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Impresión de un Presupuesto 'X' clase 'A'.
// Se requiere un Cierre 'Z' previo.
// ====================================================================================================================

procedure Tdm.CommandModifCateg_Click;
begin

  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('MODIFICANDO CATEGORIA IVA...' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('Nueva responsabilidad IVA := Responsable Inscripto' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    HASARNG.CambiarCategoriaIVA(IFResponsableInscripto);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('CATEGORIA IVA MODIFICADA !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Modificar el código de inscripción en Ingresos Brutos.
// Se requiere un Cierre 'Z' previo.
// ====================================================================================================================

procedure Tdm.CommandModifIIBB_Click;
begin

  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('MODIFICANDO INSCRIPCION INGRESOS BRUTOS...' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  OutputDebugString(StringToWideChar('Nuevo código Ingresos Brutos := IIBB-54321099876543210' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    HASARNG.CambiarInscripIIBB('IIBB-54321099876543210');
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('INSCRIPCION INGRESOS BRUTOS MODIFICADA !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Modificar la fecha de inicio de actividades.
// Se requiere un Cierre 'Z' previo.
// ====================================================================================================================

procedure Tdm.CommandModifIniActiv_Click;
begin

  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('MODIFICANDO FECHA DE INICIO DE ACTIVIDADES...' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('Nueva fecha inicio actividades := 01/02/2015' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    HASARNG.CambiarFechaInicioActividades(01/02/2015);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('FECHA DE INICIO DE ACTIVIDADES MODIFICADA !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Descarga de CTD.
// ====================================================================================================================

procedure Tdm.CommandObtRepAudit_Click;

var
  resp: RespuestaObtenerPrimerBloqueAuditoria;

  resp2: RespuestaObtenerSiguienteBloqueAuditoria;
begin
  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('DESCARGA DE CTD (Cinta Testigo Digital);:' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    OutputDebugString(StringToWideChar('Período: 01/02/2015 al 27/02/2015 , Comprimir, XML único' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    resp := HASARNG.ObtenerPrimerBloqueAuditoria('150201', '150227', ReporteZFecha,
      Comprime, XMLUnico);
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    if (resp.Registro = BloqueFinal) then
    begin
      OutputDebugString(StringToWideChar('NO HAY INFORMACION DISPONIBLE !...' , wideChars, 12));
      OutputDebugString(StringToWideChar('' , wideChars, 12));

    end
    else
    begin
      OutputDebugString(StringToWideChar('Primer bloque de información    := [' +
       (resp.Informacion) + ']' , wideChars, 12));
      OutputDebugString(StringToWideChar('' , wideChars, 12));
    end;

    while True do
    begin
      resp2 := HASARNG.ObtenerSiguienteBloqueAuditoria;

      if (resp2.Registro = BloqueInformacion) then
      begin
        OutputDebugString(StringToWideChar('Siguiente bloque de información := [' +
          (resp2.Informacion) + ']' , wideChars, 12));
        OutputDebugString(StringToWideChar('' , wideChars, 12));
      end
      else
      begin
        OutputDebugString(StringToWideChar('' , wideChars, 12));
        OutputDebugString(StringToWideChar('NO HAY MAS INFORMACION DISPONIBLE !...' , wideChars, 12));
        OutputDebugString(StringToWideChar('' , wideChars, 12));
        OutputDebugString(StringToWideChar('INFORMACION CTD DESCARGADA !...' , wideChars, 12));
        OutputDebugString(StringToWideChar('' , wideChars, 12));
      end;

    end;

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Descarga de reportes electrónicos semanales.
// ====================================================================================================================

procedure Tdm.CommandObtRepDoc_Click;

var
  resp: RespuestaObtenerPrimerBloqueDocumento;

  resp2: RespuestaObtenerSiguienteBloqueDocumento;
begin
  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('DESCARGA INFORMACION COMPROBANTES:' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    resp := HASARNG.ObtenerPrimerBloqueDocumento(1, 4, TiqueFacturaA, Comprime,
      XMLUnico);

    if (resp.Registro = BloqueFinal) then
    begin
      OutputDebugString(StringToWideChar('NO HAY INFORMACION DISPONIBLE !...!' , wideChars, 12));
      OutputDebugString(StringToWideChar('' , wideChars, 12));

    end
    else
    begin
      OutputDebugString(StringToWideChar('Primer bloque de información    := [' +
       (resp.Informacion) + ']' , wideChars, 12));
      OutputDebugString(StringToWideChar('' , wideChars, 12));
    end;

    while (True) do
    begin
      resp2 := HASARNG.ObtenerSiguienteBloqueDocumento;

      if (resp2.Registro = BloqueInformacion) then
      begin
        OutputDebugString(StringToWideChar('Siguiente bloque de información := [' +
          (resp2.Informacion) + ']' , wideChars, 12));
        OutputDebugString(StringToWideChar('' , wideChars, 12));
      end
      else
      begin
        OutputDebugString(StringToWideChar('' , wideChars, 12));
        OutputDebugString(StringToWideChar('NO HAY MAS INFORMACION DISPONIBLE !...' , wideChars, 12));
        OutputDebugString(StringToWideChar('' , wideChars, 12));
        OutputDebugString(StringToWideChar('INFORMACION COMPROBANTES DESCARGADA !...' , wideChars, 12));
        OutputDebugString(StringToWideChar('' , wideChars, 12));

      end;
    end;

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Descarga de reportes electrónicos semanales.
// ====================================================================================================================

procedure Tdm.CommandObtRepElectr_Click;

var
  resp: RespuestaObtenerPrimerBloqueReporteElectronico;

  resp2: RespuestaObtenerSiguienteBloqueReporteElectronico;
begin
  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('DESCARGA DE REPORTES SEMANALES:' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    OutputDebugString(StringToWideChar('Período: 01/02/2015 al 27/02/2015' , wideChars, 12));
    resp := HASARNG.ObtenerPrimerBloqueReporteElectronico(01/02/2015, 27/02/2015,0);

    if (resp.Registro = BloqueFinal) then
    begin
      OutputDebugString(StringToWideChar('' , wideChars, 12));
      OutputDebugString(StringToWideChar('NO HAY INFORMACION DISPONIBLE !...' , wideChars, 12));
      OutputDebugString(StringToWideChar('' , wideChars, 12));

    end
    else
    begin
      OutputDebugString(StringToWideChar('Primer bloque de información    := [' +
       (resp.Informacion) + ']' , wideChars, 12));
      OutputDebugString(StringToWideChar('' , wideChars, 12));
    end;

    while (True) do
    begin
      resp2 := HASARNG.ObtenerSiguienteBloqueReporteElectronico;

      if (resp2.Registro = BloqueInformacion) then
      begin
        OutputDebugString(StringToWideChar('Siguiente bloque de información := [' +
          (resp2.Informacion) + ']' , wideChars, 12));
        OutputDebugString(StringToWideChar('' , wideChars, 12));
      end
      else
      begin
        OutputDebugString(StringToWideChar('' , wideChars, 12));
        OutputDebugString(StringToWideChar('NO HAY MÁS INFORMACION DISPONIBLE !...' , wideChars, 12));
        OutputDebugString(StringToWideChar('' , wideChars, 12));
        OutputDebugString(StringToWideChar('REPORTES SEMANALES DECARGADOS !...' , wideChars, 12));
        OutputDebugString(StringToWideChar('' , wideChars, 12));

      end;
    end;

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Descarga del LOG interno de la impresora fiscal.
// ====================================================================================================================

procedure Tdm.CommandObtRepLog_Click;

var
  resp: RespuestaObtenerPrimerBloqueLog;

  resp2: RespuestaObtenerSiguienteBloqueLog;
begin
  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('DESCARGA LOG INTERNO:' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    resp := HASARNG.ObtenerPrimerBloqueLog;

    if (resp.Registro = BloqueFinal) then
    begin
      OutputDebugString(StringToWideChar('' , wideChars, 12));
      OutputDebugString(StringToWideChar('NO HAY INFORMACION DISPONIBLE !...' , wideChars, 12));
      OutputDebugString(StringToWideChar('' , wideChars, 12));

    end
    else
    begin
      OutputDebugString(StringToWideChar('Primer bloque de información    := [' +
       (resp.Informacion) + ']' , wideChars, 12));
      OutputDebugString(StringToWideChar('' , wideChars, 12));
    end;

    While (True) do
    begin
      resp2 := HASARNG.ObtenerSiguienteBloqueLog;

      if (resp2.Registro = BloqueInformacion) then
      begin
        OutputDebugString(StringToWideChar('Siguiente bloque de información := [' +
          (resp2.Informacion) + ']' , wideChars, 12));
        OutputDebugString(StringToWideChar('' , wideChars, 12));
      end
      else
      begin
        OutputDebugString(StringToWideChar('' , wideChars, 12));
        OutputDebugString(StringToWideChar('NO HAY MAS INFORMACION DISPONIBLE !...' , wideChars, 12));
        OutputDebugString(StringToWideChar('' , wideChars, 12));
        OutputDebugString(StringToWideChar('LOG INTERNO DESCARGADO !...' , wideChars, 12));
        OutputDebugString(StringToWideChar('' , wideChars, 12));

      end;
    end;

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Consulta de estado fiscal del último comando ejecutado.
// ====================================================================================================================

procedure Tdm.CommandObtStFiscal_Click;

var
  resp: EstadoFiscal;
begin
  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('CONSULTA ULTIMO ESTADO FISCAL:' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    resp := HASARNG.ObtenerUltimoEstadoFiscal;

    OutputDebugString(StringToWideChar('Doc. abierto             := [' + BoolToStr(resp.DocumentoAbierto) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Doc. fiscal abierto      := [' + BoolToStr(resp.DocumentoFiscalAbierto) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Error aritmético         := [' + BoolToStr(resp.ErrorAritmetico) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Error de ejecución       := [' + BoolToStr(resp.ErrorEjecucion) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Error de estado          := [' + BoolToStr(resp.ErrorEstado) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Error general            := [' + BoolToStr(resp.ErrorGeneral) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Error mem. auditoría     := [' + BoolToStr(resp.ErrorMemoriaAuditoria) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Error mem. fiscal        := [' + BoolToStr(resp.ErrorMemoriaFiscal) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Error mem. trabajo       := [' + BoolToStr(resp.ErrorMemoriaTrabajo) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Error parámetro          := [' + BoolToStr(resp.ErrorParametro) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Mem. fiscal casi llena   := [' + BoolToStr(resp.MemoriaFiscalCasiLlena) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Mem. fiscal inicializada := [' + BoolToStr(resp.MemoriaFiscalInicializada) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Mem. fiscal llena        := [' + BoolToStr(resp.MemoriaFiscalLlena) + ']'

      , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('FIN DE LA CONSULTA !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Consulta último estado de la impresora.
// ====================================================================================================================

procedure Tdm.CommandObtStImpr_Click;

var
  resp: EstadoImpresora;
begin
  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('CONSULTA ULTIMO ESTADO DE IMPRESORA:' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    resp := HASARNG.ObtenerUltimoEstadoImpresora;
    OutputDebugString(StringToWideChar('Cajón abierto        := [' + BoolToStr(resp.CajonAbierto) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Error impresora      := [' + BoolToStr(resp.ErrorImpresora) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Falta papel testigo  := [' + BoolToStr(resp.FaltaPapelJournal) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Falta papel comprob. := [' + BoolToStr(resp.FaltaPapelReceipt) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Impresora ocupada    := [' + BoolToStr(resp.ImpresoraOcupada) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Impresora offline    := [' + BoolToStr(resp.ImpresoraOffLine) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Estado Or lógico     := [' + BoolToStr(resp.OrLogico) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('Tapa abierta         := [' + BoolToStr(resp.TapaAbierta) + ']'

      , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('FIN DE LA CONSULTA !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Impresión de Documento Patrón, según definición RG AFIP Nº 3561/13.
// ====================================================================================================================

procedure Tdm.CommandPatron_Click;

var
  estilo: AtributosDeTexto;

  resp: RespuestaAbrirDocumento;
begin
  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('IMPRESION DE DOCUMENTO PATRON:' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    estilo.BorradoTexto := False;
    estilo.Centrado := False;
    estilo.DobleAncho := False;
    estilo.Negrita := False;
    HASARNG.ConfigurarZona(1, estilo,
      'Pasaje Ignoto 777 - (1408); Villa Real ..........................',
      EstacionTicket, ZonaDomicilioEmisor);
    HASARNG.ConfigurarZona(2, estilo,
      'Ciudad Autónoma de Buenos Aires ................................',
      EstacionTicket, ZonaDomicilioEmisor);
    HASARNG.ConfigurarZona(3, estilo,
      'República Argentina ............................................',
      EstacionTicket, ZonaDomicilioEmisor);
    HASARNG.ConfigurarZona(4, estilo,
      'América del Sur ................................................',
      EstacionTicket, ZonaDomicilioEmisor);

    HASARNG.CargarDatosCliente
      ('El Kioskazo de Villa Real ........................', '22222222226',
      ResponsableInscripto, TipoCUIT,
      'Avenida Julio Argentino Roca 852 - Local 9 - Entrepiso .........',
      '(1401); Ciudad Autónoma de Buenos Aires .........................',
      'República Argentina ............................................',
      'América del Sur ................................................');
    resp := HASARNG.AbrirDocumento(TiqueFacturaA);
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar('(abrir); Doc. Patrón Nro. := [' +intToStr(resp.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    resp := HASARNG.AbrirDocumento(TiqueFacturaA);

    OutputDebugString(StringToWideChar('Tique Factura " A " Nº [' +intToStr(resp.NumeroComprobante) +
      ']... ABIERTO !' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('DOCUMENTO PATRON IMPRESO !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;


  // '@TiqueFacturaA
  // '
  // 'AProducto de fabricación nacional .................0
  // 'AOrigen: Salta ....................................0
  // 'AProducto de exportación ..........................0
  // 'APresentación: Bolsa x Kilo .......................0
  // 'BCARAMELOS UNO ....................2.59.99Gravado21.00ModoSumaMontoIIFijoMonto1.99DisplayNoModoPrecioTotal1779123456791C1131Kilo
  // '
  // 'AProducto de fabricación nacional .................0
  // 'AOrigen; Jujuy ....................................0
  // 'AProducto de exportación ..........................0
  // 'APresentación: Bolsa x Kilo .......................0
  // 'BCARAMELOS DOS .....................2.59.99Gravado21.00ModoSumaMontoIIFijoMonto1.99DisplayNoModoPrecioTotal1779123456792C1131Kilo
  // '
  // 'AProducto de fabricación nacional .................0
  // 'AOrigen: Chaco ....................................0
  // 'AProducto de exportación ..........................0
  // 'APresentación: Bolsa x Kilo .......................0
  // 'BCARAMELOS TRES ....................2.59.99Gravado21.00ModoSumaMontoIIFijoMonto1.99DisplayNoModoPrecioTotal1779123456793C1131Kilo
  // '
  // 'AProducto de fabricación nacional .................0
  // 'AOrigen: Formosa ..................................0
  // 'AProducto de exportación ..........................0
  // 'APresentación: Bolsa x Kilo .......................0
  // 'BCARAMELOS CUATRO ..................2.59.99Gravado21.00ModoSumaMontoIIFijoMonto1.99DisplayNoModoPrecioTotal1779123456794C1131Kilo
  // '
  // 'AProducto de fabricación nacional .................0
  // 'AOrigen: Tucumán ..................................0
  // 'AProducto de exportación ..........................0
  // 'APresentación: Bolsa x Kilo .......................0
  // 'BCARAMELOS CINCO ...................2.59.99Gravado21.00ModoSumaMontoIIFijoMonto1.99DisplayNoModoPrecioTotal1779123456795C1131Kilo
  // '
  // 'AProducto de fabricación nacional .................0
  // 'AOrigen: Santiago del estero ......................0
  // 'AProducto de exportación ..........................0
  // 'APresentación: Bolsa x Kilo .......................0
  // 'BCARAMELOS SEIS ....................2.59.99Gravado21.00ModoSumaMontoIIFijoMonto1.99DisplayNoModoPrecioTotal1779123456796C1131Kilo
  // '
  // 'AProducto de fabricación nacional .................0
  // 'AOrigen: Catamarca ................................0
  // 'AProducto de exportación ..........................0
  // 'APresentación: Bolsa x Kilo .......................0
  // 'BCARAMELOS SIETE ...................2.59.99Gravado21.00ModoSumaMontoIIFijoMonto1.99DisplayNoModoPrecioTotal1779123456797C1131Kilo
  // '
  // 'AProducto de fabricación nacional .................0
  // 'AOrigen: la Rioja .................................0
  // 'AProducto de exportación ..........................0
  // 'APresentación: Bolsa x Kilo .......................0
  // 'BCARAMELOS OCHO ....................2.59.99Gravado21.00ModoSumaMontoIIFijoMonto1.99DisplayNoModoPrecioTotal1779123456798C1131Kilo
  // '
  // 'AProducto de fabricación nacional .................0
  // 'AOrigen: Mendoza ..................................0
  // 'AProducto de exportación ..........................0
  // 'APresentación: Bolsa x Kilo .......................0
  // 'BCARAMELOS NUEVE ...................2.59.99Gravado21.00ModoSumaMontoIIFijoMonto1.99DisplayNoModoPrecioTotal1779123456799C1131Kilo
  // '
  // 'AProducto de fabricación nacional .................0
  // 'AOrigen: San Luis .................................0
  // 'AProducto de exportación ..........................0
  // 'APresentación: Bolsa x Kilo .......................0
  // 'BCARAMELOS DIEZ ....................2.59.99Gravado21.00ModoSumaMontoIIFijoMonto1.99DisplayNoModoPrecioTotal1779123456800C1131Kilo
  // '
  // 'aPercepcionIIBBPercepción Ingresos Brutos ....165.3019.99
  // 'aPercepcionImpuestosMunicipalesPercepción Imp Municipal ......165.3019.99
  // '
  // 'DEfectivo ........................................289.78PagarDisplayNOPesos Argentinos ................................Efectivo
  // 'E

end;

// ====================================================================================================================
// Impresión de un Presupuesto 'X' clase 'A'.
// ====================================================================================================================

procedure Tdm.CommandPRESUP_Click;

var
  respabrir: RespuestaAbrirDocumento;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('IMPRIMIENDO - PRESUPUESTO " X " Clase " A ":' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      ResponsableInscripto, TipoCUIT, 'Domicilio Cliente...',
      'Domicilio extensión 1...', 'Domicilio extensión 2...',
      'Domicilio extensión 3....');
    respabrir := HASARNG.AbrirDocumento(PresupuestoX);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (abrir);Presupuesto " X " Nro.  := [' +
      intToStr(respabrir.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);

    respcierre := HASARNG.CerrarDocumento(0, 'hasarventas@hasar.com');

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (cerrar);Presupuesto " X " Nro. := [' +
     IntToStr(respcierre.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - Páginas                      := [' +
     IntToStr(respcierre.CantidadDePaginas) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('PRESUPUESTO " X " IMPRESO !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Establecer conexión con la impresora fiscal y consultar estado fiscal, y de impresora, actual.
// ====================================================================================================================

procedure Tdm.CommandProtocolo_Click;
//var
  //stprn: EstadoImpresora;
  //?resp: RespuestaConsultarVersion;

begin
  Try
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('========================================' , wideChars, 12));
    OutputDebugString(StringToWideChar('VERIFICANDO CONEXION A IMPRESORA FISCAL:' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('ETHERNET - Conectando a... 10.0.7.69' , wideChars, 12));
    OutputDebugString(StringToWideChar('ETHERNET - Conectando a... 127.0.0.1' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    HASARNG.Conectar('10.0.7.69',0);
    HASARNG.Conectar('127.0.0.1',0);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('CONECTADO ! ...' , wideChars, 12));

    CommandObtStImpr_Click;
    CommandObtStFiscal_Click;
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar('OCX FISCAL HASAR NG versión := [' +
      IntToStr(HASARNG.ObtenerVersion) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    CommandConsModvers_Click;
    OutputDebugString(StringToWideChar('========================================' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Consultar rango de fechas, o números de cierres 'Z'.
// ====================================================================================================================

procedure Tdm.CommandRangoZ_Click;

var
  resp1: RespuestaObtenerRangoFechasPorZetas;

  resp2: RespuestaObtenerRangoZetasPorFechas;

begin
  Try
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('CONSULTA RANGO NUMEROS DE CIERRES " Z ":' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('Rango consultado: 01/01/2015 al 31/12/2015...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    resp2 := HASARNG.ObtenerRangoZetasPorFechas(01/01/2014, 31/12/2015);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('Nro. " Z " inicial  := [' + IntToStr(resp2.ZetaInicial) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('Nro. " Z " final    := [' + IntToStr(resp2.ZetaFinal) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar('CONSULTA RANGO FECHAS DE CIERRES " Z ":' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('Rango consultado: 1 al 4000...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    resp1 := HASARNG.ObtenerRangoFechasPorZetas(1, 4000);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('Fecha " Z " inicial := [' + DateToStr(resp1.FechaInicial) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('Fecha " Z " final   := [' + DateToStr(resp1.FechaFinal) + ']'

      , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('FIN DE LA CONSULTA !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Impresión de un Recibo X'.
// ====================================================================================================================

procedure Tdm.CommandRBOX_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

//?  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('IMPRIMIENDO - RECIBO " X ":' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    HASARNG.CargarDocumentoAsociado(1, TiqueFacturaA, 2019, 1458);
    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      ResponsableInscripto, TipoCUIT, 'Domicilio Cliente...',
      'Domicilio extensión 1...', 'Domicilio extensión 2...',
      'Domicilio extensión 3....');
    respabrir := HASARNG.AbrirDocumento(ReciboX);
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - (abrir); Recibo " X " Nro. := [' +
      intToStr(respabrir.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    HASARNG.ImprimirItem('Item a la venta...', 1, 3500, Gravado, 0,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    HASARNG.ImprimirConceptoRecibo('Alquiler mes de Marzo de 2015...');

    resppago := HASARNG.ImprimirPago('Efectivo...', 3500, Pagar, DisplayNo, '',
      Efectivo, 0, '');
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - Pagando... Cambio       := [' + FloatToStr(resppago.Saldo) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    respcierre := HASARNG.CerrarDocumento(0, 'hasarventas@hasar.com');
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (cerrar);Recibo " X " Nro. := [' +
     IntToStr(respcierre.NumeroComprobante) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - Páginas                 := [' +
     IntToStr(respcierre.CantidadDePaginas) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('RECIBO " X " IMPRESO !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Se pide otro ejemplar del último comprobante emitido.
// ====================================================================================================================

procedure Tdm.CommandReimpr_Click;

var
  resp: RespuestaPedirReimpresion;
begin
  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('REIMPRESION COMPROBANTE:' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    resp := HASARNG.PedirReimpresion;
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('Copia Nro. := [' +intToStr(resp.NumeroDeCopia) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('FIN DE LA REIMPRESION !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Impresión de un Remito 'R'.
// ====================================================================================================================

procedure Tdm.CommandRTOR_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('IMPRIMIENDO - REMITO " R ":' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      ResponsableInscripto, TipoCUIT, 'Domicilio Cliente...',
      'Domicilio extensión 1...', 'Domicilio extensión 2...',
      'Domicilio extensión 3....');
    HASARNG.CargarTransportista('Razón Social Transportista...', '12345678903',
      'Domicilio Transportista...', 'Nombre del Chofer...', TipoCI, '12345678',
      'ABC123', 'DEF456');
    HASARNG.CargarDocumentoAsociado(1, TiqueFacturaA, 2019, 1458);
    respabrir := HASARNG.AbrirDocumento(RemitoR);
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - (abrir); Remito " R " Nro. := [' +
      intToStr(respabrir.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    resppago := HASARNG.ImprimirPago('Efectivo...', 100, Pagar, DisplayNo, '',
      Efectivo, 0, '');
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - Pagando... Cambio       := [' + FloatToStr(resppago.Saldo) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    respcierre := HASARNG.CerrarDocumento(0, 'hasarventas@hasar.com');

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (cerrar);Remito " R " Nro. := [' +
     IntToStr(respcierre.NumeroComprobante) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - Páginas                 := [' +
     IntToStr(respcierre.CantidadDePaginas) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('REMITO " R " IMPRESO !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Impresión de un Remito X'.
// ====================================================================================================================

procedure Tdm.CommandRTOX_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('IMPRIMIENDO - REMITO " X ":' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      ResponsableInscripto, TipoCUIT, 'Domicilio Cliente...',
      'Domicilio extensión 1...', 'Domicilio extensión 2...',
      'Domicilio extensión 3....');
    HASARNG.CargarTransportista('Razón Social Transportista...', '12345678903',
      'Domicilio Transportista...', 'Nombre del Chofer...', TipoCI, '12345678',
      'ABC123', 'DEF456');
    HASARNG.CargarDocumentoAsociado(1, TiqueFacturaA, 2019, 1458);
    respabrir := HASARNG.AbrirDocumento(RemitoX);
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - (abrir); Remito " X " Nro.  := [' +
      intToStr(respabrir.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    resppago := HASARNG.ImprimirPago('Efectivo...', 100, Pagar, DisplayNo, '',
      Efectivo, 0, '');
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - Pagando... Cambio        := [' + FloatToStr(resppago.Saldo) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    respcierre := HASARNG.CerrarDocumento(0, 'hasarventas@hasar.com');

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (cerrar); Remito " X " Nro. := [' +
     IntToStr(respcierre.NumeroComprobante) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - Páginas                  := [' +
     IntToStr(respcierre.CantidadDePaginas) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('CREMITO " X " IMPRESO !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Se abandona la aplicación.
// ====================================================================================================================

procedure Tdm.CommandSalir_Click;
begin

  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('...Oh !.................................................' , wideChars, 12));

  OutputDebugString(StringToWideChar('...................CERRANDO PROGRAMA....................' , wideChars, 12));

  OutputDebugString(StringToWideChar('...............................................Chau !...' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  exit; // End

end;

// ====================================================================================================================
// Consulta de subtotal.
// ====================================================================================================================

procedure Tdm.CommandSubtot_Click;

var
  respsubt: RespuestaConsultarSubtotal;
begin
  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('CONSULTA SUBTOTAL:' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    respsubt := HASARNG.ConsultarSubtotal(NoImprimeSubtotal, DisplayNo);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('Cant. Items    := [' + FloatToStr(respsubt.CantidadItems) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('Subtotal       := [' + FloatToStr(respsubt.Subtotal) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('Base imponible := [' + FloatToStr(respsubt.MontoBase) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('IVA            := [' + FloatToStr(respsubt.MontoIVA) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Imp. Internos  := [' + FloatToStr(respsubt.MontoImpInternos) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar('Otros tributos := [' + FloatToStr(respsubt.MontoOtrosTributos) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('Pagado         := [' + FloatToStr(respsubt.MontoPagado) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('FIN DE LA CONSULTA !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Impresión de un Tique Factura 'A'.
// ====================================================================================================================

procedure Tdm.CommandTFA_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar('IMPRIMIENDO - TIQUE FACTURA " A " /  A CON LEYENDA :' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      ResponsableInscripto, TipoCUIT, 'Domicilio Cliente...',
      'Domicilio extensión 1...', 'Domicilio extensión 2...',
      'Domicilio extensión 3....');
    respabrir := HASARNG.AbrirDocumento(TiqueFacturaA);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (abrir); Tique Factura " A " Nro.  := [' +
      intToStr(respabrir.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0.00000001, DisplayNo,
      ModoPrecioBase, 1, '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioBase);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, 0, '');
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - Pagando... Cambio               := [' + FloatToStr(resppago.Saldo) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    respcierre := HASARNG.CerrarDocumento(0, 'hasarventas@hasar.com');

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (cerrar); Tique Factura " A " Nro. := [' +
     IntToStr(respcierre.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - Páginas                         := [' +
     IntToStr(respcierre.CantidadDePaginas) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('TIQUE FACTURA " A " IMPRESO !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Impresión de un Tique Factura 'B'.
// ====================================================================================================================

procedure Tdm.CommandTFB_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('IMPRIMIENDO - TIQUE FACTURA " B ":' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
      'Domicilio extensión 2...', 'Domicilio extensión 3....');
    respabrir := HASARNG.AbrirDocumento(TiqueFacturaB);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (abrir); Tique Factura " B " Nro.  := [' +
      intToStr(respabrir.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0.00000001, DisplayNo,
      ModoPrecioBase, 1, '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioBase);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, 0, '');
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - Pagando... Cambio               := [' + FloatToStr(resppago.Saldo) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    respcierre := HASARNG.CerrarDocumento(0, 'hasarventas@hasar.com');

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (cerrar); Tique Factura " B " Nro. := [' +
     IntToStr(respcierre.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - Páginas                         := [' +
     IntToStr(respcierre.CantidadDePaginas) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('TIQUE FACTURA " B " IMPRESO !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Impresión de un Tique Factura 'C'.
// ====================================================================================================================

procedure Tdm.CommandTFC_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('IMPRIMIENDO - TIQUE FACTURA " C ":' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
      'Domicilio extensión 2...', 'Domicilio extensión 3....' );
    respabrir := HASARNG.AbrirDocumento(TiqueFacturaC);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (abrir); Tique Factura " C " Nro.  := [' +
      intToStr(respabrir.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, 0, '');
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - Pagando... Cambio               := [' + FloatToStr(resppago.Saldo) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    respcierre := HASARNG.CerrarDocumento(0, 'hasarventas@hasar.com');

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (cerrar); Tique Factura " C " Nro. := [' +
     IntToStr(respcierre.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - Páginas                         := [' +
     IntToStr(respcierre.CantidadDePaginas) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('TIQUE FACTURA " C "IMPRESO !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Impresión de un Tique Factura 'M'.
// ====================================================================================================================

procedure Tdm.CommandTFM_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('IMPRIMIENDO - TIQUE FACTURA " M ":' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
      'Domicilio extensión 2...', 'Domicilio extensión 3....' );
    respabrir := HASARNG.AbrirDocumento(TiqueFacturaM);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (abrir); Tique Factura " M " Nro.  := [' +
      intToStr(respabrir.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, 0, '');
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - Pagando... Cambio               := [' + FloatToStr(resppago.Saldo) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    respcierre := HASARNG.CerrarDocumento(0, 'hasarventas@hasar.com');

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (cerrar); Tique Factura " M " Nro. := [' +
     IntToStr(respcierre.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - Páginas                         := [' +
     IntToStr(respcierre.CantidadDePaginas) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('TIQUE FACTURA " M "IMPRESO !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Impresión de un Tique a Consumidor Final.
// ====================================================================================================================

procedure Tdm.CommandTique_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('IMPRIMIENDO - TIQUE A CONSUMIDOR FINAL:' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    respabrir := HASARNG.AbrirDocumento(Tique);
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - (abrir); Tique Cons. Final Nro.  := [' +
      intToStr(respabrir.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0.00000001, DisplayNo,
      ModoPrecioBase, 1, '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioBase);

    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, 0, '');
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - Pagando... Cambio               := [' + FloatToStr(resppago.Saldo) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    respcierre := HASARNG.CerrarDocumento(0, 'hasarventas@hasar.com');

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (cerrar); Tique Cons. Final Nro. := [' +
     IntToStr(respcierre.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - Páginas                         := [' +
     IntToStr(respcierre.CantidadDePaginas) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('TIQUE A CONSUMIDOR FINAL IMPRESO !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Impresión de un Tique Nota de Crédito a Consumidor Final.
// ====================================================================================================================

procedure Tdm.CommandTiqueNC_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar('IMPRIMIENDO - TIQUE NOTA DE CREDITO A CONSUMIDOR FINAL:' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    respabrir := HASARNG.AbrirDocumento(TiqueNotaCredito);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (abrir); Tique Nota de Crédito a Cons. Final Nro.  := [' +
      intToStr(respabrir.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, 0, '');
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - Pagando... Cambio                                 := [' +
      FloatToStr(resppago.Saldo) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    respcierre := HASARNG.CerrarDocumento(0, 'hasarventas@hasar.com');

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (cerrar); Tique Nota de Crédito a Cons. Final Nro. := [' +
     IntToStr(respcierre.NumeroComprobante) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - Páginas                                           := [' +
     IntToStr(respcierre.CantidadDePaginas) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar('TIQUE NOTA DE CREDITO A CONSUMIDOR FINAL IMPRESO !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Impresión de un Tique Nota de Crédito 'A'.
// ====================================================================================================================

procedure Tdm.CommandTNCA_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar('IMPRIMIENDO - TIQUE NOTA DE CREDITO " A " /  A CON LEYENDA :' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      ResponsableInscripto, TipoCUIT, 'Domicilio Cliente...',
      'Domicilio extensión 1...', 'Domicilio extensión 2...',
      'Domicilio extensión 3....' );
    respabrir := HASARNG.AbrirDocumento(TiqueNotaCreditoA);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (abrir); Tique Nota de Crédito " A " Nro.  := [' +
      intToStr(respabrir.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, 0, '');
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - Pagando... Cambio                       := [' +
      FloatToStr(resppago.Saldo) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    respcierre := HASARNG.CerrarDocumento(0, 'hasarventas@hasar.com');

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (cerrar); Tique Nota de Crédito " A " Nro. := [' +
     IntToStr(respcierre.NumeroComprobante) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - Páginas                                 := [' +
     IntToStr(respcierre.CantidadDePaginas) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('TIQUE NOTA DE CREDITO " A " IMPRESO !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Impresión de un Tique Nota de Crédito 'B'.
// ====================================================================================================================

procedure Tdm.CommandTNCB_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('IMPRIMIENDO - TIQUE NOTA DE CREDITO " B ":' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
      'Domicilio extensión 2...', 'Domicilio extensión 3....' );
    respabrir := HASARNG.AbrirDocumento(TiqueNotaCreditoB);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (abrir); Tique Nota de Crédito " B " Nro.  := [' +
      intToStr(respabrir.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, 0, '');
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - Pagando... Cambio                       := [' +
      FloatToStr(resppago.Saldo) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    respcierre := HASARNG.CerrarDocumento(0, 'hasarventas@hasar.com');

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (cerrar); Tique Nota de Crédito " B " Nro. := [' +
     IntToStr(respcierre.NumeroComprobante) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - Páginas                                 := [' +
     IntToStr(respcierre.CantidadDePaginas) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('TIQUE NOTA DE CREDITO " B " IMPRESO !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Impresión de un Tique Nota de Crédito 'C'.
// ====================================================================================================================

procedure Tdm.CommandTNCC_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('IMPRIMIENDO - TIQUE NOTA DE CREDITO " C ":' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
      'Domicilio extensión 2...', 'Domicilio extensión 3....' );
    respabrir := HASARNG.AbrirDocumento(TiqueNotaCreditoC);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (abrir); Tique Nota de Crédito " C " Nro.  := [' +
      intToStr(respabrir.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, 0, '');
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - Pagando... Cambio                       := [' +
      FloatToStr(resppago.Saldo) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    respcierre := HASARNG.CerrarDocumento(0, 'hasarventas@hasar.com');

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (cerrar); Tique Nota de Crédito " C " Nro. := [' +
     IntToStr(respcierre.NumeroComprobante) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - Páginas                                 := [' +
     IntToStr(respcierre.CantidadDePaginas) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('TIQUE NOTA DE CREDITO " C " IMPRESO !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Impresión de un Tique Nota de Crédito 'M'.
// ====================================================================================================================

procedure Tdm.CommandTNCM_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('IMPRIMIENDO - TIQUE NOTA DE CREDITO " M ":' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
      'Domicilio extensión 2...', 'Domicilio extensión 3....' );
    respabrir := HASARNG.AbrirDocumento(TiqueNotaCreditoM);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (abrir); Tique Nota de Crédito " M " Nro.  := [' +
      intToStr(respabrir.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, 0, '');
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - Pagando... Cambio                       := [' +
      FloatToStr(resppago.Saldo) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    respcierre := HASARNG.CerrarDocumento(0, 'hasarventas@hasar.com');

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (cerrar); Tique Nota de Crédito " M " Nro. := [' +
     IntToStr(respcierre.NumeroComprobante) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - Páginas                                 := [' +
     IntToStr(respcierre.CantidadDePaginas) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('TIQUE NOTA DE CREDITO " M " IMPRESO !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Impresión de un Tique Nota de Débito 'A'.
// ====================================================================================================================

procedure Tdm.CommandTNDA_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar('IMPRIMIENDO - TIQUE NOTA DE DEBITO " A " /  A CON LEYENDA :' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      ResponsableInscripto, TipoCUIT, 'Domicilio Cliente...',
      'Domicilio extensión 1...', 'Domicilio extensión 2...',
      'Domicilio extensión 3....' );
    respabrir := HASARNG.AbrirDocumento(TiqueNotaDebitoA);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (abrir); Tique Nota de Débito " A " Nro.  := [' +
      intToStr(respabrir.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, 0, '');
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - Pagando... Cambio                      := [' +
      FloatToStr(resppago.Saldo) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    respcierre := HASARNG.CerrarDocumento(0, 'hasarventas@hasar.com');

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (cerrar); Tique Nota de Débito " A " Nro. := [' +
     IntToStr(respcierre.NumeroComprobante) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - Páginas                                := [' +
     IntToStr(respcierre.CantidadDePaginas) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('TIQUE NOTA DE DEBITO " A " IMPRESO !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Impresión de un Tique Nota de Débito 'B'.
// ====================================================================================================================

procedure Tdm.CommandTNDB_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('IMPRIMIENDO - TIQUE NOTA DE DEBITO " B ":' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
      'Domicilio extensión 2...', 'Domicilio extensión 3....' );
    respabrir := HASARNG.AbrirDocumento(TiqueNotaDebitoB);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (abrir); Tique Nota de Débito " B " Nro.  := [' +
      intToStr(respabrir.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, 0, '');
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - Pagando... Cambio                      := [' +
      FloatToStr(resppago.Saldo) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    respcierre := HASARNG.CerrarDocumento(0, 'hasarventas@hasar.com');

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (cerrar); Tique Nota de Débito " B " Nro. := [' +
     IntToStr(respcierre.NumeroComprobante) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - Páginas                                := [' +
     IntToStr(respcierre.CantidadDePaginas) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('TIQUE NOTA DE DEBITO " B " IMPRESO !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Impresión de un Tique Nota de Débito 'C'.
// ====================================================================================================================

procedure Tdm.CommandTNDC_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('IMPRIMIENDO - TIQUE NOTA DE DEBITO " C ":' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
      'Domicilio extensión 2...', 'Domicilio extensión 3....' );
    respabrir := HASARNG.AbrirDocumento(NotaDeDebitoC);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (abrir); Tique Nota de Débtio " C " Nro.  := [' +
      intToStr(respabrir.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, 0, '');
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - Pagando... Cambio                      := [' +
      FloatToStr(resppago.Saldo) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    respcierre := HASARNG.CerrarDocumento(0, 'hasarventas@hasar.com');

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (cerrar); Tique Nota de Débtio " C " Nro. := [' +
     IntToStr(respcierre.NumeroComprobante) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - Páginas                                := [' +
     IntToStr(respcierre.CantidadDePaginas) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('TIQUE NOTA DE DEBITO " C " IMPRESO !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Impresión de un Tique Nota de Débito 'M'.
// ====================================================================================================================

procedure Tdm.CommandTNDM_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('IMPRIMIENDO - TIQUE NOTA DE DEBITO " M ":' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
      'Domicilio extensión 2...', 'Domicilio extensión 3....' );
    respabrir := HASARNG.AbrirDocumento(NotaDeDebitoM);
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (abrir); Tique Nota de Débito " M " Nro.  := [' +
      intToStr(respabrir.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, 0, '');
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - Pagando... Cambio                      := [' +
      FloatToStr(resppago.Saldo) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    respcierre := HASARNG.CerrarDocumento(0, 'hasarventas@hasar.com');

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (cerrar); Tique Nota de Débito " M " Nro. := [' +
     IntToStr(respcierre.NumeroComprobante) + ']' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - Páginas                                := [' +
     IntToStr(respcierre.CantidadDePaginas) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('TIQUE NOTA DE DEBITO " M " IMPRESO !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Impresión de un Tique Recibo 'A'.
// ====================================================================================================================

procedure Tdm.CommandTRA_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar('IMPRIMIENDO - TIQUE RECIBO " A " /  A CON LEYENDA :' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      ResponsableInscripto, TipoCUIT, 'Domicilio Cliente...',
      'Domicilio extensión 1...', 'Domicilio extensión 2...',
      'Domicilio extensión 3....' );
    respabrir := HASARNG.AbrirDocumento(ReciboA);
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - (abrir); Tique Recibo " A " Nro.  := [' +
      intToStr(respabrir.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, 0, '');
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar('Pagando... Cambio                 := [' + FloatToStr(resppago.Saldo) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    respcierre := HASARNG.CerrarDocumento(0, 'hasarventas@hasar.com');

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (cerrar); Tique Recibo " A " Nro. := [' +
     IntToStr(respcierre.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - Páginas                        := [' +
     IntToStr(respcierre.CantidadDePaginas) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('TIQUE RECIBO " A " IMPRESO !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Impresión de un Tique Recibo 'B'.
// ====================================================================================================================

procedure Tdm.CommandTRB_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('IMPRIMIENDO - TIQUE RECIBO " B ":' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
      'Domicilio extensión 2...', 'Domicilio extensión 3....' );
    respabrir := HASARNG.AbrirDocumento(ReciboB);
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - (abrir); Tique Recibo " B " Nro.  := [' +
      intToStr(respabrir.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, 0, '');
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - Pagando... Cambio              := [' + FloatToStr(resppago.Saldo) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    respcierre := HASARNG.CerrarDocumento(0, 'hasarventas@hasar.com');

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (cerrar); Tique Recibo " B " Nro. := [' +
     IntToStr(respcierre.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - Páginas                        := [' +
     IntToStr(respcierre.CantidadDePaginas) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('TIQUE RECIBO " B " IMPRESO !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Impresión de un Tique Recibo 'C'.
// ====================================================================================================================

procedure Tdm.CommandTRC_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('IMPRIMIENDO - TIQUE RECIBO " C ":' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
      'Domicilio extensión 2...', 'Domicilio extensión 3....' );
    respabrir := HASARNG.AbrirDocumento(ReciboC);
    OutputDebugString(StringToWideChar(' - (abrir); Tique Recibo " C " Nro.  := [' +
      intToStr(respabrir.NumeroComprobante) + ']' , wideChars, 12));

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, 0, '');
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - Pagando... Cambio              := [' + FloatToStr(resppago.Saldo) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    respcierre := HASARNG.CerrarDocumento(0, 'hasarventas@hasar.com');

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (cerrar); Tique Recibo " C " Nro. := [' +
     IntToStr(respcierre.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - Páginas                        := [' +
     IntToStr(respcierre.CantidadDePaginas) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('TIQUE RECIBO " C " IMPRESO !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Impresión de un Tique Recibo 'M'.
// ====================================================================================================================

procedure Tdm.CommandTRM_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('IMPRIMIENDO - TIQUE RECIBO " M ":' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
      'Domicilio extensión 2...', 'Domicilio extensión 3....' );
    respabrir := HASARNG.AbrirDocumento(ReciboM);
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - (abrir); Tique Recibo " M " Nro.  := [' +
      intToStr(respabrir.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, 0, '');
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar(' - Pagando... Cambio              := [' + FloatToStr(resppago.Saldo) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    respcierre := HASARNG.CerrarDocumento(0, 'hasarventas@hasar.com');

    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - (cerrar); Tique Recibo " M " Nro. := [' +
     IntToStr(respcierre.NumeroComprobante) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar(' - Páginas                        := [' +
     IntToStr(respcierre.CantidadDePaginas) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('TIQUE RECIBO " M " IMPRESO !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Se consulta el número de la 'Z' establecida como límite para el borrado de la CTD (Cinta testigo Digital); .
// ====================================================================================================================

procedure Tdm.CommandZBorr_Click;

var
  resp: RespuestaConsultarZetaBorrable;
begin
  OutputDebugString(StringToWideChar('' , wideChars, 12));
  OutputDebugString(StringToWideChar('CONSULTA LIMITE BORRADO CIERRES " Z ":' , wideChars, 12));
  OutputDebugString(StringToWideChar('' , wideChars, 12));

  Try
    resp := HASARNG.ConsultarZetaBorrable;
    OutputDebugString(StringToWideChar('' , wideChars, 12));

    OutputDebugString(StringToWideChar('Límite Cierre " Z " Nro. := [' +intToStr(resp.NumeroZeta) + ']' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));
    OutputDebugString(StringToWideChar('FIN DE LA CONSULTA !...' , wideChars, 12));
    OutputDebugString(StringToWideChar('' , wideChars, 12));

  except
    on E: Exception do
      OutputDebugString(StringToWideChar('Error := ' + (E.ClassName) + ' : ' + (E.Message), wideChars, 12));
  end;

end;

// ====================================================================================================================
// Carga de la ventana principal.
// Se activa el archivo de registro de actividades del OCX.
// ====================================================================================================================

procedure Form_Load;
begin

  HASARNG.ArchivoRegistro('ocx.log');

end;

// ====================================================================================================================
// Procesando comando actual.
// ====================================================================================================================

procedure HASARNG_ComandoEnProceso;
begin

  // if Not(proc) then
  begin
    OutputDebugString(StringToWideChar('Comando en proceso...' , wideChars, 12));
    // proc := True;

  end;

end;

// ====================================================================================================================
// Fin de procesamiento del comando enviado.
// ====================================================================================================================

procedure HASARNG_ComandoProcesado;
begin

  OutputDebugString(StringToWideChar('Comando procesado !' , wideChars, 12));
  // proc := False;

end;

// ====================================================================================================================
// Procesamiento del evento impresora.
// ====================================================================================================================

procedure HASARNG_EventoImpresora(Estado: EstadoImpresora);
begin

  OutputDebugString(StringToWideChar('Evento impresora...' , wideChars, 12));
//?  OutputDebugString(StringToWideChar('Estado := [' + (Estado) + ']' , wideChars, 12));

end;

end.
