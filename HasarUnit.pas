unit HasarUnit;

// ###################################################################################################################
// Impresoras Fiscales HASAR - 2da. Generación                                     OCX Fiscal HASAR - 2da. Generación
// RG AFIP Nº 3561/13 - Controladores Fiscales Nueva tecnología                    Ejemplo de uso
// Dto. Software de Base - Compañía HASAR SAIC - Grupo HASAR                       Marzo 2015
// ###################################################################################################################
interface

uses
  HasarArgentina_TLB;

type
  HASARNG = ImpresoraFiscalRG3561;

implementation

// Option Explicit

// ====================================================================================================================
// Comando de apertura del cajón de dinero.
// ====================================================================================================================
{ Private Sub }
procedure CommandAbrirCaj_Click;

// Debug.Print
// Debug.Print 'ABRIENDO CAJON DE DINERO...'
// Debug.Print

begin // On Error GoTo keka
  HASARNG.AbrirCajonDinero;

  // Debug.Print
  // Debug.Print 'CAJON DE DINERO ABIERTO !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Impresión de un informe de aditoría por fechas.
// ====================================================================================================================
{ Private Sub }
procedure CommandAudit_Click;

// Debug.Print
// Debug.Print 'IMPRIMIENDO REPORTE DE AUDITORIA POR FECHAS...'
// Debug.Print

begin // On Error GoTo keka
  HASARNG.ReportarZetasPorFecha('23/02/2015', '25/02/2015',
    ReporteAuditoriaGlobal);

  // Debug.Print
  // Debug.Print 'REPORTE IMPRESO !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Comandos de avance de papel.
// ====================================================================================================================
{ Private Sub }
procedure CommandAvanzPap_Click;

// Debug.Print
// Debug.Print 'AVANZANDO PAPEL...'
// Debug.Print

begin // On Error GoTo keka
  HASARNG.AvanzarPapelAmbasEstaciones(3);
  // Debug.Print '3 líneas en tique/rollo testigo.'

  HASARNG.AvanzarPapelEstacionAuditoria(3);
  // Debug.Print '3 líneas en rollo testigo, solamente.'

  HASARNG.AvanzarPapelEstacionTique(3);
  // Debug.Print '3 líneas en tique, solamente.'

  // Debug.Print
  // Debug.Print 'FIN DE AVANCE DE PAPEL...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Se elimina el logo del emisor de la memoria de trabajo de la impresora fiscal.
// ====================================================================================================================
{ Private Sub }
procedure CommandBorrarLogo_Click;

// Debug.Print
// Debug.Print 'ELIMINANDO LOGO DEL EMISOR...'
// Debug.Print

begin // On Error GoTo keka
  HASARNG.EliminarLogoEmisor;

  // Debug.Print
  // Debug.Print 'LOGO ELIMINADO !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Se cancela el comprobante en curso de emisión.
// ====================================================================================================================
{ Private Sub }
procedure CommandCancel_Click;

// Debug.Print
// Debug.Print 'CANCELANDO COMPROBANTE ABIERTO...'
// Debug.Print

begin // On Error GoTo keka
  HASARNG.Cancelar;

  // Debug.Print
  // Debug.Print 'CANCELADO !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Consulta de capacidades de la impresora fiscal
// ====================================================================================================================
{ Private Sub }
procedure CommandCapac_Click;
{ Dim }
var
  respcapac: RespuestaConsultarCapacidadesImpresoraFiscal;

  // Debug.Print
  // Debug.Print 'CONSULTANDO CAPACIDADES DE LA IMPRESORA FISCAL...'
  // Debug.Print

begin // On Error GoTo keka
  respcapac := HASARNG.ConsultarCapacidadesImpresoraFiscal(AltoLogo,
    EstacionTicket, TiqueFacturaA);
  // Debug.Print 'Alto logotipo             := [' & respcapac.Valor & ']'
  // Debug.Print
  respcapac := HASARNG.ConsultarCapacidadesImpresoraFiscal(AnchoLogo,
    EstacionTicket, TiqueFacturaA);
  // Debug.Print 'Ancho logotipo            := [' & respcapac.Valor & ']'
  // Debug.Print
  respcapac := HASARNG.ConsultarCapacidadesImpresoraFiscal(AnchoRazonSocial,
    EstacionTicket, TiqueFacturaA);
  // Debug.Print 'Ancho razón social        := [' & respcapac.Valor & ']'
  // Debug.Print
  respcapac := HASARNG.ConsultarCapacidadesImpresoraFiscal(AnchoTextoFiscal,
    EstacionTicket, TiqueFacturaA);
  // Debug.Print 'Ancho texto fiscal        := [' & respcapac.Valor & ']'
  // Debug.Print
  respcapac := HASARNG.ConsultarCapacidadesImpresoraFiscal
    (AnchoTextoLineasUsuario, EstacionTicket, TiqueFacturaA);
  // Debug.Print 'Ancho líneas usuario      := [' & respcapac.Valor & ']'
  // Debug.Print
  respcapac := HASARNG.ConsultarCapacidadesImpresoraFiscal(AnchoTextoNoFiscal,
    EstacionTicket, TiqueFacturaA);
  // Debug.Print 'Ancho texto no fiscal     := [' & respcapac.Valor & ']'
  // Debug.Print
  respcapac := HASARNG.ConsultarCapacidadesImpresoraFiscal(AnchoTextoVenta,
    EstacionTicket, TiqueFacturaA);
  // Debug.Print 'Ancho texto venta         := [' & respcapac.Valor & ']'
  // Debug.Print
  respcapac := HASARNG.ConsultarCapacidadesImpresoraFiscal(AnchoTotalImpresion,
    EstacionTicket, TiqueFacturaA);
  // Debug.Print 'Ancho total impresión     := [' & respcapac.Valor & ']'
  // Debug.Print
  respcapac := HASARNG.ConsultarCapacidadesImpresoraFiscal(SoportaCajon,
    EstacionPorDefecto, NoDocumento);
  // Debug.Print 'Soporta cajón dinero      := [' & respcapac.Valor & ']'
  // Debug.Print
  respcapac := HASARNG.ConsultarCapacidadesImpresoraFiscal(SoportaEstacion,
    EstacionTicket, TiqueFacturaA);
  // Debug.Print 'Soporta estación tique    := [' & respcapac.Valor & ']'
  // Debug.Print
  respcapac := HASARNG.ConsultarCapacidadesImpresoraFiscal(SoportaComprobante,
    EstacionTicket, TiqueFacturaA);
  // Debug.Print 'Soporta tique factura 'A' := [' & respcapac.Valor & ']'

  // Debug.Print
  // Debug.Print 'FIN DE LA CONSULTA !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Cargar imagen de logotipo del emisor en la memoria de trabajo de la impresora fiscal.
// ====================================================================================================================
{ Private Sub }
procedure CommandCargaLogo_Click;

// Debug.Print
// Debug.Print 'CARGANDO LOGO EMISOR...'
// Debug.Print

begin // On Error GoTo keka
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

  // Debug.Print
  // Debug.Print 'LOGO DEL EMISOR CARGADO !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Configurar velocidad de transferencia de información (baudios); del puerto serie RS-232.
// ====================================================================================================================
{ Private Sub }
procedure CommandCfgBaudios_Click;

// Debug.Print
// Debug.Print 'CONFIGURANDO BAUDIOS RS-232...'
// Debug.Print

begin // On Error GoTo keka
  HASARNG.CambiarVelocidadPuerto(Baudrate9600);
  // Debug.Print 'Baudios := 9600'

  // Debug.Print
  // Debug.Print 'FIN DE LA CONFIGURACION !...'

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Configurar fecha y hora en la impresora fiscal.
// ====================================================================================================================
{ Private Sub }
procedure CommandCfgFyh_Click;

// Debug.Print
// Debug.Print 'CONFIGURANDO FECHA Y HORA...'
// Debug.Print

begin // On Error GoTo keka
  HASARNG.ConfigurarFechaHora('06/03/2015', '10:49:45');

  // Debug.Print
  // Debug.Print 'FIN DE LA CONFIGURACION !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Configurar parámetros de comportamiento de la impresora fiscal.
// ====================================================================================================================
{ Private Sub }
procedure CommandCfgImprFis_Click;

// Debug.Print
// Debug.Print 'CONFIGURANDO PARAMETROS IMPRESORA FISCAL...'
// Debug.Print

begin // On Error GoTo keka
  // Debug.Print 'Borrado automático CTD        := P'
  HASARNG.ConfigurarImpresoraFiscal(BorradoAutomaticoAuditoria, 'P');
  // Debug.Print

  // Debug.Print 'Verificar supera monto máximo := N'
  HASARNG.ConfigurarImpresoraFiscal(ChequeoDesborde, 'N');
  // Debug.Print

  // Debug.Print 'Corte de papel                := P'
  HASARNG.ConfigurarImpresoraFiscal(CortePapel, 'P');
  // Debug.Print

  // Debug.Print 'Imprimir CAMBIO $0.00         := P'
  HASARNG.ConfigurarImpresoraFiscal(ImpresionCambio, 'P');
  // Debug.Print

  // Debug.Print 'Imprimir leyendas opcionales  := P'
  HASARNG.ConfigurarImpresoraFiscal(ImpresionLeyendas, 'P');
  // Debug.Print

  // Debug.Print 'Texto saldo  pendientes       := Pendiente de pago'
  HASARNG.ConfigurarImpresoraFiscal(PagoSaldo, 'Pendiente de pago');
  // Debug.Print

  // Debug.Print 'Aviso sonoro falta papel      := P'
  HASARNG.ConfigurarImpresoraFiscal(SonidoAviso, 'P');
  // Debug.Print

  // 'Modificar estos parámetros requiere Cierre 'Z' previo.
  // '------------------------------------------------------
  // 'Debug.Print "Monto limite 'B/C'            = 0.00"
  // 'HASARNG.ConfigurarImpresoraFiscal( LimiteBC, "0.00"
  // ' Debug.Print
  //
  // '    Debug.Print "Tipo de habilitación          = A"
  // '    HASARNG.ConfigurarImpresoraFiscal( TipoHabilitacion, "A"
  // 'Debug.Print

  // Debug.Print
  // Debug.Print 'FIN DE LA CONFIGURACION !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Configurar parámetros de conectividad en red.
// ====================================================================================================================
{ Private Sub }
procedure CommandCfgRed_Click;

// Debug.Print
// Debug.Print 'CONFIGURANDO PARAMETROS CONECTIVIDAD EN RED...'
// Debug.Print

begin // On Error GoTo keka
  // Debug.Print 'Dirección IP  := 10.0.7.69'
  // Debug.Print 'Máscara       := 255.255.255.0'
  // Debug.Print 'Puerta enlace := 10.0.7.69'
  HASARNG.ConfigurarRed('10.0.7.69', '255.255.255.0', '10.0.7.69');

  // Debug.Print
  // Debug.Print 'FIN DE LA CONFIGURACION !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Configurar servidor SMHTP para correo electrónico.
// ====================================================================================================================
{ Private Sub }
procedure CommandCfgServCorreo_Click;

// Debug.Print
// Debug.Print 'CONFIGURANDO SERVIDOR SMTP...'
// Debug.Print

begin // On Error GoTo keka
  // Debug.Print 'IP SMTP     := 200.80.204.3'
  // Debug.Print 'Puerto      := 465'
  // Debug.Print 'Responder a := hasarventas@hasar.com'
  HASARNG.ConfigurarServidorCorreo('200.80.204.3', 465,
    'hasarventas@hasar.com');

  // Debug.Print
  // Debug.Print 'FIN DE LA CONFIGURACION !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Configurar Cierre 'Z' límite para borrado de la CTD.
// ====================================================================================================================
{ Private Sub }
procedure CommandCfgZBorr_Click;

// Debug.Print
// Debug.Print 'CONFIGURANDO LIMITE BORRADO CTD...'
// Debug.Print

begin // On Error GoTo keka
  // Debug.Print 'Límite, Cierre 'Z' Nro. := 1'
  HASARNG.ConfigurarZetaBorrable(1);

  // Debug.Print
  // Debug.Print 'FIN DE LA CONFIGURACION !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Impresión del Informe Diario de Cierre 'Z'.
// ====================================================================================================================
{ Private Sub }
procedure CommandCFgZona_Click;
{ Dim }
var
  estilo: AtributosDeTexto;

  // Debug.Print
  // Debug.Print 'CONFIGURANDO ZONAS LINEAS DE USUARIO...'
  // Debug.Print

begin // On Error GoTo keka
  estilo.Centrado := True;
  HASARNG.ConfigurarZona(1, estilo, 'Texto línea 1 - Fantasía', EstacionTicket,
    ZonaFantasia);
  HASARNG.ConfigurarZona(2, estilo, 'Texto línea 2 - Fantasía', EstacionTicket,
    ZonaFantasia);

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

  // Debug.Print
  // Debug.Print 'FIN de la CONFIGURACION....'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Impresión del Informe Diario de Cierre 'Z'.
// ====================================================================================================================
{ Private Sub }
procedure CommandCierreZ_Click;
{ Dim }
var
  cierre: RespuestaCerrarJornadaFiscal;

begin // On Error GoTo keka
  // Debug.Print
  // Debug.Print 'IMPRIMIENDO INFORME DIARIO DE CIERRE 'Z':'
  // Debug.Print

  cierre := HASARNG.CerrarJornadaFiscal(ReporteZ);
  // Debug.Print
  // Debug.Print 'Reporte...           := [' & cierre.Reporte & ']'
  // Debug.Print
  // Debug.Print 'Cierre Nro.          := [' & cierre.Z.Numero & ']'
  // Debug.Print 'Fecha cierre         := [' & cierre.Z.Fecha & ']'
  // Debug.Print
  // Debug.Print 'DF cancelados        := [' & cierre.Z.DF_CantidadCancelados & ']'
  // Debug.Print 'DF emitidos          := [' & cierre.Z.DF_CantidadEmitidos & ']'
  // Debug.Print
  // Debug.Print 'DF total ventas      := [' & cierre.Z.DF_Total & ']'
  // Debug.Print 'DF total gravado     := [' & cierre.Z.DF_TotalGravado & ']'
  // Debug.Print 'DF total IVA         := [' & cierre.Z.DF_TotalIVA & ']'
  // Debug.Print 'DF total no gravado  := [' & cierre.Z.DF_TotalNoGravado & ']'
  // Debug.Print 'DF total exento      := [' & cierre.Z.DF_TotalExento & ']'
  // Debug.Print 'DF total tributos    := [' & cierre.Z.DF_TotalTributos & ']'
  // Debug.Print
  // Debug.Print 'DNFH emitidos        := [' & cierre.Z.DNFH_CantidadEmitidos & ']'
  // Debug.Print 'DNFH total acumulado := [' & cierre.Z.DNFH_Total & ']'
  // Debug.Print
  // Debug.Print 'NC canceladas        := [' & cierre.Z.NC_CantidadCancelados & ']'
  // Debug.Print 'NC emitidas          := [' & cierre.Z.NC_CantidadEmitidos & ']'
  // Debug.Print 'NC total crédito     := [' & cierre.Z.NC_Total & ']'
  // Debug.Print 'NC total gravado     := [' & cierre.Z.NC_TotalGravado & ']'
  // Debug.Print 'NC total IVA         := [' & cierre.Z.NC_TotalIVA & ']'
  // Debug.Print 'NC total no gravado  := [' & cierre.Z.NC_TotalNoGravado & ']'
  // Debug.Print 'NC total exento      := [' & cierre.Z.NC_TotalExento & ']'
  // Debug.Print 'NC total tributos    := [' & cierre.Z.NC_TotalTributos & ']'

  // Debug.Print
  // Debug.Print 'INFORME DIARIO DE CIERRE 'Z'... IMPRESO !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Consulta de acumulados para determnado comprobante.
// ====================================================================================================================
{ Private Sub }
procedure CommandConsAcumComprob_Click;
{ Dim }
var
  acomprob: RespuestaConsultarAcumuladosComprobante;
  { Dim }
  acomprob2: RespuestaContinuarConsultaAcumulados;

  // Debug.Print
  // Debug.Print 'CONSULTANDO ACUMULADOS COMPROBANTE:'
  // Debug.Print

begin // On Error GoTo keka
  acomprob := HASARNG.ConsultarAcumuladosComprobante(TiqueFacturaA, 13);
  HasarArgentina_TLB.RegistroFinal;

  if (acomprob.Registro = (HasarArgentina_TLB.RegistroFinal)) then
  begin
    // Debug.Print 'NO HAY INFORMACION DISPONIBLE !...'
    // Debug.Print

    // Exit Sub
    { End If } end;

  // Select
  Case acomprob.Registro of
    HasarArgentina_TLB.RegistroDetalladoDF:
      begin
        // Debug.Print
        // Debug.Print 'TIPO REGISTRO:'
        // Debug.Print '[' & acomprob.Registro & ']'
        // Debug.Print
        // Debug.Print 'DF (Documentos Fiscales);:'
        // Debug.Print '-------------------------'
        // Debug.Print 'DF Tipo comprobante        := [' & FromTiposComprobanteToString(acomprob.RegDF.CodigoComprobante); & ']'
        // Debug.Print 'DF Nro. inicial            := [' & acomprob.RegDF.NumeroInicial & ']'
        // Debug.Print 'DF Nro. final              := [' & acomprob.RegDF.NumeroFinal & ']'
        // Debug.Print 'DF cancelados              := [' & acomprob.RegDF.CantidadCancelados & ']'
        // Debug.Print
        // Debug.Print 'DF total ventas            := [' & acomprob.RegDF.Total & ']'
        // Debug.Print 'DF total gravado           := [' & acomprob.RegDF.TotalGravado & ']'
        // Debug.Print 'DF total no gravado        := [' & acomprob.RegDF.TotalNoGravado & ']'
        // Debug.Print 'DF total exento            := [' & acomprob.RegDF.TotalExento & ']'
        // Debug.Print
        // Debug.Print 'DF IVA 1                   := [' & acomprob.RegDF.AlicuotaIVA_1 & ']'
        // Debug.Print 'DF monto IVA 1             := [' & acomprob.RegDF.MontoIVA_1 & ']'
        // Debug.Print 'DF base imponible 1        := [' & acomprob.RegDF.MontoNetoSinIVA_1 & ']'
        // Debug.Print 'DF IVA 2                   := [' & acomprob.RegDF.AlicuotaIVA_2 & ']'
        // Debug.Print 'DF monto IVA 2             := [' & acomprob.RegDF.MontoIVA_2 & ']'
        // Debug.Print 'DF base imponible 2        := [' & acomprob.RegDF.MontoNetoSinIVA_2 & ']'
        // Debug.Print 'DF IVA 3                   := [' & acomprob.RegDF.AlicuotaIVA_3 & ']'
        // Debug.Print 'DF monto IVA 3             := [' & acomprob.RegDF.MontoIVA_3 & ']'
        // Debug.Print 'DF base imponible 3        := [' & acomprob.RegDF.MontoNetoSinIVA_3 & ']'
        // Debug.Print 'DF IVA 4                   := [' & acomprob.RegDF.AlicuotaIVA_4 & ']'
        // Debug.Print 'DF monto IVA 4             := [' & acomprob.RegDF.MontoIVA_4 & ']'
        // Debug.Print 'DF base imponible 4        := [' & acomprob.RegDF.MontoNetoSinIVA_4 & ']'
        // Debug.Print 'DF IVA 5                   := [' & acomprob.RegDF.AlicuotaIVA_5 & ']'
        // Debug.Print 'DF monto IVA 5             := [' & acomprob.RegDF.MontoIVA_5 & ']'
        // Debug.Print 'DF base imponible 5        := [' & acomprob.RegDF.MontoNetoSinIVA_5 & ']'
        // Debug.Print 'DF IVA 6                   := [' & acomprob.RegDF.AlicuotaIVA_6 & ']'
        // Debug.Print 'DF monto IVA 6             := [' & acomprob.RegDF.MontoIVA_6 & ']'
        // Debug.Print 'DF base imponible 6        := [' & acomprob.RegDF.MontoNetoSinIVA_6 & ']'
        // Debug.Print 'DF IVA 7                   := [' & acomprob.RegDF.AlicuotaIVA_7 & ']'
        // Debug.Print 'DF monto IVA 7             := [' & acomprob.RegDF.MontoIVA_7 & ']'
        // Debug.Print 'DF base imponible 7        := [' & acomprob.RegDF.MontoNetoSinIVA_7 & ']'
        // Debug.Print 'DF IVA 8                   := [' & acomprob.RegDF.AlicuotaIVA_8 & ']'
        // Debug.Print 'DF monto IVA 8             := [' & acomprob.RegDF.MontoIVA_8 & ']'
        // Debug.Print 'DF base imponible 8        := [' & acomprob.RegDF.MontoNetoSinIVA_8 & ']'
        // Debug.Print 'DF IVA 9                   := [' & acomprob.RegDF.AlicuotaIVA_9 & ']'
        // Debug.Print 'DF monto IVA 9             := [' & acomprob.RegDF.MontoIVA_9 & ']'
        // Debug.Print 'DF base imponible 9        := [' & acomprob.RegDF.MontoNetoSinIVA_9 & ']'
        // Debug.Print 'DF IVA 10                  := [' & acomprob.RegDF.AlicuotaIVA_10 & ']'
        // Debug.Print 'DF monto IVA 10            := [' & acomprob.RegDF.MontoIVA_10 & ']'
        // Debug.Print 'DF base imponible 10       := [' & acomprob.RegDF.MontoNetoSinIVA_10 & ']'
        // Debug.Print
        // Debug.Print 'DF total IVA               := [' & acomprob.RegDF.TotalIVA & ']'
        // Debug.Print
        // Debug.Print 'DF tributo 1               := [' & acomprob.RegDF.CodigoTributo1 & ']'
        // Debug.Print 'DF monto tributo 1         := [' & acomprob.RegDF.ImporteTributo1 & ']'
        // Debug.Print 'DF tributo 2               := [' & acomprob.RegDF.CodigoTributo2 & ']'
        // Debug.Print 'DF monto tributo 2         := [' & acomprob.RegDF.ImporteTributo2 & ']'
        // Debug.Print 'DF tributo 3               := [' & acomprob.RegDF.CodigoTributo3 & ']'
        // Debug.Print 'DF monto tributo 3         := [' & acomprob.RegDF.ImporteTributo3 & ']'
        // Debug.Print 'DF tributo 4               := [' & acomprob.RegDF.CodigoTributo4 & ']'
        // Debug.Print 'DF monto tributo 4         := [' & acomprob.RegDF.ImporteTributo4 & ']'
        // Debug.Print 'DF tributo 5               := [' & acomprob.RegDF.CodigoTributo5 & ']'
        // Debug.Print 'DF monto tributo 5         := [' & acomprob.RegDF.ImporteTributo5 & ']'
        // Debug.Print 'DF tributo 6               := [' & acomprob.RegDF.CodigoTributo6 & ']'
        // Debug.Print 'DF monto tributo 6         := [' & acomprob.RegDF.ImporteTributo6 & ']'
        // Debug.Print 'DF tributo 7               := [' & acomprob.RegDF.CodigoTributo7 & ']'
        // Debug.Print 'DF monto tributo 7         := [' & acomprob.RegDF.ImporteTributo7 & ']'
        // Debug.Print 'DF tributo 8               := [' & acomprob.RegDF.CodigoTributo8 & ']'
        // Debug.Print 'DF monto tributo 8         := [' & acomprob.RegDF.ImporteTributo8 & ']'
        // Debug.Print 'DF tributo 9               := [' & acomprob.RegDF.CodigoTributo9 & ']'
        // Debug.Print 'DF monto tributo 9         := [' & acomprob.RegDF.ImporteTributo9 & ']'
        // Debug.Print 'DF tributo 10              := [' & acomprob.RegDF.CodigoTributo10 & ']'
        // Debug.Print 'DF monto tributo 10        := [' & acomprob.RegDF.ImporteTributo10 & ']'
        // Debug.Print 'DF tributo 11              := [' & acomprob.RegDF.CodigoTributo11 & ']'
        // Debug.Print 'DF monto tributo 11        := [' & acomprob.RegDF.ImporteTributo11 & ']'
        // Debug.Print
        // Debug.Print 'DF total tributos          := [' & acomprob.RegDF.TotalTributos & ']'
        // Debug.Print
      end;
    HasarArgentina_TLB.RegistroDetalladoDNFH:
      begin
        // Debug.Print
        // Debug.Print 'TIPO REGISTRO:'
        // Debug.Print '[' & acomprob.Registro & ']'
        // Debug.Print
        // Debug.Print 'DNFH (Documentos No Fiscales Homologados);: :=QUE ACUMULAN:='
        // Debug.Print '---------------------------------------------------------'
        // Debug.Print 'DNFH Tipo Comprob.         := [' & FromTiposComprobanteToString(acomprob.RegDF.CodigoComprobante); & ']'
        // Debug.Print 'DNFH Nro. inicial          := [' & acomprob.RegDNFH.NumeroInicial & ']'
        // Debug.Print 'DNFH Nro. Final            := [' & acomprob.RegDNFH.NumeroFinal & ']'
        // Debug.Print 'DNFH total acumulado       := [' & acomprob.RegDNFH.Total & ']'
        // Debug.Print
      end;
    HasarArgentina_TLB.RegistroDetalladoDNFHNoAcum:
      begin // Debug.Print
        // Debug.Print 'TIPO REGISTRO:'
        // Debug.Print '[' & acomprob.Registro & ']'
        // Debug.Print
        // Debug.Print 'DNFH (Documentos No Fiscales Homologados);: :=QUE NO ACUMULAN:='
        // Debug.Print '------------------------------------------------------------'
        // Debug.Print 'Tipo Comprobante := [' & FromTiposComprobanteToString(acomprob.RegDF.CodigoComprobante); & ']'
        // Debug.Print 'Nº inicial       := [' & acomprob.RegDNFH_NoAcum.NumeroInicial & ']'
        // Debug.Print 'Nº final         := [' & acomprob.RegDNFH_NoAcum.NumeroFinal & ']'
        // Debug.Print
      end;
    HasarArgentina_TLB.RegistroGlobal:
      begin
        // Debug.Print
        // Debug.Print 'TIPO REGISTRO:'
        // Debug.Print '[' & acomprob.Registro & ']'
        // Debug.Print
        // Debug.Print 'INFORMACION GLOBAL:'
        // Debug.Print '-------------------'
        // Debug.Print 'DF cant. cancelados := [' & acomprob.RegGlobal.DF_CantidadCancelados & ']'
        // Debug.Print 'DF cant. emitidos   := [' & acomprob.RegGlobal.DF_CantidadEmitidos & ']'
        // Debug.Print
        // Debug.Print 'DF total ventas     := [' & acomprob.RegGlobal.DF_Total & ']'
        // Debug.Print
        // Debug.Print 'DF total gravado    := [' & acomprob.RegGlobal.DF_TotalGravado & ']'
        // Debug.Print 'DF total IVA        := [' & acomprob.RegGlobal.DF_TotalIVA & ']'
        // Debug.Print 'DF total tributos   := [' & acomprob.RegGlobal.DF_TotalTributos & ']'
        // Debug.Print 'DF total no gravado := [' & acomprob.RegGlobal.DF_TotalNoGravado & ']'
        // Debug.Print 'DF total exento     := [' & acomprob.RegGlobal.DF_TotalExento & ']'
        // Debug.Print
        // Debug.Print 'DF total DNFH       := [' & acomprob.RegGlobal.DNFH_Total & ']'
        // Debug.Print
      end;
    { End Select } end;

  acomprob2 := HASARNG.ContinuarConsultaAcumulados;

  while (acomprob2.Registro <> HasarArgentina_TLB.
    RegistroFinal) do
  begin
    // Select
    Case acomprob2.Registro of
      HasarArgentina_TLB.RegistroDetalladoDF:
        begin
          // Debug.Print
          // Debug.Print 'TIPO REGISTRO:'
          // Debug.Print '[' & acomprob2.Registro & ']'
          // Debug.Print
          // Debug.Print 'DF (Documentos Fiscales);:'
          // Debug.Print '-------------------------'
          // Debug.Print 'DF Tipo comprobante        := [' & FromTiposComprobanteToString(acomprob2.RegDF.CodigoComprobante); & ']'
          // Debug.Print 'DF Nro. inicial            := [' & acomprob2.RegDF.NumeroInicial & ']'
          // Debug.Print 'DF Nro. final              := [' & acomprob2.RegDF.NumeroFinal & ']'
          // Debug.Print 'DF cancelados              := [' & acomprob2.RegDF.CantidadCancelados & ']'
          // Debug.Print
          // Debug.Print 'DF total ventas            := [' & acomprob2.RegDF.Total & ']'
          // Debug.Print 'DF total gravado           := [' & acomprob2.RegDF.TotalGravado & ']'
          // Debug.Print 'DF total no gravado        := [' & acomprob2.RegDF.TotalNoGravado & ']'
          // Debug.Print 'DF total exento            := [' & acomprob2.RegDF.TotalExento & ']'
          // Debug.Print
          // Debug.Print 'DF IVA 1                   := [' & acomprob2.RegDF.AlicuotaIVA_1 & ']'
          // Debug.Print 'DF monto IVA 1             := [' & acomprob2.RegDF.MontoIVA_1 & ']'
          // Debug.Print 'DF IVA 2                   := [' & acomprob2.RegDF.AlicuotaIVA_2 & ']'
          // Debug.Print 'DF monto IVA 2             := [' & acomprob2.RegDF.MontoIVA_2 & ']'
          // Debug.Print 'DF IVA 3                   := [' & acomprob2.RegDF.AlicuotaIVA_3 & ']'
          // Debug.Print 'DF monto IVA 3             := [' & acomprob2.RegDF.MontoIVA_3 & ']'
          // Debug.Print 'DF IVA 4                   := [' & acomprob2.RegDF.AlicuotaIVA_4 & ']'
          // Debug.Print 'DF monto IVA 4             := [' & acomprob2.RegDF.MontoIVA_4 & ']'
          // Debug.Print 'DF IVA 5                   := [' & acomprob2.RegDF.AlicuotaIVA_5 & ']'
          // Debug.Print 'DF monto IVA 5             := [' & acomprob2.RegDF.MontoIVA_5 & ']'
          // Debug.Print 'DF IVA 6                   := [' & acomprob2.RegDF.AlicuotaIVA_6 & ']'
          // Debug.Print 'DF monto IVA 6             := [' & acomprob2.RegDF.MontoIVA_6 & ']'
          // Debug.Print 'DF IVA 7                   := [' & acomprob2.RegDF.AlicuotaIVA_7 & ']'
          // Debug.Print 'DF monto IVA 7             := [' & acomprob2.RegDF.MontoIVA_7 & ']'
          // Debug.Print 'DF IVA 8                   := [' & acomprob2.RegDF.AlicuotaIVA_8 & ']'
          // Debug.Print 'DF monto IVA 8             := [' & acomprob2.RegDF.MontoIVA_8 & ']'
          // Debug.Print 'DF IVA 9                   := [' & acomprob2.RegDF.AlicuotaIVA_9 & ']'
          // Debug.Print 'DF monto IVA 9             := [' & acomprob2.RegDF.MontoIVA_9 & ']'
          // Debug.Print 'DF IVA 10                  := [' & acomprob2.RegDF.AlicuotaIVA_10 & ']'
          // Debug.Print 'DF monto IVA 10            := [' & acomprob2.RegDF.MontoIVA_10 & ']'
          // Debug.Print
          // Debug.Print 'DF total IVA               := [' & acomprob2.RegDF.TotalIVA & ']'
          // Debug.Print
          // Debug.Print 'DF tributo 1               := [' & acomprob2.RegDF.CodigoTributo1 & ']'
          // Debug.Print 'DF monto tributo 1         := [' & acomprob2.RegDF.ImporteTributo1 & ']'
          // Debug.Print 'DF tributo 2               := [' & acomprob2.RegDF.CodigoTributo2 & ']'
          // Debug.Print 'DF monto tributo 2         := [' & acomprob2.RegDF.ImporteTributo2 & ']'
          // Debug.Print 'DF tributo 3               := [' & acomprob2.RegDF.CodigoTributo3 & ']'
          // Debug.Print 'DF monto tributo 3         := [' & acomprob2.RegDF.ImporteTributo3 & ']'
          // Debug.Print 'DF tributo 4               := [' & acomprob2.RegDF.CodigoTributo4 & ']'
          // Debug.Print 'DF monto tributo 4         := [' & acomprob2.RegDF.ImporteTributo4 & ']'
          // Debug.Print 'DF tributo 5               := [' & acomprob2.RegDF.CodigoTributo5 & ']'
          // Debug.Print 'DF monto tributo 5         := [' & acomprob2.RegDF.ImporteTributo5 & ']'
          // Debug.Print 'DF tributo 6               := [' & acomprob2.RegDF.CodigoTributo6 & ']'
          // Debug.Print 'DF monto tributo 6         := [' & acomprob2.RegDF.ImporteTributo6 & ']'
          // Debug.Print 'DF tributo 7               := [' & acomprob2.RegDF.CodigoTributo7 & ']'
          // Debug.Print 'DF monto tributo 7         := [' & acomprob2.RegDF.ImporteTributo7 & ']'
          // Debug.Print 'DF tributo 8               := [' & acomprob2.RegDF.CodigoTributo8 & ']'
          // Debug.Print 'DF monto tributo 8         := [' & acomprob2.RegDF.ImporteTributo8 & ']'
          // Debug.Print 'DF tributo 9               := [' & acomprob2.RegDF.CodigoTributo9 & ']'
          // Debug.Print 'DF monto tributo 9         := [' & acomprob2.RegDF.ImporteTributo9 & ']'
          // Debug.Print 'DF tributo 10              := [' & acomprob2.RegDF.CodigoTributo10 & ']'
          // Debug.Print 'DF monto tributo 10        := [' & acomprob2.RegDF.ImporteTributo10 & ']'
          // Debug.Print 'DF tributo 11              := [' & acomprob2.RegDF.CodigoTributo11 & ']'
          // Debug.Print 'DF monto tributo 11        := [' & acomprob2.RegDF.ImporteTributo11 & ']'
          // Debug.Print
          // Debug.Print 'DF total tributos          := [' & acomprob2.RegDF.TotalTributos & ']'
          // Debug.Print
        end;
      HasarArgentina_TLB.RegistroDetalladoDNFH:
        begin
          // Debug.Print
          // Debug.Print 'TIPO REGISTRO:'
          // Debug.Print '[' & acomprob2.Registro & ']'
          // Debug.Print
          // Debug.Print 'DNFH (Documentos No Fiscales Homologados);: :=QUE ACUMULAN:='
          // Debug.Print '---------------------------------------------------------'
          // Debug.Print 'DNFH Tipo Comprob.         := [' & FromTiposComprobanteToString(acomprob2.RegDF.CodigoComprobante); & ']'
          // Debug.Print 'DNFH Nro. inicial          := [' & acomprob2.RegDNFH.NumeroInicial & ']'
          // Debug.Print 'DNFH Nro. Final            := [' & acomprob2.RegDNFH.NumeroFinal & ']'
          // Debug.Print 'DNFH total acumulado       := [' & acomprob2.RegDNFH.Total & ']'
          // Debug.Print
        end;
      HasarArgentina_TLB.RegistroDetalladoDNFHNoAcum:
        begin
          // Debug.Print
          // Debug.Print 'TIPO REGISTRO:'
          // Debug.Print '[' & acomprob2.Registro & ']'
          // Debug.Print
          // Debug.Print 'DNFH (Documentos No Fiscales Homologados);: :=QUE NO ACUMULAN:='
          // Debug.Print '------------------------------------------------------------'
          // Debug.Print 'Tipo Comprobante := [' & FromTiposComprobanteToString(acomprob2.RegDF.CodigoComprobante); & ']'
          // Debug.Print 'Nº inicial       := [' & acomprob2.RegDNFH_NoAcum.NumeroInicial & ']'
          // Debug.Print 'Nº final         := [' & acomprob2.RegDNFH_NoAcum.NumeroFinal & ']'
          // Debug.Print
        end;
      HasarArgentina_TLB.RegistroGlobal:
        begin
          // Debug.Print
          // Debug.Print 'TIPO REGISTRO:'
          // Debug.Print '[' & acomprob2.Registro & ']'
          // Debug.Print
          // Debug.Print 'INFORMACION GLOBAL:'
          // Debug.Print '-------------------'
          // Debug.Print 'DF cant. cancelados := [' & acomprob2.RegGlobal.DF_CantidadCancelados & ']'
          // Debug.Print 'DF cant. emitidos   := [' & acomprob2.RegGlobal.DF_CantidadEmitidos & ']'
          // Debug.Print
          // Debug.Print 'DF total ventas     := [' & acomprob2.RegGlobal.DF_Total & ']'
          // Debug.Print
          // Debug.Print 'DF total gravado    := [' & acomprob2.RegGlobal.DF_TotalGravado & ']'
          // Debug.Print 'DF total IVA        := [' & acomprob2.RegGlobal.DF_TotalIVA & ']'
          // Debug.Print 'DF total tributos   := [' & acomprob2.RegGlobal.DF_TotalTributos & ']'
          // Debug.Print 'DF total no gravado := [' & acomprob2.RegGlobal.DF_TotalNoGravado & ']'
          // Debug.Print 'DF total exento     := [' & acomprob2.RegGlobal.DF_TotalExento & ']'
          // Debug.Print
          // Debug.Print 'DF total DNFH       := [' & acomprob2.RegGlobal.DNFH_Total & ']'
          // Debug.Print
        end;
      { End Select } end;

    acomprob2 := HASARNG.ContinuarConsultaAcumulados;
    { Wend } end;

  // Debug.Print
  // Debug.Print 'NO HAY MAS INFORMACION DISPONIBLE !...'
  // Debug.Print
  // Debug.Print 'FIN DE LA CONSULTA...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Consulta de acumulados en la memoria de trabajo de la impresora fiscal.
// ====================================================================================================================
{ Private Sub }
procedure CommandConsAcumMemoria_Click;
{ Dim }
var
  amem: RespuestaConsultarAcumuladosMemoriaDeTrabajo;
  { Dim }
  amem2: RespuestaContinuarConsultaAcumulados;

  // Debug.Print
  // Debug.Print 'CONSULTANDO ACUMULADOS MEMORIA DE TRABAJO...'
  // Debug.Print

begin // On Error GoTo keka
  amem := HASARNG.ConsultarAcumuladosMemoriaDeTrabajo(NoDocumento);

  If (amem.Registro = HasarArgentina_TLB.RegistroFinal)
  then
  begin
    // Debug.Print
    // Debug.Print 'NO HAY INFORMACION DISPONIBLE !...'
    // Debug.Print

    // Exit Sub
    { End If } end;

  // Select
  Case amem.Registro of
    HasarArgentina_TLB.RegistroDetalladoDF:
      begin
        // Debug.Print
        // Debug.Print 'TIPO REGISTRO:'
        // Debug.Print '[' & amem.Registro & ']'
        // Debug.Print
        // Debug.Print 'DF (Documentos Fiscales);:'
        // Debug.Print '-------------------------'
        // Debug.Print 'DF cancelados              := [' & amem.RegDF.CantidadCancelados & ']'
        // Debug.Print 'DF Tipo comprobante        := [' & FromTiposComprobanteToString(amem.RegDF.CodigoComprobante); & ']'
        // Debug.Print 'DF Nro. inicial            := [' & amem.RegDF.NumeroInicial & ']'
        // Debug.Print 'DF Nro. final              := [' & amem.RegDF.NumeroFinal & ']'
        // Debug.Print
        // Debug.Print 'DF total ventas            := [' & amem.RegDF.Total & ']'
        // Debug.Print
        // Debug.Print 'DF total gravado           := [' & amem.RegDF.TotalGravado & ']'
        // Debug.Print 'DF total no gravado        := [' & amem.RegDF.TotalNoGravado & ']'
        // Debug.Print 'DF total exento            := [' & amem.RegDF.TotalExento & ']'
        // Debug.Print
        // Debug.Print 'DF IVA 1                   := [' & amem.RegDF.AlicuotaIVA_1 & ']'
        // Debug.Print 'DF monto IVA 1             := [' & amem.RegDF.MontoIVA_1 & ']'
        // Debug.Print 'DF IVA 2                   := [' & amem.RegDF.AlicuotaIVA_2 & ']'
        // Debug.Print 'DF monto IVA 2             := [' & amem.RegDF.MontoIVA_2 & ']'
        // Debug.Print 'DF IVA 3                   := [' & amem.RegDF.AlicuotaIVA_3 & ']'
        // Debug.Print 'DF monto IVA 3             := [' & amem.RegDF.MontoIVA_3 & ']'
        // Debug.Print 'DF IVA 4                   := [' & amem.RegDF.AlicuotaIVA_4 & ']'
        // Debug.Print 'DF monto IVA 4             := [' & amem.RegDF.MontoIVA_4 & ']'
        // Debug.Print 'DF IVA 5                   := [' & amem.RegDF.AlicuotaIVA_5 & ']'
        // Debug.Print 'DF monto IVA 5             := [' & amem.RegDF.MontoIVA_5 & ']'
        // Debug.Print 'DF IVA 6                   := [' & amem.RegDF.AlicuotaIVA_6 & ']'
        // Debug.Print 'DF monto IVA 6             := [' & amem.RegDF.MontoIVA_6 & ']'
        // Debug.Print 'DF IVA 7                   := [' & amem.RegDF.AlicuotaIVA_7 & ']'
        // Debug.Print 'DF monto IVA 7             := [' & amem.RegDF.MontoIVA_7 & ']'
        // Debug.Print 'DF IVA 8                   := [' & amem.RegDF.AlicuotaIVA_8 & ']'
        // Debug.Print 'DF monto IVA 8             := [' & amem.RegDF.MontoIVA_8 & ']'
        // Debug.Print 'DF IVA 9                   := [' & amem.RegDF.AlicuotaIVA_9 & ']'
        // Debug.Print 'DF monto IVA 9             := [' & amem.RegDF.MontoIVA_9 & ']'
        // Debug.Print 'DF IVA 10                  := [' & amem.RegDF.AlicuotaIVA_10 & ']'
        // Debug.Print 'DF monto IVA 10            := [' & amem.RegDF.MontoIVA_10 & ']'
        // Debug.Print
        // Debug.Print 'DF total IVA               := [' & amem.RegDF.TotalIVA & ']'
        // Debug.Print
        // Debug.Print 'DF tributo 1               := [' & amem.RegDF.CodigoTributo1 & ']'
        // Debug.Print 'DF monto tributo 1         := [' & amem.RegDF.ImporteTributo1 & ']'
        // Debug.Print 'DF tributo 2               := [' & amem.RegDF.CodigoTributo2 & ']'
        // Debug.Print 'DF monto tributo 2         := [' & amem.RegDF.ImporteTributo2 & ']'
        // Debug.Print 'DF tributo 3               := [' & amem.RegDF.CodigoTributo3 & ']'
        // Debug.Print 'DF monto tributo 3         := [' & amem.RegDF.ImporteTributo3 & ']'
        // Debug.Print 'DF tributo 4               := [' & amem.RegDF.CodigoTributo4 & ']'
        // Debug.Print 'DF monto tributo 4         := [' & amem.RegDF.ImporteTributo4 & ']'
        // Debug.Print 'DF tributo 5               := [' & amem.RegDF.CodigoTributo5 & ']'
        // Debug.Print 'DF monto tributo 5         := [' & amem.RegDF.ImporteTributo5 & ']'
        // Debug.Print 'DF tributo 6               := [' & amem.RegDF.CodigoTributo6 & ']'
        // Debug.Print 'DF monto tributo 6         := [' & amem.RegDF.ImporteTributo6 & ']'
        // Debug.Print 'DF tributo 7               := [' & amem.RegDF.CodigoTributo7 & ']'
        // Debug.Print 'DF monto tributo 7         := [' & amem.RegDF.ImporteTributo7 & ']'
        // Debug.Print 'DF tributo 8               := [' & amem.RegDF.CodigoTributo8 & ']'
        // Debug.Print 'DF monto tributo 8         := [' & amem.RegDF.ImporteTributo8 & ']'
        // Debug.Print 'DF tributo 9               := [' & amem.RegDF.CodigoTributo9 & ']'
        // Debug.Print 'DF monto tributo 9         := [' & amem.RegDF.ImporteTributo9 & ']'
        // Debug.Print 'DF tributo 10              := [' & amem.RegDF.CodigoTributo10 & ']'
        // Debug.Print 'DF monto tributo 10        := [' & amem.RegDF.ImporteTributo10 & ']'
        // Debug.Print 'DF tributo 11              := [' & amem.RegDF.CodigoTributo11 & ']'
        // Debug.Print 'DF monto tributo 11        := [' & amem.RegDF.ImporteTributo11 & ']'
        // Debug.Print
        // Debug.Print 'DF total tributos          := [' & amem.RegDF.TotalTributos & ']'
        // Debug.Print
      end;
    HasarArgentina_TLB.RegistroDetalladoDNFH:
      begin // Debug.Print
        // Debug.Print 'TIPO REGISTRO:'
        // Debug.Print '[' & amem.Registro & ']'
        // Debug.Print
        // Debug.Print 'DNFH (Documentos No Fiscales Homologados);: :=QUE ACUMULAN:='
        // Debug.Print '---------------------------------------------------------'
        // Debug.Print 'DNFH Tipo Comprob.         := [' & FromTiposComprobanteToString(amem.RegDNFH.CodigoComprobante); & ']'
        // Debug.Print 'DNFH Nro. inicial          := [' & amem.RegDNFH.NumeroInicial & ']'
        // Debug.Print 'DNFH Nro. Final            := [' & amem.RegDNFH.NumeroFinal & ']'
        // Debug.Print 'DNFH total acumulado       := [' & amem.RegDNFH.Total & ']'
        // Debug.Print
      end;
    HasarArgentina_TLB.RegistroDetalladoDNFHNoAcum:
      begin
        // Debug.Print
        // Debug.Print 'TIPO REGISTRO:'
        // Debug.Print '[' & amem.Registro & ']'
        // Debug.Print
        // Debug.Print 'DNFH (Documentos No Fiscales Homologados);: :=QUE NO ACUMULAN:='
        // Debug.Print '------------------------------------------------------------'
        // Debug.Print 'Tipo Comprobante := [' & FromTiposComprobanteToString(amem.RegDNFH_NoAcum.CodigoComprobante); & ']'
        // Debug.Print 'Nº inicial       := [' & amem.RegDNFH_NoAcum.NumeroInicial & ']'
        // Debug.Print 'Nº final         := [' & amem.RegDNFH_NoAcum.NumeroFinal & ']'
        // Debug.Print
      end;
    HasarArgentina_TLB.RegistroGlobal:
      begin
        // Debug.Print
        // Debug.Print 'TIPO REGISTRO:'
        // Debug.Print '[' & amem.Registro & ']'
        // Debug.Print
        // Debug.Print 'INFORMACION GLOBAL:'
        // Debug.Print '-------------------'
        // Debug.Print 'DF cant. cancelados := [' & amem.RegGlobal.DF_CantidadCancelados & ']'
        // Debug.Print 'DF cant. emitidos   := [' & amem.RegGlobal.DF_CantidadEmitidos & ']'
        // Debug.Print
        // Debug.Print 'DF total ventas     := [' & amem.RegGlobal.DF_Total & ']'
        // Debug.Print
        // Debug.Print 'DF total gravado    := [' & amem.RegGlobal.DF_TotalGravado & ']'
        // Debug.Print 'DF total IVA        := [' & amem.RegGlobal.DF_TotalIVA & ']'
        // Debug.Print 'DF total tributos   := [' & amem.RegGlobal.DF_TotalTributos & ']'
        // Debug.Print 'DF total no gravado := [' & amem.RegGlobal.DF_TotalNoGravado & ']'
        // Debug.Print 'DF total exento     := [' & amem.RegGlobal.DF_TotalExento & ']'
        // Debug.Print
        // Debug.Print 'DF total DNFH       := [' & amem.RegGlobal.DNFH_Total & ']'
        // Debug.Print
      end;
    { End Select } end;

  amem2 := HASARNG.ContinuarConsultaAcumulados;

  while (amem2.Registro <> HasarArgentina_TLB.
    RegistroFinal) do
  begin
    // Select
    Case amem2.Registro of
      HasarArgentina_TLB.RegistroDetalladoDF:
        begin
          // Debug.Print
          // Debug.Print 'TIPO REGISTRO:'
          // Debug.Print '[' & amem2.Registro & ']'
          // Debug.Print
          // Debug.Print 'DF (Documentos Fiscales);:'
          // Debug.Print '-------------------------'
          // Debug.Print 'DF cancelados              := [' & amem2.RegDF.CantidadCancelados & ']'
          // Debug.Print 'DF Tipo comprobante        := [' & FromTiposComprobanteToString(amem2.RegDF.CodigoComprobante); & ']'
          // Debug.Print 'DF Nro. inicial            := [' & amem2.RegDF.NumeroInicial & ']'
          // Debug.Print 'DF Nro. final              := [' & amem2.RegDF.NumeroFinal & ']'
          // Debug.Print
          // Debug.Print 'DF total ventas            := [' & amem2.RegDF.Total & ']'
          // Debug.Print
          // Debug.Print 'DF total gravado           := [' & amem2.RegDF.TotalGravado & ']'
          // Debug.Print 'DF total no gravado        := [' & amem2.RegDF.TotalNoGravado & ']'
          // Debug.Print 'DF total exento            := [' & amem2.RegDF.TotalExento & ']'
          // Debug.Print
          // Debug.Print 'DF IVA 1                   := [' & amem2.RegDF.AlicuotaIVA_1 & ']'
          // Debug.Print 'DF monto IVA 1             := [' & amem2.RegDF.MontoIVA_1 & ']'
          // Debug.Print 'DF IVA 2                   := [' & amem2.RegDF.AlicuotaIVA_2 & ']'
          // Debug.Print 'DF monto IVA 2             := [' & amem2.RegDF.MontoIVA_2 & ']'
          // Debug.Print 'DF IVA 3                   := [' & amem2.RegDF.AlicuotaIVA_3 & ']'
          // Debug.Print 'DF monto IVA 3             := [' & amem2.RegDF.MontoIVA_3 & ']'
          // Debug.Print 'DF IVA 4                   := [' & amem2.RegDF.AlicuotaIVA_4 & ']'
          // Debug.Print 'DF monto IVA 4             := [' & amem2.RegDF.MontoIVA_4 & ']'
          // Debug.Print 'DF IVA 5                   := [' & amem2.RegDF.AlicuotaIVA_5 & ']'
          // Debug.Print 'DF monto IVA 5             := [' & amem2.RegDF.MontoIVA_5 & ']'
          // Debug.Print 'DF IVA 6                   := [' & amem2.RegDF.AlicuotaIVA_6 & ']'
          // Debug.Print 'DF monto IVA 6             := [' & amem2.RegDF.MontoIVA_6 & ']'
          // Debug.Print 'DF IVA 7                   := [' & amem2.RegDF.AlicuotaIVA_7 & ']'
          // Debug.Print 'DF monto IVA 7             := [' & amem2.RegDF.MontoIVA_7 & ']'
          // Debug.Print 'DF IVA 8                   := [' & amem2.RegDF.AlicuotaIVA_8 & ']'
          // Debug.Print 'DF monto IVA 8             := [' & amem2.RegDF.MontoIVA_8 & ']'
          // Debug.Print 'DF IVA 9                   := [' & amem2.RegDF.AlicuotaIVA_9 & ']'
          // Debug.Print 'DF monto IVA 9             := [' & amem2.RegDF.MontoIVA_9 & ']'
          // Debug.Print 'DF IVA 10                  := [' & amem2.RegDF.AlicuotaIVA_10 & ']'
          // Debug.Print 'DF monto IVA 10            := [' & amem2.RegDF.MontoIVA_10 & ']'
          // Debug.Print
          // Debug.Print 'DF total IVA               := [' & amem2.RegDF.TotalIVA & ']'
          // Debug.Print
          // Debug.Print 'DF tributo 1               := [' & amem2.RegDF.CodigoTributo1 & ']'
          // Debug.Print 'DF monto tributo 1         := [' & amem2.RegDF.ImporteTributo1 & ']'
          // Debug.Print 'DF tributo 2               := [' & amem2.RegDF.CodigoTributo2 & ']'
          // Debug.Print 'DF monto tributo 2         := [' & amem2.RegDF.ImporteTributo2 & ']'
          // Debug.Print 'DF tributo 3               := [' & amem2.RegDF.CodigoTributo3 & ']'
          // Debug.Print 'DF monto tributo 3         := [' & amem2.RegDF.ImporteTributo3 & ']'
          // Debug.Print 'DF tributo 4               := [' & amem2.RegDF.CodigoTributo4 & ']'
          // Debug.Print 'DF monto tributo 4         := [' & amem2.RegDF.ImporteTributo4 & ']'
          // Debug.Print 'DF tributo 5               := [' & amem2.RegDF.CodigoTributo5 & ']'
          // Debug.Print 'DF monto tributo 5         := [' & amem2.RegDF.ImporteTributo5 & ']'
          // Debug.Print 'DF tributo 6               := [' & amem2.RegDF.CodigoTributo6 & ']'
          // Debug.Print 'DF monto tributo 6         := [' & amem2.RegDF.ImporteTributo6 & ']'
          // Debug.Print 'DF tributo 7               := [' & amem2.RegDF.CodigoTributo7 & ']'
          // Debug.Print 'DF monto tributo 7         := [' & amem2.RegDF.ImporteTributo7 & ']'
          // Debug.Print 'DF tributo 8               := [' & amem2.RegDF.CodigoTributo8 & ']'
          // Debug.Print 'DF monto tributo 8         := [' & amem2.RegDF.ImporteTributo8 & ']'
          // Debug.Print 'DF tributo 9               := [' & amem2.RegDF.CodigoTributo9 & ']'
          // Debug.Print 'DF monto tributo 9         := [' & amem2.RegDF.ImporteTributo9 & ']'
          // Debug.Print 'DF tributo 10              := [' & amem2.RegDF.CodigoTributo10 & ']'
          // Debug.Print 'DF monto tributo 10        := [' & amem2.RegDF.ImporteTributo10 & ']'
          // Debug.Print 'DF tributo 11              := [' & amem2.RegDF.CodigoTributo11 & ']'
          // Debug.Print 'DF monto tributo 11        := [' & amem2.RegDF.ImporteTributo11 & ']'
          // Debug.Print
          // Debug.Print 'DF total tributos          := [' & amem2.RegDF.TotalTributos & ']'
          // Debug.Print
        end;
      HasarArgentina_TLB.RegistroDetalladoDNFH:
        begin
          // Debug.Print
          // Debug.Print 'TIPO REGISTRO:'
          // Debug.Print '[' & amem2.Registro & ']'
          // Debug.Print
          // Debug.Print 'DNFH (Documentos No Fiscales Homologados);: :=QUE ACUMULAN:='
          // Debug.Print '---------------------------------------------------------'
          // Debug.Print 'DNFH Tipo Comprob.         := [' & FromTiposComprobanteToString(amem2.RegDNFH.CodigoComprobante); & ']'
          // Debug.Print 'DNFH Nro. inicial          := [' & amem2.RegDNFH.NumeroInicial & ']'
          // Debug.Print 'DNFH Nro. Final            := [' & amem2.RegDNFH.NumeroFinal & ']'
          // Debug.Print 'DNFH total acumulado       := [' & amem2.RegDNFH.Total & ']'
          // Debug.Print
        end;
      HasarArgentina_TLB.RegistroDetalladoDNFHNoAcum:
        begin
          // Debug.Print
          // Debug.Print 'TIPO REGISTRO:'
          // Debug.Print '[' & amem2.Registro & ']'
          // Debug.Print
          // Debug.Print 'DNFH (Documentos No Fiscales Homologados);: :=QUE NO ACUMULAN:='
          // Debug.Print '------------------------------------------------------------'
          // Debug.Print 'Tipo Comprobante := [' & FromTiposComprobanteToString(amem2.RegDNFH_NoAcum.CodigoComprobante); & ']'
          // Debug.Print 'Nº inicial       := [' & amem2.RegDNFH_NoAcum.NumeroInicial & ']'
          // Debug.Print 'Nº final         := [' & amem2.RegDNFH_NoAcum.NumeroFinal & ']'
          // Debug.Print
        end;
      HasarArgentina_TLB.RegistroGlobal:
        begin
          // Debug.Print
          // Debug.Print 'TIPO REGISTRO:'
          // Debug.Print '[' & amem2.Registro & ']'
          // Debug.Print
          // Debug.Print 'INFORMACION GLOBAL:'
          // Debug.Print '-------------------'
          // Debug.Print 'DF cant. cancelados := [' & amem2.RegGlobal.DF_CantidadCancelados & ']'
          // Debug.Print 'DF cant. emitidos   := [' & amem2.RegGlobal.DF_CantidadEmitidos & ']'
          // Debug.Print
          // Debug.Print 'DF total ventas     := [' & amem2.RegGlobal.DF_Total & ']'
          // Debug.Print
          // Debug.Print 'DF total gravado    := [' & amem2.RegGlobal.DF_TotalGravado & ']'
          // Debug.Print 'DF total IVA        := [' & amem2.RegGlobal.DF_TotalIVA & ']'
          // Debug.Print 'DF total tributos   := [' & amem2.RegGlobal.DF_TotalTributos & ']'
          // Debug.Print 'DF total no gravado := [' & amem2.RegGlobal.DF_TotalNoGravado & ']'
          // Debug.Print 'DF total exento     := [' & amem2.RegGlobal.DF_TotalExento & ']'
          // Debug.Print
          // Debug.Print 'DF total DNFH       := [' & amem2.RegGlobal.DNFH_Total & ']'
          // Debug.Print
        end;
      { End Select } end;

    amem2 := HASARNG.ContinuarConsultaAcumulados;
    { Wend } end;

  // Debug.Print
  // Debug.Print 'NO HAY MAS INFORMACION DISPONIBLE !...'
  // Debug.Print
  // Debug.Print 'FIN DE LA CONSULTA !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Consultar configuración de conectividad en red.
// ====================================================================================================================
{ Private Sub }
procedure CommandConsCfgRed_Click;
{ Dim }
var
  cfgred: RespuestaConsultarConfiguracionRed;

  // Debug.Print
  // Debug.Print 'CONSULTANDO CONFIGURACION DE RED...'
  // Debug.Print

begin // On Error GoTo keka
  cfgred := HASARNG.ConsultarConfiguracionRed;
  // Debug.Print
  // Debug.Print 'CONFIGURACION DE RED:'
  // Debug.Print 'Direcc. IP := [' & cfgred.DireccionIP & ']'
  // Debug.Print 'Gateway    := [' & cfgred.Gateway & ']'
  // Debug.Print 'Máscara    := [' & cfgred.Mascara & ']'

  // Debug.Print
  // Debug.Print 'FIN DE LA CONSULTA !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ==================================================================================================================
// Consulta de acumulados para determinado Cierre Diario 'Z' - Memoria fiscal de la impresora fiscal.
// ==================================================================================================================
{ Private Sub }
procedure CommandConsCierreZ_Click;
{ Dim }
var
  azeta: RespuestaConsultarAcumuladosCierreZeta;
  { Dim }
  azeta2: RespuestaContinuarConsultaAcumulados;

  // Debug.Print
  // Debug.Print 'CONSULTANDO ACUMULADOS CIERRE 'Z'...'
  // Debug.Print

begin // On Error GoTo keka
  azeta := HASARNG.ConsultarAcumuladosCierreZeta(ReporteZNumero, 11);

  if (azeta.Registro = HasarArgentina_TLB.RegistroFinal)
  then
  begin
    // Debug.Print
    // Debug.Print 'NO HAY INFORMACION DISPONIBLE !...'
    // Debug.Print

    // Exit Sub
    { End If } end;

  // Select
  Case azeta.Registro of
    HasarArgentina_TLB.RegistroDetalladoDF:
      begin
        // Debug.Print
        // Debug.Print 'TIPO REGISTRO:'
        // Debug.Print '[' & azeta.Registro & ']'
        // Debug.Print
        // Debug.Print 'DF (Documentos Fiscales);:'
        // Debug.Print '-------------------------'
        // Debug.Print 'DF Tipo comprobante        := [' & FromTiposComprobanteToString(azeta.RegDF.CodigoComprobante); & ']'
        // Debug.Print 'DF Nro. inicial            := [' & azeta.RegDF.NumeroInicial & ']'
        // Debug.Print 'DF Nro. final              := [' & azeta.RegDF.NumeroFinal & ']'
        // Debug.Print 'DF cancelados              := [' & azeta.RegDF.CantidadCancelados & ']'
        // Debug.Print
        // Debug.Print 'DF total ventas            := [' & azeta.RegDF.Total & ']'
        // Debug.Print
        // Debug.Print 'DF total gravado           := [' & azeta.RegDF.TotalGravado & ']'
        // Debug.Print 'DF total no gravado        := [' & azeta.RegDF.TotalNoGravado & ']'
        // Debug.Print 'DF total exento            := [' & azeta.RegDF.TotalExento & ']'
        // Debug.Print
        // Debug.Print 'DF IVA 1                   := [' & azeta.RegDF.AlicuotaIVA_1 & ']'
        // Debug.Print 'DF monto IVA 1             := [' & azeta.RegDF.MontoIVA_1 & ']'
        // Debug.Print 'DF IVA 2                   := [' & azeta.RegDF.AlicuotaIVA_2 & ']'
        // Debug.Print 'DF monto IVA 2             := [' & azeta.RegDF.MontoIVA_2 & ']'
        // Debug.Print 'DF IVA 3                   := [' & azeta.RegDF.AlicuotaIVA_3 & ']'
        // Debug.Print 'DF monto IVA 3             := [' & azeta.RegDF.MontoIVA_3 & ']'
        // Debug.Print 'DF IVA 4                   := [' & azeta.RegDF.AlicuotaIVA_4 & ']'
        // Debug.Print 'DF monto IVA 4             := [' & azeta.RegDF.MontoIVA_4 & ']'
        // Debug.Print 'DF IVA 5                   := [' & azeta.RegDF.AlicuotaIVA_5 & ']'
        // Debug.Print 'DF monto IVA 5             := [' & azeta.RegDF.MontoIVA_5 & ']'
        // Debug.Print 'DF IVA 6                   := [' & azeta.RegDF.AlicuotaIVA_6 & ']'
        // Debug.Print 'DF monto IVA 6             := [' & azeta.RegDF.MontoIVA_6 & ']'
        // Debug.Print 'DF IVA 7                   := [' & azeta.RegDF.AlicuotaIVA_7 & ']'
        // Debug.Print 'DF monto IVA 7             := [' & azeta.RegDF.MontoIVA_7 & ']'
        // Debug.Print 'DF IVA 8                   := [' & azeta.RegDF.AlicuotaIVA_8 & ']'
        // Debug.Print 'DF monto IVA 8             := [' & azeta.RegDF.MontoIVA_8 & ']'
        // Debug.Print 'DF IVA 9                   := [' & azeta.RegDF.AlicuotaIVA_9 & ']'
        // Debug.Print 'DF monto IVA 9             := [' & azeta.RegDF.MontoIVA_9 & ']'
        // Debug.Print 'DF IVA 10                  := [' & azeta.RegDF.AlicuotaIVA_10 & ']'
        // Debug.Print 'DF monto IVA 10            := [' & azeta.RegDF.MontoIVA_10 & ']'
        // Debug.Print
        // Debug.Print 'DF total IVA               := [' & azeta.RegDF.TotalIVA & ']'
        // Debug.Print
        // Debug.Print 'DF tributo 1               := [' & azeta.RegDF.CodigoTributo1 & ']'
        // Debug.Print 'DF monto tributo 1         := [' & azeta.RegDF.ImporteTributo1 & ']'
        // Debug.Print 'DF tributo 2               := [' & azeta.RegDF.CodigoTributo2 & ']'
        // Debug.Print 'DF monto tributo 2         := [' & azeta.RegDF.ImporteTributo2 & ']'
        // Debug.Print 'DF tributo 3               := [' & azeta.RegDF.CodigoTributo3 & ']'
        // Debug.Print 'DF monto tributo 3         := [' & azeta.RegDF.ImporteTributo3 & ']'
        // Debug.Print 'DF tributo 4               := [' & azeta.RegDF.CodigoTributo4 & ']'
        // Debug.Print 'DF monto tributo 4         := [' & azeta.RegDF.ImporteTributo4 & ']'
        // Debug.Print 'DF tributo 5               := [' & azeta.RegDF.CodigoTributo5 & ']'
        // Debug.Print 'DF monto tributo 5         := [' & azeta.RegDF.ImporteTributo5 & ']'
        // Debug.Print 'DF tributo 6               := [' & azeta.RegDF.CodigoTributo6 & ']'
        // Debug.Print 'DF monto tributo 6         := [' & azeta.RegDF.ImporteTributo6 & ']'
        // Debug.Print 'DF tributo 7               := [' & azeta.RegDF.CodigoTributo7 & ']'
        // Debug.Print 'DF monto tributo 7         := [' & azeta.RegDF.ImporteTributo7 & ']'
        // Debug.Print 'DF tributo 8               := [' & azeta.RegDF.CodigoTributo8 & ']'
        // Debug.Print 'DF monto tributo 8         := [' & azeta.RegDF.ImporteTributo8 & ']'
        // Debug.Print 'DF tributo 9               := [' & azeta.RegDF.CodigoTributo9 & ']'
        // Debug.Print 'DF monto tributo 9         := [' & azeta.RegDF.ImporteTributo9 & ']'
        // Debug.Print 'DF tributo 10              := [' & azeta.RegDF.CodigoTributo10 & ']'
        // Debug.Print 'DF monto tributo 10        := [' & azeta.RegDF.ImporteTributo10 & ']'
        // Debug.Print 'DF tributo 11              := [' & azeta.RegDF.CodigoTributo11 & ']'
        // Debug.Print 'DF monto tributo 11        := [' & azeta.RegDF.ImporteTributo11 & ']'
        // Debug.Print
        // Debug.Print 'DF total tributos          := [' & azeta.RegDF.TotalTributos & ']'
        // Debug.Print
      end;
    HasarArgentina_TLB.RegistroDetalladoDNFH:
      begin
        // Debug.Print
        // Debug.Print 'TIPO REGISTRO:'
        // Debug.Print '[' & azeta.Registro & ']'
        // Debug.Print
        // Debug.Print 'DNFH (Documentos No Fiscales Homologados);: :=QUE ACUMULAN:='
        // Debug.Print '---------------------------------------------------------'
        // Debug.Print 'DNFH Tipo Comprob.         := [' & FromTiposComprobanteToString(azeta.RegDNFH.CodigoComprobante); & ']'
        // Debug.Print 'DNFH Nro. inicial          := [' & azeta.RegDNFH.NumeroInicial & ']'
        // Debug.Print 'DNFH Nro. Final            := [' & azeta.RegDNFH.NumeroFinal & ']'
        // Debug.Print 'DNFH total acumulado       := [' & azeta.RegDNFH.Total & ']'
        // Debug.Print
      end;
    HasarArgentina_TLB.RegistroDetalladoDNFHNoAcum:
      begin
        // Debug.Print
        // Debug.Print 'TIPO REGISTRO:'
        // Debug.Print '[' & azeta.Registro & ']'
        // Debug.Print
        // Debug.Print 'DNFH (Documentos No Fiscales Homologados);: :=QUE NO ACUMULAN:='
        // Debug.Print '------------------------------------------------------------'
        // Debug.Print 'Tipo Comprobante := [' & FromTiposComprobanteToString(azeta.RegDNFH_NoAcum.CodigoComprobante); & ']'
        // Debug.Print 'Nº inicial       := [' & azeta.RegDNFH_NoAcum.NumeroInicial & ']'
        // Debug.Print 'Nº final         := [' & azeta.RegDNFH_NoAcum.NumeroFinal & ']'
        // Debug.Print
      end;
    HasarArgentina_TLB.RegistroGlobal:
      begin
        // Debug.Print
        // Debug.Print 'TIPO REGISTRO:'
        // Debug.Print '[' & azeta.Registro & ']'
        // Debug.Print
        // Debug.Print 'INFORMACION GLOBAL:'
        // Debug.Print '-------------------'
        // Debug.Print 'DF cant. cancelados := [' & azeta.RegGlobal.DF_CantidadCancelados & ']'
        // Debug.Print 'DF cant. emitidos   := [' & azeta.RegGlobal.DF_CantidadEmitidos & ']'
        // Debug.Print
        // Debug.Print 'DF total ventas     := [' & azeta.RegGlobal.DF_Total & ']'
        // Debug.Print
        // Debug.Print 'DF total gravado    := [' & azeta.RegGlobal.DF_TotalGravado & ']'
        // Debug.Print 'DF total IVA        := [' & azeta.RegGlobal.DF_TotalIVA & ']'
        // Debug.Print 'DF total tributos   := [' & azeta.RegGlobal.DF_TotalTributos & ']'
        // Debug.Print 'DF total no gravado := [' & azeta.RegGlobal.DF_TotalNoGravado & ']'
        // Debug.Print 'DF total exento     := [' & azeta.RegGlobal.DF_TotalExento & ']'
        // Debug.Print
        // Debug.Print 'DF total DNFH       := [' & azeta.RegGlobal.DNFH_Total & ']'
        // Debug.Print
      end;
    { End Select } end;

  azeta2 := HASARNG.ContinuarConsultaAcumulados;

  while (azeta2.Registro <> HasarArgentina_TLB.
    RegistroFinal) do
  begin
    // Select
    Case azeta2.Registro of
      HasarArgentina_TLB.RegistroDetalladoDF:
        begin
          // Debug.Print
          // Debug.Print 'TIPO REGISTRO:'
          // Debug.Print '[' & azeta2.Registro & ']'
          // Debug.Print
          // Debug.Print 'DF (Documentos Fiscales);:'
          // Debug.Print '-------------------------'
          // Debug.Print 'DF Tipo comprobante        := [' & FromTiposComprobanteToString(azeta2.RegDF.CodigoComprobante); & ']'
          // Debug.Print 'DF Nro. inicial            := [' & azeta2.RegDF.NumeroInicial & ']'
          // Debug.Print 'DF Nro. final              := [' & azeta2.RegDF.NumeroFinal & ']'
          // Debug.Print 'DF cancelados              := [' & azeta2.RegDF.CantidadCancelados & ']'
          // Debug.Print
          // Debug.Print 'DF total ventas            := [' & azeta2.RegDF.Total & ']'
          // Debug.Print
          // Debug.Print 'DF total gravado           := [' & azeta2.RegDF.TotalGravado & ']'
          // Debug.Print 'DF total no gravado        := [' & azeta2.RegDF.TotalNoGravado & ']'
          // Debug.Print 'DF total exento            := [' & azeta2.RegDF.TotalExento & ']'
          // Debug.Print
          // Debug.Print 'DF IVA 1                   := [' & azeta2.RegDF.AlicuotaIVA_1 & ']'
          // Debug.Print 'DF monto IVA 1             := [' & azeta2.RegDF.MontoIVA_1 & ']'
          // Debug.Print 'DF IVA 2                   := [' & azeta2.RegDF.AlicuotaIVA_2 & ']'
          // Debug.Print 'DF monto IVA 2             := [' & azeta2.RegDF.MontoIVA_2 & ']'
          // Debug.Print 'DF IVA 3                   := [' & azeta2.RegDF.AlicuotaIVA_3 & ']'
          // Debug.Print 'DF monto IVA 3             := [' & azeta2.RegDF.MontoIVA_3 & ']'
          // Debug.Print 'DF IVA 4                   := [' & azeta2.RegDF.AlicuotaIVA_4 & ']'
          // Debug.Print 'DF monto IVA 4             := [' & azeta2.RegDF.MontoIVA_4 & ']'
          // Debug.Print 'DF IVA 5                   := [' & azeta2.RegDF.AlicuotaIVA_5 & ']'
          // Debug.Print 'DF monto IVA 5             := [' & azeta2.RegDF.MontoIVA_5 & ']'
          // Debug.Print 'DF IVA 6                   := [' & azeta2.RegDF.AlicuotaIVA_6 & ']'
          // Debug.Print 'DF monto IVA 6             := [' & azeta2.RegDF.MontoIVA_6 & ']'
          // Debug.Print 'DF IVA 7                   := [' & azeta2.RegDF.AlicuotaIVA_7 & ']'
          // Debug.Print 'DF monto IVA 7             := [' & azeta2.RegDF.MontoIVA_7 & ']'
          // Debug.Print 'DF IVA 8                   := [' & azeta2.RegDF.AlicuotaIVA_8 & ']'
          // Debug.Print 'DF monto IVA 8             := [' & azeta2.RegDF.MontoIVA_8 & ']'
          // Debug.Print 'DF IVA 9                   := [' & azeta2.RegDF.AlicuotaIVA_9 & ']'
          // Debug.Print 'DF monto IVA 9             := [' & azeta2.RegDF.MontoIVA_9 & ']'
          // Debug.Print 'DF IVA 10                  := [' & azeta2.RegDF.AlicuotaIVA_10 & ']'
          // Debug.Print 'DF monto IVA 10            := [' & azeta2.RegDF.MontoIVA_10 & ']'
          // Debug.Print
          // Debug.Print 'DF total IVA               := [' & azeta2.RegDF.TotalIVA & ']'
          // Debug.Print
          // Debug.Print 'DF tributo 1               := [' & azeta2.RegDF.CodigoTributo1 & ']'
          // Debug.Print 'DF monto tributo 1         := [' & azeta2.RegDF.ImporteTributo1 & ']'
          // Debug.Print 'DF tributo 2               := [' & azeta2.RegDF.CodigoTributo2 & ']'
          // Debug.Print 'DF monto tributo 2         := [' & azeta2.RegDF.ImporteTributo2 & ']'
          // Debug.Print 'DF tributo 3               := [' & azeta2.RegDF.CodigoTributo3 & ']'
          // Debug.Print 'DF monto tributo 3         := [' & azeta2.RegDF.ImporteTributo3 & ']'
          // Debug.Print 'DF tributo 4               := [' & azeta2.RegDF.CodigoTributo4 & ']'
          // Debug.Print 'DF monto tributo 4         := [' & azeta2.RegDF.ImporteTributo4 & ']'
          // Debug.Print 'DF tributo 5               := [' & azeta2.RegDF.CodigoTributo5 & ']'
          // Debug.Print 'DF monto tributo 5         := [' & azeta2.RegDF.ImporteTributo5 & ']'
          // Debug.Print 'DF tributo 6               := [' & azeta2.RegDF.CodigoTributo6 & ']'
          // Debug.Print 'DF monto tributo 6         := [' & azeta2.RegDF.ImporteTributo6 & ']'
          // Debug.Print 'DF tributo 7               := [' & azeta2.RegDF.CodigoTributo7 & ']'
          // Debug.Print 'DF monto tributo 7         := [' & azeta2.RegDF.ImporteTributo7 & ']'
          // Debug.Print 'DF tributo 8               := [' & azeta2.RegDF.CodigoTributo8 & ']'
          // Debug.Print 'DF monto tributo 8         := [' & azeta2.RegDF.ImporteTributo8 & ']'
          // Debug.Print 'DF tributo 9               := [' & azeta2.RegDF.CodigoTributo9 & ']'
          // Debug.Print 'DF monto tributo 9         := [' & azeta2.RegDF.ImporteTributo9 & ']'
          // Debug.Print 'DF tributo 10              := [' & azeta2.RegDF.CodigoTributo10 & ']'
          // Debug.Print 'DF monto tributo 10        := [' & azeta2.RegDF.ImporteTributo10 & ']'
          // Debug.Print 'DF tributo 11              := [' & azeta2.RegDF.CodigoTributo11 & ']'
          // Debug.Print 'DF monto tributo 11        := [' & azeta2.RegDF.ImporteTributo11 & ']'
          // Debug.Print
          // Debug.Print 'DF total tributos          := [' & azeta2.RegDF.TotalTributos & ']'
          // Debug.Print
        end;
      HasarArgentina_TLB.RegistroDetalladoDNFH:
        begin
          // Debug.Print
          // Debug.Print 'TIPO REGISTRO:'
          // Debug.Print '[' & azeta2.Registro & ']'
          // Debug.Print
          // Debug.Print 'DNFH (Documentos No Fiscales Homologados);: :=QUE ACUMULAN:='
          // Debug.Print '---------------------------------------------------------'
          // Debug.Print 'DNFH Tipo Comprob.         := [' & FromTiposComprobanteToString(azeta2.RegDNFH.CodigoComprobante); & ']'
          // Debug.Print 'DNFH Nro. inicial          := [' & azeta2.RegDNFH.NumeroInicial & ']'
          // Debug.Print 'DNFH Nro. Final            := [' & azeta2.RegDNFH.NumeroFinal & ']'
          // Debug.Print 'DNFH total acumulado       := [' & azeta2.RegDNFH.Total & ']'
          // Debug.Print
        end;
      HasarArgentina_TLB.RegistroDetalladoDNFHNoAcum:
        begin
          // Debug.Print
          // Debug.Print 'TIPO REGISTRO:'
          // Debug.Print '[' & azeta2.Registro & ']'
          // Debug.Print
          // Debug.Print 'DNFH (Documentos No Fiscales Homologados);: :=QUE NO ACUMULAN:='
          // Debug.Print '------------------------------------------------------------'
          // Debug.Print 'Tipo Comprobante := [' & FromTiposComprobanteToString(azeta2.RegDNFH_NoAcum.CodigoComprobante); & ']'
          // Debug.Print 'Nº inicial       := [' & azeta2.RegDNFH_NoAcum.NumeroInicial & ']'
          // Debug.Print 'Nº final         := [' & azeta2.RegDNFH_NoAcum.NumeroFinal & ']'
          // Debug.Print
        end;
      HasarArgentina_TLB.RegistroGlobal:
        begin
          // Debug.Print
          // Debug.Print 'TIPO REGISTRO:'
          // Debug.Print '[' & azeta2.Registro & ']'
          // Debug.Print
          // Debug.Print 'INFORMACION GLOBAL:'
          // Debug.Print '-------------------'
          // Debug.Print 'DF cant. cancelados := [' & azeta2.RegGlobal.DF_CantidadCancelados & ']'
          // Debug.Print 'DF cant. emitidos   := [' & azeta2.RegGlobal.DF_CantidadEmitidos & ']'
          // Debug.Print
          // Debug.Print 'DF total ventas     := [' & azeta2.RegGlobal.DF_Total & ']'
          // Debug.Print
          // Debug.Print 'DF total gravado    := [' & azeta2.RegGlobal.DF_TotalGravado & ']'
          // Debug.Print 'DF total IVA        := [' & azeta2.RegGlobal.DF_TotalIVA & ']'
          // Debug.Print 'DF total tributos   := [' & azeta2.RegGlobal.DF_TotalTributos & ']'
          // Debug.Print 'DF total no gravado := [' & azeta2.RegGlobal.DF_TotalNoGravado & ']'
          // Debug.Print 'DF total exento     := [' & azeta2.RegGlobal.DF_TotalExento & ']'
          // Debug.Print
          // Debug.Print 'DF total DNFH       := [' & azeta2.RegGlobal.DNFH_Total & ']'
          // Debug.Print
        end;
      { End Select } end;

    azeta2 := HASARNG.ContinuarConsultaAcumulados;
    { Wend } end;

  // Debug.Print
  // Debug.Print 'NO HAY MAS INFORMACION DISPONIBLE !...'
  // Debug.Print
  // Debug.Print 'FIN DE LA CONSULTA !...'
  // Debug.Print
  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Consultar configuración del servidor de correo electrónico.
// ====================================================================================================================
{ Private Sub }
procedure CommandConsCorreo_Click;
{ Dim }
var
  respcorreo: RespuestaConsultarConfiguracionServidorCorreo;

  // Debug.Print
  // Debug.Print 'CONSULTANDO CONFIGURACION DEL SERVIDOR DE CORREO ELECTRONICO...'
  // Debug.Print

begin // On Error GoTo keka
  respcorreo := HASARNG.ConsultarConfiguracionServidorCorreo;
  // Debug.Print
  // Debug.Print 'IP Servidor SMTP     := [' & respcorreo.DireccionIP & ']'
  // Debug.Print 'Port Servidor SMTP   := [' & respcorreo.Puerto & ']'
  // Debug.Print 'Responder a          := [' & respcorreo.DireccionRemitente & ']'

  // Debug.Print
  // Debug.Print 'FIN DE LA CONSULTA !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Consultar documentos asociados.
// ====================================================================================================================
{ Private Sub }
procedure CommandConsDocAsoc_Click;
{ Dim }
var
  respdoc: RespuestaConsultarDocumentoAsociado;
  // Debug.Print
  // Debug.Print 'CONSULTANDO DOCUMENTOS ASOCIADOS...'
  // Debug.Print

begin // On Error GoTo keka
  respdoc := HASARNG.ConsultarDocumentoAsociado(1);
  // Debug.Print
  // Debug.Print ':=LINEA 1:='
  // Debug.Print 'Tipo comprobante := [' & FromTiposComprobanteToString(respdoc.CodigoComprobante); & ']'
  // Debug.Print 'Nro. comprobante := [' & respdoc.NumeroPos & '-' & respdoc.NumeroComprobante & ']'
  // Debug.Print

  respdoc := HASARNG.ConsultarDocumentoAsociado(2);
  // Debug.Print
  // Debug.Print ':=LINEA 2:='
  // Debug.Print 'Tipo comprobante := [' & FromTiposComprobanteToString(respdoc.CodigoComprobante); & ']'
  // Debug.Print 'Nro. comprobante := [' & respdoc.NumeroPos & '-' & respdoc.NumeroComprobante & ']'

  // Debug.Print
  // Debug.Print 'FIN DE LA CONSULTA !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Consultar información último error producido.
// ====================================================================================================================
{ Private Sub }
procedure CommandConsError_Click;
{ Dim }
var
  resperr: RespuestaConsultarUltimoError;

  // Debug.Print
  // Debug.Print 'CONSULTANDO ULTIMO ERROR...'
  // Debug.Print

begin // On Error GoTo keka
  resperr := HASARNG.ConsultarUltimoError;
  // Debug.Print
  // Debug.Print 'ID error := [' & resperr.UltimoError & ']'
  // Debug.Print 'Campo    := [' & resperr.NumeroParametro & ' :: ' & resperr.NombreParametro & ']'
  // Debug.Print 'Mensaje  := [' & resperr.Descripcion & ']'
  // Debug.Print 'Contexto := [' & resperr.Contexto & ']'

  // Debug.Print
  // Debug.Print 'FIN DE LA CONSULTA !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Consultar estado general de la impresora fiscal.
// ====================================================================================================================
{ Private Sub }
procedure CommandConsEstado_Click;
{ Dim }
var
  respest: RespuestaConsultarEstado;

  // Debug.Print
  // Debug.Print 'CONSULTANDO ESTADO GENERAL IMPRESORA FISCAL...'
  // Debug.Print

begin // On Error GoTo keka
  respest := HASARNG.ConsultarEstado(NoDocumento);
  // Debug.Print
  // Debug.Print 'Tipo Comprobante      := [' & FromTiposComprobanteToString(respest.CodigoComprobante); & ']'
  // Debug.Print 'Ultimo Nro.           := [' & respest.NumeroUltimoComprobante & ']'
  // Debug.Print 'Cancelados            := [' & respest.CantidadCancelados & ']'
  // Debug.Print 'Emitidos              := [' & respest.CantidadEmitidos & ']'
  // Debug.Print
  // Debug.Print 'Almacenado en memoria de trabajo...'
  // Debug.Print 'Código de barras      := [' & respest.EstadoAuxiliar.CodigoBarrasAlmacenado & ']'
  // Debug.Print 'Datos del cliente     := [' & respest.EstadoAuxiliar.DatosClienteAlmacenados & ']'
  // Debug.Print
  // Debug.Print 'Memoria de auditoria...'
  // Debug.Print 'Casi llena            := [' & respest.EstadoAuxiliar.MemoriaAuditoriaCasiLlena & ']'
  // Debug.Print 'Llena                 := [' & respest.EstadoAuxiliar.MemoriaAuditoriaLlena & ']'
  // Debug.Print
  // Debug.Print 'Otra info...'
  // Debug.Print 'Modo entrenamiento    := [' & respest.EstadoAuxiliar.ModoEntrenamiento & ']'
  // Debug.Print 'Ult. comprob. cancel. := [' & respest.EstadoAuxiliar.UltimoComprobanteFueCancelado & ']'

  // Debug.Print
  // Debug.Print 'FIN DE LA CONSULTA !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Consultar información acerca del modelo y versión de la impresora fiscal.
// ====================================================================================================================
{ Private Sub }
procedure CommandConsModvers_Click;
{ Dim }
var
  resp: RespuestaConsultarVersion;

  // Debug.Print
  // Debug.Print 'CONSULTANDO MODELO Y VERSION IMPRESORA FISCAL...'
  // Debug.Print

begin // On Error GoTo keka
  resp := HASARNG.ConsultarVersion;
  // Debug.Print
  // Debug.Print 'Impresora fiscal  := [' & resp.NombreProducto & ']'
  // Debug.Print 'Marca             := [' & resp.Marca & ']'
  // Debug.Print 'Modelo y versión  := [' & resp.Version & ']'
  // Debug.Print 'Fecha firmware    := [' & resp.FechaFirmware & ']'
  // Debug.Print 'Versión motor     := [' & resp.VersionMotor & ']'
  // Debug.Print 'Versión protocolo := [' & resp.VersionProtocolo & ']'

  // Debug.Print
  // Debug.Print 'FIN DE LA CONSULTA !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Consultar capacidad de cierres 'Z'.
// ====================================================================================================================
{ Private Sub }
procedure CommandConsZetas_Click;
{ Dim }
var
  respz: RespuestaConsultarCapacidadZetas;

  // Debug.Print
  // Debug.Print 'CONSULTANDO CAPACIDAD CIERRES 'Z'...'
  // Debug.Print

begin // On Error GoTo keka
  respz := HASARNG.ConsultarCapacidadZetas;
  // Debug.Print
  // Debug.Print 'Cierres 'Z' totales     := [' & respz.MaximaCantidadDeZetas & ']'
  // Debug.Print 'Cierres 'Z' realizados  := [' & respz.UltimaZeta & ']'
  // Debug.Print 'Cierres 'Z' disponibles := [' & (Val(respz.MaximaCantidadDeZetas); - Val(respz.UltimaZeta);); & ']'

  // Debug.Print
  // Debug.Print 'FIN DE LA CONSULTA !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Consultar líneas de usuario, por zona.
// ====================================================================================================================
{ Private Sub }
procedure CommandConsZona_Click;
{ Dim }
var
  resp: RespuestaConsultarZona;

  // Debug.Print
  // Debug.Print 'CONSULTANDO LINEAS DE USUARIO POR ZONA...'
  // Debug.Print

begin // On Error GoTo keka
  resp := HASARNG.ConsultarZona(1, EstacionTicket, ZonaFantasia);
  // Debug.Print
  // Debug.Print ':=LINEA 1 , Fantasía:='
  // Debug.Print 'Estilo: Borrado     := [' & resp.Atributos.BorradoTexto & ']'
  // Debug.Print 'Estilo: Centrado    := [' & resp.Atributos.Centrado & ']'
  // Debug.Print 'Estilo: Doble ancho := [' & resp.Atributos.DobleAncho & ']'
  // Debug.Print 'Estilo: Negrita     := [' & resp.Atributos.Negrita & ']'
  // Debug.Print 'Texto               := [' & resp.Descripcion & ']'
  // Debug.Print

  resp := HASARNG.ConsultarZona(2, EstacionTicket, ZonaFantasia);
  // Debug.Print
  // Debug.Print ':=LINEA 2 , Fantasía:='
  // Debug.Print 'Estilo: Borrado     := [' & resp.Atributos.BorradoTexto & ']'
  // Debug.Print 'Estilo: Centrado    := [' & resp.Atributos.Centrado & ']'
  // Debug.Print 'Estilo: Doble ancho := [' & resp.Atributos.DobleAncho & ']'
  // Debug.Print 'Estilo: Negrita     := [' & resp.Atributos.Negrita & ']'
  // Debug.Print 'Texto  := [' & resp.Descripcion & ']'
  // Debug.Print

  resp := HASARNG.ConsultarZona(1, EstacionTicket, Zona1Encabezado);
  // Debug.Print
  // Debug.Print ':=LINEA 1 , Encabezado 1:='
  // Debug.Print 'Estilo: Borrado     := [' & resp.Atributos.BorradoTexto & ']'
  // Debug.Print 'Estilo: Centrado    := [' & resp.Atributos.Centrado & ']'
  // Debug.Print 'Estilo: Doble ancho := [' & resp.Atributos.DobleAncho & ']'
  // Debug.Print 'Estilo: Negrita     := [' & resp.Atributos.Negrita & ']'
  // Debug.Print 'Texto  := [' & resp.Descripcion & ']'
  // Debug.Print

  resp := HASARNG.ConsultarZona(2, EstacionTicket, Zona1Encabezado);
  // Debug.Print
  // Debug.Print ':=LINEA 2 , Encabezado 1:='
  // Debug.Print 'Estilo: Borrado     := [' & resp.Atributos.BorradoTexto & ']'
  // Debug.Print 'Estilo: Centrado    := [' & resp.Atributos.Centrado & ']'
  // Debug.Print 'Estilo: Doble ancho := [' & resp.Atributos.DobleAncho & ']'
  // Debug.Print 'Estilo: Negrita     := [' & resp.Atributos.Negrita & ']'
  // Debug.Print 'Texto  := [' & resp.Descripcion & ']'
  // Debug.Print

  resp := HASARNG.ConsultarZona(3, EstacionTicket, Zona1Encabezado);
  // Debug.Print
  // Debug.Print ':=LINEA 3 , Encabezado 1:='
  // Debug.Print 'Estilo: Borrado     := [' & resp.Atributos.BorradoTexto & ']'
  // Debug.Print 'Estilo: Centrado    := [' & resp.Atributos.Centrado & ']'
  // Debug.Print 'Estilo: Doble ancho := [' & resp.Atributos.DobleAncho & ']'
  // Debug.Print 'Estilo: Negrita     := [' & resp.Atributos.Negrita & ']'
  // Debug.Print 'Texto  := [' & resp.Descripcion & ']'
  // Debug.Print

  resp := HASARNG.ConsultarZona(1, EstacionTicket, Zona2Encabezado);
  // Debug.Print
  // Debug.Print ':=LINEA 1 , Encabezado 2:='
  // Debug.Print 'Estilo: Borrado     := [' & resp.Atributos.BorradoTexto & ']'
  // Debug.Print 'Estilo: Centrado    := [' & resp.Atributos.Centrado & ']'
  // Debug.Print 'Estilo: Doble ancho := [' & resp.Atributos.DobleAncho & ']'
  // Debug.Print 'Estilo: Negrita     := [' & resp.Atributos.Negrita & ']'
  // Debug.Print 'Texto  := [' & resp.Descripcion & ']'
  // Debug.Print

  resp := HASARNG.ConsultarZona(2, EstacionTicket, Zona2Encabezado);
  // Debug.Print
  // Debug.Print ':=LINEA 2 , Encabezado 2:='
  // Debug.Print 'Estilo: Borrado     := [' & resp.Atributos.BorradoTexto & ']'
  // Debug.Print 'Estilo: Centrado    := [' & resp.Atributos.Centrado & ']'
  // Debug.Print 'Estilo: Doble ancho := [' & resp.Atributos.DobleAncho & ']'
  // Debug.Print 'Estilo: Negrita     := [' & resp.Atributos.Negrita & ']'
  // Debug.Print 'Texto  := [' & resp.Descripcion & ']'
  // Debug.Print

  resp := HASARNG.ConsultarZona(3, EstacionTicket, Zona2Encabezado);
  // Debug.Print
  // Debug.Print ':=LINEA 3 , Encabezado 2:='
  // Debug.Print 'Estilo: Borrado     := [' & resp.Atributos.BorradoTexto & ']'
  // Debug.Print 'Estilo: Centrado    := [' & resp.Atributos.Centrado & ']'
  // Debug.Print 'Estilo: Doble ancho := [' & resp.Atributos.DobleAncho & ']'
  // Debug.Print 'Estilo: Negrita     := [' & resp.Atributos.Negrita & ']'
  // Debug.Print 'Texto  := [' & resp.Descripcion & ']'
  // Debug.Print

  resp := HASARNG.ConsultarZona(1, EstacionTicket, Zona1Cola);
  // Debug.Print
  // Debug.Print ':=LINEA 1 , Cola 1:='
  // Debug.Print 'Estilo: Borrado     := [' & resp.Atributos.BorradoTexto & ']'
  // Debug.Print 'Estilo: Centrado    := [' & resp.Atributos.Centrado & ']'
  // Debug.Print 'Estilo: Doble ancho := [' & resp.Atributos.DobleAncho & ']'
  // Debug.Print 'Estilo: Negrita     := [' & resp.Atributos.Negrita & ']'
  // Debug.Print 'Texto  := [' & resp.Descripcion & ']'
  // Debug.Print

  resp := HASARNG.ConsultarZona(2, EstacionTicket, Zona1Cola);
  // Debug.Print
  // Debug.Print ':=LINEA 2 , Cola 1:='
  // Debug.Print 'Estilo: Borrado     := [' & resp.Atributos.BorradoTexto & ']'
  // Debug.Print 'Estilo: Centrado    := [' & resp.Atributos.Centrado & ']'
  // Debug.Print 'Estilo: Doble ancho := [' & resp.Atributos.DobleAncho & ']'
  // Debug.Print 'Estilo: Negrita     := [' & resp.Atributos.Negrita & ']'
  // Debug.Print 'Texto  := [' & resp.Descripcion & ']'
  // Debug.Print

  resp := HASARNG.ConsultarZona(3, EstacionTicket, Zona1Cola);
  // Debug.Print
  // Debug.Print ':=LINEA 3 , Cola 1:='
  // Debug.Print 'Estilo: Borrado     := [' & resp.Atributos.BorradoTexto & ']'
  // Debug.Print 'Estilo: Centrado    := [' & resp.Atributos.Centrado & ']'
  // Debug.Print 'Estilo: Doble ancho := [' & resp.Atributos.DobleAncho & ']'
  // Debug.Print 'Estilo: Negrita     := [' & resp.Atributos.Negrita & ']'
  // Debug.Print 'Texto  := [' & resp.Descripcion & ']'
  // Debug.Print

  resp := HASARNG.ConsultarZona(4, EstacionTicket, Zona1Cola);
  // Debug.Print
  // Debug.Print ':=LINEA 4 , Cola 1:='
  // Debug.Print 'Estilo: Borrado     := [' & resp.Atributos.BorradoTexto & ']'
  // Debug.Print 'Estilo: Centrado    := [' & resp.Atributos.Centrado & ']'
  // Debug.Print 'Estilo: Doble ancho := [' & resp.Atributos.DobleAncho & ']'
  // Debug.Print 'Estilo: Negrita     := [' & resp.Atributos.Negrita & ']'
  // Debug.Print 'Texto  := [' & resp.Descripcion & ']'
  // Debug.Print

  resp := HASARNG.ConsultarZona(1, EstacionTicket, Zona2Cola);
  // Debug.Print
  // Debug.Print ':=LINEA 1 , Cola 2:='
  // Debug.Print 'Estilo: Borrado     := [' & resp.Atributos.BorradoTexto & ']'
  // Debug.Print 'Estilo: Centrado    := [' & resp.Atributos.Centrado & ']'
  // Debug.Print 'Estilo: Doble ancho := [' & resp.Atributos.DobleAncho & ']'
  // Debug.Print 'Estilo: Negrita     := [' & resp.Atributos.Negrita & ']'
  // Debug.Print 'Texto  := [' & resp.Descripcion & ']'
  // Debug.Print

  resp := HASARNG.ConsultarZona(2, EstacionTicket, Zona2Cola);
  // Debug.Print
  // Debug.Print ':=LINEA 2 , Cola 2:='
  // Debug.Print 'Estilo: Borrado     := [' & resp.Atributos.BorradoTexto & ']'
  // Debug.Print 'Estilo: Centrado    := [' & resp.Atributos.Centrado & ']'
  // Debug.Print 'Estilo: Doble ancho := [' & resp.Atributos.DobleAncho & ']'
  // Debug.Print 'Estilo: Negrita     := [' & resp.Atributos.Negrita & ']'
  // Debug.Print 'Texto  := [' & resp.Descripcion & ']'
  // Debug.Print

  resp := HASARNG.ConsultarZona(3, EstacionTicket, Zona2Cola);
  // Debug.Print
  // Debug.Print ':=LINEA 3 , Cola 2:='
  // Debug.Print 'Estilo: Borrado     := [' & resp.Atributos.BorradoTexto & ']'
  // Debug.Print 'Estilo: Centrado    := [' & resp.Atributos.Centrado & ']'
  // Debug.Print 'Estilo: Doble ancho := [' & resp.Atributos.DobleAncho & ']'
  // Debug.Print 'Estilo: Negrita     := [' & resp.Atributos.Negrita & ']'
  // Debug.Print 'Texto  := [' & resp.Descripcion & ']'
  // Debug.Print

  resp := HASARNG.ConsultarZona(4, EstacionTicket, Zona2Cola);
  // Debug.Print
  // Debug.Print ':=LINEA 4 , Cola 2:='
  // Debug.Print 'Estilo: Borrado     := [' & resp.Atributos.BorradoTexto & ']'
  // Debug.Print 'Estilo: Centrado    := [' & resp.Atributos.Centrado & ']'
  // Debug.Print 'Estilo: Doble ancho := [' & resp.Atributos.DobleAncho & ']'
  // Debug.Print 'Estilo: Negrita     := [' & resp.Atributos.Negrita & ']'
  // Debug.Print 'Texto  := [' & resp.Descripcion & ']'
  // Debug.Print

  resp := HASARNG.ConsultarZona(5, EstacionTicket, Zona2Cola);
  // Debug.Print
  // Debug.Print ':=LINEA 5 , Cola 2:='
  // Debug.Print 'Estilo: Borrado     := [' & resp.Atributos.BorradoTexto & ']'
  // Debug.Print 'Estilo: Centrado    := [' & resp.Atributos.Centrado & ']'
  // Debug.Print 'Estilo: Doble ancho := [' & resp.Atributos.DobleAncho & ']'
  // Debug.Print 'Estilo: Negrita     := [' & resp.Atributos.Negrita & ']'
  // Debug.Print 'Texto  := [' & resp.Descripcion & ']'
  // Debug.Print

  resp := HASARNG.ConsultarZona(6, EstacionTicket, Zona2Cola);
  // Debug.Print
  // Debug.Print ':=LINEA 6 , Cola 2:='
  // Debug.Print 'Estilo: Borrado     := [' & resp.Atributos.BorradoTexto & ']'
  // Debug.Print 'Estilo: Centrado    := [' & resp.Atributos.Centrado & ']'
  // Debug.Print 'Estilo: Doble ancho := [' & resp.Atributos.DobleAncho & ']'
  // Debug.Print 'Estilo: Negrita     := [' & resp.Atributos.Negrita & ']'
  // Debug.Print 'Texto  := [' & resp.Descripcion & ']'
  // Debug.Print

  resp := HASARNG.ConsultarZona(1, EstacionTicket, ZonaDomicilioEmisor);
  // Debug.Print
  // Debug.Print ':=LINEA 1 , Domicilio emisor:='
  // Debug.Print 'Estilo: Borrado     := [' & resp.Atributos.BorradoTexto & ']'
  // Debug.Print 'Estilo: Centrado    := [' & resp.Atributos.Centrado & ']'
  // Debug.Print 'Estilo: Doble ancho := [' & resp.Atributos.DobleAncho & ']'
  // Debug.Print 'Estilo: Negrita     := [' & resp.Atributos.Negrita & ']'
  // Debug.Print 'Texto  := [' & resp.Descripcion & ']'
  // Debug.Print

  resp := HASARNG.ConsultarZona(2, EstacionTicket, ZonaDomicilioEmisor);
  // Debug.Print
  // Debug.Print ':=LINEA 2 , Domicilio emisor:='
  // Debug.Print 'Estilo: Borrado     := [' & resp.Atributos.BorradoTexto & ']'
  // Debug.Print 'Estilo: Centrado    := [' & resp.Atributos.Centrado & ']'
  // Debug.Print 'Estilo: Doble ancho := [' & resp.Atributos.DobleAncho & ']'
  // Debug.Print 'Estilo: Negrita     := [' & resp.Atributos.Negrita & ']'
  // Debug.Print 'Texto  := [' & resp.Descripcion & ']'
  // Debug.Print

  resp := HASARNG.ConsultarZona(3, EstacionTicket, ZonaDomicilioEmisor);
  // Debug.Print
  // Debug.Print ':=LINEA 3 , Domicilio emisor:='
  // Debug.Print 'Estilo: Borrado     := [' & resp.Atributos.BorradoTexto & ']'
  // Debug.Print 'Estilo: Centrado    := [' & resp.Atributos.Centrado & ']'
  // Debug.Print 'Estilo: Doble ancho := [' & resp.Atributos.DobleAncho & ']'
  // Debug.Print 'Estilo: Negrita     := [' & resp.Atributos.Negrita & ']'
  // Debug.Print 'Texto  := [' & resp.Descripcion & ']'
  // Debug.Print

  resp := HASARNG.ConsultarZona(4, EstacionTicket, ZonaDomicilioEmisor);
  // Debug.Print
  // Debug.Print ':=LINEA 4 , Domicilio emisor:='
  // Debug.Print 'Estilo: Borrado     := [' & resp.Atributos.BorradoTexto & ']'
  // Debug.Print 'Estilo: Centrado    := [' & resp.Atributos.Centrado & ']'
  // Debug.Print 'Estilo: Doble ancho := [' & resp.Atributos.DobleAncho & ']'
  // Debug.Print 'Estilo: Negrita     := [' & resp.Atributos.Negrita & ']'
  // Debug.Print 'Texto  := [' & resp.Descripcion & ']'

  // Debug.Print
  // Debug.Print 'FIN DE LA CONSULTA !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Se pide la reimpresión de un comprobante cualquera.
// ====================================================================================================================
{ Private Sub }
procedure CommandCopiarDoc_Click;

// Debug.Print
// Debug.Print 'SOLICITANDO REIMPRESION DE COMPROBANTE...'
// Debug.Print

begin // On Error GoTo keka
  // Debug.Print 'Copia de Tique Factura 'A' Nº 13'
  HASARNG.CopiarComprobante(TiqueFacturaA, 13);

  // Debug.Print
  // Debug.Print 'COMPROBANTE REIMPRESO !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Consultar datos de inicialización de la impresora fiscal.
// ====================================================================================================================
{ Private Sub }
procedure CommandDatosIni_Click;
{ Dim }
var
  datosini: RespuestaConsultarDatosInicializacion;

  // Debug.Print
  // Debug.Print 'CONSULTANDO DATOS DE INCIALIZACION...'
  // Debug.Print

begin // On Error GoTo keka
  datosini := HASARNG.ConsultarDatosInicializacion;
  // Debug.Print
  // Debug.Print 'Razón Social      := [' & datosini.RazonSocial & ']'
  // Debug.Print 'CUIT              := [' & datosini.Cuit & ']'
  // Debug.Print 'Responsab. IVA    := [' & FromTiposDeResponsabilidadesImpresorToString(datosini.ResponsabilidadIVA); & ']'
  // Debug.Print 'Ingr. Brutos      := [' & datosini.IngBrutos & ']'
  // Debug.Print 'Fecha inicio act. := [' & datosini.FechaInicioActividades & ']'
  // Debug.Print 'Nro. POS          := [' & datosini.NumeroPos & ']'
  // Debug.Print 'Reg. impr. fiscal := [' & datosini.Registro & ']'

  // Debug.Print
  // Debug.Print 'FIN DE LA CONSULTA !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Comando para el envío de comprobantes, por correo electrónico.
// ====================================================================================================================
{ Private Sub }
procedure CommandDocxMail_Click;

// Debug.Print
// Debug.Print 'ENVIANDO COMPROBANTE POR MAIL:'
// Debug.Print

begin // On Error GoTo keka
  // Debug.Print 'Enviando: Tique Factura 'A' Nº 13 :: rcardenes@hasar.com'
  // Debug.Print
  HASARNG.EnviarDocumentoCorreo(TiqueFacturaA, 13, 'rcardenes@hasar.com');

  // Debug.Print
  // Debug.Print 'COMPROBANTE ENVIADO !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Impresión de un Comprobante Donación.
// ====================================================================================================================
{ Private Sub }
procedure CommandDONA_Click;
{ Dim }
var
  respabrir: RespuestaAbrirDocumento;
  { Dim }
  resppago: RespuestaImprimirPago;
  { Dim }
  respcierre: RespuestaCerrarDocumento;

begin // On Error GoTo keka
  // Debug.Print
  // Debug.Print 'IMPRIMIENDO - COMPROBANTE DONACION:'
  // Debug.Print

  HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
    ResponsableInscripto, TipoCUIT, 'Domicilio Cliente...',
    'Domicilio extensión 1...', 'Domicilio extensión 2...',
    'Domicilio extensión 3....');
  HASARNG.CargarDocumentoAsociado(1, TiqueFacturaA, 2019, 1458);
  HASARNG.CargarBeneficiario('Razón Social Beneficiario...', '00000000000',
    TipoCUIL, 'Domicilio Beneficiario...');
  respabrir := HASARNG.AbrirDocumento(ComprobanteDonacion);

  // Debug.Print
  // Debug.Print ' - (abrir); Comprob. Donación Nro.   := [' & respabrir.NumeroComprobante & ']'
  // Debug.Print

  HASARNG.ImprimirItem('Monto parcial vuelto...', 1, 10, Exento, 0,
    ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1, '',
    'DONA', Donacion);
  resppago := HASARNG.ImprimirPago('Efectivo...', 10, Pagar, DisplayNo, '',
    Efectivo, '', '');

  // Debug.Print
  // Debug.Print ' - Pagando... Cambio                 := [' & resppago.Saldo & ']'
  // Debug.Print

  respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  // Debug.Print
  // Debug.Print ' - (cerrar);Comprobante Donación Nro. := [' & respcierre.NumeroComprobante & ']'
  // Debug.Print ' - Páginas                           := [' & respcierre.CantidadDePaginas & ']'
  // Debug.Print
  // Debug.Print 'COMPROBANTE DONACION IMPRESO !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Impresión del Detalle de ventas (cierre 'X');.
// ====================================================================================================================
{ Private Sub }
procedure CommandEquis_Click;
{ Dim }
var
  cierre: RespuestaCerrarJornadaFiscal;

  // Debug.Print
  // Debug.Print 'DETALLE DE VENTAS:'
  // Debug.Print

begin // On Error GoTo keka
  cierre := HASARNG.CerrarJornadaFiscal(ReporteX);
  // Debug.Print
  // Debug.Print 'Reporte...        := [' & cierre.Reporte & ']'
  // Debug.Print
  // Debug.Print 'Detalle Nro.      := [' & cierre.X.Numero & ']'
  // Debug.Print
  // Debug.Print 'Fecha inicial     := [' & cierre.X.FechaInicio & ']'
  // Debug.Print 'Hora inicial      := [' & cierre.X.HoraInicio & ']'
  // Debug.Print 'Fecha final       := [' & cierre.X.FechaCierre & ']'
  // Debug.Print 'Hora final        := [' & cierre.X.HoraCierre & ']'
  // Debug.Print
  // Debug.Print 'DF Emitidos       := [' & cierre.X.DF_CantidadEmitidos & ']'
  // Debug.Print 'DF total ventas   := [' & cierre.X.DF_Total & ']'
  // Debug.Print 'DF total IVA      := [' & cierre.X.DF_TotalIVA & ']'
  // Debug.Print 'DF total tributos := [' & cierre.X.DF_TotalTributos & ']'
  // Debug.Print
  // Debug.Print 'DNFH emitidos     := [' & cierre.X.DNFH_CantidadEmitidos & ']'
  // Debug.Print
  // Debug.Print 'NC emitidas       := [' & cierre.X.NC_CantidadEmitidos & ']'
  // Debug.Print 'NC total crédito  := [' & cierre.X.NC_Total & ']'
  // Debug.Print 'NC total IVA      := [' & cierre.X.NC_TotalIVA & ']'
  // Debug.Print 'NC total tributos := [' & cierre.X.NC_TotalTributos & ']'

  // Debug.Print
  // Debug.Print 'DETALLE DE VENTAS IMPRESO !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Impresión de un Documento Genérico.
// ====================================================================================================================
{ Private Sub }
procedure CommandFechaHora_Click;
{ Dim }
var
  respfyh: RespuestaConsultarFechaHora;

  // Debug.Print
  // Debug.Print 'CONSULTA DE FECHA Y HORA:'
  // Debug.Print

begin // On Error GoTo keka
  respfyh := HASARNG.ConsultarFechaHora;
  // Debug.Print
  // Debug.Print 'Fecha := [' & respfyh.Fecha & ']'
  // Debug.Print 'Hora  := [' & respfyh.Hora & ']'

  // Debug.Print
  // Debug.Print 'FIN DE LA CONSULTA !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Impresión de un Documento Genérico.
// ====================================================================================================================
{ Private Sub }
procedure CommandGenerico_Click;
{ Dim }
var
  respabrir: RespuestaAbrirDocumento;
  { Dim }
  resppago: RespuestaImprimirPago;
  { Dim }
  estilo: AtributosDeTexto;
  { Dim }
  respcierre: RespuestaCerrarDocumento;

begin // On Error GoTo keka
  // Debug.Print
  // Debug.Print 'IMPRIMIENDO - DOCUMENTO GENERICO:'
  // Debug.Print

  HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
    ResponsableInscripto, TipoCUIT, 'Domicilio Cliente...',
    'Domicilio extensión 1...', 'Domicilio extensión 2...',
    'Domicilio extensión 3....');
  HASARNG.CargarDocumentoAsociado(1, FacturaA, 2019, 1458);

  respabrir := HASARNG.AbrirDocumento(Generico);
  // Debug.Print
  // Debug.Print ' - (abrir); Documento Genérico Nro. := [' & respabrir.NumeroComprobante & ']'
  // Debug.Print

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

  respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  // Debug.Print
  // Debug.Print ' - (cerrar);Documento Genérico Nro. := [' & respcierre.NumeroComprobante & ']'
  // Debug.Print ' - Páginas                         := [' & respcierre.CantidadDePaginas & ']'
  // Debug.Print
  // Debug.Print 'DOCUMENTO GENERICO IMPRESO !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Impresión de un Presupuesto 'X' clase 'A'.
// Se requiere un Cierre 'Z' previo.
// ====================================================================================================================
{ Private Sub }
procedure CommandModifCateg_Click;

// Debug.Print
// Debug.Print 'MODIFICANDO CATEGORIA IVA...'
// Debug.Print
// Debug.Print 'Nueva responsabilidad IVA := Responsable Inscripto'
// Debug.Print

begin // On Error GoTo keka
  HASARNG.CambiarCategoriaIVA(IFResponsableInscripto);
  // Debug.Print
  // Debug.Print 'CATEGORIA IVA MODIFICADA !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Modificar el código de inscripción en Ingresos Brutos.
// Se requiere un Cierre 'Z' previo.
// ====================================================================================================================
{ Private Sub }
procedure CommandModifIIBB_Click;

// Debug.Print
// Debug.Print 'MODIFICANDO INSCRIPCION INGRESOS BRUTOS...'
// Debug.Print
// Debug.Print 'Nuevo código Ingresos Brutos := IIBB-54321099876543210'
// Debug.Print

begin // On Error GoTo keka
  HASARNG.CambiarInscripIIBB('IIBB-54321099876543210');
  // Debug.Print
  // Debug.Print 'INSCRIPCION INGRESOS BRUTOS MODIFICADA !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Modificar la fecha de inicio de actividades.
// Se requiere un Cierre 'Z' previo.
// ====================================================================================================================
{ Private Sub }
procedure CommandModifIniActiv_Click;

// Debug.Print
// Debug.Print 'MODIFICANDO FECHA DE INICIO DE ACTIVIDADES...'
// Debug.Print
// Debug.Print 'Nueva fecha inicio actividades := 01/02/2015'
// Debug.Print

begin // On Error GoTo keka
  HASARNG.CambiarFechaInicioActividades('01/02/2015');
  // Debug.Print
  // Debug.Print 'FECHA DE INICIO DE ACTIVIDADES MODIFICADA !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Descarga de CTD.
// ====================================================================================================================
{ Private Sub }
procedure CommandObtRepAudit_Click;
{ Dim }
var
  resp: RespuestaObtenerPrimerBloqueAuditoria;
  { Dim }
  resp2: RespuestaObtenerSiguienteBloqueAuditoria;

  // Debug.Print
  // Debug.Print 'DESCARGA DE CTD (Cinta Testigo Digital);:'
  // Debug.Print

begin // On Error GoTo keka
  // Debug.Print 'Período: 01/02/2015 al 27/02/2015 , Comprimir, XML único'
  // Debug.Print
  resp := HASARNG.ObtenerPrimerBloqueAuditoria(150201, 150227, ReporteZFecha,
    Comprime, XMLUnico);
  // Debug.Print

  if (resp.Registro = BloqueFinal) then
  begin
    // Debug.Print 'NO HAY INFORMACION DISPONIBLE !...'
    // Debug.Print

    // Exit Sub
  end
  else
  begin
    // Debug.Print 'Primer bloque de información    := [' & resp.Informacion & ']'
    // Debug.Print
  end;
  { End If }

while True do
begin
  resp2 := HASARNG.ObtenerSiguienteBloqueAuditoria;

  if (resp2.Registro = BloqueInformacion) then
  begin
    // Debug.Print 'Siguiente bloque de información := [' & resp2.Informacion & ']'
    // Debug.Print
  end
  else
  begin
    // Debug.Print
    // Debug.Print 'NO HAY MAS INFORMACION DISPONIBLE !...'
    // Debug.Print
    // Debug.Print 'INFORMACION CTD DESCARGADA !...'
    // Debug.Print
  end;
  // Exit Sub
  { End If }
{ Wend } end;

// Exit Sub

// keka:
// Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

{ End Sub }
end;

// ====================================================================================================================
// Descarga de reportes electrónicos semanales.
// ====================================================================================================================
{ Private Sub }
procedure CommandObtRepDoc_Click;
{ Dim }
var
  resp: RespuestaObtenerPrimerBloqueDocumento;
  { Dim }
  resp2: RespuestaObtenerSiguienteBloqueDocumento;

  // Debug.Print
  // Debug.Print 'DESCARGA INFORMACION COMPROBANTES:'
  // Debug.Print

begin // On Error GoTo keka
  resp := HASARNG.ObtenerPrimerBloqueDocumento(1, 4, TiqueFacturaA, Comprime,
    XMLUnico);

  if (resp.Registro = BloqueFinal) then
  begin
    // Debug.Print 'NO HAY INFORMACION DISPONIBLE !...!'
    // Debug.Print

    // Exit Sub
    end
  else
  begin
    // Debug.Print 'Primer bloque de información    := [' & resp.Informacion & ']'
    // Debug.Print
    { End If } end;

  while (True) do
  begin
    resp2 := HASARNG.ObtenerSiguienteBloqueDocumento;

  if (resp2.Registro = BloqueInformacion) then
  begin
    // Debug.Print 'Siguiente bloque de información := [' & resp2.Informacion & ']'
    // Debug.Print
    end
  else
  begin
    // Debug.Print
    // Debug.Print 'NO HAY MAS INFORMACION DISPONIBLE !...'
    // Debug.Print
    // Debug.Print 'INFORMACION COMPROBANTES DESCARGADA !...'
    // Debug.Print

    // Exit Sub
    { End If } end;
  { Wend } end;

// Exit Sub

// keka:
// Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

{ End Sub }
end;

// ====================================================================================================================
// Descarga de reportes electrónicos semanales.
// ====================================================================================================================
{ Private Sub }
procedure CommandObtRepElectr_Click;
{ Dim }
var
  resp: RespuestaObtenerPrimerBloqueReporteElectronico;
  { Dim }
  resp2: RespuestaObtenerSiguienteBloqueReporteElectronico;

  // Debug.Print
  // Debug.Print 'DESCARGA DE REPORTES SEMANALES:'
  // Debug.Print

begin // On Error GoTo keka
  // Debug.Print 'Período: 01/02/2015 al 27/02/2015'
  resp := HASARNG.ObtenerPrimerBloqueReporteElectronico('01/02/2015',
    '27/02/2015');

  if (resp.Registro = BloqueFinal) then
  begin
    // Debug.Print
    // Debug.Print 'NO HAY INFORMACION DISPONIBLE !...'
    // Debug.Print

    // Exit Sub
    end
  else
  begin
    // Debug.Print 'Primer bloque de información    := [' & resp.Informacion & ']'
    // Debug.Print
    { End If } end;

  while (True) do
  begin
    resp2 := HASARNG.ObtenerSiguienteBloqueReporteElectronico;

  if (resp2.Registro = BloqueInformacion) then
  begin
    // Debug.Print 'Siguiente bloque de información := [' & resp2.Informacion & ']'
    // Debug.Print
    end
  else
  begin
    // Debug.Print
    // Debug.Print 'NO HAY MÁS INFORMACION DISPONIBLE !...'
    // Debug.Print
    // Debug.Print 'REPORTES SEMANALES DECARGADOS !...'
    // Debug.Print

    // Exit Sub
    { End If } end;
  { Wend } end;

// Exit Sub

// keka:
// Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

{ End Sub }
end;

// ====================================================================================================================
// Descarga del LOG interno de la impresora fiscal.
// ====================================================================================================================
{ Private Sub }
procedure CommandObtRepLog_Click;
{ Dim }
var
  resp: RespuestaObtenerPrimerBloqueLog;
  { Dim }
  resp2: RespuestaObtenerSiguienteBloqueLog;

  // Debug.Print
  // Debug.Print 'DESCARGA LOG INTERNO:'
  // Debug.Print

begin // On Error GoTo keka
  resp := HASARNG.ObtenerPrimerBloqueLog;

  if (resp.Registro = BloqueFinal) then
  begin
    // Debug.Print
    // Debug.Print 'NO HAY INFORMACION DISPONIBLE !...'
    // Debug.Print
    // Exit Sub
    end
  else
  begin
    // Debug.Print 'Primer bloque de información    := [' & resp.Informacion & ']'
    // Debug.Print
    { End If } end;

  While (True) do
  begin
    resp2 := HASARNG.ObtenerSiguienteBloqueLog;

  if (resp2.Registro = BloqueInformacion) then
  begin
    // Debug.Print 'Siguiente bloque de información := [' & resp2.Informacion & ']'
    // Debug.Print
    end
  else
  begin
    // Debug.Print
    // Debug.Print 'NO HAY MAS INFORMACION DISPONIBLE !...'
    // Debug.Print
    // Debug.Print 'LOG INTERNO DESCARGADO !...'
    // Debug.Print

    // Exit Sub
    { End If } end;
  { Wend } end;

// Exit Sub

// keka:
// Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

{ End Sub }
end;

// ====================================================================================================================
// Consulta de estado fiscal del último comando ejecutado.
// ====================================================================================================================
{ Private Sub }
procedure CommandObtStFiscal_Click;
{ Dim }
var
  resp: EstadoFiscal;

  // Debug.Print
  // Debug.Print 'CONSULTA ULTIMO ESTADO FISCAL:'
  // Debug.Print

begin // On Error GoTo keka
  resp := HASARNG.ObtenerUltimoEstadoFiscal;
  // Debug.Print 'Doc. abierto             := [' & resp.DocumentoAbierto & ']'
  // Debug.Print 'Doc. fiscal abierto      := [' & resp.DocumentoFiscalAbierto & ']'
  // Debug.Print 'Error aritmético         := [' & resp.ErrorAritmetico & ']'
  // Debug.Print 'Error de ejecución       := [' & resp.ErrorEjecucion & ']'
  // Debug.Print 'Error de estado          := [' & resp.ErrorEstado & ']'
  // Debug.Print 'Error general            := [' & resp.ErrorGeneral & ']'
  // Debug.Print 'Error mem. auditoría     := [' & resp.ErrorMemoriaAuditoria & ']'
  // Debug.Print 'Error mem. fiscal        := [' & resp.ErrorMemoriaFiscal & ']'
  // Debug.Print 'Error mem. trabajo       := [' & resp.ErrorMemoriaTrabajo & ']'
  // Debug.Print 'Error parámetro          := [' & resp.ErrorParametro & ']'
  // Debug.Print 'Mem. fiscal casi llena   := [' & resp.MemoriaFiscalCasiLlena & ']'
  // Debug.Print 'Mem. fiscal inicializada := [' & resp.MemoriaFiscalInicializada & ']'
  // Debug.Print 'Mem. fiscal llena        := [' & resp.MemoriaFiscalLlena & ']'

  // Debug.Print
  // Debug.Print 'FIN DE LA CONSULTA !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Consulta último estado de la impresora.
// ====================================================================================================================
{ Private Sub }
procedure CommandObtStImpr_Click;
{ Dim }
var
resp: EstadoImpresora;

// Debug.Print
// Debug.Print 'CONSULTA ULTIMO ESTADO DE IMPRESORA:'
// Debug.Print

begin // On Error GoTo keka
  resp := HASARNG.ObtenerUltimoEstadoImpresora;
  // Debug.Print 'Cajón abierto        := [' & resp.CajonAbierto & ']'
  // Debug.Print 'Error impresora      := [' & resp.ErrorImpresora & ']'
  // Debug.Print 'Falta papel testigo  := [' & resp.FaltaPapelJournal & ']'
  // Debug.Print 'Falta papel comprob. := [' & resp.FaltaPapelReceipt & ']'
  // Debug.Print 'Impresora ocupada    := [' & resp.ImpresoraOcupada & ']'
  // Debug.Print 'Impresora offline    := [' & resp.ImpresoraOffLine & ']'
  // Debug.Print 'Estado Or lógico     := [' & resp.OrLogico & ']'
  // Debug.Print 'Tapa abierta         := [' & resp.TapaAbierta & ']'

  // Debug.Print
  // Debug.Print 'FIN DE LA CONSULTA !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Impresión de Documento Patrón, según definición RG AFIP Nº 3561/13.
// ====================================================================================================================
{ Private Sub }
procedure CommandPatron_Click;
{ Dim }
var
  estilo: AtributosDeTexto;
  { Dim }
  resp: RespuestaAbrirDocumento;

  // Debug.Print
  // Debug.Print 'IMPRESION DE DOCUMENTO PATRON:'
  // Debug.Print

begin // On Error GoTo keka
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
  // Debug.Print
  // Debug.Print '(abrir); Doc. Patrón Nro. := [' & resp.NumeroComprobante & ']'
  // Debug.Print
  resp := HASARNG.AbrirDocumento(TiqueFacturaA);
  // Debug.Print 'Tique Factura 'A' Nº [' & resp.NumeroComprobante & ']... ABIERTO !'
  // Debug.Print

  // Debug.Print
  // Debug.Print 'DOCUMENTO PATRON IMPRESO !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description


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

  { End Sub }
end;

// ====================================================================================================================
// Impresión de un Presupuesto 'X' clase 'A'.
// ====================================================================================================================
{ Private Sub }
procedure CommandPRESUP_Click;
{ Dim }
var
  respabrir: RespuestaAbrirDocumento;
  { Dim }
  estilo: AtributosDeTexto;
  { Dim }
  respcierre: RespuestaCerrarDocumento;

begin // On Error GoTo keka
  // Debug.Print
  // Debug.Print 'IMPRIMIENDO - PRESUPUESTO 'X' Clase 'A':'
  // Debug.Print

  HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
    ResponsableInscripto, TipoCUIT, 'Domicilio Cliente...',
    'Domicilio extensión 1...', 'Domicilio extensión 2...',
    'Domicilio extensión 3....');
  respabrir := HASARNG.AbrirDocumento(PresupuestoX);
  // Debug.Print
  // Debug.Print ' - (abrir);Presupuesto 'X' Nro.  := [' & respabrir.NumeroComprobante & ']'
  // Debug.Print

  estilo.Negrita := True;
  HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
  HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21, ModoSumaMonto,
    IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
    '779123456789', '', Unidad);
  HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
    ModoPrecioTotal);

  respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  // Debug.Print
  // Debug.Print ' - (cerrar);Presupuesto 'X' Nro. := [' & respcierre.NumeroComprobante & ']'
  // Debug.Print ' - Páginas                      := [' & respcierre.CantidadDePaginas & ']'
  // Debug.Print
  // Debug.Print 'PRESUPUESTO 'X' IMPRESO !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Establecer conexión con la impresora fiscal y consultar estado fiscal, y de impresora, actual.
// ====================================================================================================================
{ Private Sub }
procedure CommandProtocolo_Click;
{ Dim }
var
  stprn: EstadoImpresora;
  { Dim }
  resp: RespuestaConsultarVersion;

begin // On Error GoTo keka
  // Debug.Print
  // Debug.Print '========================================'
  // Debug.Print 'VERIFICANDO CONEXION A IMPRESORA FISCAL:'
  // Debug.Print
  // Debug.Print 'ETHERNET - Conectando a... 10.0.7.69'
  // Debug.Print 'ETHERNET - Conectando a... 127.0.0.1'
  // Debug.Print
  HASARNG.Conectar( '10.0.7.69');
  HASARNG.Conectar( '127.0.0.1');
  // Debug.Print
  // Debug.Print 'CONECTADO ! ...'

  CommandObtStImpr_Click;
  CommandObtStFiscal_Click;
  // Debug.Print
  // Debug.Print 'OCX FISCAL HASAR NG versión := [' & HASARNG.ObtenerVersion & ']'
  // Debug.Print
  CommandConsModvers_Click;
  // Debug.Print '========================================'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Consultar rango de fechas, o números de cierres 'Z'.
// ====================================================================================================================
{ Private Sub }
procedure CommandRangoZ_Click;
{ Dim }
var
  resp1: RespuestaObtenerRangoFechasPorZetas;
  { Dim }
  resp2: RespuestaObtenerRangoZetasPorFechas;

begin // On Error GoTo keka
  // Debug.Print
  // Debug.Print 'CONSULTA RANGO NUMEROS DE CIERRES 'Z':'
  // Debug.Print
  // Debug.Print 'Rango consultado: 01/01/2015 al 31/12/2015...'
  // Debug.Print

  resp2 := HASARNG.ObtenerRangoZetasPorFechas('01/01/2014', '31/12/2015');
  // Debug.Print
  // Debug.Print 'Nro. 'Z' inicial  := [' & resp2.ZetaInicial & ']'
  // Debug.Print 'Nro. 'Z' final    := [' & resp2.ZetaFinal & ']'
  // Debug.Print

  // Debug.Print 'CONSULTA RANGO FECHAS DE CIERRES 'Z':'
  // Debug.Print
  // Debug.Print 'Rango consultado: 1 al 4000...'
  // Debug.Print

  resp1 := HASARNG.ObtenerRangoFechasPorZetas(1, 4000);
  // Debug.Print
  // Debug.Print 'Fecha 'Z' inicial := [' & resp1.FechaInicial & ']'
  // Debug.Print 'Fecha 'Z' final   := [' & resp1.FechaFinal & ']'

  // Debug.Print
  // Debug.Print 'FIN DE LA CONSULTA !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
end;

// ====================================================================================================================
// Impresión de un Recibo X'.
// ====================================================================================================================
{ Private Sub }
procedure CommandRBOX_Click;
{ Dim }
var
  respabrir: RespuestaAbrirDocumento;
  { Dim }
  resppago: RespuestaImprimirPago;
  { Dim }
  estilo: AtributosDeTexto;
  { Dim }
  respcierre: RespuestaCerrarDocumento;

begin // On Error GoTo keka
  // Debug.Print
  // Debug.Print 'IMPRIMIENDO - RECIBO 'X':'
  // Debug.Print

  HASARNG.CargarDocumentoAsociado(1, TiqueFacturaA, 2019, 1458);
  HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
    ResponsableInscripto, TipoCUIT, 'Domicilio Cliente...',
    'Domicilio extensión 1...', 'Domicilio extensión 2...',
    'Domicilio extensión 3....');
  respabrir := HASARNG.AbrirDocumento(ReciboX);
  // Debug.Print
  // Debug.Print ' - (abrir); Recibo 'X' Nro. := [' & respabrir.NumeroComprobante & ']'
  // Debug.Print

  HASARNG.ImprimirItem('Item a la venta...', 1, 3500, Gravado, 0, ModoSumaMonto,
    IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
    '779123456789', '', Unidad);
  HASARNG.ImprimirConceptoRecibo( 'Alquiler mes de Marzo de 2015...');

  resppago := HASARNG.ImprimirPago('Efectivo...', 3500, Pagar, DisplayNo, '',
    Efectivo, '', '');
  // Debug.Print
  // Debug.Print ' - Pagando... Cambio       := [' & resppago.Saldo & ']'
  // Debug.Print

  respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');
  // Debug.Print
  // Debug.Print ' - (cerrar);Recibo 'X' Nro. := [' & respcierre.NumeroComprobante & ']'
  // Debug.Print ' - Páginas                 := [' & respcierre.CantidadDePaginas & ']'
  // Debug.Print
  // Debug.Print 'RECIBO 'X' IMPRESO !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
  end;

  // ====================================================================================================================
  // Se pide otro ejemplar del último comprobante emitido.
  // ====================================================================================================================
  { Private Sub }
  procedure CommandReimpr_Click;
  { Dim }
  var resp: RespuestaPedirReimpresion;

  // Debug.Print
  // Debug.Print 'REIMPRESION COMPROBANTE:'
  // Debug.Print

  begin // On Error GoTo keka
  resp := HASARNG.PedirReimpresion;
  // Debug.Print
  // Debug.Print 'Copia Nro. := [' & resp.NumeroDeCopia & ']'
  // Debug.Print
  // Debug.Print 'FIN DE LA REIMPRESION !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
  end;

  // ====================================================================================================================
  // Impresión de un Remito 'R'.
  // ====================================================================================================================
  { Private Sub }
  procedure CommandRTOR_Click;
  { Dim }
  var respabrir: RespuestaAbrirDocumento;
  { Dim }
  resppago: RespuestaImprimirPago;
  { Dim }
  estilo: AtributosDeTexto;
  { Dim }
  respcierre: RespuestaCerrarDocumento;

  begin // On Error GoTo keka
  // Debug.Print
  // Debug.Print 'IMPRIMIENDO - REMITO 'R':'
  // Debug.Print

  HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
    ResponsableInscripto, TipoCUIT, 'Domicilio Cliente...',
    'Domicilio extensión 1...', 'Domicilio extensión 2...',
    'Domicilio extensión 3....');
  HASARNG.CargarTransportista('Razón Social Transportista...', '12345678903',
    'Domicilio Transportista...', 'Nombre del Chofer...', TipoCI, '12345678',
    'ABC123', 'DEF456'); HASARNG.CargarDocumentoAsociado(1, TiqueFacturaA, 2019,
    1458); respabrir := HASARNG.AbrirDocumento(RemitoR);
  // Debug.Print
  // Debug.Print ' - (abrir); Remito 'R' Nro. := [' & respabrir.NumeroComprobante & ']'
  // Debug.Print

  estilo.Negrita := True; HASARNG.ImprimirTextoFiscal(estilo,
    'Hasta agotar stock...', DisplayNo);
  HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21, ModoSumaMonto,
    IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1, '779123456789', '',
    Unidad); resppago := HASARNG.ImprimirPago('Efectivo...', 100, Pagar,
    DisplayNo, '', Efectivo, '', '');
  // Debug.Print
  // Debug.Print ' - Pagando... Cambio       := [' & resppago.Saldo & ']'
  // Debug.Print

  respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  // Debug.Print
  // Debug.Print ' - (cerrar);Remito 'R' Nro. := [' & respcierre.NumeroComprobante & ']'
  // Debug.Print ' - Páginas                 := [' & respcierre.CantidadDePaginas & ']'
  // Debug.Print
  // Debug.Print 'REMITO 'R' IMPRESO !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
  end;

  // ====================================================================================================================
  // Impresión de un Remito X'.
  // ====================================================================================================================
  { Private Sub }
  procedure CommandRTOX_Click;
  { Dim }
  var respabrir: RespuestaAbrirDocumento;
  { Dim }
  resppago: RespuestaImprimirPago;
  { Dim }
  estilo: AtributosDeTexto;
  { Dim }
  respcierre: RespuestaCerrarDocumento;

  begin // On Error GoTo keka
  // Debug.Print
  // Debug.Print 'IMPRIMIENDO - REMITO 'X':'
  // Debug.Print

  HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
    ResponsableInscripto, TipoCUIT, 'Domicilio Cliente...',
    'Domicilio extensión 1...', 'Domicilio extensión 2...',
    'Domicilio extensión 3....');
  HASARNG.CargarTransportista('Razón Social Transportista...', '12345678903',
    'Domicilio Transportista...', 'Nombre del Chofer...', TipoCI, '12345678',
    'ABC123', 'DEF456'); HASARNG.CargarDocumentoAsociado(1, TiqueFacturaA, 2019,
    1458); respabrir := HASARNG.AbrirDocumento(RemitoX);
  // Debug.Print
  // Debug.Print ' - (abrir); Remito 'X' Nro.  := [' & respabrir.NumeroComprobante & ']'
  // Debug.Print

  estilo.Negrita := True; HASARNG.ImprimirTextoFiscal(estilo,
    'Hasta agotar stock...', DisplayNo);
  HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21, ModoSumaMonto,
    IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1, '779123456789', '',
    Unidad); resppago := HASARNG.ImprimirPago('Efectivo...', 100, Pagar,
    DisplayNo, '', Efectivo, '', '');
  // Debug.Print
  // Debug.Print ' - Pagando... Cambio        := [' & resppago.Saldo & ']'
  // Debug.Print

  respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  // Debug.Print
  // Debug.Print ' - (cerrar); Remito 'X' Nro. := [' & respcierre.NumeroComprobante & ']'
  // Debug.Print ' - Páginas                  := [' & respcierre.CantidadDePaginas & ']'
  // Debug.Print
  // Debug.Print 'CREMITO 'X' IMPRESO !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
  end;

  // ====================================================================================================================
  // Se abandona la aplicación.
  // ====================================================================================================================
  { Private Sub }
  procedure CommandSalir_Click; begin

  // Debug.Print
  // Debug.Print '...Oh !.................................................'
  // Debug.Print '...................CERRANDO PROGRAMA....................'
  // Debug.Print '...............................................Chau !...'
  // Debug.Print

  exit; // End

  { End Sub }

  end;

  // ====================================================================================================================
  // Consulta de subtotal.
  // ====================================================================================================================
  { Private Sub }
  procedure CommandSubtot_Click;
  { Dim }
  var respsubt: RespuestaConsultarSubtotal;

  // Debug.Print
  // Debug.Print 'CONSULTA SUBTOTAL:'
  // Debug.Print

  begin // On Error GoTo keka
  respsubt := HASARNG.ConsultarSubtotal(NoImprimeSubtotal, DisplayNo);
  // Debug.Print
  // Debug.Print 'Cant. Items    := [' & respsubt.CantidadItems & ']'
  // Debug.Print 'Subtotal       := [' & respsubt.Subtotal & ']'
  // Debug.Print 'Base imponible := [' & respsubt.MontoBase & ']'
  // Debug.Print 'IVA            := [' & respsubt.MontoIVA & ']'
  // Debug.Print 'Imp. Internos  := [' & respsubt.MontoImpInternos & ']'
  // Debug.Print 'Otros tributos := [' & respsubt.MontoOtrosTributos & ']'
  // Debug.Print 'Pagado         := [' & respsubt.MontoPagado & ']'
  // Debug.Print
  // Debug.Print 'FIN DE LA CONSULTA !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
  end;

  // ====================================================================================================================
  // Impresión de un Tique Factura 'A'.
  // ====================================================================================================================
  { Private Sub }
  procedure CommandTFA_Click;
  { Dim }
  var respabrir: RespuestaAbrirDocumento;
  { Dim }
  resppago: RespuestaImprimirPago;
  { Dim }
  estilo: AtributosDeTexto;
  { Dim }
  respcierre: RespuestaCerrarDocumento;

  begin // On Error GoTo keka
  // Debug.Print
  // Debug.Print 'IMPRIMIENDO - TIQUE FACTURA 'A' / 'A CON LEYENDA':'
  // Debug.Print

  HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
    ResponsableInscripto, TipoCUIT, 'Domicilio Cliente...',
    'Domicilio extensión 1...', 'Domicilio extensión 2...',
    'Domicilio extensión 3....');
  respabrir := HASARNG.AbrirDocumento(TiqueFacturaA);
  // Debug.Print
  // Debug.Print ' - (abrir); Tique Factura 'A' Nro.  := [' & respabrir.NumeroComprobante & ']'
  // Debug.Print

  estilo.Negrita := True; HASARNG.ImprimirTextoFiscal(estilo,
    'Hasta agotar stock...', DisplayNo);
  HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21, ModoSumaMonto,
    IIVariablePorcentual, 0.00000001, DisplayNo, ModoPrecioBase, 1,
    '779123456789', '', Unidad); HASARNG.ImprimirDescuentoItem('Oferta 10%...',
    10, DisplayNo, ModoPrecioBase);
  resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
    Efectivo, '', '');
  // Debug.Print
  // Debug.Print ' - Pagando... Cambio               := [' & resppago.Saldo & ']'
  // Debug.Print

  respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  // Debug.Print
  // Debug.Print ' - (cerrar); Tique Factura 'A' Nro. := [' & respcierre.NumeroComprobante & ']'
  // Debug.Print ' - Páginas                         := [' & respcierre.CantidadDePaginas & ']'
  // Debug.Print
  // Debug.Print 'TIQUE FACTURA 'A' IMPRESO !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
  end;

  // ====================================================================================================================
  // Impresión de un Tique Factura 'B'.
  // ====================================================================================================================
  { Private Sub }
  procedure CommandTFB_Click;
  { Dim }
  var respabrir: RespuestaAbrirDocumento;
  { Dim }
  resppago: RespuestaImprimirPago;
  { Dim }
  estilo: AtributosDeTexto;
  { Dim }
  respcierre: RespuestaCerrarDocumento;

  begin // On Error GoTo keka
  // Debug.Print
  // Debug.Print 'IMPRIMIENDO - TIQUE FACTURA 'B':'
  // Debug.Print

  HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
    Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
    'Domicilio extensión 2...', 'Domicilio extensión 3....');
  respabrir := HASARNG.AbrirDocumento(TiqueFacturaB);
  // Debug.Print
  // Debug.Print ' - (abrir); Tique Factura 'B' Nro.  := [' & respabrir.NumeroComprobante & ']'
  // Debug.Print

  estilo.Negrita := True; HASARNG.ImprimirTextoFiscal(estilo,
    'Hasta agotar stock...', DisplayNo);
  HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21, ModoSumaMonto,
    IIVariablePorcentual, 0.00000001, DisplayNo, ModoPrecioBase, 1,
    '779123456789', '', Unidad); HASARNG.ImprimirDescuentoItem('Oferta 10%...',
    10, DisplayNo, ModoPrecioBase);
  resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
    Efectivo, '', '');
  // Debug.Print
  // Debug.Print ' - Pagando... Cambio               := [' & resppago.Saldo & ']'
  // Debug.Print

  respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  // Debug.Print
  // Debug.Print ' - (cerrar); Tique Factura 'B' Nro. := [' & respcierre.NumeroComprobante & ']'
  // Debug.Print ' - Páginas                         := [' & respcierre.CantidadDePaginas & ']'
  // Debug.Print
  // Debug.Print 'TIQUE FACTURA 'B' IMPRESO !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
  end;

  // ====================================================================================================================
  // Impresión de un Tique Factura 'C'.
  // ====================================================================================================================
  { Private Sub }
  procedure CommandTFC_Click;
  { Dim }
  var respabrir: RespuestaAbrirDocumento;
  { Dim }
  resppago: RespuestaImprimirPago;
  { Dim }
  estilo: AtributosDeTexto;
  { Dim }
  respcierre: RespuestaCerrarDocumento;

  begin // On Error GoTo keka
  // Debug.Print
  // Debug.Print 'IMPRIMIENDO - TIQUE FACTURA 'C':'
  // Debug.Print

  HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
    Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
    'Domicilio extensión 2...', 'Domicilio extensión 3....');
  respabrir := HASARNG.AbrirDocumento(TiqueFacturaC);
  // Debug.Print
  // Debug.Print ' - (abrir); Tique Factura 'C' Nro.  := [' & respabrir.NumeroComprobante & ']'
  // Debug.Print

  estilo.Negrita := True; HASARNG.ImprimirTextoFiscal(estilo,
    'Hasta agotar stock...', DisplayNo);
  HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21, ModoSumaMonto,
    IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1, '779123456789', '',
    Unidad); HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
    ModoPrecioTotal); resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar,
    DisplayNo, '', Efectivo, '', '');
  // Debug.Print
  // Debug.Print ' - Pagando... Cambio               := [' & resppago.Saldo & ']'
  // Debug.Print

  respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  // Debug.Print
  // Debug.Print ' - (cerrar); Tique Factura 'C' Nro. := [' & respcierre.NumeroComprobante & ']'
  // Debug.Print ' - Páginas                         := [' & respcierre.CantidadDePaginas & ']'
  // Debug.Print
  // Debug.Print 'TIQUE FACTURA 'C'IMPRESO !...'
  // Debug.Print

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
  end;

  // ====================================================================================================================
  // Impresión de un Tique Factura 'M'.
  // ====================================================================================================================
  { Private Sub }
  procedure CommandTFM_Click;
  { Dim }
  var
  respabrir: RespuestaAbrirDocumento;
  { Dim }
  resppago: RespuestaImprimirPago;
  { Dim }
  estilo: AtributosDeTexto;
  { Dim }
  respcierre: RespuestaCerrarDocumento;

  begin // On Error GoTo keka
  // Debug.Print
  // Debug.Print 'IMPRIMIENDO - TIQUE FACTURA 'M':'
  // Debug.Print

  HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
    Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
    'Domicilio extensión 2...', 'Domicilio extensión 3....');
  respabrir := HASARNG.AbrirDocumento(TiqueFacturaM);
  // Debug.Print
  // Debug.Print ' - (abrir); Tique Factura 'M' Nro.  := [' & respabrir.NumeroComprobante & ']'
  // Debug.Print

  estilo.Negrita := True; HASARNG.ImprimirTextoFiscal(estilo,
    'Hasta agotar stock...', DisplayNo);
  HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21, ModoSumaMonto,
    IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1, '779123456789', '',
    Unidad); HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
    ModoPrecioTotal); resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar,
    DisplayNo, '', Efectivo, '', '');
  // Debug.Print
  // Debug.Print ' - Pagando... Cambio               := [' & resppago.Saldo & ']'
  // Debug.Print

  respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  // Debug.Print
  // Debug.Print ' - (cerrar); Tique Factura 'M' Nro. := [' & respcierre.NumeroComprobante & ']'
  // Debug.Print ' - Páginas                         := [' & respcierre.CantidadDePaginas & ']'
  // Debug.Print
  // Debug.Print 'TIQUE FACTURA 'M'IMPRESO !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
  end;

  // ====================================================================================================================
  // Impresión de un Tique a Consumidor Final.
  // ====================================================================================================================
  { Private Sub }
  procedure CommandTique_Click;
  { Dim }
  var respabrir: RespuestaAbrirDocumento;
  { Dim }
  resppago: RespuestaImprimirPago;
  { Dim }
  estilo: AtributosDeTexto;
  { Dim }
  respcierre: RespuestaCerrarDocumento;

  begin // On Error GoTo keka
  // Debug.Print
  // Debug.Print 'IMPRIMIENDO - TIQUE A CONSUMIDOR FINAL:'
  // Debug.Print

  respabrir := HASARNG.AbrirDocumento(Tique);
  // Debug.Print
  // Debug.Print ' - (abrir); Tique Cons. Final Nro.  := [' & respabrir.NumeroComprobante & ']'
  // Debug.Print

  estilo.Negrita := True; HASARNG.ImprimirTextoFiscal(estilo,
    'Hasta agotar stock...', DisplayNo);
  HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21, ModoSumaMonto,
    IIVariablePorcentual, 0.00000001, DisplayNo, ModoPrecioBase, 1,
    '779123456789', '', Unidad); HASARNG.ImprimirDescuentoItem('Oferta 10%...',
    10, DisplayNo, ModoPrecioBase);

  resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
    Efectivo, '', '');
  // Debug.Print
  // Debug.Print ' - Pagando... Cambio               := [' & resppago.Saldo & ']'
  // Debug.Print

  respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  // Debug.Print
  // Debug.Print ' - (cerrar); Tique Cons. Final Nro. := [' & respcierre.NumeroComprobante & ']'
  // Debug.Print ' - Páginas                         := [' & respcierre.CantidadDePaginas & ']'
  // Debug.Print
  // Debug.Print 'TIQUE A CONSUMIDOR FINAL IMPRESO !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
  end;

  // ====================================================================================================================
  // Impresión de un Tique Nota de Crédito a Consumidor Final.
  // ====================================================================================================================
  { Private Sub }
  procedure CommandTiqueNC_Click;
  { Dim }
  var respabrir: RespuestaAbrirDocumento;
  { Dim }
  resppago: RespuestaImprimirPago;
  { Dim }
  estilo: AtributosDeTexto;
  { Dim }
  respcierre: RespuestaCerrarDocumento;

  begin // On Error GoTo keka
  // Debug.Print
  // Debug.Print 'IMPRIMIENDO - TIQUE NOTA DE CREDITO A CONSUMIDOR FINAL:'
  // Debug.Print

  respabrir := HASARNG.AbrirDocumento(TiqueNotaCredito);
  // Debug.Print
  // Debug.Print ' - (abrir); Tique Nota de Crédito a Cons. Final Nro.  := [' & respabrir.NumeroComprobante & ']'
  // Debug.Print

  estilo.Negrita := True; HASARNG.ImprimirTextoFiscal(estilo,
    'Hasta agotar stock...', DisplayNo);
  HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21, ModoSumaMonto,
    IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1, '779123456789', '',
    Unidad); HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
    ModoPrecioTotal); resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar,
    DisplayNo, '', Efectivo, '', '');
  // Debug.Print
  // Debug.Print ' - Pagando... Cambio                                 := [' & resppago.Saldo & ']'
  // Debug.Print

  respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  // Debug.Print
  // Debug.Print ' - (cerrar); Tique Nota de Crédito a Cons. Final Nro. := [' & respcierre.NumeroComprobante & ']'
  // Debug.Print ' - Páginas                                           := [' & respcierre.CantidadDePaginas & ']'
  // Debug.Print
  // Debug.Print 'TIQUE NOTA DE CREDITO A CONSUMIDOR FINAL IMPRESO !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
  end;

  // ====================================================================================================================
  // Impresión de un Tique Nota de Crédito 'A'.
  // ====================================================================================================================
  { Private Sub }
  procedure CommandTNCA_Click;
  { Dim }
  var respabrir: RespuestaAbrirDocumento;
  { Dim }
  resppago: RespuestaImprimirPago;
  { Dim }
  estilo: AtributosDeTexto;
  { Dim }
  respcierre: RespuestaCerrarDocumento;

  begin // On Error GoTo keka
  // Debug.Print
  // Debug.Print 'IMPRIMIENDO - TIQUE NOTA DE CREDITO 'A' / 'A con leyenda':'
  // Debug.Print

  HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
    ResponsableInscripto, TipoCUIT, 'Domicilio Cliente...',
    'Domicilio extensión 1...', 'Domicilio extensión 2...',
    'Domicilio extensión 3....');
  respabrir := HASARNG.AbrirDocumento(TiqueNotaCreditoA);
  // Debug.Print
  // Debug.Print ' - (abrir); Tique Nota de Crédito 'A' Nro.  := [' & respabrir.NumeroComprobante & ']'
  // Debug.Print

  estilo.Negrita := True; HASARNG.ImprimirTextoFiscal(estilo,
    'Hasta agotar stock...', DisplayNo);
  HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21, ModoSumaMonto,
    IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1, '779123456789', '',
    Unidad); HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
    ModoPrecioTotal); resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar,
    DisplayNo, '', Efectivo, '', '');
  // Debug.Print
  // Debug.Print ' - Pagando... Cambio                       := [' & resppago.Saldo & ']'
  // Debug.Print

  respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  // Debug.Print
  // Debug.Print ' - (cerrar); Tique Nota de Crédito 'A' Nro. := [' & respcierre.NumeroComprobante & ']'
  // Debug.Print ' - Páginas                                 := [' & respcierre.CantidadDePaginas & ']'
  // Debug.Print
  // Debug.Print 'TIQUE NOTA DE CREDITO 'A' IMPRESO !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
  end;

  // ====================================================================================================================
  // Impresión de un Tique Nota de Crédito 'B'.
  // ====================================================================================================================
  { Private Sub }
  procedure CommandTNCB_Click;
  { Dim }
  var respabrir: RespuestaAbrirDocumento;
  { Dim }
  resppago: RespuestaImprimirPago;
  { Dim }
  estilo: AtributosDeTexto;
  { Dim }
  respcierre: RespuestaCerrarDocumento;

  begin // On Error GoTo keka
  // Debug.Print
  // Debug.Print 'IMPRIMIENDO - TIQUE NOTA DE CREDITO 'B':'
  // Debug.Print

  HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
    Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
    'Domicilio extensión 2...', 'Domicilio extensión 3....');
  respabrir := HASARNG.AbrirDocumento(TiqueNotaCreditoB);
  // Debug.Print
  // Debug.Print ' - (abrir); Tique Nota de Crédito 'B' Nro.  := [' & respabrir.NumeroComprobante & ']'
  // Debug.Print

  estilo.Negrita := True; HASARNG.ImprimirTextoFiscal(estilo,
    'Hasta agotar stock...', DisplayNo);
  HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21, ModoSumaMonto,
    IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1, '779123456789', '',
    Unidad); HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
    ModoPrecioTotal); resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar,
    DisplayNo, '', Efectivo, '', '');
  // Debug.Print
  // Debug.Print ' - Pagando... Cambio                       := [' & resppago.Saldo & ']'
  // Debug.Print

  respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  // Debug.Print
  // Debug.Print ' - (cerrar); Tique Nota de Crédito 'B' Nro. := [' & respcierre.NumeroComprobante & ']'
  // Debug.Print ' - Páginas                                 := [' & respcierre.CantidadDePaginas & ']'
  // Debug.Print
  // Debug.Print 'TIQUE NOTA DE CREDITO 'B' IMPRESO !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
  end;

  // ====================================================================================================================
  // Impresión de un Tique Nota de Crédito 'C'.
  // ====================================================================================================================
  { Private Sub }
  procedure CommandTNCC_Click;
  { Dim }
  var respabrir: RespuestaAbrirDocumento;
  { Dim }
  resppago: RespuestaImprimirPago;
  { Dim }
  estilo: AtributosDeTexto;
  { Dim }
  respcierre: RespuestaCerrarDocumento;

  begin // On Error GoTo keka
  // Debug.Print
  // Debug.Print 'IMPRIMIENDO - TIQUE NOTA DE CREDITO 'C':'
  // Debug.Print

  HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
    Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
    'Domicilio extensión 2...', 'Domicilio extensión 3....');
  respabrir := HASARNG.AbrirDocumento(TiqueNotaCreditoC);
  // Debug.Print
  // Debug.Print ' - (abrir); Tique Nota de Crédito 'C' Nro.  := [' & respabrir.NumeroComprobante & ']'
  // Debug.Print

  estilo.Negrita := True; HASARNG.ImprimirTextoFiscal(estilo,
    'Hasta agotar stock...', DisplayNo);
  HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21, ModoSumaMonto,
    IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1, '779123456789', '',
    Unidad); HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
    ModoPrecioTotal); resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar,
    DisplayNo, '', Efectivo, '', '');
  // Debug.Print
  // Debug.Print ' - Pagando... Cambio                       := [' & resppago.Saldo & ']'
  // Debug.Print

  respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  // Debug.Print
  // Debug.Print ' - (cerrar); Tique Nota de Crédito 'C' Nro. := [' & respcierre.NumeroComprobante & ']'
  // Debug.Print ' - Páginas                                 := [' & respcierre.CantidadDePaginas & ']'
  // Debug.Print
  // Debug.Print 'TIQUE NOTA DE CREDITO 'C' IMPRESO !...'
  // Debug.Print

  // Exit Sub

  // keka:
  // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

  { End Sub }
  end;

  // ====================================================================================================================
  // Impresión de un Tique Nota de Crédito 'M'.
  // ====================================================================================================================
  { Private Sub }
  procedure CommandTNCM_Click;
  { Dim }
  var respabrir: RespuestaAbrirDocumento;
  { Dim }
  resppago: RespuestaImprimirPago;
  { Dim }
  estilo: AtributosDeTexto;
  { Dim }
  respcierre: RespuestaCerrarDocumento;

  begin // On Error GoTo keka
  // Debug.Print
  // Debug.Print 'IMPRIMIENDO - TIQUE NOTA DE CREDITO 'M':'
  // Debug.Print

  HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
    Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
    'Domicilio extensión 2...', 'Domicilio extensión 3....');
    respabrir :=
    HASARNG.AbrirDocumento(TiqueNotaCreditoM);
    // Debug.Print
    // Debug.Print ' - (abrir); Tique Nota de Crédito 'M' Nro.  := [' & respabrir.NumeroComprobante & ']'
    // Debug.Print

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
    ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
    '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
    ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
    Efectivo, '', '');
    // Debug.Print
    // Debug.Print ' - Pagando... Cambio                       := [' & resppago.Saldo & ']'
    // Debug.Print

    respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

    // Debug.Print
    // Debug.Print ' - (cerrar); Tique Nota de Crédito 'M' Nro. := [' & respcierre.NumeroComprobante & ']'
    // Debug.Print ' - Páginas                                 := [' & respcierre.CantidadDePaginas & ']'
    // Debug.Print
    // Debug.Print 'TIQUE NOTA DE CREDITO 'M' IMPRESO !...'
    // Debug.Print

    // Exit Sub

    // keka:
    // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

    { End Sub }
end;

  // ====================================================================================================================
  // Impresión de un Tique Nota de Débito 'A'.
  // ====================================================================================================================
  { Private Sub }
  procedure CommandTNDA_Click;
  { Dim }
var
    respabrir: RespuestaAbrirDocumento;
    { Dim }
    resppago: RespuestaImprimirPago;
    { Dim }
    estilo: AtributosDeTexto;
    { Dim }
    respcierre: RespuestaCerrarDocumento;

begin // On Error GoTo keka
    // Debug.Print
    // Debug.Print 'IMPRIMIENDO - TIQUE NOTA DE DEBITO 'A' / 'A con leyenda':'
    // Debug.Print

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
    ResponsableInscripto, TipoCUIT, 'Domicilio Cliente...',
    'Domicilio extensión 1...', 'Domicilio extensión 2...',
    'Domicilio extensión 3....');
    respabrir := HASARNG.AbrirDocumento(TiqueNotaDebitoA);
    // Debug.Print
    // Debug.Print ' - (abrir); Tique Nota de Débito 'A' Nro.  := [' & respabrir.NumeroComprobante & ']'
    // Debug.Print

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
    ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
    '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
    ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
    Efectivo, '', '');
    // Debug.Print
    // Debug.Print ' - Pagando... Cambio                      := [' & resppago.Saldo & ']'
    // Debug.Print

    respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

    // Debug.Print
    // Debug.Print ' - (cerrar); Tique Nota de Débito 'A' Nro. := [' & respcierre.NumeroComprobante & ']'
    // Debug.Print ' - Páginas                                := [' & respcierre.CantidadDePaginas & ']'
    // Debug.Print
    // Debug.Print 'TIQUE NOTA DE DEBITO 'A' IMPRESO !...'
    // Debug.Print

    // Exit Sub

    // keka:
    // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

    { End Sub }
end;

  // ====================================================================================================================
  // Impresión de un Tique Nota de Débito 'B'.
  // ====================================================================================================================
  { Private Sub }
  procedure CommandTNDB_Click;
  { Dim }
var
    respabrir: RespuestaAbrirDocumento;
    { Dim }
    resppago: RespuestaImprimirPago;
    { Dim }
    estilo: AtributosDeTexto;
    { Dim }
    respcierre: RespuestaCerrarDocumento;

begin // On Error GoTo keka
    // Debug.Print
    // Debug.Print 'IMPRIMIENDO - TIQUE NOTA DE DEBITO 'B':'
    // Debug.Print

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
    Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
    'Domicilio extensión 2...', 'Domicilio extensión 3....');
    respabrir := HASARNG.AbrirDocumento(TiqueNotaDebitoB);
    // Debug.Print
    // Debug.Print ' - (abrir); Tique Nota de Débito 'B' Nro.  := [' & respabrir.NumeroComprobante & ']'
    // Debug.Print

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
    ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
    '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
    ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
    Efectivo, '', '');
    // Debug.Print
    // Debug.Print ' - Pagando... Cambio                      := [' & resppago.Saldo & ']'
    // Debug.Print

    respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

    // Debug.Print
    // Debug.Print ' - (cerrar); Tique Nota de Débito 'B' Nro. := [' & respcierre.NumeroComprobante & ']'
    // Debug.Print ' - Páginas                                := [' & respcierre.CantidadDePaginas & ']'
    // Debug.Print
    // Debug.Print 'TIQUE NOTA DE DEBITO 'B' IMPRESO !...'
    // Debug.Print

    // Exit Sub

    // keka:
    // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

    { End Sub }
end;

  // ====================================================================================================================
  // Impresión de un Tique Nota de Débito 'C'.
  // ====================================================================================================================
  { Private Sub }
  procedure CommandTNDC_Click;
  { Dim }
var
    respabrir: RespuestaAbrirDocumento;
    { Dim }
    resppago: RespuestaImprimirPago;
    { Dim }
    estilo: AtributosDeTexto;
    { Dim }
    respcierre: RespuestaCerrarDocumento;

begin // On Error GoTo keka
    // Debug.Print
    // Debug.Print 'IMPRIMIENDO - TIQUE NOTA DE DEBITO 'C':'
    // Debug.Print

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
    Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
    'Domicilio extensión 2...', 'Domicilio extensión 3....');
    respabrir := HASARNG.AbrirDocumento(NotaDeDebitoC);
    // Debug.Print
    // Debug.Print ' - (abrir); Tique Nota de Débtio 'C' Nro.  := [' & respabrir.NumeroComprobante & ']'
    // Debug.Print

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
    ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
    '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
    ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
    Efectivo, '', '');
    // Debug.Print
    // Debug.Print ' - Pagando... Cambio                      := [' & resppago.Saldo & ']'
    // Debug.Print

    respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

    // Debug.Print
    // Debug.Print ' - (cerrar); Tique Nota de Débtio 'C' Nro. := [' & respcierre.NumeroComprobante & ']'
    // Debug.Print ' - Páginas                                := [' & respcierre.CantidadDePaginas & ']'
    // Debug.Print
    // Debug.Print 'TIQUE NOTA DE DEBITO 'C' IMPRESO !...'
    // Debug.Print

    // Exit Sub

    // keka:
    // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

    { End Sub }
end;

  // ====================================================================================================================
  // Impresión de un Tique Nota de Débito 'M'.
  // ====================================================================================================================
  { Private Sub }
  procedure CommandTNDM_Click;
  { Dim }
var
    respabrir: RespuestaAbrirDocumento;
    { Dim }
    resppago: RespuestaImprimirPago;
    { Dim }
    estilo: AtributosDeTexto;
    { Dim }
    respcierre: RespuestaCerrarDocumento;

begin // On Error GoTo keka
    // Debug.Print
    // Debug.Print 'IMPRIMIENDO - TIQUE NOTA DE DEBITO 'M':'
    // Debug.Print

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
    Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
    'Domicilio extensión 2...', 'Domicilio extensión 3....');
    respabrir := HASARNG.AbrirDocumento(NotaDeDebitoM);
    // Debug.Print
    // Debug.Print ' - (abrir); Tique Nota de Débito 'M' Nro.  := [' & respabrir.NumeroComprobante & ']'
    // Debug.Print

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
    ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
    '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
    ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
    Efectivo, '', '');
    // Debug.Print
    // Debug.Print ' - Pagando... Cambio                      := [' & resppago.Saldo & ']'
    // Debug.Print

    respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

    // Debug.Print
    // Debug.Print ' - (cerrar); Tique Nota de Débito 'M' Nro. := [' & respcierre.NumeroComprobante & ']'
    // Debug.Print ' - Páginas                                := [' & respcierre.CantidadDePaginas & ']'
    // Debug.Print
    // Debug.Print 'TIQUE NOTA DE DEBITO 'M' IMPRESO !...'
    // Debug.Print

    // Exit Sub

    // keka:
    // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

    { End Sub }
end;

  // ====================================================================================================================
  // Impresión de un Tique Recibo 'A'.
  // ====================================================================================================================
  { Private Sub }
  procedure CommandTRA_Click;
    { Dim }
  var
      respabrir: RespuestaAbrirDocumento;
      { Dim }
      resppago: RespuestaImprimirPago;
      { Dim }
      estilo: AtributosDeTexto;
      { Dim }
      respcierre: RespuestaCerrarDocumento;

  begin // On Error GoTo keka
      // Debug.Print
      // Debug.Print 'IMPRIMIENDO - TIQUE RECIBO 'A' / 'A con leyenda':'
      // Debug.Print

      HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      ResponsableInscripto, TipoCUIT, 'Domicilio Cliente...',
      'Domicilio extensión 1...', 'Domicilio extensión 2...',
      'Domicilio extensión 3....');
      respabrir := HASARNG.AbrirDocumento(ReciboA);
      // Debug.Print
      // Debug.Print ' - (abrir); Tique Recibo 'A' Nro.  := [' & respabrir.NumeroComprobante & ']'
      // Debug.Print

      estilo.Negrita := True;
      HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
      HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
      HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);
      resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, '', '');
      // Debug.Print
      // Debug.Print 'Pagando... Cambio                 := [' & resppago.Saldo & ']'
      // Debug.Print

      respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

      // Debug.Print
      // Debug.Print ' - (cerrar); Tique Recibo 'A' Nro. := [' & respcierre.NumeroComprobante & ']'
      // Debug.Print ' - Páginas                        := [' & respcierre.CantidadDePaginas & ']'
      // Debug.Print
      // Debug.Print 'TIQUE RECIBO 'A' IMPRESO !...'
      // Debug.Print

      // Exit Sub

      // keka:
      // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

      { End Sub }
  end;

    // ====================================================================================================================
    // Impresión de un Tique Recibo 'B'.
    // ====================================================================================================================
    { Private Sub }
    procedure CommandTRB_Click;
    { Dim }
  var
      respabrir: RespuestaAbrirDocumento;
      { Dim }
      resppago: RespuestaImprimirPago;
      { Dim }
      estilo: AtributosDeTexto;
      { Dim }
      respcierre: RespuestaCerrarDocumento;

  begin // On Error GoTo keka
      // Debug.Print
      // Debug.Print 'IMPRIMIENDO - TIQUE RECIBO 'B':'
      // Debug.Print

      HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
      'Domicilio extensión 2...', 'Domicilio extensión 3....');
      respabrir := HASARNG.AbrirDocumento(ReciboB);
      // Debug.Print
      // Debug.Print ' - (abrir); Tique Recibo 'B' Nro.  := [' & respabrir.NumeroComprobante & ']'
      // Debug.Print

      estilo.Negrita := True;
      HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
      HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
      HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);
      resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, '', '');
      // Debug.Print
      // Debug.Print ' - Pagando... Cambio              := [' & resppago.Saldo & ']'
      // Debug.Print

      respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

      // Debug.Print
      // Debug.Print ' - (cerrar); Tique Recibo 'B' Nro. := [' & respcierre.NumeroComprobante & ']'
      // Debug.Print ' - Páginas                        := [' & respcierre.CantidadDePaginas & ']'
      // Debug.Print
      // Debug.Print 'TIQUE RECIBO 'B' IMPRESO !...'
      // Debug.Print

      // Exit Sub

      // keka:
      // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

      { End Sub }
  end;

    // ====================================================================================================================
    // Impresión de un Tique Recibo 'C'.
    // ====================================================================================================================
    { Private Sub }
    procedure CommandTRC_Click;
    { Dim }
  var
      respabrir: RespuestaAbrirDocumento;
      { Dim }
      resppago: RespuestaImprimirPago;
      { Dim }
      estilo: AtributosDeTexto;
      { Dim }
      respcierre: RespuestaCerrarDocumento;

  begin // On Error GoTo keka
      // Debug.Print
      // Debug.Print 'IMPRIMIENDO - TIQUE RECIBO 'C':'
      // Debug.Print

      HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
      'Domicilio extensión 2...', 'Domicilio extensión 3....');
      respabrir := HASARNG.AbrirDocumento(ReciboC);
      // Debug.Print ' - (abrir); Tique Recibo 'C' Nro.  := [' & respabrir.NumeroComprobante & ']'

      estilo.Negrita := True;
      HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
      HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
      HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);
      resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, '', '');
      // Debug.Print
      // Debug.Print ' - Pagando... Cambio              := [' & resppago.Saldo & ']'
      // Debug.Print

      respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

      // Debug.Print
      // Debug.Print ' - (cerrar); Tique Recibo 'C' Nro. := [' & respcierre.NumeroComprobante & ']'
      // Debug.Print ' - Páginas                        := [' & respcierre.CantidadDePaginas & ']'
      // Debug.Print
      // Debug.Print 'TIQUE RECIBO 'C'IMPRESO !...'
      // Debug.Print

      // Exit Sub

      // keka:
      // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

      { End Sub }
  end;

    // ====================================================================================================================
    // Impresión de un Tique Recibo 'M'.
    // ====================================================================================================================
    { Private Sub }
    procedure CommandTRM_Click;
    { Dim }
  var
      respabrir: RespuestaAbrirDocumento;
      { Dim }
      resppago: RespuestaImprimirPago;
      { Dim }
      estilo: AtributosDeTexto;
      { Dim }
      respcierre: RespuestaCerrarDocumento;

  begin // On Error GoTo keka
      // Debug.Print
      // Debug.Print 'IMPRIMIENDO - TIQUE RECIBO 'M':'
      // Debug.Print

      HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
      'Domicilio extensión 2...', 'Domicilio extensión 3....');
      respabrir := HASARNG.AbrirDocumento(ReciboM);
      // Debug.Print
      // Debug.Print ' - (abrir); Tique Recibo 'M' Nro.  := [' & respabrir.NumeroComprobante & ']'
      // Debug.Print

      estilo.Negrita := True;
      HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
      HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
      HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);
      resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, '', '');
      // Debug.Print
      // Debug.Print ' - Pagando... Cambio              := [' & resppago.Saldo & ']'
      // Debug.Print

      respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

      // Debug.Print
      // Debug.Print ' - (cerrar); Tique Recibo 'M' Nro. := [' & respcierre.NumeroComprobante & ']'
      // Debug.Print ' - Páginas                        := [' & respcierre.CantidadDePaginas & ']'
      // Debug.Print
      // Debug.Print 'TIQUE RECIBO 'M' IMPRESO !...'
      // Debug.Print

      // Exit Sub

      // keka:
      // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

      { End Sub }
  end;

    // ====================================================================================================================
    // Se consulta el número de la 'Z' establecida como límite para el borrado de la CTD (Cinta testigo Digital); .
    // ====================================================================================================================
    { Private Sub }
    procedure CommandZBorr_Click;
    { Dim }
  var
      resp: RespuestaConsultarZetaBorrable;

      // Debug.Print
      // Debug.Print 'CONSULTA LIMITE BORRADO CIERRES 'Z':'
      // Debug.Print

  begin // On Error GoTo keka
      resp := HASARNG.ConsultarZetaBorrable;
      // Debug.Print
      // Debug.Print 'Límite Cierre 'Z' Nro. := [' & resp.NumeroZeta & ']'
      // Debug.Print
      // Debug.Print 'FIN DE LA CONSULTA !...'
      // Debug.Print

      // Exit Sub

      // keka:
      // Debug.Print 'Error := ' & Err.Number & ' : ' & Err.Description

      { End Sub }
  end;

    // ====================================================================================================================
    // Carga de la ventana principal.
    // Se activa el archivo de registro de actividades del OCX.
    // ====================================================================================================================
    { Private Sub }
    procedure Form_Load;
  begin

      HASARNG.ArchivoRegistro('ocx.log');

      { End Sub }
  end;

    // ====================================================================================================================
    // Procesando comando actual.
    // ====================================================================================================================
    { Private Sub }
    procedure HASARNG_ComandoEnProceso;
  begin

      // if Not(proc) then
    begin
        // Debug.Print 'Comando en proceso...'
       // proc := True;
        { End If }
        end;

      { End Sub }
  end;

    // ====================================================================================================================
    // Fin de procesamiento del comando enviado.
    // ====================================================================================================================
    { Private Sub }
    procedure HASARNG_ComandoProcesado;
  begin

      // Debug.Print 'Comando procesado !'
      // proc := False;

      { End Sub }
  end;

    // ====================================================================================================================
    // Procesamiento del evento impresora.
    // ====================================================================================================================
    { Private Sub }
    procedure HASARNG_EventoImpresora
    (Estado: HasarArgentina_TLB.EstadoImpresora);
  begin

      // Debug.Print 'Evento impresora...'
      // Debug.Print 'Estado := [' & Estado & ']'

      { End Sub }
  end;

end.
