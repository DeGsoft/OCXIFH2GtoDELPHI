unit HasarUnit;

// ###################################################################################################################
// Impresoras Fiscales HASAR - 2da. Generación                                     OCX Fiscal HASAR - 2da. Generación
// RG AFIP Nº 3561/13 - Controladores Fiscales Nueva tecnología                    Ejemplo de uso
// Dto. Software de Base - Compañía HASAR SAIC - Grupo HASAR                       Marzo 2015
// ###################################################################################################################

interface

uses
  HasarArgentina_TLB, System.SysUtils,System.TypInfo;

var
  HASARNG : ImpresoraFiscalRG3561;

implementation

// Option Explicit

// ====================================================================================================================
// Comando de apertura del cajón de dinero.
// ====================================================================================================================

procedure CommandAbrirCaj_Click;
begin

Writeln('');
Writeln('ABRIENDO CAJON DE DINERO...');
Writeln('');

 Try
    HASARNG.AbrirCajonDinero;
  Writeln('');
  Writeln('CAJON DE DINERO ABIERTO !...');
  Writeln('');

     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Impresión de un informe de aditoría por fechas.
// ====================================================================================================================

procedure CommandAudit_Click;
begin

Writeln('');
Writeln('IMPRIMIENDO REPORTE DE AUDITORIA POR FECHAS...');
Writeln('');

 Try
    HASARNG.ReportarZetasPorFecha(StrToDate('23/02/2015'), StrToDate('25/02/2015'),
      ReporteAuditoriaGlobal);

  Writeln('');
    Writeln('REPORTE IMPRESO !...');
    Writeln('');



     except
    on E: Exception do

      Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Comandos de avance de papel.
// ====================================================================================================================

procedure CommandAvanzPap_Click;
begin

Writeln('');
  Writeln('AVANZANDO PAPEL...');
  Writeln('');

 Try
    HASARNG.AvanzarPapelAmbasEstaciones(3);
  Writeln('3 líneas en tique/rollo testigo.');

    HASARNG.AvanzarPapelEstacionAuditoria(3);
  Writeln('3 líneas en rollo testigo, solamente.');

    HASARNG.AvanzarPapelEstacionTique(3);
  Writeln('3 líneas en tique, solamente.'

      );
    Writeln('');
    Writeln('FIN DE AVANCE DE PAPEL...');
    Writeln('');



     except
    on E: Exception do

      Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Se elimina el logo del emisor de la memoria de trabajo de la impresora fiscal.
// ====================================================================================================================

procedure CommandBorrarLogo_Click;
begin

Writeln('');
  Writeln('ELIMINANDO LOGO DEL EMISOR...');
  Writeln('');

 Try
    HASARNG.EliminarLogoEmisor;

  Writeln('');
    Writeln('LOGO ELIMINADO !...');
    Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Se cancela el comprobante en curso de emisión.
// ====================================================================================================================

procedure CommandCancel_Click;
begin

Writeln('');
  Writeln('CANCELANDO COMPROBANTE ABIERTO...');
Writeln('');

 Try
    HASARNG.Cancelar;

  Writeln('');
    Writeln('CANCELADO !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Consulta de capacidades de la impresora fiscal
// ====================================================================================================================

procedure CommandCapac_Click;

var
  respcapac: RespuestaConsultarCapacidadesImpresoraFiscal;

begin
  Writeln('');
  Writeln('CONSULTANDO CAPACIDADES DE LA IMPRESORA FISCAL...');
Writeln('');

 Try
    respcapac := HASARNG.ConsultarCapacidadesImpresoraFiscal(AltoLogo,
      EstacionTicket, TiqueFacturaA);
  Writeln('Alto logotipo := [' +( respcapac.Valor) + ']');
  Writeln('');
    respcapac := HASARNG.ConsultarCapacidadesImpresoraFiscal(AnchoLogo,
      EstacionTicket, TiqueFacturaA);

    Writeln('Ancho logotipo            := [' +( respcapac.Valor) + ']');
  Writeln('');
    respcapac := HASARNG.ConsultarCapacidadesImpresoraFiscal(AnchoRazonSocial,
      EstacionTicket, TiqueFacturaA);

    Writeln('Ancho razón social        := [' +( respcapac.Valor) + ']');
  Writeln('');
    respcapac := HASARNG.ConsultarCapacidadesImpresoraFiscal(AnchoTextoFiscal,
      EstacionTicket, TiqueFacturaA);

    Writeln('Ancho texto fiscal        := [' +( respcapac.Valor) + ']');
  Writeln('');
    respcapac := HASARNG.ConsultarCapacidadesImpresoraFiscal
      (AnchoTextoLineasUsuario, EstacionTicket, TiqueFacturaA);

    Writeln('Ancho líneas usuario      := [' +( respcapac.Valor) + ']');
  Writeln('');
    respcapac := HASARNG.ConsultarCapacidadesImpresoraFiscal(AnchoTextoNoFiscal,
      EstacionTicket, TiqueFacturaA);

    Writeln('Ancho texto no fiscal     := [' +( respcapac.Valor) + ']');
  Writeln('');
    respcapac := HASARNG.ConsultarCapacidadesImpresoraFiscal(AnchoTextoVenta,
      EstacionTicket, TiqueFacturaA);

    Writeln('Ancho texto venta         := [' +( respcapac.Valor) + ']');
  Writeln('');
    respcapac := HASARNG.ConsultarCapacidadesImpresoraFiscal
      (AnchoTotalImpresion, EstacionTicket, TiqueFacturaA);

    Writeln('Ancho total impresión     := [' +( respcapac.Valor) + ']');
  Writeln('');
    respcapac := HASARNG.ConsultarCapacidadesImpresoraFiscal(SoportaCajon,
      EstacionPorDefecto, NoDocumento);

    Writeln('Soporta cajón dinero      := [' +( respcapac.Valor) + ']');
  Writeln('');
    respcapac := HASARNG.ConsultarCapacidadesImpresoraFiscal(SoportaEstacion,
      EstacionTicket, TiqueFacturaA);

    Writeln('Soporta estación tique    := [' +( respcapac.Valor) + ']');
  Writeln('');
    respcapac := HASARNG.ConsultarCapacidadesImpresoraFiscal(SoportaComprobante,
      EstacionTicket, TiqueFacturaA);

    Writeln('Soporta tique factura " A " := [' +( respcapac.Valor) + ']');

  Writeln('');
  Writeln('FIN DE LA CONSULTA !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Cargar imagen de logotipo del emisor en la memoria de trabajo de la impresora fiscal.
// ====================================================================================================================

procedure CommandCargaLogo_Click;
begin
Writeln('');
Writeln('CARGANDO LOGO EMISOR...');
Writeln('');

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

  Writeln('');
    Writeln('LOGO DEL EMISOR CARGADO !...');
    Writeln('');

     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Configurar velocidad de transferencia de información (baudios); del puerto serie RS-232.
// ====================================================================================================================

procedure CommandCfgBaudios_Click;
begin
  Writeln('');
Writeln('CONFIGURANDO BAUDIOS RS-232...');
Writeln('');

 Try
    HASARNG.CambiarVelocidadPuerto(Baudrate9600);
  Writeln('Baudios := 9600'

      );
    Writeln('');
  Writeln('FIN DE LA CONFIGURACION !...');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Configurar fecha y hora en la impresora fiscal.
// ====================================================================================================================

procedure CommandCfgFyh_Click;
begin
Writeln('');
  Writeln('CONFIGURANDO FECHA Y HORA...');
  Writeln('');

 Try
    HASARNG.ConfigurarFechaHora(StrToDate('06/03/2015'), StrToDate('10:49:45'));

  Writeln('');
    Writeln('FIN DE LA CONFIGURACION !...');
    Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Configurar parámetros de comportamiento de la impresora fiscal.
// ====================================================================================================================

procedure CommandCfgImprFis_Click;

begin
  Writeln('');
  Writeln('CONFIGURANDO PARAMETROS IMPRESORA FISCAL...');
  Writeln('');

 Try
  Writeln('Borrado automático CTD        := P');
    HASARNG.ConfigurarImpresoraFiscal(BorradoAutomaticoAuditoria, 'P');
  Writeln('');

  Writeln('Verificar supera monto máximo := N');
    HASARNG.ConfigurarImpresoraFiscal(ChequeoDesborde, 'N');
  Writeln('');

  Writeln('Corte de papel                := P');
    HASARNG.ConfigurarImpresoraFiscal(CortePapel, 'P');
  Writeln('');

  Writeln('Imprimir CAMBIO $0.00         := P');
    HASARNG.ConfigurarImpresoraFiscal(ImpresionCambio, 'P');
  Writeln('');

  Writeln('Imprimir leyendas opcionales  := P');
    HASARNG.ConfigurarImpresoraFiscal(ImpresionLeyendas, 'P');
  Writeln('');


    Writeln('Texto saldo  pendientes       := Pendiente de pago');
    HASARNG.ConfigurarImpresoraFiscal(PagoSaldo, 'Pendiente de pago');
  Writeln('');

  Writeln('Aviso sonoro falta papel      := P');
    HASARNG.ConfigurarImpresoraFiscal(SonidoAviso, 'P');
  Writeln('');

    // 'Modificar estos parámetros requiere Cierre 'Z' previo.
    // '------------------------------------------------------
    // 'Debug.Print "Monto limite 'B/C'            = 0.00"
    // 'HASARNG.ConfigurarImpresoraFiscal( LimiteBC, "0.00"
    // ' Debug.Print
    //
    // '    Debug.Print "Tipo de habilitación          = A"
    // '    HASARNG.ConfigurarImpresoraFiscal( TipoHabilitacion, "A"
    // 'Debug.Print

  Writeln('');
    Writeln('FIN DE LA CONFIGURACION !...');
    Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Configurar parámetros de conectividad en red.
// ====================================================================================================================

procedure CommandCfgRed_Click;
begin
Writeln('');
  Writeln('CONFIGURANDO PARAMETROS CONECTIVIDAD EN RED...');
Writeln('');

 Try
  Writeln('Dirección IP  := 10.0.7.69');
  Writeln('Máscara       := 255.255.255.0');
  Writeln('Puerta enlace := 10.0.7.69');
    HASARNG.ConfigurarRed('10.0.7.69', '255.255.255.0', '10.0.7.69');

  Writeln('');
    Writeln('FIN DE LA CONFIGURACION !...');
    Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Configurar servidor SMHTP para correo electrónico.
// ====================================================================================================================

procedure CommandCfgServCorreo_Click;
begin

Writeln('');
  Writeln('CONFIGURANDO SERVIDOR SMTP...');
  Writeln('');

 Try
  Writeln('IP SMTP     := 200.80.204.3');
  Writeln('Puerto      := 465');
  Writeln('Responder a := hasarventas@hasar.com');
    HASARNG.ConfigurarServidorCorreo('200.80.204.3', 465,
      'hasarventas@hasar.com');

  Writeln('');
    Writeln('FIN DE LA CONFIGURACION !...');
    Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Configurar Cierre 'Z' límite para borrado de la CTD.
// ====================================================================================================================

procedure CommandCfgZBorr_Click;
begin

Writeln('');
  Writeln('CONFIGURANDO LIMITE BORRADO CTD...');
  Writeln('');

 Try
  Writeln('Límite, Cierre " Z " Nro. := 1');
    HASARNG.ConfigurarZetaBorrable(1);

  Writeln('');
    Writeln('FIN DE LA CONFIGURACION !...');
    Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Impresión del Informe Diario de Cierre 'Z'.
// ====================================================================================================================

procedure CommandCFgZona_Click;

var
  estilo: AtributosDeTexto;
begin
Writeln('');
  Writeln('CONFIGURANDO ZONAS LINEAS DE USUARIO...');
  Writeln('');

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

  Writeln('');
    Writeln('FIN de la CONFIGURACION....');
    Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Impresión del Informe Diario de Cierre 'Z'.
// ====================================================================================================================

procedure CommandCierreZ_Click;

var
  cierre: RespuestaCerrarJornadaFiscal;

begin
  Try
    Writeln('');
    Writeln('IMPRIMIENDO INFORME DIARIO DE CIERRE " Z ":');
    Writeln('');

    cierre := HASARNG.CerrarJornadaFiscal(ReporteZ);
    Writeln('');
    //?Writeln('Reporte...           := [' + FloatToStr(cierre.Reporte) + ']');
    Writeln('');

    Writeln('Cierre Nro.          := [' +IntToStr(cierre.Z.Numero) + ']');
    Writeln('Fecha cierre         := [' +DateToStr(cierre.Z.Fecha) + ']');
    Writeln('');

    Writeln('DF cancelados        := [' +IntToStr(cierre.Z.DF_CantidadCancelados) + ']');

    Writeln('DF emitidos          := [' +IntToStr(cierre.Z.DF_CantidadEmitidos) + ']');

    Writeln('');

    Writeln('DF total ventas      := [' + FloatToStr(cierre.Z.DF_Total) + ']');

    Writeln('DF total gravado     := [' + FloatToStr(cierre.Z.DF_TotalGravado) + ']');

    Writeln('DF total IVA         := [' + FloatToStr(cierre.Z.DF_TotalIVA) + ']');

    Writeln('DF total no gravado  := [' + FloatToStr(cierre.Z.DF_TotalNoGravado) + ']');

    Writeln('DF total exento      := [' + FloatToStr(cierre.Z.DF_TotalExento) + ']');

    Writeln('DF total tributos    := [' + FloatToStr(cierre.Z.DF_TotalTributos) + ']');

    Writeln('');

    Writeln('DNFH emitidos        := [' +IntToStr(cierre.Z.DNFH_CantidadEmitidos) + ']');

    Writeln('DNFH total acumulado := [' + FloatToStr(cierre.Z.DNFH_Total) + ']');

    Writeln('');

    Writeln('NC canceladas        := [' +IntToStr(cierre.Z.NC_CantidadCancelados) + ']');

    Writeln('NC emitidas          := [' +IntToStr(cierre.Z.NC_CantidadEmitidos) + ']');

    Writeln('NC total crédito     := [' + FloatToStr(cierre.Z.NC_Total) + ']');

    Writeln('NC total gravado     := [' + FloatToStr(cierre.Z.NC_TotalGravado) + ']');

    Writeln('NC total IVA         := [' + FloatToStr(cierre.Z.NC_TotalIVA) + ']');

    Writeln('NC total no gravado  := [' + FloatToStr(cierre.Z.NC_TotalNoGravado) + ']');

    Writeln('NC total exento      := [' + FloatToStr(cierre.Z.NC_TotalExento) + ']');

    Writeln('NC total tributos    := [' + FloatToStr(cierre.Z.NC_TotalTributos) + ']'

      );
    Writeln('');
  Writeln('INFORME DIARIO DE CIERRE " Z "... IMPRESO !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Consulta de acumulados para determnado comprobante.
// ====================================================================================================================

procedure CommandConsAcumComprob_Click;

var
  acomprob: RespuestaConsultarAcumuladosComprobante;

  acomprob2: RespuestaContinuarConsultaAcumulados;

begin
  Writeln('');
  Writeln('CONSULTANDO ACUMULADOS COMPROBANTE:');
  Writeln('');

 Try
    acomprob := HASARNG.ConsultarAcumuladosComprobante(TiqueFacturaA, 13);

    if (acomprob.Registro = (RegistroFinal)) then
    begin
      Writeln('NO HAY INFORMACION DISPONIBLE !...');
    Writeln('');


       end;


    Case acomprob.Registro of
      HasarArgentina_TLB.RegistroDetalladoDF:
        begin
          Writeln('');
          Writeln('TIPO REGISTRO:');
          //?Writeln('[' + (acomprob.Registro) + ']');
          Writeln('');
          Writeln('DF (Documentos Fiscales);:');
          Writeln('-------------------------');
          //?Writeln('DF Tipo comprobante        := [' +FromTiposComprobanteToString(acomprob.RegDF.CodigoComprobante) + ']');

          Writeln('DF Nro. inicial            := [' +
            IntToStr(acomprob.RegDF.NumeroInicial) + ']');

          Writeln('DF Nro. final              := [' +
            IntToStr(acomprob.RegDF.NumeroFinal) + ']');

          Writeln('DF cancelados              := [' +
            IntToStr(acomprob.RegDF.CantidadCancelados) + ']');
          Writeln('');

          Writeln('DF total ventas            := [' +
            FloatToStr(acomprob.RegDF.Total) + ']');

          Writeln('DF total gravado           := [' +
           FloatToStr(acomprob.RegDF.TotalGravado) + ']');

          Writeln('DF total no gravado        := [' +
            FloatToStr(acomprob.RegDF.TotalNoGravado) + ']');

          Writeln('DF total exento            := [' + FloatToStr(acomprob.RegDF.TotalExento) + ']');
          Writeln('');

          Writeln('DF IVA 1                   := [' +
            FloatToStr(acomprob.RegDF.AlicuotaIVA_1) + ']');

          Writeln('DF monto IVA 1             := [' +
            FloatToStr(acomprob.RegDF.MontoIVA_1) + ']');

          Writeln('DF base imponible 1        := [' +
            FloatToStr(acomprob.RegDF.MontoNetoSinIVA_1) + ']');

          Writeln('DF IVA 2                   := [' +
            FloatToStr(acomprob.RegDF.AlicuotaIVA_2) + ']');

          Writeln('DF monto IVA 2             := [' +
            FloatToStr(acomprob.RegDF.MontoIVA_2) + ']');

          Writeln('DF base imponible 2        := [' +
            FloatToStr(acomprob.RegDF.MontoNetoSinIVA_2) + ']');

          Writeln('DF IVA 3                   := [' +
            FloatToStr(acomprob.RegDF.AlicuotaIVA_3) + ']');

          Writeln('DF monto IVA 3             := [' +
            FloatToStr(acomprob.RegDF.MontoIVA_3) + ']');

          Writeln('DF base imponible 3        := [' +
            FloatToStr(acomprob.RegDF.MontoNetoSinIVA_3) + ']');

          Writeln('DF IVA 4                   := [' +
            FloatToStr(acomprob.RegDF.AlicuotaIVA_4) + ']');

          Writeln('DF monto IVA 4             := [' +
            FloatToStr(acomprob.RegDF.MontoIVA_4) + ']');

          Writeln('DF base imponible 4        := [' +
            FloatToStr(acomprob.RegDF.MontoNetoSinIVA_4) + ']');

          Writeln('DF IVA 5                   := [' +
            FloatToStr(acomprob.RegDF.AlicuotaIVA_5) + ']');

          Writeln('DF monto IVA 5             := [' +
            FloatToStr(acomprob.RegDF.MontoIVA_5) + ']');

          Writeln('DF base imponible 5        := [' +
            FloatToStr(acomprob.RegDF.MontoNetoSinIVA_5) + ']');

          Writeln('DF IVA 6                   := [' +
            FloatToStr(acomprob.RegDF.AlicuotaIVA_6) + ']');

          Writeln('DF monto IVA 6             := [' +
            FloatToStr(acomprob.RegDF.MontoIVA_6) + ']');

          Writeln('DF base imponible 6        := [' +
            FloatToStr(acomprob.RegDF.MontoNetoSinIVA_6) + ']');

          Writeln('DF IVA 7                   := [' +
            FloatToStr(acomprob.RegDF.AlicuotaIVA_7) + ']');

          Writeln('DF monto IVA 7             := [' +
            FloatToStr(acomprob.RegDF.MontoIVA_7) + ']');

          Writeln('DF base imponible 7        := [' +
            FloatToStr(acomprob.RegDF.MontoNetoSinIVA_7) + ']');

          Writeln('DF IVA 8                   := [' +
            FloatToStr(acomprob.RegDF.AlicuotaIVA_8) + ']');

          Writeln('DF monto IVA 8             := [' +
            FloatToStr(acomprob.RegDF.MontoIVA_8) + ']');

          Writeln('DF base imponible 8        := [' +
            FloatToStr(acomprob.RegDF.MontoNetoSinIVA_8) + ']');

          Writeln('DF IVA 9                   := [' +
            FloatToStr(acomprob.RegDF.AlicuotaIVA_9) + ']');

          Writeln('DF monto IVA 9             := [' +
            FloatToStr(acomprob.RegDF.MontoIVA_9) + ']');

          Writeln('DF base imponible 9        := [' +
            FloatToStr(acomprob.RegDF.MontoNetoSinIVA_9) + ']');

          Writeln('DF IVA 10                  := [' +
            FloatToStr(acomprob.RegDF.AlicuotaIVA_10) + ']');

          Writeln('DF monto IVA 10            := [' +
            FloatToStr(acomprob.RegDF.MontoIVA_10) + ']');

          Writeln('DF base imponible 10       := [' +
            FloatToStr(acomprob.RegDF.MontoNetoSinIVA_10) + ']');
          Writeln('');

          Writeln('DF total IVA               := [' + FloatToStr(acomprob.RegDF.TotalIVA) +
            ']');
          Writeln('');

          Writeln('DF tributo 1               := [' +
            FloatToStr(acomprob.RegDF.CodigoTributo1) + ']');

          Writeln('DF monto tributo 1         := [' +
            FloatToStr(acomprob.RegDF.ImporteTributo1) + ']');

          Writeln('DF tributo 2               := [' +
            FloatToStr(acomprob.RegDF.CodigoTributo2) + ']');

          Writeln('DF monto tributo 2         := [' +
            FloatToStr(acomprob.RegDF.ImporteTributo2) + ']');

          Writeln('DF tributo 3               := [' +
            FloatToStr(acomprob.RegDF.CodigoTributo3) + ']');

          Writeln('DF monto tributo 3         := [' +
            FloatToStr(acomprob.RegDF.ImporteTributo3) + ']');

          Writeln('DF tributo 4               := [' +
            FloatToStr(acomprob.RegDF.CodigoTributo4) + ']');

          Writeln('DF monto tributo 4         := [' +
            FloatToStr(acomprob.RegDF.ImporteTributo4) + ']');

          Writeln('DF tributo 5               := [' +
            FloatToStr(acomprob.RegDF.CodigoTributo5) + ']');

          Writeln('DF monto tributo 5         := [' +
            FloatToStr(acomprob.RegDF.ImporteTributo5) + ']');

          Writeln('DF tributo 6               := [' +
            FloatToStr(acomprob.RegDF.CodigoTributo6) + ']');

          Writeln('DF monto tributo 6         := [' +
            FloatToStr(acomprob.RegDF.ImporteTributo6) + ']');

          Writeln('DF tributo 7               := [' +
            FloatToStr(acomprob.RegDF.CodigoTributo7) + ']');

          Writeln('DF monto tributo 7         := [' +
            FloatToStr(acomprob.RegDF.ImporteTributo7) + ']');

          Writeln('DF tributo 8               := [' +
            FloatToStr(acomprob.RegDF.CodigoTributo8) + ']');

          Writeln('DF monto tributo 8         := [' +
            FloatToStr(acomprob.RegDF.ImporteTributo8) + ']');

          Writeln('DF tributo 9               := [' +
            FloatToStr(acomprob.RegDF.CodigoTributo9) + ']');

          Writeln('DF monto tributo 9         := [' +
            FloatToStr(acomprob.RegDF.ImporteTributo9) + ']');

          Writeln('DF tributo 10              := [' +
            FloatToStr(acomprob.RegDF.CodigoTributo10) + ']');

          Writeln('DF monto tributo 10        := [' +
            FloatToStr(acomprob.RegDF.ImporteTributo10) + ']');

          Writeln('DF tributo 11              := [' +
            FloatToStr(acomprob.RegDF.CodigoTributo11) + ']');

          Writeln('DF monto tributo 11        := [' +
            FloatToStr(acomprob.RegDF.ImporteTributo11) + ']');
          Writeln('');

          Writeln('DF total tributos          := [' +
            FloatToStr(acomprob.RegDF.TotalTributos) + ']');
          Writeln('');
        end;
      RegistroDetalladoDNFH:
        begin
          Writeln('');
        Writeln('TIPO REGISTRO:');
        Writeln('[' + FloatToStr(acomprob.Registro) + ']');
        Writeln('');

          Writeln('DNFH (Documentos No Fiscales Homologados);: :=QUE ACUMULAN:=');

          Writeln('---------------------------------------------------------');
        Writeln('DNFH Tipo Comprob.         := [' +
            { FromTiposComprobanteToString }
            FloatToStr(acomprob.RegDF.CodigoComprobante) + ']');

          Writeln('DNFH Nro. inicial          := [' +
            IntToStr(acomprob.RegDNFH.NumeroInicial) + ']');

          Writeln('DNFH Nro. Final            := [' +
            IntToStr(acomprob.RegDNFH.NumeroFinal) + ']');

          Writeln('DNFH total acumulado       := [' + FloatToStr(acomprob.RegDNFH.Total) +
            ']');
          Writeln('');
        end;
      HasarArgentina_TLB.RegistroDetalladoDNFHNoAcum:
        begin
          Writeln('');
          Writeln('TIPO REGISTRO:');
          Writeln('[' + FloatToStr(acomprob.Registro) + ']');
        Writeln('');

          Writeln('DNFH (Documentos No Fiscales Homologados);: :=QUE NO ACUMULAN:=');

          Writeln('------------------------------------------------------------');
        Writeln('Tipo Comprobante := [' +
            { FromTiposComprobanteToString }
            FloatToStr(acomprob.RegDF.CodigoComprobante) + ']');

          Writeln('Nº inicial       := [' +
            IntToStr(acomprob.RegDNFH_NoAcum.NumeroInicial) + ']');

          Writeln('Nº final         := [' +IntToStr(acomprob.RegDNFH_NoAcum.NumeroFinal)
            + ']');
          Writeln('');
        end;
      HasarArgentina_TLB.RegistroGlobal:
        begin
          Writeln('');
        Writeln('TIPO REGISTRO:');
        Writeln('[' + FloatToStr(acomprob.Registro) + ']');
        Writeln('');
        Writeln('INFORMACION GLOBAL:');
        Writeln('-------------------');

          Writeln('DF cant. cancelados := [' +
            IntToStr(acomprob.RegGlobal.DF_CantidadCancelados) + ']');

          Writeln('DF cant. emitidos   := [' +
            IntToStr(acomprob.RegGlobal.DF_CantidadEmitidos) + ']');
        Writeln('');

          Writeln('DF total ventas     := [' + FloatToStr(acomprob.RegGlobal.DF_Total) +
            ']');
          Writeln('');

          Writeln('DF total gravado    := [' +
            FloatToStr(acomprob.RegGlobal.DF_TotalGravado) + ']');

          Writeln('DF total IVA        := [' +
            FloatToStr(acomprob.RegGlobal.DF_TotalIVA) + ']');

          Writeln('DF total tributos   := [' +
            FloatToStr(acomprob.RegGlobal.DF_TotalTributos) + ']');

          Writeln('DF total no gravado := [' +
            FloatToStr(acomprob.RegGlobal.DF_TotalNoGravado) + ']');

          Writeln('DF total exento     := [' + FloatToStr(acomprob.RegGlobal.DF_TotalExento)
            + ']');
          Writeln('');

          Writeln('DF total DNFH       := [' + FloatToStr(acomprob.RegGlobal.DNFH_Total) +
            ']');
          Writeln('');
        end;
       end;

    acomprob2 := HASARNG.ContinuarConsultaAcumulados;

    while (acomprob2.Registro <> HasarArgentina_TLB.RegistroFinal) do
    begin

      Case acomprob2.Registro of
        HasarArgentina_TLB.RegistroDetalladoDF:
          begin
            Writeln('');
            Writeln('TIPO REGISTRO:');
            Writeln('[' + FloatToStr(acomprob2.Registro) + ']');
          Writeln('');
          Writeln('DF (Documentos Fiscales);:');
          Writeln('-------------------------');
          Writeln('DF Tipo comprobante        := [' +
              { FromTiposComprobanteToString }
              FloatToStr(acomprob2.RegDF.CodigoComprobante) + ']');

            Writeln('DF Nro. inicial            := [' +
              IntToStr(acomprob2.RegDF.NumeroInicial) + ']');

            Writeln('DF Nro. final              := [' +
              IntToStr(acomprob2.RegDF.NumeroFinal) + ']');

            Writeln('DF cancelados              := [' +
              IntToStr(acomprob2.RegDF.CantidadCancelados) + ']');
          Writeln('');

            Writeln('DF total ventas            := [' +
              FloatToStr(acomprob2.RegDF.Total) + ']');

            Writeln('DF total gravado           := [' +
              FloatToStr(acomprob2.RegDF.TotalGravado) + ']');

            Writeln('DF total no gravado        := [' +
              FloatToStr(acomprob2.RegDF.TotalNoGravado) + ']');

            Writeln('DF total exento            := [' +
              FloatToStr(acomprob2.RegDF.TotalExento) + ']');
            Writeln('');

            Writeln('DF IVA 1                   := [' +
              FloatToStr(acomprob2.RegDF.AlicuotaIVA_1) + ']');

            Writeln('DF monto IVA 1             := [' +
              FloatToStr(acomprob2.RegDF.MontoIVA_1) + ']');

            Writeln('DF IVA 2                   := [' +
              FloatToStr(acomprob2.RegDF.AlicuotaIVA_2) + ']');

            Writeln('DF monto IVA 2             := [' +
              FloatToStr(acomprob2.RegDF.MontoIVA_2) + ']');

            Writeln('DF IVA 3                   := [' +
              FloatToStr(acomprob2.RegDF.AlicuotaIVA_3) + ']');

            Writeln('DF monto IVA 3             := [' +
              FloatToStr(acomprob2.RegDF.MontoIVA_3) + ']');

            Writeln('DF IVA 4                   := [' +
              FloatToStr(acomprob2.RegDF.AlicuotaIVA_4) + ']');

            Writeln('DF monto IVA 4             := [' +
              FloatToStr(acomprob2.RegDF.MontoIVA_4) + ']');

            Writeln('DF IVA 5                   := [' +
              FloatToStr(acomprob2.RegDF.AlicuotaIVA_5) + ']');

            Writeln('DF monto IVA 5             := [' +
              FloatToStr(acomprob2.RegDF.MontoIVA_5) + ']');

            Writeln('DF IVA 6                   := [' +
              FloatToStr(acomprob2.RegDF.AlicuotaIVA_6) + ']');

            Writeln('DF monto IVA 6             := [' +
              FloatToStr(acomprob2.RegDF.MontoIVA_6) + ']');

            Writeln('DF IVA 7                   := [' +
              FloatToStr(acomprob2.RegDF.AlicuotaIVA_7) + ']');

            Writeln('DF monto IVA 7             := [' +
              FloatToStr(acomprob2.RegDF.MontoIVA_7) + ']');

            Writeln('DF IVA 8                   := [' +
              FloatToStr(acomprob2.RegDF.AlicuotaIVA_8) + ']');

            Writeln('DF monto IVA 8             := [' +
              FloatToStr(acomprob2.RegDF.MontoIVA_8) + ']');

            Writeln('DF IVA 9                   := [' +
              FloatToStr(acomprob2.RegDF.AlicuotaIVA_9) + ']');

            Writeln('DF monto IVA 9             := [' +
              FloatToStr(acomprob2.RegDF.MontoIVA_9) + ']');

            Writeln('DF IVA 10                  := [' +
              FloatToStr(acomprob2.RegDF.AlicuotaIVA_10) + ']');

            Writeln('DF monto IVA 10            := [' +
              FloatToStr(acomprob2.RegDF.MontoIVA_10) + ']');
            Writeln('');

            Writeln('DF total IVA               := [' + FloatToStr(acomprob2.RegDF.TotalIVA
             ) + ']');
            Writeln('');

            Writeln('DF tributo 1               := [' +
              FloatToStr(acomprob2.RegDF.CodigoTributo1) + ']');

            Writeln('DF monto tributo 1         := [' +
              FloatToStr(acomprob2.RegDF.ImporteTributo1) + ']');

            Writeln('DF tributo 2               := [' +
              FloatToStr(acomprob2.RegDF.CodigoTributo2) + ']');

            Writeln('DF monto tributo 2         := [' +
              FloatToStr(acomprob2.RegDF.ImporteTributo2) + ']');

            Writeln('DF tributo 3               := [' +
              FloatToStr(acomprob2.RegDF.CodigoTributo3) + ']');

            Writeln('DF monto tributo 3         := [' +
              FloatToStr(acomprob2.RegDF.ImporteTributo3) + ']');

            Writeln('DF tributo 4               := [' +
              FloatToStr(acomprob2.RegDF.CodigoTributo4) + ']');

            Writeln('DF monto tributo 4         := [' +
              FloatToStr(acomprob2.RegDF.ImporteTributo4) + ']');

            Writeln('DF tributo 5               := [' +
              FloatToStr(acomprob2.RegDF.CodigoTributo5) + ']');

            Writeln('DF monto tributo 5         := [' +
              FloatToStr(acomprob2.RegDF.ImporteTributo5) + ']');

            Writeln('DF tributo 6               := [' +
              FloatToStr(acomprob2.RegDF.CodigoTributo6) + ']');

            Writeln('DF monto tributo 6         := [' +
              FloatToStr(acomprob2.RegDF.ImporteTributo6) + ']');

            Writeln('DF tributo 7               := [' +
              FloatToStr(acomprob2.RegDF.CodigoTributo7) + ']');

            Writeln('DF monto tributo 7         := [' +
              FloatToStr(acomprob2.RegDF.ImporteTributo7) + ']');

            Writeln('DF tributo 8               := [' +
              FloatToStr(acomprob2.RegDF.CodigoTributo8) + ']');

            Writeln('DF monto tributo 8         := [' +
              FloatToStr(acomprob2.RegDF.ImporteTributo8) + ']');

            Writeln('DF tributo 9               := [' +
              FloatToStr(acomprob2.RegDF.CodigoTributo9) + ']');

            Writeln('DF monto tributo 9         := [' +
              FloatToStr(acomprob2.RegDF.ImporteTributo9) + ']');

            Writeln('DF tributo 10              := [' +
              FloatToStr(acomprob2.RegDF.CodigoTributo10) + ']');

            Writeln('DF monto tributo 10        := [' +
              FloatToStr(acomprob2.RegDF.ImporteTributo10) + ']');

            Writeln('DF tributo 11              := [' +
              FloatToStr(acomprob2.RegDF.CodigoTributo11) + ']');

            Writeln('DF monto tributo 11        := [' +
              FloatToStr(acomprob2.RegDF.ImporteTributo11) + ']');
            Writeln('');

            Writeln('DF total tributos          := [' +
              FloatToStr(acomprob2.RegDF.TotalTributos) + ']');
            Writeln('');
          end;
        HasarArgentina_TLB.RegistroDetalladoDNFH:
          begin
            Writeln('');
          Writeln('TIPO REGISTRO:');
          Writeln('[' + FloatToStr(acomprob2.Registro) + ']');
          Writeln('');

            Writeln('DNFH (Documentos No Fiscales Homologados);: :=QUE ACUMULAN:=');

            Writeln('---------------------------------------------------------');
          Writeln('DNFH Tipo Comprob.         := [' +
              { FromTiposComprobanteToString }
              FloatToStr(acomprob2.RegDF.CodigoComprobante) + ']');

            Writeln('DNFH Nro. inicial          := [' +
              FloatToStr(acomprob2.RegDNFH.NumeroInicial) + ']');

            Writeln('DNFH Nro. Final            := [' +
              FloatToStr(acomprob2.RegDNFH.NumeroFinal) + ']');

            Writeln('DNFH total acumulado       := [' + FloatToStr(acomprob2.RegDNFH.Total
             ) + ']');
            Writeln('');
          end;
        HasarArgentina_TLB.RegistroDetalladoDNFHNoAcum:
          begin
            Writeln('');
            Writeln('TIPO REGISTRO:');
            Writeln('[' + FloatToStr(acomprob2.Registro) + ']');
          Writeln('');

            Writeln('DNFH (Documentos No Fiscales Homologados);: :=QUE NO ACUMULAN:=');

            Writeln('------------------------------------------------------------');
          Writeln('Tipo Comprobante := [' +
              { FromTiposComprobanteToString }
              FloatToStr(acomprob2.RegDF.CodigoComprobante) + ']');

            Writeln('Nº inicial       := [' +
              FloatToStr(acomprob2.RegDNFH_NoAcum.NumeroInicial) + ']');

            Writeln('Nº final         := [' +
              FloatToStr(acomprob2.RegDNFH_NoAcum.NumeroFinal) + ']');
          Writeln('');
          end;
        HasarArgentina_TLB.RegistroGlobal:
          begin
            Writeln('');
          Writeln('TIPO REGISTRO:');
          Writeln('[' + FloatToStr(acomprob2.Registro) + ']');
          Writeln('');
          Writeln('INFORMACION GLOBAL:');
          Writeln('-------------------');

            Writeln('DF cant. cancelados := [' +
              FloatToStr(acomprob2.RegGlobal.DF_CantidadCancelados) + ']');

            Writeln('DF cant. emitidos   := [' +
              FloatToStr(acomprob2.RegGlobal.DF_CantidadEmitidos) + ']');
          Writeln('');

            Writeln('DF total ventas     := [' + FloatToStr(acomprob2.RegGlobal.DF_Total) +
              ']');
            Writeln('');

            Writeln('DF total gravado    := [' +
              FloatToStr(acomprob2.RegGlobal.DF_TotalGravado) + ']');

            Writeln('DF total IVA        := [' +
              FloatToStr(acomprob2.RegGlobal.DF_TotalIVA) + ']');

            Writeln('DF total tributos   := [' +
              FloatToStr(acomprob2.RegGlobal.DF_TotalTributos) + ']');

            Writeln('DF total no gravado := [' +
              FloatToStr(acomprob2.RegGlobal.DF_TotalNoGravado) + ']');

            Writeln('DF total exento     := [' +
              FloatToStr(acomprob2.RegGlobal.DF_TotalExento) + ']');
          Writeln('');

            Writeln('DF total DNFH       := [' + FloatToStr(acomprob2.RegGlobal.DNFH_Total
             ) + ']');
            Writeln('');
          end;
         end;

      acomprob2 := HASARNG.ContinuarConsultaAcumulados;
       end;

  Writeln('');
    Writeln('NO HAY MAS INFORMACION DISPONIBLE !...');
    Writeln('');
  Writeln('FIN DE LA CONSULTA...');
    Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Consulta de acumulados en la memoria de trabajo de la impresora fiscal.
// ====================================================================================================================

procedure CommandConsAcumMemoria_Click;

var
  amem: RespuestaConsultarAcumuladosMemoriaDeTrabajo;

  amem2: RespuestaContinuarConsultaAcumulados;
begin
Writeln('');
  Writeln('CONSULTANDO ACUMULADOS MEMORIA DE TRABAJO...');
  Writeln('');

 Try
    amem := HASARNG.ConsultarAcumuladosMemoriaDeTrabajo(NoDocumento);

    If (amem.Registro = HasarArgentina_TLB.RegistroFinal) then
    begin
      Writeln('');
      Writeln('NO HAY INFORMACION DISPONIBLE !...');
      Writeln('');


       end;


    Case amem.Registro of
      HasarArgentina_TLB.RegistroDetalladoDF:
        begin
          Writeln('');
          Writeln('TIPO REGISTRO:');
          Writeln('[' +FloatToStr(amem.Registro) + ']');
        Writeln('');
        Writeln('DF (Documentos Fiscales);:');
        Writeln('-------------------------');

          Writeln('DF cancelados              := [' +
           FloatToStr(amem.RegDF.CantidadCancelados) + ']');
        Writeln('DF Tipo comprobante        := [' +
            { FromTiposComprobanteToString }
            FloatToStr(amem.RegDF.CodigoComprobante) + ']');

          Writeln('DF Nro. inicial            := [' +
            FloatToStr(amem.RegDF.NumeroInicial) + ']');

          Writeln('DF Nro. final              := [' +FloatToStr(amem.RegDF.NumeroFinal) +
            ']');
          Writeln('');

          Writeln('DF total ventas            := [' + FloatToStr(amem.RegDF.Total) + ']');

          Writeln('');

          Writeln('DF total gravado           := [' +
            FloatToStr(amem.RegDF.TotalGravado) + ']');

          Writeln('DF total no gravado        := [' +
            FloatToStr(amem.RegDF.TotalNoGravado) + ']');

          Writeln('DF total exento            := [' +FloatToStr(amem.RegDF.TotalExento) +
            ']');
          Writeln('');

          Writeln('DF IVA 1                   := [' +
            FloatToStr(amem.RegDF.AlicuotaIVA_1) + ']');

          Writeln('DF monto IVA 1             := [' +
            FloatToStr(amem.RegDF.MontoIVA_1) + ']');

          Writeln('DF IVA 2                   := [' +
            FloatToStr(amem.RegDF.AlicuotaIVA_2) + ']');

          Writeln('DF monto IVA 2             := [' +
            FloatToStr(amem.RegDF.MontoIVA_2) + ']');

          Writeln('DF IVA 3                   := [' +
            FloatToStr(amem.RegDF.AlicuotaIVA_3) + ']');

          Writeln('DF monto IVA 3             := [' +
           FloatToStr(amem.RegDF.MontoIVA_3) + ']');

          Writeln('DF IVA 4                   := [' +
           FloatToStr(amem.RegDF.AlicuotaIVA_4) + ']');

          Writeln('DF monto IVA 4             := [' +
           FloatToStr(amem.RegDF.MontoIVA_4) + ']');

          Writeln('DF IVA 5                   := [' +
           FloatToStr(amem.RegDF.AlicuotaIVA_5) + ']');

          Writeln('DF monto IVA 5             := [' +
           FloatToStr(amem.RegDF.MontoIVA_5) + ']');

          Writeln('DF IVA 6                   := [' +
           FloatToStr(amem.RegDF.AlicuotaIVA_6) + ']');

          Writeln('DF monto IVA 6             := [' +
           FloatToStr(amem.RegDF.MontoIVA_6) + ']');

          Writeln('DF IVA 7                   := [' +
           FloatToStr(amem.RegDF.AlicuotaIVA_7) + ']');

          Writeln('DF monto IVA 7             := [' +
           FloatToStr(amem.RegDF.MontoIVA_7) + ']');

          Writeln('DF IVA 8                   := [' +
           FloatToStr(amem.RegDF.AlicuotaIVA_8) + ']');

          Writeln('DF monto IVA 8             := [' +
           FloatToStr(amem.RegDF.MontoIVA_8) + ']');

          Writeln('DF IVA 9                   := [' +
           FloatToStr(amem.RegDF.AlicuotaIVA_9) + ']');

          Writeln('DF monto IVA 9             := [' +
           FloatToStr(amem.RegDF.MontoIVA_9) + ']');

          Writeln('DF IVA 10                  := [' +
           FloatToStr(amem.RegDF.AlicuotaIVA_10) + ']');

          Writeln('DF monto IVA 10            := [' +FloatToStr(amem.RegDF.MontoIVA_10) +
            ']');
          Writeln('');

          Writeln('DF total IVA               := [' +FloatToStr(amem.RegDF.TotalIVA) +
            ']');
          Writeln('');

          Writeln('DF tributo 1               := [' +
           FloatToStr(amem.RegDF.CodigoTributo1) + ']');

          Writeln('DF monto tributo 1         := [' +
           FloatToStr(amem.RegDF.ImporteTributo1) + ']');

          Writeln('DF tributo 2               := [' +
           FloatToStr(amem.RegDF.CodigoTributo2) + ']');

          Writeln('DF monto tributo 2         := [' +
           FloatToStr(amem.RegDF.ImporteTributo2) + ']');

          Writeln('DF tributo 3               := [' +
           FloatToStr(amem.RegDF.CodigoTributo3) + ']');

          Writeln('DF monto tributo 3         := [' +
           FloatToStr(amem.RegDF.ImporteTributo3) + ']');

          Writeln('DF tributo 4               := [' +
           FloatToStr(amem.RegDF.CodigoTributo4) + ']');

          Writeln('DF monto tributo 4         := [' +
           FloatToStr(amem.RegDF.ImporteTributo4) + ']');

          Writeln('DF tributo 5               := [' +
           FloatToStr(amem.RegDF.CodigoTributo5) + ']');

          Writeln('DF monto tributo 5         := [' +
           FloatToStr(amem.RegDF.ImporteTributo5) + ']');

          Writeln('DF tributo 6               := [' +
           FloatToStr(amem.RegDF.CodigoTributo6) + ']');

          Writeln('DF monto tributo 6         := [' +
           FloatToStr(amem.RegDF.ImporteTributo6) + ']');

          Writeln('DF tributo 7               := [' +
           FloatToStr(amem.RegDF.CodigoTributo7) + ']');

          Writeln('DF monto tributo 7         := [' +
           FloatToStr(amem.RegDF.ImporteTributo7) + ']');

          Writeln('DF tributo 8               := [' +
           FloatToStr(amem.RegDF.CodigoTributo8) + ']');

          Writeln('DF monto tributo 8         := [' +
           FloatToStr(amem.RegDF.ImporteTributo8) + ']');

          Writeln('DF tributo 9               := [' +
           FloatToStr(amem.RegDF.CodigoTributo9) + ']');

          Writeln('DF monto tributo 9         := [' +
           FloatToStr(amem.RegDF.ImporteTributo9) + ']');

          Writeln('DF tributo 10              := [' +
           FloatToStr(amem.RegDF.CodigoTributo10) + ']');

          Writeln('DF monto tributo 10        := [' +
           FloatToStr(amem.RegDF.ImporteTributo10) + ']');

          Writeln('DF tributo 11              := [' +
           FloatToStr(amem.RegDF.CodigoTributo11) + ']');

          Writeln('DF monto tributo 11        := [' +
           FloatToStr(amem.RegDF.ImporteTributo11) + ']');
          Writeln('');

          Writeln('DF total tributos          := [' +FloatToStr(amem.RegDF.TotalTributos) +
            ']');
          Writeln('');
        end;
      HasarArgentina_TLB.RegistroDetalladoDNFH:
        begin
          Writeln('');
        Writeln('TIPO REGISTRO:');
        Writeln('[' +FloatToStr(amem.Registro) + ']');
        Writeln('');

          Writeln('DNFH (Documentos No Fiscales Homologados);: :=QUE ACUMULAN:=');

          Writeln('---------------------------------------------------------');
        Writeln('DNFH Tipo Comprob.         := [' +
            { FromTiposComprobanteToString }
            FloatToStr(amem.RegDNFH.CodigoComprobante) + ']');

          Writeln('DNFH Nro. inicial          := [' +
           FloatToStr(amem.RegDNFH.NumeroInicial) + ']');

          Writeln('DNFH Nro. Final            := [' +
           FloatToStr(amem.RegDNFH.NumeroFinal) + ']');

          Writeln('DNFH total acumulado       := [' +FloatToStr(amem.RegDNFH.Total) + ']');

          Writeln('');
        end;
      HasarArgentina_TLB.RegistroDetalladoDNFHNoAcum:
        begin
          Writeln('');
          Writeln('TIPO REGISTRO:');
          Writeln('[' +FloatToStr(amem.Registro) + ']');
        Writeln('');

          Writeln('DNFH (Documentos No Fiscales Homologados);: :=QUE NO ACUMULAN:=');

          Writeln('------------------------------------------------------------');
        Writeln('Tipo Comprobante := [' +
            { FromTiposComprobanteToString }
            FloatToStr(amem.RegDNFH_NoAcum.CodigoComprobante) + ']');
          Writeln('Nº inicial       := [' +
           FloatToStr(amem.RegDNFH_NoAcum.NumeroInicial) + ']');

          Writeln('Nº final         := [' +FloatToStr(amem.RegDNFH_NoAcum.NumeroFinal) +
            ']');
          Writeln('');
        end;
      HasarArgentina_TLB.RegistroGlobal:
        begin
          Writeln('');
        Writeln('TIPO REGISTRO:');
        Writeln('[' +FloatToStr(amem.Registro) + ']');
        Writeln('');
        Writeln('INFORMACION GLOBAL:');
        Writeln('-------------------');

          Writeln('DF cant. cancelados := [' +
           FloatToStr(amem.RegGlobal.DF_CantidadCancelados) + ']');

          Writeln('DF cant. emitidos   := [' +
           FloatToStr(amem.RegGlobal.DF_CantidadEmitidos) + ']');
          Writeln('');

          Writeln('DF total ventas     := [' +FloatToStr(amem.RegGlobal.DF_Total) + ']');

          Writeln('');

          Writeln('DF total gravado    := [' +
           FloatToStr(amem.RegGlobal.DF_TotalGravado) + ']');

          Writeln('DF total IVA        := [' +
           FloatToStr(amem.RegGlobal.DF_TotalIVA) + ']');

          Writeln('DF total tributos   := [' +
           FloatToStr(amem.RegGlobal.DF_TotalTributos) + ']');

          Writeln('DF total no gravado := [' +
           FloatToStr(amem.RegGlobal.DF_TotalNoGravado) + ']');

          Writeln('DF total exento     := [' +FloatToStr(amem.RegGlobal.DF_TotalExento) +
            ']');
          Writeln('');

          Writeln('DF total DNFH       := [' +FloatToStr(amem.RegGlobal.DNFH_Total) + ']');

          Writeln('');
        end;
       end;

    amem2 := HASARNG.ContinuarConsultaAcumulados;

    while (amem2.Registro <> HasarArgentina_TLB.RegistroFinal) do
    begin

      Case amem2.Registro of
        HasarArgentina_TLB.RegistroDetalladoDF:
          begin
            Writeln('');
            Writeln('TIPO REGISTRO:');
            Writeln('[' +FloatToStr(amem2.Registro) + ']');
          Writeln('');
          Writeln('DF (Documentos Fiscales);:');
          Writeln('-------------------------');

            Writeln('DF cancelados              := [' +
              FloatToStr(amem2.RegDF.CantidadCancelados) + ']');
          Writeln('DF Tipo comprobante        := [' +
              { FromTiposComprobanteToString }
              FloatToStr(amem2.RegDF.CodigoComprobante) + ']');

            Writeln('DF Nro. inicial            := [' +
              FloatToStr(amem2.RegDF.NumeroInicial) + ']');

            Writeln('DF Nro. final              := [' + FloatToStr(amem2.RegDF.NumeroFinal
             ) + ']');
            Writeln('');

            Writeln('DF total ventas            := [' + FloatToStr(amem2.RegDF.Total) +
              ']');
            Writeln('');

            Writeln('DF total gravado           := [' +
             FloatToStr(amem2.RegDF.TotalGravado) + ']');

            Writeln('DF total no gravado        := [' +
             FloatToStr(amem2.RegDF.TotalNoGravado) + ']');

            Writeln('DF total exento            := [' + FloatToStr(amem2.RegDF.TotalExento
             ) + ']');
            Writeln('');

            Writeln('DF IVA 1                   := [' +
             FloatToStr(amem2.RegDF.AlicuotaIVA_1) + ']');

            Writeln('DF monto IVA 1             := [' +
             FloatToStr(amem2.RegDF.MontoIVA_1) + ']');

            Writeln('DF IVA 2                   := [' +
             FloatToStr(amem2.RegDF.AlicuotaIVA_2) + ']');

            Writeln('DF monto IVA 2             := [' +
             FloatToStr(amem2.RegDF.MontoIVA_2) + ']');

            Writeln('DF IVA 3                   := [' +
             FloatToStr(amem2.RegDF.AlicuotaIVA_3) + ']');

            Writeln('DF monto IVA 3             := [' +
             FloatToStr(amem2.RegDF.MontoIVA_3) + ']');

            Writeln('DF IVA 4                   := [' +
             FloatToStr(amem2.RegDF.AlicuotaIVA_4) + ']');

            Writeln('DF monto IVA 4             := [' +
             FloatToStr(amem2.RegDF.MontoIVA_4) + ']');

            Writeln('DF IVA 5                   := [' +
             FloatToStr(amem2.RegDF.AlicuotaIVA_5) + ']');

            Writeln('DF monto IVA 5             := [' +
             FloatToStr(amem2.RegDF.MontoIVA_5) + ']');

            Writeln('DF IVA 6                   := [' +
             FloatToStr(amem2.RegDF.AlicuotaIVA_6) + ']');

            Writeln('DF monto IVA 6             := [' +
             FloatToStr(amem2.RegDF.MontoIVA_6) + ']');

            Writeln('DF IVA 7                   := [' +
             FloatToStr(amem2.RegDF.AlicuotaIVA_7) + ']');

            Writeln('DF monto IVA 7             := [' +
             FloatToStr(amem2.RegDF.MontoIVA_7) + ']');

            Writeln('DF IVA 8                   := [' +
             FloatToStr(amem2.RegDF.AlicuotaIVA_8) + ']');

            Writeln('DF monto IVA 8             := [' +
             FloatToStr(amem2.RegDF.MontoIVA_8) + ']');

            Writeln('DF IVA 9                   := [' +
             FloatToStr(amem2.RegDF.AlicuotaIVA_9) + ']');

            Writeln('DF monto IVA 9             := [' +
             FloatToStr(amem2.RegDF.MontoIVA_9) + ']');

            Writeln('DF IVA 10                  := [' +
             FloatToStr(amem2.RegDF.AlicuotaIVA_10) + ']');

            Writeln('DF monto IVA 10            := [' + FloatToStr(amem2.RegDF.MontoIVA_10
             ) + ']');
            Writeln('');

            Writeln('DF total IVA               := [' + FloatToStr(amem2.RegDF.TotalIVA) +
              ']');
            Writeln('');

            Writeln('DF tributo 1               := [' +
             FloatToStr(amem2.RegDF.CodigoTributo1) + ']');

            Writeln('DF monto tributo 1         := [' +
             FloatToStr(amem2.RegDF.ImporteTributo1) + ']');

            Writeln('DF tributo 2               := [' +
             FloatToStr(amem2.RegDF.CodigoTributo2) + ']');

            Writeln('DF monto tributo 2         := [' +
             FloatToStr(amem2.RegDF.ImporteTributo2) + ']');

            Writeln('DF tributo 3               := [' +
             FloatToStr(amem2.RegDF.CodigoTributo3) + ']');

            Writeln('DF monto tributo 3         := [' +
             FloatToStr(amem2.RegDF.ImporteTributo3) + ']');

            Writeln('DF tributo 4               := [' +
             FloatToStr(amem2.RegDF.CodigoTributo4) + ']');

            Writeln('DF monto tributo 4         := [' +
             FloatToStr(amem2.RegDF.ImporteTributo4) + ']');

            Writeln('DF tributo 5               := [' +
             FloatToStr(amem2.RegDF.CodigoTributo5) + ']');

            Writeln('DF monto tributo 5         := [' +
             FloatToStr(amem2.RegDF.ImporteTributo5) + ']');

            Writeln('DF tributo 6               := [' +
             FloatToStr(amem2.RegDF.CodigoTributo6) + ']');

            Writeln('DF monto tributo 6         := [' +
             FloatToStr(amem2.RegDF.ImporteTributo6) + ']');

            Writeln('DF tributo 7               := [' +
             FloatToStr(amem2.RegDF.CodigoTributo7) + ']');

            Writeln('DF monto tributo 7         := [' +
             FloatToStr(amem2.RegDF.ImporteTributo7) + ']');

            Writeln('DF tributo 8               := [' +
             FloatToStr(amem2.RegDF.CodigoTributo8) + ']');

            Writeln('DF monto tributo 8         := [' +
             FloatToStr(amem2.RegDF.ImporteTributo8) + ']');

            Writeln('DF tributo 9               := [' +
             FloatToStr(amem2.RegDF.CodigoTributo9) + ']');

            Writeln('DF monto tributo 9         := [' +
             FloatToStr(amem2.RegDF.ImporteTributo9) + ']');

            Writeln('DF tributo 10              := [' +
             FloatToStr(amem2.RegDF.CodigoTributo10) + ']');

            Writeln('DF monto tributo 10        := [' +
             FloatToStr(amem2.RegDF.ImporteTributo10) + ']');

            Writeln('DF tributo 11              := [' +
             FloatToStr(amem2.RegDF.CodigoTributo11) + ']');

            Writeln('DF monto tributo 11        := [' +
             FloatToStr(amem2.RegDF.ImporteTributo11) + ']');
            Writeln('');

            Writeln('DF total tributos          := [' +
             FloatToStr(amem2.RegDF.TotalTributos) + ']');
            Writeln('');
          end;
        HasarArgentina_TLB.RegistroDetalladoDNFH:
          begin
            Writeln('');
          Writeln('TIPO REGISTRO:');
          Writeln('[' +FloatToStr(amem2.Registro) + ']');
          Writeln('');

            Writeln('DNFH (Documentos No Fiscales Homologados);: :=QUE ACUMULAN:=');

            Writeln('---------------------------------------------------------');
          Writeln('DNFH Tipo Comprob.         := [' +
              { FromTiposComprobanteToString }
              FloatToStr(amem2.RegDNFH.CodigoComprobante) + ']');

            Writeln('DNFH Nro. inicial          := [' +
             FloatToStr(amem2.RegDNFH.NumeroInicial) + ']');

            Writeln('DNFH Nro. Final            := [' +
             FloatToStr(amem2.RegDNFH.NumeroFinal) + ']');

            Writeln('DNFH total acumulado       := [' + FloatToStr(amem2.RegDNFH.Total) +
              ']');
            Writeln('');
          end;
        HasarArgentina_TLB.RegistroDetalladoDNFHNoAcum:
          begin
            Writeln('');
            Writeln('TIPO REGISTRO:');
            Writeln('[' +FloatToStr(amem2.Registro) + ']');
          Writeln('');

            Writeln('DNFH (Documentos No Fiscales Homologados);: :=QUE NO ACUMULAN:=');

            Writeln('------------------------------------------------------------');
          Writeln('Tipo Comprobante := [' +
              { FromTiposComprobanteToString }
              FloatToStr(amem2.RegDNFH_NoAcum.CodigoComprobante) + ']');

            Writeln('Nº inicial       := [' +
             FloatToStr(amem2.RegDNFH_NoAcum.NumeroInicial) + ']');

            Writeln('Nº final         := [' + FloatToStr(amem2.RegDNFH_NoAcum.NumeroFinal) +
              ']');
            Writeln('');
          end;
        HasarArgentina_TLB.RegistroGlobal:
          begin
            Writeln('');
          Writeln('TIPO REGISTRO:');
          Writeln('[' +FloatToStr(amem2.Registro) + ']');
          Writeln('');
          Writeln('INFORMACION GLOBAL:');
          Writeln('-------------------');

            Writeln('DF cant. cancelados := [' +
             FloatToStr(amem2.RegGlobal.DF_CantidadCancelados) + ']');

            Writeln('DF cant. emitidos   := [' +
             FloatToStr(amem2.RegGlobal.DF_CantidadEmitidos) + ']');
          Writeln('');

            Writeln('DF total ventas     := [' + FloatToStr(amem2.RegGlobal.DF_Total) +
              ']');
            Writeln('');

            Writeln('DF total gravado    := [' +
             FloatToStr(amem2.RegGlobal.DF_TotalGravado) + ']');

            Writeln('DF total IVA        := [' +
             FloatToStr(amem2.RegGlobal.DF_TotalIVA) + ']');

            Writeln('DF total tributos   := [' +
             FloatToStr(amem2.RegGlobal.DF_TotalTributos) + ']');

            Writeln('DF total no gravado := [' +
             FloatToStr(amem2.RegGlobal.DF_TotalNoGravado) + ']');

            Writeln('DF total exento     := [' + FloatToStr(amem2.RegGlobal.DF_TotalExento
             ) + ']');
            Writeln('');

            Writeln('DF total DNFH       := [' + FloatToStr(amem2.RegGlobal.DNFH_Total) +
              ']');
            Writeln('');
          end;
         end;

      amem2 := HASARNG.ContinuarConsultaAcumulados;
       end;

  Writeln('');
    Writeln('NO HAY MAS INFORMACION DISPONIBLE !...');
    Writeln('');
  Writeln('FIN DE LA CONSULTA !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Consultar configuración de conectividad en red.
// ====================================================================================================================

procedure CommandConsCfgRed_Click;

var
  cfgred: RespuestaConsultarConfiguracionRed;

begin
  Writeln('');
  Writeln('CONSULTANDO CONFIGURACION DE RED...');
  Writeln('');

 Try
    cfgred := HASARNG.ConsultarConfiguracionRed;
    Writeln('');
  Writeln('CONFIGURACION DE RED:');
  Writeln('Direcc. IP := [' + (cfgred.DireccionIP) + ']');
  Writeln('Gateway    := [' + (cfgred.Gateway) + ']');
  Writeln('Máscara    := [' + (cfgred.Mascara) + ']');
    Writeln('');
  Writeln('FIN DE LA CONSULTA !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ==================================================================================================================
// Consulta de acumulados para determinado Cierre Diario 'Z' - Memoria fiscal de la impresora fiscal.
// ==================================================================================================================

procedure CommandConsCierreZ_Click;

var
  azeta: RespuestaConsultarAcumuladosCierreZeta;

  azeta2: RespuestaContinuarConsultaAcumulados;

begin
  Writeln('');
  Writeln('CONSULTANDO ACUMULADOS CIERRE " Z "...');
  Writeln('');

 Try
    azeta := HASARNG.ConsultarAcumuladosCierreZeta(ReporteZNumero, 11);

    if (azeta.Registro = HasarArgentina_TLB.RegistroFinal) then
    begin
      Writeln('');
      Writeln('NO HAY INFORMACION DISPONIBLE !...');
      Writeln('');


       end;


    Case azeta.Registro of
      HasarArgentina_TLB.RegistroDetalladoDF:
        begin
          Writeln('');
          Writeln('TIPO REGISTRO:');
          Writeln('[' +FloatToStr(azeta.Registro) + ']');
        Writeln('');
        Writeln('DF (Documentos Fiscales);:');
        Writeln('-------------------------');
        Writeln('DF Tipo comprobante        := [' +
            { FromTiposComprobanteToString }
            (azeta.RegDF.CodigoComprobante) + ']');

          Writeln('DF Nro. inicial            := [' +
           FloatToStr(azeta.RegDF.NumeroInicial) + ']');

          Writeln('DF Nro. final              := [' +
           FloatToStr(azeta.RegDF.NumeroFinal) + ']');

          Writeln('DF cancelados              := [' +
           FloatToStr(azeta.RegDF.CantidadCancelados) + ']');
          Writeln('');

          Writeln('DF total ventas            := [' +FloatToStr(azeta.RegDF.Total) + ']');

          Writeln('');

          Writeln('DF total gravado           := [' +
           FloatToStr(azeta.RegDF.TotalGravado) + ']');

          Writeln('DF total no gravado        := [' +
           FloatToStr(azeta.RegDF.TotalNoGravado) + ']');

          Writeln('DF total exento            := [' +FloatToStr(azeta.RegDF.TotalExento) +
            ']');
          Writeln('');

          Writeln('DF IVA 1                   := [' +
           FloatToStr(azeta.RegDF.AlicuotaIVA_1) + ']');

          Writeln('DF monto IVA 1             := [' +
           FloatToStr(azeta.RegDF.MontoIVA_1) + ']');

          Writeln('DF IVA 2                   := [' +
           FloatToStr(azeta.RegDF.AlicuotaIVA_2) + ']');

          Writeln('DF monto IVA 2             := [' +
           FloatToStr(azeta.RegDF.MontoIVA_2) + ']');

          Writeln('DF IVA 3                   := [' +
           FloatToStr(azeta.RegDF.AlicuotaIVA_3) + ']');

          Writeln('DF monto IVA 3             := [' +
           FloatToStr(azeta.RegDF.MontoIVA_3) + ']');

          Writeln('DF IVA 4                   := [' +
           FloatToStr(azeta.RegDF.AlicuotaIVA_4) + ']');

          Writeln('DF monto IVA 4             := [' +
           FloatToStr(azeta.RegDF.MontoIVA_4) + ']');

          Writeln('DF IVA 5                   := [' +
           FloatToStr(azeta.RegDF.AlicuotaIVA_5) + ']');

          Writeln('DF monto IVA 5             := [' +
           FloatToStr(azeta.RegDF.MontoIVA_5) + ']');

          Writeln('DF IVA 6                   := [' +
           FloatToStr(azeta.RegDF.AlicuotaIVA_6) + ']');

          Writeln('DF monto IVA 6             := [' +
           FloatToStr(azeta.RegDF.MontoIVA_6) + ']');

          Writeln('DF IVA 7                   := [' +
           FloatToStr(azeta.RegDF.AlicuotaIVA_7) + ']');

          Writeln('DF monto IVA 7             := [' +
           FloatToStr(azeta.RegDF.MontoIVA_7) + ']');

          Writeln('DF IVA 8                   := [' +
           FloatToStr(azeta.RegDF.AlicuotaIVA_8) + ']');

          Writeln('DF monto IVA 8             := [' +
           FloatToStr(azeta.RegDF.MontoIVA_8) + ']');

          Writeln('DF IVA 9                   := [' +
           FloatToStr(azeta.RegDF.AlicuotaIVA_9) + ']');

          Writeln('DF monto IVA 9             := [' +
           FloatToStr(azeta.RegDF.MontoIVA_9) + ']');

          Writeln('DF IVA 10                  := [' +
           FloatToStr(azeta.RegDF.AlicuotaIVA_10) + ']');

          Writeln('DF monto IVA 10            := [' +FloatToStr(azeta.RegDF.MontoIVA_10) +
            ']');
          Writeln('');

          Writeln('DF total IVA               := [' +FloatToStr(azeta.RegDF.TotalIVA) +
            ']');
          Writeln('');

          Writeln('DF tributo 1               := [' +
           FloatToStr(azeta.RegDF.CodigoTributo1) + ']');

          Writeln('DF monto tributo 1         := [' +
           FloatToStr(azeta.RegDF.ImporteTributo1) + ']');

          Writeln('DF tributo 2               := [' +
           FloatToStr(azeta.RegDF.CodigoTributo2) + ']');

          Writeln('DF monto tributo 2         := [' +
           FloatToStr(azeta.RegDF.ImporteTributo2) + ']');

          Writeln('DF tributo 3               := [' +
           FloatToStr(azeta.RegDF.CodigoTributo3) + ']');

          Writeln('DF monto tributo 3         := [' +
           FloatToStr(azeta.RegDF.ImporteTributo3) + ']');

          Writeln('DF tributo 4               := [' +
           FloatToStr(azeta.RegDF.CodigoTributo4) + ']');

          Writeln('DF monto tributo 4         := [' +
           FloatToStr(azeta.RegDF.ImporteTributo4) + ']');

          Writeln('DF tributo 5               := [' +
           FloatToStr(azeta.RegDF.CodigoTributo5) + ']');

          Writeln('DF monto tributo 5         := [' +
           FloatToStr(azeta.RegDF.ImporteTributo5) + ']');

          Writeln('DF tributo 6               := [' +
           FloatToStr(azeta.RegDF.CodigoTributo6) + ']');

          Writeln('DF monto tributo 6         := [' +
           FloatToStr(azeta.RegDF.ImporteTributo6) + ']');

          Writeln('DF tributo 7               := [' +
           FloatToStr(azeta.RegDF.CodigoTributo7) + ']');

          Writeln('DF monto tributo 7         := [' +
           FloatToStr(azeta.RegDF.ImporteTributo7) + ']');

          Writeln('DF tributo 8               := [' +
           FloatToStr(azeta.RegDF.CodigoTributo8) + ']');

          Writeln('DF monto tributo 8         := [' +
           FloatToStr(azeta.RegDF.ImporteTributo8) + ']');

          Writeln('DF tributo 9               := [' +
           FloatToStr(azeta.RegDF.CodigoTributo9) + ']');

          Writeln('DF monto tributo 9         := [' +
           FloatToStr(azeta.RegDF.ImporteTributo9) + ']');

          Writeln('DF tributo 10              := [' +
           FloatToStr(azeta.RegDF.CodigoTributo10) + ']');

          Writeln('DF monto tributo 10        := [' +
           FloatToStr(azeta.RegDF.ImporteTributo10) + ']');

          Writeln('DF tributo 11              := [' +
           FloatToStr(azeta.RegDF.CodigoTributo11) + ']');

          Writeln('DF monto tributo 11        := [' +
           FloatToStr(azeta.RegDF.ImporteTributo11) + ']');
          Writeln('');

          Writeln('DF total tributos          := [' +FloatToStr(azeta.RegDF.TotalTributos
           ) + ']');
          Writeln('');
        end;
      HasarArgentina_TLB.RegistroDetalladoDNFH:
        begin
          Writeln('');
        Writeln('TIPO REGISTRO:');
        Writeln('[' +FloatToStr(azeta.Registro) + ']');
        Writeln('');

          Writeln('DNFH (Documentos No Fiscales Homologados);: :=QUE ACUMULAN:=');

          Writeln('---------------------------------------------------------');
        Writeln('DNFH Tipo Comprob.         := [' +
            { FromTiposComprobanteToString }
            (azeta.RegDNFH.CodigoComprobante) + ']');

          Writeln('DNFH Nro. inicial          := [' +
           FloatToStr(azeta.RegDNFH.NumeroInicial) + ']');

          Writeln('DNFH Nro. Final            := [' +
           FloatToStr(azeta.RegDNFH.NumeroFinal) + ']');

          Writeln('DNFH total acumulado       := [' +FloatToStr(azeta.RegDNFH.Total) +
            ']');
          Writeln('');
        end;
      HasarArgentina_TLB.RegistroDetalladoDNFHNoAcum:
        begin
          Writeln('');
          Writeln('TIPO REGISTRO:');
          Writeln('[' +FloatToStr(azeta.Registro) + ']');
        Writeln('');

          Writeln('DNFH (Documentos No Fiscales Homologados);: :=QUE NO ACUMULAN:=');

          Writeln('------------------------------------------------------------');
        Writeln('Tipo Comprobante := [' +
            { FromTiposComprobanteToString }
            (azeta.RegDNFH_NoAcum.CodigoComprobante) + ']');
          Writeln('Nº inicial       := [' +
           FloatToStr(azeta.RegDNFH_NoAcum.NumeroInicial) + ']');

          Writeln('Nº final         := [' +FloatToStr(azeta.RegDNFH_NoAcum.NumeroFinal) +
            ']');
          Writeln('');
        end;
      HasarArgentina_TLB.RegistroGlobal:
        begin
          Writeln('');
        Writeln('TIPO REGISTRO:');
        Writeln('[' +FloatToStr(azeta.Registro) + ']');
        Writeln('');
        Writeln('INFORMACION GLOBAL:');
        Writeln('-------------------');

          Writeln('DF cant. cancelados := [' +
           FloatToStr(azeta.RegGlobal.DF_CantidadCancelados) + ']');

          Writeln('DF cant. emitidos   := [' +
           FloatToStr(azeta.RegGlobal.DF_CantidadEmitidos) + ']');
          Writeln('');

          Writeln('DF total ventas     := [' +FloatToStr(azeta.RegGlobal.DF_Total) + ']');

          Writeln('');

          Writeln('DF total gravado    := [' +
           FloatToStr(azeta.RegGlobal.DF_TotalGravado) + ']');

          Writeln('DF total IVA        := [' +
           FloatToStr(azeta.RegGlobal.DF_TotalIVA) + ']');

          Writeln('DF total tributos   := [' +
           FloatToStr(azeta.RegGlobal.DF_TotalTributos) + ']');

          Writeln('DF total no gravado := [' +
           FloatToStr(azeta.RegGlobal.DF_TotalNoGravado) + ']');

          Writeln('DF total exento     := [' +FloatToStr(azeta.RegGlobal.DF_TotalExento) +
            ']');
          Writeln('');

          Writeln('DF total DNFH       := [' +FloatToStr(azeta.RegGlobal.DNFH_Total) +
            ']');
          Writeln('');
        end;
       end;

    azeta2 := HASARNG.ContinuarConsultaAcumulados;

    while (azeta2.Registro <> HasarArgentina_TLB.RegistroFinal) do
    begin

      Case azeta2.Registro of
        HasarArgentina_TLB.RegistroDetalladoDF:
          begin
            Writeln('');
            Writeln('TIPO REGISTRO:');
            Writeln('[' +FloatToStr(azeta2.Registro) + ']');
          Writeln('');
          Writeln('DF (Documentos Fiscales);:');
          Writeln('-------------------------');
          Writeln('DF Tipo comprobante        := [' +
              { FromTiposComprobanteToString }
              (azeta2.RegDF.CodigoComprobante) + ']');

            Writeln('DF Nro. inicial            := [' +
             FloatToStr(azeta2.RegDF.NumeroInicial) + ']');

            Writeln('DF Nro. final              := [' +
             FloatToStr(azeta2.RegDF.NumeroFinal) + ']');

            Writeln('DF cancelados              := [' +
             FloatToStr(azeta2.RegDF.CantidadCancelados) + ']');
            Writeln('');

            Writeln('DF total ventas            := [' +FloatToStr(azeta2.RegDF.Total) +
              ']');
            Writeln('');

            Writeln('DF total gravado           := [' +
             FloatToStr(azeta2.RegDF.TotalGravado) + ']');

            Writeln('DF total no gravado        := [' +
             FloatToStr(azeta2.RegDF.TotalNoGravado) + ']');

            Writeln('DF total exento            := [' +FloatToStr(azeta2.RegDF.TotalExento)
              + ']');
            Writeln('');

            Writeln('DF IVA 1                   := [' +
             FloatToStr(azeta2.RegDF.AlicuotaIVA_1) + ']');

            Writeln('DF monto IVA 1             := [' +
             FloatToStr(azeta2.RegDF.MontoIVA_1) + ']');

            Writeln('DF IVA 2                   := [' +
             FloatToStr(azeta2.RegDF.AlicuotaIVA_2) + ']');

            Writeln('DF monto IVA 2             := [' +
             FloatToStr(azeta2.RegDF.MontoIVA_2) + ']');

            Writeln('DF IVA 3                   := [' +
             FloatToStr(azeta2.RegDF.AlicuotaIVA_3) + ']');

            Writeln('DF monto IVA 3             := [' +
             FloatToStr(azeta2.RegDF.MontoIVA_3) + ']');

            Writeln('DF IVA 4                   := [' +
             FloatToStr(azeta2.RegDF.AlicuotaIVA_4) + ']');

            Writeln('DF monto IVA 4             := [' +
             FloatToStr(azeta2.RegDF.MontoIVA_4) + ']');

            Writeln('DF IVA 5                   := [' +
             FloatToStr(azeta2.RegDF.AlicuotaIVA_5) + ']');

            Writeln('DF monto IVA 5             := [' +
             FloatToStr(azeta2.RegDF.MontoIVA_5) + ']');

            Writeln('DF IVA 6                   := [' +
             FloatToStr(azeta2.RegDF.AlicuotaIVA_6) + ']');

            Writeln('DF monto IVA 6             := [' +
             FloatToStr(azeta2.RegDF.MontoIVA_6) + ']');

            Writeln('DF IVA 7                   := [' +
             FloatToStr(azeta2.RegDF.AlicuotaIVA_7) + ']');

            Writeln('DF monto IVA 7             := [' +
             FloatToStr(azeta2.RegDF.MontoIVA_7) + ']');

            Writeln('DF IVA 8                   := [' +
             FloatToStr(azeta2.RegDF.AlicuotaIVA_8) + ']');

            Writeln('DF monto IVA 8             := [' +
             FloatToStr(azeta2.RegDF.MontoIVA_8) + ']');

            Writeln('DF IVA 9                   := [' +
             FloatToStr(azeta2.RegDF.AlicuotaIVA_9) + ']');

            Writeln('DF monto IVA 9             := [' +
             FloatToStr(azeta2.RegDF.MontoIVA_9) + ']');

            Writeln('DF IVA 10                  := [' +
             FloatToStr(azeta2.RegDF.AlicuotaIVA_10) + ']');

            Writeln('DF monto IVA 10            := [' +FloatToStr(azeta2.RegDF.MontoIVA_10
             ) + ']');
            Writeln('');

            Writeln('DF total IVA               := [' +FloatToStr(azeta2.RegDF.TotalIVA) +
              ']');
            Writeln('');

            Writeln('DF tributo 1               := [' +
             FloatToStr(azeta2.RegDF.CodigoTributo1) + ']');

            Writeln('DF monto tributo 1         := [' +
             FloatToStr(azeta2.RegDF.ImporteTributo1) + ']');

            Writeln('DF tributo 2               := [' +
             FloatToStr(azeta2.RegDF.CodigoTributo2) + ']');

            Writeln('DF monto tributo 2         := [' +
             FloatToStr(azeta2.RegDF.ImporteTributo2) + ']');

            Writeln('DF tributo 3               := [' +
             FloatToStr(azeta2.RegDF.CodigoTributo3) + ']');

            Writeln('DF monto tributo 3         := [' +
             FloatToStr(azeta2.RegDF.ImporteTributo3) + ']');

            Writeln('DF tributo 4               := [' +
             FloatToStr(azeta2.RegDF.CodigoTributo4) + ']');

            Writeln('DF monto tributo 4         := [' +
             FloatToStr(azeta2.RegDF.ImporteTributo4) + ']');

            Writeln('DF tributo 5               := [' +
             FloatToStr(azeta2.RegDF.CodigoTributo5) + ']');

            Writeln('DF monto tributo 5         := [' +
             FloatToStr(azeta2.RegDF.ImporteTributo5) + ']');

            Writeln('DF tributo 6               := [' +
             FloatToStr(azeta2.RegDF.CodigoTributo6) + ']');

            Writeln('DF monto tributo 6         := [' +
             FloatToStr(azeta2.RegDF.ImporteTributo6) + ']');

            Writeln('DF tributo 7               := [' +
             FloatToStr(azeta2.RegDF.CodigoTributo7) + ']');

            Writeln('DF monto tributo 7         := [' +
             FloatToStr(azeta2.RegDF.ImporteTributo7) + ']');

            Writeln('DF tributo 8               := [' +
             FloatToStr(azeta2.RegDF.CodigoTributo8) + ']');

            Writeln('DF monto tributo 8         := [' +
             FloatToStr(azeta2.RegDF.ImporteTributo8) + ']');

            Writeln('DF tributo 9               := [' +
             FloatToStr(azeta2.RegDF.CodigoTributo9) + ']');

            Writeln('DF monto tributo 9         := [' +
             FloatToStr(azeta2.RegDF.ImporteTributo9) + ']');

            Writeln('DF tributo 10              := [' +
             FloatToStr(azeta2.RegDF.CodigoTributo10) + ']');

            Writeln('DF monto tributo 10        := [' +
             FloatToStr(azeta2.RegDF.ImporteTributo10) + ']');

            Writeln('DF tributo 11              := [' +
             FloatToStr(azeta2.RegDF.CodigoTributo11) + ']');

            Writeln('DF monto tributo 11        := [' +
             FloatToStr(azeta2.RegDF.ImporteTributo11) + ']');
            Writeln('');

            Writeln('DF total tributos          := [' +
             FloatToStr(azeta2.RegDF.TotalTributos) + ']');
            Writeln('');
          end;
        HasarArgentina_TLB.RegistroDetalladoDNFH:
          begin
            Writeln('');
          Writeln('TIPO REGISTRO:');
          Writeln('[' +FloatToStr(azeta2.Registro) + ']');
          Writeln('');

            Writeln('DNFH (Documentos No Fiscales Homologados);: :=QUE ACUMULAN:=');

            Writeln('---------------------------------------------------------');
          Writeln('DNFH Tipo Comprob.         := [' +
              { FromTiposComprobanteToString }
              (azeta2.RegDNFH.CodigoComprobante) + ']');

            Writeln('DNFH Nro. inicial          := [' +
             FloatToStr(azeta2.RegDNFH.NumeroInicial) + ']');

            Writeln('DNFH Nro. Final            := [' +
             FloatToStr(azeta2.RegDNFH.NumeroFinal) + ']');

            Writeln('DNFH total acumulado       := [' +FloatToStr(azeta2.RegDNFH.Total) +
              ']');
            Writeln('');
          end;
        HasarArgentina_TLB.RegistroDetalladoDNFHNoAcum:
          begin
            Writeln('');
            Writeln('TIPO REGISTRO:');
            Writeln('[' +FloatToStr(azeta2.Registro) + ']');
          Writeln('');

            Writeln('DNFH (Documentos No Fiscales Homologados);: :=QUE NO ACUMULAN:=');

            Writeln('------------------------------------------------------------');
          Writeln('Tipo Comprobante := [' +
              { FromTiposComprobanteToString }
              (azeta2.RegDNFH_NoAcum.CodigoComprobante) + ']');

            Writeln('Nº inicial       := [' +
             FloatToStr(azeta2.RegDNFH_NoAcum.NumeroInicial) + ']');

            Writeln('Nº final         := [' +FloatToStr(azeta2.RegDNFH_NoAcum.NumeroFinal
             ) + ']');
            Writeln('');
          end;
        HasarArgentina_TLB.RegistroGlobal:
          begin
            Writeln('');
          Writeln('TIPO REGISTRO:');
          Writeln('[' +FloatToStr(azeta2.Registro) + ']');
          Writeln('');
          Writeln('INFORMACION GLOBAL:');
          Writeln('-------------------');

            Writeln('DF cant. cancelados := [' +
             FloatToStr(azeta2.RegGlobal.DF_CantidadCancelados) + ']');

            Writeln('DF cant. emitidos   := [' +
             FloatToStr(azeta2.RegGlobal.DF_CantidadEmitidos) + ']');
          Writeln('');

            Writeln('DF total ventas     := [' +FloatToStr(azeta2.RegGlobal.DF_Total) +
              ']');
            Writeln('');

            Writeln('DF total gravado    := [' +
             FloatToStr(azeta2.RegGlobal.DF_TotalGravado) + ']');

            Writeln('DF total IVA        := [' +
             FloatToStr(azeta2.RegGlobal.DF_TotalIVA) + ']');

            Writeln('DF total tributos   := [' +
             FloatToStr(azeta2.RegGlobal.DF_TotalTributos) + ']');

            Writeln('DF total no gravado := [' +
             FloatToStr(azeta2.RegGlobal.DF_TotalNoGravado) + ']');

            Writeln('DF total exento     := [' +FloatToStr(azeta2.RegGlobal.DF_TotalExento)
              + ']');
            Writeln('');

            Writeln('DF total DNFH       := [' +FloatToStr(azeta2.RegGlobal.DNFH_Total) +
              ']');
            Writeln('');
          end;
         end;

      azeta2 := HASARNG.ContinuarConsultaAcumulados;
       end;

  Writeln('');
    Writeln('NO HAY MAS INFORMACION DISPONIBLE !...');
    Writeln('');
  Writeln('FIN DE LA CONSULTA !...');
  Writeln('');


     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Consultar configuración del servidor de correo electrónico.
// ====================================================================================================================

procedure CommandConsCorreo_Click;

var
  respcorreo: RespuestaConsultarConfiguracionServidorCorreo;

begin
  Writeln('');
  Writeln('CONSULTANDO CONFIGURACION DEL SERVIDOR DE CORREO ELECTRONICO...');
  Writeln('');

 Try
    respcorreo := HASARNG.ConsultarConfiguracionServidorCorreo;
    Writeln('');
    Writeln('IP Servidor SMTP     := [' + (respcorreo.DireccionIP) + ']');
    Writeln('Port Servidor SMTP   := [' + (respcorreo.Puerto) + ']');
    Writeln('Responder a          := [' + (respcorreo.DireccionRemitente) + ']');
    Writeln('');
    Writeln('FIN DE LA CONSULTA !...');
    Writeln('');

     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Consultar documentos asociados.
// ====================================================================================================================

procedure CommandConsDocAsoc_Click;

var
  respdoc: RespuestaConsultarDocumentoAsociado;
begin
Writeln('');
Writeln('CONSULTANDO DOCUMENTOS ASOCIADOS...');
Writeln('');

 Try
    respdoc := HASARNG.ConsultarDocumentoAsociado(1);
    Writeln('');
  Writeln(':=LINEA 1:=');
  Writeln('Tipo comprobante := [' +
      { FromTiposComprobanteToString } (respdoc.CodigoComprobante) + ']');

    Writeln('Nro. comprobante := [' + respdoc.NumeroPos + '-' +(
      respdoc.NumeroComprobante) + ']');
    Writeln('');

    respdoc := HASARNG.ConsultarDocumentoAsociado(2);
  Writeln('');
    Writeln(':=LINEA 2:=');
  Writeln('Tipo comprobante := [' +
      { FromTiposComprobanteToString } (respdoc.CodigoComprobante) + ']');

    Writeln('Nro. comprobante := [' + respdoc.NumeroPos + '-' +
      respdoc.NumeroComprobante + ']'

      );
    Writeln('');
  Writeln('FIN DE LA CONSULTA !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Consultar información último error producido.
// ====================================================================================================================

procedure CommandConsError_Click;

var
  resperr: RespuestaConsultarUltimoError;

begin
  Writeln('');
  Writeln('CONSULTANDO ULTIMO ERROR...');
  Writeln('');

 Try
    resperr := HASARNG.ConsultarUltimoError;
  Writeln('');
  Writeln('ID error := [' + (resperr.UltimoError) + ']');

    Writeln('Campo    := [' + (resperr.NumeroParametro) + ' :: ' +
      (resperr.NombreParametro) + ']');
  Writeln('Mensaje  := [' + (resperr.Descripcion) + ']');
  Writeln('Contexto := [' + (resperr.Contexto) + ']');
    Writeln('');
  Writeln('FIN DE LA CONSULTA !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Consultar estado general de la impresora fiscal.
// ====================================================================================================================

procedure CommandConsEstado_Click;

var
  respest: RespuestaConsultarEstado;
begin
Writeln('');
  Writeln('CONSULTANDO ESTADO GENERAL IMPRESORA FISCAL...');
Writeln('');

 Try
    respest := HASARNG.ConsultarEstado(NoDocumento);
    Writeln('');

    Writeln('Tipo Comprobante      := [' + { FromTiposComprobanteToString }
      (respest.CodigoComprobante) + ']');

    Writeln('Ultimo Nro.           := [' +
      (respest.NumeroUltimoComprobante) + ']');

    Writeln('Cancelados            := [' + (respest.CantidadCancelados) + ']');

    Writeln('Emitidos              := [' + (respest.CantidadEmitidos) + ']');

    Writeln('');
  Writeln('Almacenado en memoria de trabajo...');

    Writeln('Código de barras      := [' +
      (respest.EstadoAuxiliar.CodigoBarrasAlmacenado) + ']');

    Writeln('Datos del cliente     := [' +
      (respest.EstadoAuxiliar.DatosClienteAlmacenados) + ']');
  Writeln('');
  Writeln('Memoria de auditoria...');

    Writeln('Casi llena            := [' +
      (respest.EstadoAuxiliar.MemoriaAuditoriaCasiLlena) + ']');

    Writeln('Llena                 := [' +
      (respest.EstadoAuxiliar.MemoriaAuditoriaLlena) + ']');
  Writeln('');
    Writeln('Otra info...');

    Writeln('Modo entrenamiento    := [' +
      (respest.EstadoAuxiliar.ModoEntrenamiento) + ']');

    Writeln('Ult. comprob. cancel. := [' +
      (respest.EstadoAuxiliar.UltimoComprobanteFueCancelado) + ']'

      );
    Writeln('');
  Writeln('FIN DE LA CONSULTA !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Consultar información acerca del modelo y versión de la impresora fiscal.
// ====================================================================================================================

procedure CommandConsModvers_Click;

var
  resp: RespuestaConsultarVersion;
begin
Writeln('');
  Writeln('CONSULTANDO MODELO Y VERSION IMPRESORA FISCAL...');
Writeln('');

 Try
    resp := HASARNG.ConsultarVersion;
  Writeln('');

    Writeln('Impresora fiscal  := [' + (resp.NombreProducto) + ']');
  Writeln('Marca             := [' + (resp.Marca) + ']');
  Writeln('Modelo y versión  := [' + (resp.Version) + ']');

    Writeln('Fecha firmware    := [' + (resp.FechaFirmware) + ']');
  Writeln('Versión motor     := [' + (resp.VersionMotor) + ']');

    Writeln('Versión protocolo := [' + (resp.VersionProtocolo) + ']'

      );
    Writeln('');
  Writeln('FIN DE LA CONSULTA !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Consultar capacidad de cierres 'Z'.
// ====================================================================================================================

procedure CommandConsZetas_Click;

var
  respz: RespuestaConsultarCapacidadZetas;
begin
Writeln('');
  Writeln('CONSULTANDO CAPACIDAD CIERRES " Z "...');
  Writeln('');

 Try
    respz := HASARNG.ConsultarCapacidadZetas;
  Writeln('');
  Writeln('Cierres " Z " totales     := [' +
      (respz.CantidadDeZetasRemanentes) + ']');
  Writeln('Cierres " Z " realizados  := [' + (respz.UltimaZeta) + ']');
  Writeln('Cierres " Z " disponibles := [' + (Val(respz.CantidadDeZetasRemanentes)
      - Val(respz.UltimaZeta)) + ']');

  Writeln('');
  Writeln('FIN DE LA CONSULTA !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Consultar líneas de usuario, por zona.
// ====================================================================================================================

procedure CommandConsZona_Click;

var
  resp: RespuestaConsultarZona;

begin
  Writeln('');
  Writeln('CONSULTANDO LINEAS DE USUARIO POR ZONA...');
  Writeln('');

 Try
    resp := HASARNG.ConsultarZona(1, EstacionTicket, ZonaFantasia);
  Writeln('');
    Writeln(':=LINEA 1 , Fantasía:=');

    Writeln('Estilo: Borrado     := [' + (resp.Atributos.BorradoTexto) + ']');

    Writeln('Estilo: Centrado    := [' + (resp.Atributos.Centrado) + ']');

    Writeln('Estilo: Doble ancho := [' + (resp.Atributos.DobleAncho) + ']');

    Writeln('Estilo: Negrita     := [' + (resp.Atributos.Negrita) + ']');

    Writeln('Texto               := [' + (resp.Descripcion) + ']');

    Writeln('');

    resp := HASARNG.ConsultarZona(2, EstacionTicket, ZonaFantasia);
  Writeln('');
    Writeln(':=LINEA 2 , Fantasía:=');

    Writeln('Estilo: Borrado     := [' + (resp.Atributos.BorradoTexto) + ']');

    Writeln('Estilo: Centrado    := [' + (resp.Atributos.Centrado) + ']');

    Writeln('Estilo: Doble ancho := [' + (resp.Atributos.DobleAncho) + ']');

    Writeln('Estilo: Negrita     := [' + (resp.Atributos.Negrita) + ']');

    Writeln('Texto  := [' + (resp.Descripcion) + ']');
  Writeln('');

    resp := HASARNG.ConsultarZona(1, EstacionTicket, Zona1Encabezado);
  Writeln('');
    Writeln(':=LINEA 1 , Encabezado 1:=');

    Writeln('Estilo: Borrado     := [' + (resp.Atributos.BorradoTexto) + ']');

    Writeln('Estilo: Centrado    := [' + (resp.Atributos.Centrado) + ']');

    Writeln('Estilo: Doble ancho := [' + (resp.Atributos.DobleAncho) + ']');

    Writeln('Estilo: Negrita     := [' + (resp.Atributos.Negrita) + ']');

    Writeln('Texto  := [' + (resp.Descripcion) + ']');
  Writeln('');

    resp := HASARNG.ConsultarZona(2, EstacionTicket, Zona1Encabezado);
  Writeln('');
    Writeln(':=LINEA 2 , Encabezado 1:=');

    Writeln('Estilo: Borrado     := [' + (resp.Atributos.BorradoTexto) + ']');

    Writeln('Estilo: Centrado    := [' + (resp.Atributos.Centrado) + ']');

    Writeln('Estilo: Doble ancho := [' + (resp.Atributos.DobleAncho) + ']');

    Writeln('Estilo: Negrita     := [' + (resp.Atributos.Negrita) + ']');

    Writeln('Texto  := [' + (resp.Descripcion) + ']');
  Writeln('');

    resp := HASARNG.ConsultarZona(3, EstacionTicket, Zona1Encabezado);
  Writeln('');
    Writeln(':=LINEA 3 , Encabezado 1:=');

    Writeln('Estilo: Borrado     := [' + (resp.Atributos.BorradoTexto) + ']');

    Writeln('Estilo: Centrado    := [' + (resp.Atributos.Centrado) + ']');

    Writeln('Estilo: Doble ancho := [' + (resp.Atributos.DobleAncho) + ']');

    Writeln('Estilo: Negrita     := [' + (resp.Atributos.Negrita) + ']');

    Writeln('Texto  := [' + (resp.Descripcion) + ']');
  Writeln('');

    resp := HASARNG.ConsultarZona(1, EstacionTicket, Zona2Encabezado);
  Writeln('');
    Writeln(':=LINEA 1 , Encabezado 2:=');

    Writeln('Estilo: Borrado     := [' + (resp.Atributos.BorradoTexto) + ']');

    Writeln('Estilo: Centrado    := [' + (resp.Atributos.Centrado) + ']');

    Writeln('Estilo: Doble ancho := [' + (resp.Atributos.DobleAncho) + ']');

    Writeln('Estilo: Negrita     := [' + (resp.Atributos.Negrita) + ']');

    Writeln('Texto  := [' + (resp.Descripcion) + ']');
  Writeln('');

    resp := HASARNG.ConsultarZona(2, EstacionTicket, Zona2Encabezado);
  Writeln('');
    Writeln(':=LINEA 2 , Encabezado 2:=');

    Writeln('Estilo: Borrado     := [' + (resp.Atributos.BorradoTexto) + ']');

    Writeln('Estilo: Centrado    := [' + (resp.Atributos.Centrado) + ']');

    Writeln('Estilo: Doble ancho := [' + (resp.Atributos.DobleAncho) + ']');

    Writeln('Estilo: Negrita     := [' + (resp.Atributos.Negrita) + ']');

    Writeln('Texto  := [' + (resp.Descripcion) + ']');
  Writeln('');

    resp := HASARNG.ConsultarZona(3, EstacionTicket, Zona2Encabezado);
  Writeln('');
    Writeln(':=LINEA 3 , Encabezado 2:=');

    Writeln('Estilo: Borrado     := [' + (resp.Atributos.BorradoTexto) + ']');

    Writeln('Estilo: Centrado    := [' + (resp.Atributos.Centrado) + ']');

    Writeln('Estilo: Doble ancho := [' + (resp.Atributos.DobleAncho) + ']');

    Writeln('Estilo: Negrita     := [' + (resp.Atributos.Negrita) + ']');

    Writeln('Texto  := [' + (resp.Descripcion) + ']');
  Writeln('');

    resp := HASARNG.ConsultarZona(1, EstacionTicket, Zona1Cola);
  Writeln('');
    Writeln(':=LINEA 1 , Cola 1:=');
    Writeln('Estilo: Borrado     := [' + (resp.Atributos.BorradoTexto) + ']');

    Writeln('Estilo: Centrado    := [' + (resp.Atributos.Centrado) + ']');

    Writeln('Estilo: Doble ancho := [' + (resp.Atributos.DobleAncho) + ']');

    Writeln('Estilo: Negrita     := [' + (resp.Atributos.Negrita) + ']');

    Writeln('Texto  := [' + (resp.Descripcion) + ']');
  Writeln('');

    resp := HASARNG.ConsultarZona(2, EstacionTicket, Zona1Cola);
  Writeln('');
    Writeln(':=LINEA 2 , Cola 1:=');
    Writeln('Estilo: Borrado     := [' + (resp.Atributos.BorradoTexto) + ']');

    Writeln('Estilo: Centrado    := [' + (resp.Atributos.Centrado) + ']');

    Writeln('Estilo: Doble ancho := [' + (resp.Atributos.DobleAncho) + ']');

    Writeln('Estilo: Negrita     := [' + (resp.Atributos.Negrita) + ']');

    Writeln('Texto  := [' + (resp.Descripcion) + ']');
  Writeln('');

    resp := HASARNG.ConsultarZona(3, EstacionTicket, Zona1Cola);
  Writeln('');
    Writeln(':=LINEA 3 , Cola 1:=');
    Writeln('Estilo: Borrado     := [' + (resp.Atributos.BorradoTexto) + ']');

    Writeln('Estilo: Centrado    := [' + (resp.Atributos.Centrado) + ']');

    Writeln('Estilo: Doble ancho := [' + (resp.Atributos.DobleAncho) + ']');

    Writeln('Estilo: Negrita     := [' + (resp.Atributos.Negrita) + ']');

    Writeln('Texto  := [' + (resp.Descripcion) + ']');
  Writeln('');

    resp := HASARNG.ConsultarZona(4, EstacionTicket, Zona1Cola);
  Writeln('');
    Writeln(':=LINEA 4 , Cola 1:=');
    Writeln('Estilo: Borrado     := [' + (resp.Atributos.BorradoTexto) + ']');

    Writeln('Estilo: Centrado    := [' + (resp.Atributos.Centrado) + ']');

    Writeln('Estilo: Doble ancho := [' + (resp.Atributos.DobleAncho) + ']');

    Writeln('Estilo: Negrita     := [' + (resp.Atributos.Negrita) + ']');

    Writeln('Texto  := [' + (resp.Descripcion) + ']');
  Writeln('');

    resp := HASARNG.ConsultarZona(1, EstacionTicket, Zona2Cola);
  Writeln('');
    Writeln(':=LINEA 1 , Cola 2:=');
    Writeln('Estilo: Borrado     := [' + (resp.Atributos.BorradoTexto) + ']');

    Writeln('Estilo: Centrado    := [' + (resp.Atributos.Centrado) + ']');

    Writeln('Estilo: Doble ancho := [' + (resp.Atributos.DobleAncho) + ']');

    Writeln('Estilo: Negrita     := [' + (resp.Atributos.Negrita) + ']');

    Writeln('Texto  := [' + (resp.Descripcion) + ']');
  Writeln('');

    resp := HASARNG.ConsultarZona(2, EstacionTicket, Zona2Cola);
  Writeln('');
    Writeln(':=LINEA 2 , Cola 2:=');
    Writeln('Estilo: Borrado     := [' + (resp.Atributos.BorradoTexto) + ']');

    Writeln('Estilo: Centrado    := [' + (resp.Atributos.Centrado) + ']');

    Writeln('Estilo: Doble ancho := [' + (resp.Atributos.DobleAncho) + ']');

    Writeln('Estilo: Negrita     := [' + (resp.Atributos.Negrita) + ']');

    Writeln('Texto  := [' + (resp.Descripcion) + ']');
  Writeln('');

    resp := HASARNG.ConsultarZona(3, EstacionTicket, Zona2Cola);
  Writeln('');
    Writeln(':=LINEA 3 , Cola 2:=');
    Writeln('Estilo: Borrado     := [' + (resp.Atributos.BorradoTexto) + ']');

    Writeln('Estilo: Centrado    := [' + (resp.Atributos.Centrado) + ']');

    Writeln('Estilo: Doble ancho := [' + (resp.Atributos.DobleAncho) + ']');

    Writeln('Estilo: Negrita     := [' + (resp.Atributos.Negrita) + ']');

    Writeln('Texto  := [' + (resp.Descripcion) + ']');
  Writeln('');

    resp := HASARNG.ConsultarZona(4, EstacionTicket, Zona2Cola);
  Writeln('');
    Writeln(':=LINEA 4 , Cola 2:=');
    Writeln('Estilo: Borrado     := [' + (resp.Atributos.BorradoTexto) + ']');

    Writeln('Estilo: Centrado    := [' + (resp.Atributos.Centrado) + ']');

    Writeln('Estilo: Doble ancho := [' + (resp.Atributos.DobleAncho) + ']');

    Writeln('Estilo: Negrita     := [' + (resp.Atributos.Negrita) + ']');

    Writeln('Texto  := [' + (resp.Descripcion) + ']');
  Writeln('');

    resp := HASARNG.ConsultarZona(5, EstacionTicket, Zona2Cola);
  Writeln('');
    Writeln(':=LINEA 5 , Cola 2:=');
    Writeln('Estilo: Borrado     := [' + (resp.Atributos.BorradoTexto) + ']');

    Writeln('Estilo: Centrado    := [' + (resp.Atributos.Centrado) + ']');

    Writeln('Estilo: Doble ancho := [' + (resp.Atributos.DobleAncho) + ']');

    Writeln('Estilo: Negrita     := [' + (resp.Atributos.Negrita) + ']');

    Writeln('Texto  := [' + (resp.Descripcion) + ']');
  Writeln('');

    resp := HASARNG.ConsultarZona(6, EstacionTicket, Zona2Cola);
  Writeln('');
    Writeln(':=LINEA 6 , Cola 2:=');
    Writeln('Estilo: Borrado     := [' + (resp.Atributos.BorradoTexto) + ']');

    Writeln('Estilo: Centrado    := [' + (resp.Atributos.Centrado) + ']');

    Writeln('Estilo: Doble ancho := [' + (resp.Atributos.DobleAncho) + ']');

    Writeln('Estilo: Negrita     := [' + (resp.Atributos.Negrita) + ']');

    Writeln('Texto  := [' + (resp.Descripcion) + ']');
  Writeln('');

    resp := HASARNG.ConsultarZona(1, EstacionTicket, ZonaDomicilioEmisor);
  Writeln('');
    Writeln(':=LINEA 1 , Domicilio emisor:=');

    Writeln('Estilo: Borrado     := [' + (resp.Atributos.BorradoTexto) + ']');

    Writeln('Estilo: Centrado    := [' + (resp.Atributos.Centrado) + ']');

    Writeln('Estilo: Doble ancho := [' + (resp.Atributos.DobleAncho) + ']');

    Writeln('Estilo: Negrita     := [' + (resp.Atributos.Negrita) + ']');

    Writeln('Texto  := [' + (resp.Descripcion) + ']');
  Writeln('');

    resp := HASARNG.ConsultarZona(2, EstacionTicket, ZonaDomicilioEmisor);
  Writeln('');
    Writeln(':=LINEA 2 , Domicilio emisor:=');

    Writeln('Estilo: Borrado     := [' + (resp.Atributos.BorradoTexto) + ']');

    Writeln('Estilo: Centrado    := [' + (resp.Atributos.Centrado) + ']');

    Writeln('Estilo: Doble ancho := [' + (resp.Atributos.DobleAncho) + ']');

    Writeln('Estilo: Negrita     := [' + (resp.Atributos.Negrita) + ']');

    Writeln('Texto  := [' + (resp.Descripcion) + ']');
  Writeln('');

    resp := HASARNG.ConsultarZona(3, EstacionTicket, ZonaDomicilioEmisor);
  Writeln('');
    Writeln(':=LINEA 3 , Domicilio emisor:=');

    Writeln('Estilo: Borrado     := [' + (resp.Atributos.BorradoTexto) + ']');

    Writeln('Estilo: Centrado    := [' + (resp.Atributos.Centrado) + ']');

    Writeln('Estilo: Doble ancho := [' + (resp.Atributos.DobleAncho) + ']');

    Writeln('Estilo: Negrita     := [' + (resp.Atributos.Negrita) + ']');

    Writeln('Texto  := [' + (resp.Descripcion) + ']');
  Writeln('');

    resp := HASARNG.ConsultarZona(4, EstacionTicket, ZonaDomicilioEmisor);
  Writeln('');
    Writeln(':=LINEA 4 , Domicilio emisor:=');

    Writeln('Estilo: Borrado     := [' + (resp.Atributos.BorradoTexto) + ']');

    Writeln('Estilo: Centrado    := [' + (resp.Atributos.Centrado) + ']');

    Writeln('Estilo: Doble ancho := [' + (resp.Atributos.DobleAncho) + ']');

    Writeln('Estilo: Negrita     := [' + (resp.Atributos.Negrita) + ']');

    Writeln('Texto  := [' + (resp.Descripcion) + ']'

      );
    Writeln('');
  Writeln('FIN DE LA CONSULTA !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Se pide la reimpresión de un comprobante cualquera.
// ====================================================================================================================

procedure CommandCopiarDoc_Click;
begin

Writeln('');
  Writeln('SOLICITANDO REIMPRESION DE COMPROBANTE...');
  Writeln('');

 Try
    Writeln('Copia de Tique Factura " A " Nº 13');
    HASARNG.CopiarComprobante(TiqueFacturaA, 13);

  Writeln('');
    Writeln('COMPROBANTE REIMPRESO !...');
    Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Consultar datos de inicialización de la impresora fiscal.
// ====================================================================================================================

procedure CommandDatosIni_Click;

var
  datosini: RespuestaConsultarDatosInicializacion;
begin
Writeln('');
  Writeln('CONSULTANDO DATOS DE INCIALIZACION...');
  Writeln('');

 Try
    datosini := HASARNG.ConsultarDatosInicializacion;
    Writeln('');

    Writeln('Razón Social      := [' + (datosini.RazonSocial) + ']');
  Writeln('CUIT              := [' + (datosini.Cuit) + ']');
  Writeln('Responsab. IVA    := [' +
      { FromTiposDeResponsabilidadesImpresorToString }
      (datosini.ResponsabilidadIVA) + ']');
    Writeln('Ingr. Brutos      := [' + (datosini.IngBrutos) + ']');

    Writeln('Fecha inicio act. := [' + (datosini.FechaInicioActividades) + ']');

    Writeln('Nro. POS          := [' + (datosini.NumeroPos) + ']');
  Writeln('Reg. impr. fiscal := [' + (datosini.Registro) + ']'

      );
    Writeln('');
  Writeln('FIN DE LA CONSULTA !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Comando para el envío de comprobantes, por correo electrónico.
// ====================================================================================================================

procedure CommandDocxMail_Click;
begin

Writeln('');
  Writeln('ENVIANDO COMPROBANTE POR MAIL:');
  Writeln('');

 Try
    Writeln('Enviando: Tique Factura " A " Nº 13 :: rcardenes@hasar.com');
  Writeln('');
    HASARNG.EnviarDocumentoCorreo(TiqueFacturaA, 13, 'rcardenes@hasar.com');

  Writeln('');
    Writeln('COMPROBANTE ENVIADO !...');
    Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Impresión de un Comprobante Donación.
// ====================================================================================================================

procedure CommandDONA_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    Writeln('');
  Writeln('IMPRIMIENDO - COMPROBANTE DONACION:');
  Writeln('');

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      ResponsableInscripto, TipoCUIT, 'Domicilio Cliente...',
      'Domicilio extensión 1...', 'Domicilio extensión 2...',
      'Domicilio extensión 3....');
    HASARNG.CargarDocumentoAsociado(1, TiqueFacturaA, 2019, 1458);
    HASARNG.CargarBeneficiario('Razón Social Beneficiario...', '00000000000',
      TipoCUIL, 'Domicilio Beneficiario...');
    respabrir := HASARNG.AbrirDocumento(ComprobanteDonacion);

  Writeln('');
    Writeln(' - (abrir); Comprob. Donación Nro.   := [' +
      IntToStr(respabrir.NumeroComprobante) + ']');
    Writeln('');

    HASARNG.ImprimirItem('Monto parcial vuelto...', 1, 10, Exento, 0,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1, '',
      'DONA', Donacion);
    resppago := HASARNG.ImprimirPago('Efectivo...', 10, Pagar, DisplayNo, '',
      Efectivo, '', '');

  Writeln('');
    Writeln(' - Pagando... Cambio                 := [' + FloatToStr(resppago.Saldo) + ']');
  Writeln('');

    respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  Writeln('');
    Writeln(' - (cerrar);Comprobante Donación Nro. := [' +
      IntToStr(respcierre.NumeroComprobante) + ']');
    Writeln(' - Páginas                           := [' +
      IntToStr(respcierre.CantidadDePaginas) + ']');
    Writeln('');
  Writeln('COMPROBANTE DONACION IMPRESO !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Impresión del Detalle de ventas (cierre 'X');.
// ====================================================================================================================

procedure CommandEquis_Click;

var
  cierre: RespuestaCerrarJornadaFiscal;
begin
Writeln('');
  Writeln('DETALLE DE VENTAS:');
  Writeln('');

 Try
    cierre := HASARNG.CerrarJornadaFiscal(ReporteX);
    Writeln('');
  Writeln('Reporte...        := [' + FloatToStr(cierre.Reporte) + ']');
  Writeln('');
  Writeln('Detalle Nro.      := [' + FloatToStr(cierre.X.Numero) + ']');
  Writeln('');
    Writeln('Fecha inicial     := [' + FloatToStr(cierre.X.FechaInicio) + ']');

    Writeln('Hora inicial      := [' + FloatToStr(cierre.X.HoraInicio) + ']');

    Writeln('Fecha final       := [' + FloatToStr(cierre.X.FechaCierre) + ']');

    Writeln('Hora final        := [' + FloatToStr(cierre.X.HoraCierre) + ']');

    Writeln('');

    Writeln('DF Emitidos       := [' + FloatToStr(cierre.X.DF_CantidadEmitidos) + ']');
  Writeln('DF total ventas   := [' + FloatToStr(cierre.X.DF_Total) + ']');

    Writeln('DF total IVA      := [' + FloatToStr(cierre.X.DF_TotalIVA) + ']');

    Writeln('DF total tributos := [' + FloatToStr(cierre.X.DF_TotalTributos) + ']');

    Writeln('');

    Writeln('DNFH emitidos     := [' + FloatToStr(cierre.X.DNFH_CantidadEmitidos) + ']');

    Writeln('');

    Writeln('NC emitidas       := [' + FloatToStr(cierre.X.NC_CantidadEmitidos) + ']');
  Writeln('NC total crédito  := [' + FloatToStr(cierre.X.NC_Total) + ']');

    Writeln('NC total IVA      := [' + FloatToStr(cierre.X.NC_TotalIVA) + ']');

    Writeln('NC total tributos := [' + FloatToStr(cierre.X.NC_TotalTributos) + ']'

      );
    Writeln('');
  Writeln('DETALLE DE VENTAS IMPRESO !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Impresión de un Documento Genérico.
// ====================================================================================================================

procedure CommandFechaHora_Click;

var
  respfyh: RespuestaConsultarFechaHora;
begin
Writeln('');
  Writeln('CONSULTA DE FECHA Y HORA:');
  Writeln('');

 Try
    respfyh := HASARNG.ConsultarFechaHora;
  Writeln('');
  Writeln('Fecha := [' + DateToStr(respfyh.Fecha) + ']');
  Writeln('Hora  := [' + TimeToStr(respfyh.Hora) + ']'

      );
    Writeln('');
  Writeln('FIN DE LA CONSULTA !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Impresión de un Documento Genérico.
// ====================================================================================================================

procedure CommandGenerico_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    Writeln('');
  Writeln('IMPRIMIENDO - DOCUMENTO GENERICO:');
  Writeln('');

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      ResponsableInscripto, TipoCUIT, 'Domicilio Cliente...',
      'Domicilio extensión 1...', 'Domicilio extensión 2...',
      'Domicilio extensión 3....');
    HASARNG.CargarDocumentoAsociado(1, FacturaA, 2019, 1458);

    respabrir := HASARNG.AbrirDocumento(Generico);
    Writeln('');

    Writeln(' - (abrir); Documento Genérico Nro. := [' +
      IntToStr(respabrir.NumeroComprobante) + ']');
    Writeln('');

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

  Writeln('');
    Writeln(' - (cerrar);Documento Genérico Nro. := [' +
      IntToStr(respcierre.NumeroComprobante) + ']');
    Writeln(' - Páginas                         := [' +
      IntToStr(respcierre.CantidadDePaginas) + ']');
    Writeln('');
  Writeln('DOCUMENTO GENERICO IMPRESO !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Impresión de un Presupuesto 'X' clase 'A'.
// Se requiere un Cierre 'Z' previo.
// ====================================================================================================================

procedure CommandModifCateg_Click;
begin

Writeln('');
  Writeln('MODIFICANDO CATEGORIA IVA...');
  Writeln('');
Writeln('Nueva responsabilidad IVA := Responsable Inscripto');
Writeln('');

 Try
    HASARNG.CambiarCategoriaIVA(IFResponsableInscripto);
  Writeln('');
    Writeln('CATEGORIA IVA MODIFICADA !...');
    Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Modificar el código de inscripción en Ingresos Brutos.
// Se requiere un Cierre 'Z' previo.
// ====================================================================================================================

procedure CommandModifIIBB_Click;
begin

Writeln('');
  Writeln('MODIFICANDO INSCRIPCION INGRESOS BRUTOS...');
  Writeln('');

  Writeln('Nuevo código Ingresos Brutos := IIBB-54321099876543210');
Writeln('');

 Try
    HASARNG.CambiarInscripIIBB('IIBB-54321099876543210');
  Writeln('');
    Writeln('INSCRIPCION INGRESOS BRUTOS MODIFICADA !...');
    Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Modificar la fecha de inicio de actividades.
// Se requiere un Cierre 'Z' previo.
// ====================================================================================================================

procedure CommandModifIniActiv_Click;
begin

Writeln('');
  Writeln('MODIFICANDO FECHA DE INICIO DE ACTIVIDADES...');
  Writeln('');
Writeln('Nueva fecha inicio actividades := 01/02/2015');
Writeln('');

 Try
    HASARNG.CambiarFechaInicioActividades('01/02/2015');
  Writeln('');
    Writeln('FECHA DE INICIO DE ACTIVIDADES MODIFICADA !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Descarga de CTD.
// ====================================================================================================================

procedure CommandObtRepAudit_Click;

var
  resp: RespuestaObtenerPrimerBloqueAuditoria;

  resp2: RespuestaObtenerSiguienteBloqueAuditoria;
begin
Writeln('');
  Writeln('DESCARGA DE CTD (Cinta Testigo Digital);:');
  Writeln('');

 Try
    Writeln('Período: 01/02/2015 al 27/02/2015 , Comprimir, XML único');
  Writeln('');
    resp := HASARNG.ObtenerPrimerBloqueAuditoria(150201, 150227, ReporteZFecha,
      Comprime, XMLUnico);
    Writeln('');

    if (resp.Registro = BloqueFinal) then
    begin
      Writeln('NO HAY INFORMACION DISPONIBLE !...');
      Writeln('');


    end
    else
    begin
      Writeln('Primer bloque de información    := [' + (resp.Informacion) + ']');
    Writeln('');
    end;


    while True do
    begin
      resp2 := HASARNG.ObtenerSiguienteBloqueAuditoria;

      if (resp2.Registro = BloqueInformacion) then
      begin
        Writeln('Siguiente bloque de información := [' +
          (resp2.Informacion) + ']');
      Writeln('');
      end
      else
      begin
        Writeln('');
      Writeln('NO HAY MAS INFORMACION DISPONIBLE !...');
      Writeln('');
      Writeln('INFORMACION CTD DESCARGADA !...');
      Writeln('');
      end;


       end;



     except
    on E: Exception do
      Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Descarga de reportes electrónicos semanales.
// ====================================================================================================================

procedure CommandObtRepDoc_Click;

var
  resp: RespuestaObtenerPrimerBloqueDocumento;

  resp2: RespuestaObtenerSiguienteBloqueDocumento;
begin
Writeln('');
  Writeln('DESCARGA INFORMACION COMPROBANTES:');
  Writeln('');

 Try
    resp := HASARNG.ObtenerPrimerBloqueDocumento(1, 4, TiqueFacturaA, Comprime,
      XMLUnico);

    if (resp.Registro = BloqueFinal) then
    begin
      Writeln('NO HAY INFORMACION DISPONIBLE !...!');
      Writeln('');


    end
    else
    begin
      Writeln('Primer bloque de información    := [' + (resp.Informacion) + ']');
    Writeln('');
       end;

    while (True) do
    begin
      resp2 := HASARNG.ObtenerSiguienteBloqueDocumento;

      if (resp2.Registro = BloqueInformacion) then
      begin
        Writeln('Siguiente bloque de información := [' +
          (resp2.Informacion) + ']');
      Writeln('');
      end
      else
      begin
        Writeln('');
      Writeln('NO HAY MAS INFORMACION DISPONIBLE !...');
      Writeln('');
      Writeln('INFORMACION COMPROBANTES DESCARGADA !...');
      Writeln('');


         end;
       end;



     except
    on E: Exception do
      Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Descarga de reportes electrónicos semanales.
// ====================================================================================================================

procedure CommandObtRepElectr_Click;

var
  resp: RespuestaObtenerPrimerBloqueReporteElectronico;

  resp2: RespuestaObtenerSiguienteBloqueReporteElectronico;
begin
Writeln('');
  Writeln('DESCARGA DE REPORTES SEMANALES:');
  Writeln('');

 Try
    Writeln('Período: 01/02/2015 al 27/02/2015');
    resp := HASARNG.ObtenerPrimerBloqueReporteElectronico('01/02/2015',
      '27/02/2015');

    if (resp.Registro = BloqueFinal) then
    begin
      Writeln('');
    Writeln('NO HAY INFORMACION DISPONIBLE !...');
    Writeln('');


    end
    else
    begin
      Writeln('Primer bloque de información    := [' + (resp.Informacion) + ']');
    Writeln('');
       end;

    while (True) do
    begin
      resp2 := HASARNG.ObtenerSiguienteBloqueReporteElectronico;

      if (resp2.Registro = BloqueInformacion) then
      begin
        Writeln('Siguiente bloque de información := [' +
          (resp2.Informacion) + ']');
      Writeln('');
      end
      else
      begin
        Writeln('');
      Writeln('NO HAY MÁS INFORMACION DISPONIBLE !...');
      Writeln('');
      Writeln('REPORTES SEMANALES DECARGADOS !...');
      Writeln('');


         end;
       end;



     except
    on E: Exception do
      Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Descarga del LOG interno de la impresora fiscal.
// ====================================================================================================================

procedure CommandObtRepLog_Click;

var
  resp: RespuestaObtenerPrimerBloqueLog;

  resp2: RespuestaObtenerSiguienteBloqueLog;
begin
Writeln('');
  Writeln('DESCARGA LOG INTERNO:');
  Writeln('');

 Try
    resp := HASARNG.ObtenerPrimerBloqueLog;

    if (resp.Registro = BloqueFinal) then
    begin
      Writeln('');
    Writeln('NO HAY INFORMACION DISPONIBLE !...');
    Writeln('');

    end
    else
    begin
      Writeln('Primer bloque de información    := [' + (resp.Informacion) + ']');
    Writeln('');
       end;

    While (True) do
    begin
      resp2 := HASARNG.ObtenerSiguienteBloqueLog;

      if (resp2.Registro = BloqueInformacion) then
      begin
        Writeln('Siguiente bloque de información := [' +
          (resp2.Informacion) + ']');
      Writeln('');
      end
      else
      begin
        Writeln('');
      Writeln('NO HAY MAS INFORMACION DISPONIBLE !...');
      Writeln('');
      Writeln('LOG INTERNO DESCARGADO !...');
      Writeln('');


         end;
       end;



     except
    on E: Exception do
      Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Consulta de estado fiscal del último comando ejecutado.
// ====================================================================================================================

procedure CommandObtStFiscal_Click;

var
  resp: EstadoFiscal;
begin
Writeln('');
  Writeln('CONSULTA ULTIMO ESTADO FISCAL:');
  Writeln('');

 Try
    resp := HASARNG.ObtenerUltimoEstadoFiscal;

    Writeln('Doc. abierto             := [' + (resp.DocumentoAbierto) + ']');

    Writeln('Doc. fiscal abierto      := [' +
      (resp.DocumentoFiscalAbierto) + ']');

    Writeln('Error aritmético         := [' + (resp.ErrorAritmetico) + ']');

    Writeln('Error de ejecución       := [' + (resp.ErrorEjecucion) + ']');

    Writeln('Error de estado          := [' + (resp.ErrorEstado) + ']');

    Writeln('Error general            := [' + (resp.ErrorGeneral) + ']');

    Writeln('Error mem. auditoría     := [' + (resp.ErrorMemoriaAuditoria) + ']');

    Writeln('Error mem. fiscal        := [' + (resp.ErrorMemoriaFiscal) + ']');

    Writeln('Error mem. trabajo       := [' + (resp.ErrorMemoriaTrabajo) + ']');

    Writeln('Error parámetro          := [' + (resp.ErrorParametro) + ']');

    Writeln('Mem. fiscal casi llena   := [' +
      (resp.MemoriaFiscalCasiLlena) + ']');

    Writeln('Mem. fiscal inicializada := [' +
      (resp.MemoriaFiscalInicializada) + ']');

    Writeln('Mem. fiscal llena        := [' + (resp.MemoriaFiscalLlena) + ']'

      );
    Writeln('');
  Writeln('FIN DE LA CONSULTA !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Consulta último estado de la impresora.
// ====================================================================================================================

procedure CommandObtStImpr_Click;

var
  resp: EstadoImpresora;
begin
Writeln('');
  Writeln('CONSULTA ULTIMO ESTADO DE IMPRESORA:');
  Writeln('');

 Try
    resp := HASARNG.ObtenerUltimoEstadoImpresora;
    Writeln('Cajón abierto        := [' + (resp.CajonAbierto) + ']');

    Writeln('Error impresora      := [' + (resp.ErrorImpresora) + ']');

    Writeln('Falta papel testigo  := [' + (resp.FaltaPapelJournal) + ']');

    Writeln('Falta papel comprob. := [' + (resp.FaltaPapelReceipt) + ']');

    Writeln('Impresora ocupada    := [' + (resp.ImpresoraOcupada) + ']');

    Writeln('Impresora offline    := [' + (resp.ImpresoraOffLine) + ']');

    Writeln('Estado Or lógico     := [' + (resp.OrLogico) + ']');
    Writeln('Tapa abierta         := [' + (resp.TapaAbierta) + ']'

      );
    Writeln('');
  Writeln('FIN DE LA CONSULTA !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Impresión de Documento Patrón, según definición RG AFIP Nº 3561/13.
// ====================================================================================================================

procedure CommandPatron_Click;

var
  estilo: AtributosDeTexto;

  resp: RespuestaAbrirDocumento;
begin
Writeln('');
  Writeln('IMPRESION DE DOCUMENTO PATRON:');
  Writeln('');

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
    Writeln('');

    Writeln('(abrir); Doc. Patrón Nro. := [' + (resp.NumeroComprobante) + ']');
  Writeln('');
    resp := HASARNG.AbrirDocumento(TiqueFacturaA);

    Writeln('Tique Factura " A " Nº [' + (resp.NumeroComprobante) +
      ']... ABIERTO !');
  Writeln('');

  Writeln('');
  Writeln('DOCUMENTO PATRON IMPRESO !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
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

procedure CommandPRESUP_Click;

var
  respabrir: RespuestaAbrirDocumento;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    Writeln('');
  Writeln('IMPRIMIENDO - PRESUPUESTO " X " Clase " A ":');
  Writeln('');

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      ResponsableInscripto, TipoCUIT, 'Domicilio Cliente...',
      'Domicilio extensión 1...', 'Domicilio extensión 2...',
      'Domicilio extensión 3....');
    respabrir := HASARNG.AbrirDocumento(PresupuestoX);
  Writeln('');
    Writeln(' - (abrir);Presupuesto " X " Nro.  := [' +
      (respabrir.NumeroComprobante) + ']');
    Writeln('');

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);

    respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  Writeln('');
    Writeln(' - (cerrar);Presupuesto " X " Nro. := [' +
      (respcierre.NumeroComprobante) + ']');
    Writeln(' - Páginas                      := [' +
      (respcierre.CantidadDePaginas) + ']');
    Writeln('');
  Writeln('PRESUPUESTO " X " IMPRESO !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Establecer conexión con la impresora fiscal y consultar estado fiscal, y de impresora, actual.
// ====================================================================================================================

procedure CommandProtocolo_Click;

var
  stprn: EstadoImpresora;

  resp: RespuestaConsultarVersion;

begin
  Try
    Writeln('');
  Writeln('========================================');
  Writeln('VERIFICANDO CONEXION A IMPRESORA FISCAL:');
  Writeln('');
  Writeln('ETHERNET - Conectando a... 10.0.7.69');
  Writeln('ETHERNET - Conectando a... 127.0.0.1');
  Writeln('');
    HASARNG.Conectar('10.0.7.69');
    HASARNG.Conectar('127.0.0.1');
    Writeln('');
  Writeln('CONECTADO ! ...');

    CommandObtStImpr_Click;
    CommandObtStFiscal_Click;
  Writeln('');

    Writeln('OCX FISCAL HASAR NG versión := [' + (HASARNG.ObtenerVersion) + ']');
  Writeln('');
    CommandConsModvers_Click;
  Writeln('========================================');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Consultar rango de fechas, o números de cierres 'Z'.
// ====================================================================================================================

procedure CommandRangoZ_Click;

var
  resp1: RespuestaObtenerRangoFechasPorZetas;

  resp2: RespuestaObtenerRangoZetasPorFechas;

begin
  Try
    Writeln('');
  Writeln('CONSULTA RANGO NUMEROS DE CIERRES " Z ":');
  Writeln('');
  Writeln('Rango consultado: 01/01/2015 al 31/12/2015...');
  Writeln('');

    resp2 := HASARNG.ObtenerRangoZetasPorFechas('01/01/2014', '31/12/2015');
  Writeln('');
    Writeln('Nro. " Z " inicial  := [' + IntToStr(resp2.ZetaInicial) + ']');
  Writeln('Nro. " Z " final    := [' + IntToStr(resp2.ZetaFinal) + ']');
  Writeln('');

  Writeln('CONSULTA RANGO FECHAS DE CIERRES " Z ":');
  Writeln('');
  Writeln('Rango consultado: 1 al 4000...');
  Writeln('');

    resp1 := HASARNG.ObtenerRangoFechasPorZetas(1, 4000);
  Writeln('');
    Writeln('Fecha " Z " inicial := [' + (resp1.FechaInicial) + ']');
  Writeln('Fecha " Z " final   := [' + (resp1.FechaFinal) + ']'

      );
    Writeln('');
  Writeln('FIN DE LA CONSULTA !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Impresión de un Recibo X'.
// ====================================================================================================================

procedure CommandRBOX_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    Writeln('');
  Writeln('IMPRIMIENDO - RECIBO " X ":');
  Writeln('');

    HASARNG.CargarDocumentoAsociado(1, TiqueFacturaA, 2019, 1458);
    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      ResponsableInscripto, TipoCUIT, 'Domicilio Cliente...',
      'Domicilio extensión 1...', 'Domicilio extensión 2...',
      'Domicilio extensión 3....');
    respabrir := HASARNG.AbrirDocumento(ReciboX);
    Writeln('');

    Writeln(' - (abrir); Recibo " X " Nro. := [' +
      (respabrir.NumeroComprobante) + ']');
  Writeln('');

    HASARNG.ImprimirItem('Item a la venta...', 1, 3500, Gravado, 0,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    HASARNG.ImprimirConceptoRecibo('Alquiler mes de Marzo de 2015...');

    resppago := HASARNG.ImprimirPago('Efectivo...', 3500, Pagar, DisplayNo, '',
      Efectivo, '', '');
    Writeln('');
    Writeln(' - Pagando... Cambio       := [' + (resppago.Saldo) + ']');
  Writeln('');

    respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');
  Writeln('');
    Writeln(' - (cerrar);Recibo " X " Nro. := [' +
      (respcierre.NumeroComprobante) + ']');

    Writeln(' - Páginas                 := [' + (respcierre.CantidadDePaginas) +
      ']');
    Writeln('');
  Writeln('RECIBO " X " IMPRESO !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Se pide otro ejemplar del último comprobante emitido.
// ====================================================================================================================

procedure CommandReimpr_Click;

var
  resp: RespuestaPedirReimpresion;
begin
Writeln('');
  Writeln('REIMPRESION COMPROBANTE:');
  Writeln('');

 Try
    resp := HASARNG.PedirReimpresion;
  Writeln('');
  Writeln('Copia Nro. := [' + (resp.NumeroDeCopia) + ']');
  Writeln('');
  Writeln('FIN DE LA REIMPRESION !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Impresión de un Remito 'R'.
// ====================================================================================================================

procedure CommandRTOR_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    Writeln('');
  Writeln('IMPRIMIENDO - REMITO " R ":');
  Writeln('');

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      ResponsableInscripto, TipoCUIT, 'Domicilio Cliente...',
      'Domicilio extensión 1...', 'Domicilio extensión 2...',
      'Domicilio extensión 3....');
    HASARNG.CargarTransportista('Razón Social Transportista...', '12345678903',
      'Domicilio Transportista...', 'Nombre del Chofer...', TipoCI, '12345678',
      'ABC123', 'DEF456');
    HASARNG.CargarDocumentoAsociado(1, TiqueFacturaA, 2019, 1458);
    respabrir := HASARNG.AbrirDocumento(RemitoR);
  Writeln('');

    Writeln(' - (abrir); Remito " R " Nro. := [' +
      (respabrir.NumeroComprobante) + ']');
  Writeln('');

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    resppago := HASARNG.ImprimirPago('Efectivo...', 100, Pagar, DisplayNo, '',
      Efectivo, '', '');
    Writeln('');
    Writeln(' - Pagando... Cambio       := [' + (resppago.Saldo) + ']');
  Writeln('');

    respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  Writeln('');
    Writeln(' - (cerrar);Remito " R " Nro. := [' +
      (respcierre.NumeroComprobante) + ']');

    Writeln(' - Páginas                 := [' + (respcierre.CantidadDePaginas) +
      ']');
    Writeln('');
  Writeln('REMITO " R " IMPRESO !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Impresión de un Remito X'.
// ====================================================================================================================

procedure CommandRTOX_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    Writeln('');
  Writeln('IMPRIMIENDO - REMITO " X ":');
  Writeln('');

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      ResponsableInscripto, TipoCUIT, 'Domicilio Cliente...',
      'Domicilio extensión 1...', 'Domicilio extensión 2...',
      'Domicilio extensión 3....');
    HASARNG.CargarTransportista('Razón Social Transportista...', '12345678903',
      'Domicilio Transportista...', 'Nombre del Chofer...', TipoCI, '12345678',
      'ABC123', 'DEF456');
    HASARNG.CargarDocumentoAsociado(1, TiqueFacturaA, 2019, 1458);
    respabrir := HASARNG.AbrirDocumento(RemitoX);
  Writeln('');

    Writeln(' - (abrir); Remito " X " Nro.  := [' +
      (respabrir.NumeroComprobante) + ']');
  Writeln('');

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    resppago := HASARNG.ImprimirPago('Efectivo...', 100, Pagar, DisplayNo, '',
      Efectivo, '', '');
    Writeln('');
    Writeln(' - Pagando... Cambio        := [' + (resppago.Saldo) + ']');
  Writeln('');

    respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  Writeln('');
    Writeln(' - (cerrar); Remito " X " Nro. := [' +
      (respcierre.NumeroComprobante) + ']');

    Writeln(' - Páginas                  := [' + (respcierre.CantidadDePaginas) +
      ']');
    Writeln('');
  Writeln('CREMITO " X " IMPRESO !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Se abandona la aplicación.
// ====================================================================================================================

procedure CommandSalir_Click;
begin

Writeln('');
  Writeln('...Oh !.................................................');

  Writeln('...................CERRANDO PROGRAMA....................');

  Writeln('...............................................Chau !...');
Writeln('');

  exit; // End



end;

// ====================================================================================================================
// Consulta de subtotal.
// ====================================================================================================================

procedure CommandSubtot_Click;

var
  respsubt: RespuestaConsultarSubtotal;
begin
Writeln('');
  Writeln('CONSULTA SUBTOTAL:');
  Writeln('');

 Try
    respsubt := HASARNG.ConsultarSubtotal(NoImprimeSubtotal, DisplayNo);
  Writeln('');
    Writeln('Cant. Items    := [' + (respsubt.CantidadItems) + ']');
  Writeln('Subtotal       := [' + (respsubt.Subtotal) + ']');
  Writeln('Base imponible := [' + (respsubt.MontoBase) + ']');
  Writeln('IVA            := [' + (respsubt.MontoIVA) + ']');

    Writeln('Imp. Internos  := [' + (respsubt.MontoImpInternos) + ']');

    Writeln('Otros tributos := [' + (respsubt.MontoOtrosTributos) + ']');
  Writeln('Pagado         := [' + (respsubt.MontoPagado) + ']');
  Writeln('');
  Writeln('FIN DE LA CONSULTA !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Impresión de un Tique Factura 'A'.
// ====================================================================================================================

procedure CommandTFA_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    Writeln('');

    Writeln('IMPRIMIENDO - TIQUE FACTURA " A " /  A CON LEYENDA :');
  Writeln('');

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      ResponsableInscripto, TipoCUIT, 'Domicilio Cliente...',
      'Domicilio extensión 1...', 'Domicilio extensión 2...',
      'Domicilio extensión 3....');
    respabrir := HASARNG.AbrirDocumento(TiqueFacturaA);
  Writeln('');
    Writeln(' - (abrir); Tique Factura " A " Nro.  := [' +
      (respabrir.NumeroComprobante) + ']');
    Writeln('');

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0.00000001, DisplayNo,
      ModoPrecioBase, 1, '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioBase);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, '', '');
    Writeln('');

    Writeln(' - Pagando... Cambio               := [' + (resppago.Saldo) + ']');
  Writeln('');

    respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  Writeln('');
    Writeln(' - (cerrar); Tique Factura " A " Nro. := [' +
      (respcierre.NumeroComprobante) + ']');
    Writeln(' - Páginas                         := [' +
      (respcierre.CantidadDePaginas) + ']');
    Writeln('');
  Writeln('TIQUE FACTURA " A " IMPRESO !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Impresión de un Tique Factura 'B'.
// ====================================================================================================================

procedure CommandTFB_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    Writeln('');
  Writeln('IMPRIMIENDO - TIQUE FACTURA " B ":');
  Writeln('');

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
      'Domicilio extensión 2...', 'Domicilio extensión 3....');
    respabrir := HASARNG.AbrirDocumento(TiqueFacturaB);
  Writeln('');
    Writeln(' - (abrir); Tique Factura " B " Nro.  := [' +
      (respabrir.NumeroComprobante) + ']');
    Writeln('');

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0.00000001, DisplayNo,
      ModoPrecioBase, 1, '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioBase);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, '', '');
    Writeln('');

    Writeln(' - Pagando... Cambio               := [' + (resppago.Saldo) + ']');
  Writeln('');

    respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  Writeln('');
    Writeln(' - (cerrar); Tique Factura " B " Nro. := [' +
      (respcierre.NumeroComprobante) + ']');
    Writeln(' - Páginas                         := [' +
      (respcierre.CantidadDePaginas) + ']');
    Writeln('');
  Writeln('TIQUE FACTURA " B " IMPRESO !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Impresión de un Tique Factura 'C'.
// ====================================================================================================================

procedure CommandTFC_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    Writeln('');
  Writeln('IMPRIMIENDO - TIQUE FACTURA " C ":');
  Writeln('');

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
      'Domicilio extensión 2...', 'Domicilio extensión 3....');
    respabrir := HASARNG.AbrirDocumento(TiqueFacturaC);
  Writeln('');
    Writeln(' - (abrir); Tique Factura " C " Nro.  := [' +
      (respabrir.NumeroComprobante) + ']');
    Writeln('');

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, '', '');
    Writeln('');

    Writeln(' - Pagando... Cambio               := [' + (resppago.Saldo) + ']');
  Writeln('');

    respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  Writeln('');
    Writeln(' - (cerrar); Tique Factura " C " Nro. := [' +
      (respcierre.NumeroComprobante) + ']');
    Writeln(' - Páginas                         := [' +
      (respcierre.CantidadDePaginas) + ']');
    Writeln('');
  Writeln('TIQUE FACTURA " C "IMPRESO !...');
  Writeln('');

     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Impresión de un Tique Factura 'M'.
// ====================================================================================================================

procedure CommandTFM_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    Writeln('');
  Writeln('IMPRIMIENDO - TIQUE FACTURA " M ":');
  Writeln('');

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
      'Domicilio extensión 2...', 'Domicilio extensión 3....');
    respabrir := HASARNG.AbrirDocumento(TiqueFacturaM);
  Writeln('');
    Writeln(' - (abrir); Tique Factura " M " Nro.  := [' +
      (respabrir.NumeroComprobante) + ']');
    Writeln('');

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, '', '');
    Writeln('');

    Writeln(' - Pagando... Cambio               := [' + (resppago.Saldo) + ']');
  Writeln('');

    respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  Writeln('');
    Writeln(' - (cerrar); Tique Factura " M " Nro. := [' +
      (respcierre.NumeroComprobante) + ']');
    Writeln(' - Páginas                         := [' +
      (respcierre.CantidadDePaginas) + ']');
    Writeln('');
  Writeln('TIQUE FACTURA " M "IMPRESO !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Impresión de un Tique a Consumidor Final.
// ====================================================================================================================

procedure CommandTique_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    Writeln('');
  Writeln('IMPRIMIENDO - TIQUE A CONSUMIDOR FINAL:');
  Writeln('');

    respabrir := HASARNG.AbrirDocumento(Tique);
    Writeln('');

    Writeln(' - (abrir); Tique Cons. Final Nro.  := [' +
      (respabrir.NumeroComprobante) + ']');
    Writeln('');

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0.00000001, DisplayNo,
      ModoPrecioBase, 1, '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioBase);

    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, '', '');
    Writeln('');
    Writeln(' - Pagando... Cambio               := [' + (resppago.Saldo) + ']');
  Writeln('');

    respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  Writeln('');
    Writeln(' - (cerrar); Tique Cons. Final Nro. := [' +
      (respcierre.NumeroComprobante) + ']');
    Writeln(' - Páginas                         := [' +
      (respcierre.CantidadDePaginas) + ']');
    Writeln('');
  Writeln('TIQUE A CONSUMIDOR FINAL IMPRESO !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Impresión de un Tique Nota de Crédito a Consumidor Final.
// ====================================================================================================================

procedure CommandTiqueNC_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    Writeln('');

    Writeln('IMPRIMIENDO - TIQUE NOTA DE CREDITO A CONSUMIDOR FINAL:');
  Writeln('');

    respabrir := HASARNG.AbrirDocumento(TiqueNotaCredito);
  Writeln('');
    Writeln(' - (abrir); Tique Nota de Crédito a Cons. Final Nro.  := [' +
      (respabrir.NumeroComprobante) + ']');
    Writeln('');

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, '', '');
    Writeln('');

    Writeln(' - Pagando... Cambio                                 := [' +
      (resppago.Saldo) + ']');
    Writeln('');

    respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  Writeln('');
    Writeln(' - (cerrar); Tique Nota de Crédito a Cons. Final Nro. := [' +
      (respcierre.NumeroComprobante) + ']');

    Writeln(' - Páginas                                           := [' +
      (respcierre.CantidadDePaginas) + ']');
    Writeln('');

    Writeln('TIQUE NOTA DE CREDITO A CONSUMIDOR FINAL IMPRESO !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Impresión de un Tique Nota de Crédito 'A'.
// ====================================================================================================================

procedure CommandTNCA_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    Writeln('');

    Writeln('IMPRIMIENDO - TIQUE NOTA DE CREDITO " A " /  A CON LEYENDA :');
  Writeln('');

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      ResponsableInscripto, TipoCUIT, 'Domicilio Cliente...',
      'Domicilio extensión 1...', 'Domicilio extensión 2...',
      'Domicilio extensión 3....');
    respabrir := HASARNG.AbrirDocumento(TiqueNotaCreditoA);
  Writeln('');
    Writeln(' - (abrir); Tique Nota de Crédito " A " Nro.  := [' +
      (respabrir.NumeroComprobante) + ']');
    Writeln('');

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, '', '');
    Writeln('');

    Writeln(' - Pagando... Cambio                       := [' +
      (resppago.Saldo) + ']');
  Writeln('');

    respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  Writeln('');
    Writeln(' - (cerrar); Tique Nota de Crédito " A " Nro. := [' +
      (respcierre.NumeroComprobante) + ']');

    Writeln(' - Páginas                                 := [' +
      (respcierre.CantidadDePaginas) + ']');
    Writeln('');
  Writeln('TIQUE NOTA DE CREDITO " A " IMPRESO !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Impresión de un Tique Nota de Crédito 'B'.
// ====================================================================================================================

procedure CommandTNCB_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    Writeln('');
  Writeln('IMPRIMIENDO - TIQUE NOTA DE CREDITO " B ":');
  Writeln('');

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
      'Domicilio extensión 2...', 'Domicilio extensión 3....');
    respabrir := HASARNG.AbrirDocumento(TiqueNotaCreditoB);
  Writeln('');
    Writeln(' - (abrir); Tique Nota de Crédito " B " Nro.  := [' +
      (respabrir.NumeroComprobante) + ']');
    Writeln('');

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, '', '');
    Writeln('');

    Writeln(' - Pagando... Cambio                       := [' +
      (resppago.Saldo) + ']');
  Writeln('');

    respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  Writeln('');
    Writeln(' - (cerrar); Tique Nota de Crédito " B " Nro. := [' +
      (respcierre.NumeroComprobante) + ']');

    Writeln(' - Páginas                                 := [' +
      (respcierre.CantidadDePaginas) + ']');
    Writeln('');
  Writeln('TIQUE NOTA DE CREDITO " B " IMPRESO !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Impresión de un Tique Nota de Crédito 'C'.
// ====================================================================================================================

procedure CommandTNCC_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    Writeln('');
  Writeln('IMPRIMIENDO - TIQUE NOTA DE CREDITO " C ":');
  Writeln('');

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
      'Domicilio extensión 2...', 'Domicilio extensión 3....');
    respabrir := HASARNG.AbrirDocumento(TiqueNotaCreditoC);
  Writeln('');
    Writeln(' - (abrir); Tique Nota de Crédito " C " Nro.  := [' +
      (respabrir.NumeroComprobante) + ']');
    Writeln('');

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, '', '');
    Writeln('');

    Writeln(' - Pagando... Cambio                       := [' +
      (resppago.Saldo) + ']');
  Writeln('');

    respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  Writeln('');
    Writeln(' - (cerrar); Tique Nota de Crédito " C " Nro. := [' +
      (respcierre.NumeroComprobante) + ']');

    Writeln(' - Páginas                                 := [' +
      (respcierre.CantidadDePaginas) + ']');
    Writeln('');
  Writeln('TIQUE NOTA DE CREDITO " C " IMPRESO !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Impresión de un Tique Nota de Crédito 'M'.
// ====================================================================================================================

procedure CommandTNCM_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    Writeln('');
  Writeln('IMPRIMIENDO - TIQUE NOTA DE CREDITO " M ":');
  Writeln('');

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
      'Domicilio extensión 2...', 'Domicilio extensión 3....');
    respabrir := HASARNG.AbrirDocumento(TiqueNotaCreditoM);
  Writeln('');
    Writeln(' - (abrir); Tique Nota de Crédito " M " Nro.  := [' +
      (respabrir.NumeroComprobante) + ']');
    Writeln('');

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, '', '');
    Writeln('');

    Writeln(' - Pagando... Cambio                       := [' +
      (resppago.Saldo) + ']');
  Writeln('');

    respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  Writeln('');
    Writeln(' - (cerrar); Tique Nota de Crédito " M " Nro. := [' +
      (respcierre.NumeroComprobante) + ']');

    Writeln(' - Páginas                                 := [' +
      (respcierre.CantidadDePaginas) + ']');
    Writeln('');
  Writeln('TIQUE NOTA DE CREDITO " M " IMPRESO !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Impresión de un Tique Nota de Débito 'A'.
// ====================================================================================================================

procedure CommandTNDA_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    Writeln('');

    Writeln('IMPRIMIENDO - TIQUE NOTA DE DEBITO " A " /  A CON LEYENDA :');
  Writeln('');

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      ResponsableInscripto, TipoCUIT, 'Domicilio Cliente...',
      'Domicilio extensión 1...', 'Domicilio extensión 2...',
      'Domicilio extensión 3....');
    respabrir := HASARNG.AbrirDocumento(TiqueNotaDebitoA);
  Writeln('');
    Writeln(' - (abrir); Tique Nota de Débito " A " Nro.  := [' +
      (respabrir.NumeroComprobante) + ']');
    Writeln('');

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, '', '');
    Writeln('');

    Writeln(' - Pagando... Cambio                      := [' +
      (resppago.Saldo) + ']');
  Writeln('');

    respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  Writeln('');
    Writeln(' - (cerrar); Tique Nota de Débito " A " Nro. := [' +
      (respcierre.NumeroComprobante) + ']');

    Writeln(' - Páginas                                := [' +
      (respcierre.CantidadDePaginas) + ']');
    Writeln('');
  Writeln('TIQUE NOTA DE DEBITO " A " IMPRESO !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Impresión de un Tique Nota de Débito 'B'.
// ====================================================================================================================

procedure CommandTNDB_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    Writeln('');
  Writeln('IMPRIMIENDO - TIQUE NOTA DE DEBITO " B ":');
  Writeln('');

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
      'Domicilio extensión 2...', 'Domicilio extensión 3....');
    respabrir := HASARNG.AbrirDocumento(TiqueNotaDebitoB);
  Writeln('');
    Writeln(' - (abrir); Tique Nota de Débito " B " Nro.  := [' +
      (respabrir.NumeroComprobante) + ']');
    Writeln('');

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, '', '');
    Writeln('');

    Writeln(' - Pagando... Cambio                      := [' +
      (resppago.Saldo) + ']');
  Writeln('');

    respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  Writeln('');
    Writeln(' - (cerrar); Tique Nota de Débito " B " Nro. := [' +
      (respcierre.NumeroComprobante) + ']');

    Writeln(' - Páginas                                := [' +
      (respcierre.CantidadDePaginas) + ']');
    Writeln('');
  Writeln('TIQUE NOTA DE DEBITO " B " IMPRESO !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Impresión de un Tique Nota de Débito 'C'.
// ====================================================================================================================

procedure CommandTNDC_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    Writeln('');
  Writeln('IMPRIMIENDO - TIQUE NOTA DE DEBITO " C ":');
  Writeln('');

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
      'Domicilio extensión 2...', 'Domicilio extensión 3....');
    respabrir := HASARNG.AbrirDocumento(NotaDeDebitoC);
  Writeln('');
    Writeln(' - (abrir); Tique Nota de Débtio " C " Nro.  := [' +
      (respabrir.NumeroComprobante) + ']');
    Writeln('');

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, '', '');
    Writeln('');

    Writeln(' - Pagando... Cambio                      := [' +
      (resppago.Saldo) + ']');
  Writeln('');

    respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  Writeln('');
    Writeln(' - (cerrar); Tique Nota de Débtio " C " Nro. := [' +
      (respcierre.NumeroComprobante) + ']');

    Writeln(' - Páginas                                := [' +
      (respcierre.CantidadDePaginas) + ']');
    Writeln('');
  Writeln('TIQUE NOTA DE DEBITO " C " IMPRESO !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Impresión de un Tique Nota de Débito 'M'.
// ====================================================================================================================

procedure CommandTNDM_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    Writeln('');
  Writeln('IMPRIMIENDO - TIQUE NOTA DE DEBITO " M ":');
  Writeln('');

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
      'Domicilio extensión 2...', 'Domicilio extensión 3....');
    respabrir := HASARNG.AbrirDocumento(NotaDeDebitoM);
  Writeln('');
    Writeln(' - (abrir); Tique Nota de Débito " M " Nro.  := [' +
      (respabrir.NumeroComprobante) + ']');
    Writeln('');

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, '', '');
    Writeln('');

    Writeln(' - Pagando... Cambio                      := [' +
      (resppago.Saldo) + ']');
  Writeln('');

    respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  Writeln('');
    Writeln(' - (cerrar); Tique Nota de Débito " M " Nro. := [' +
      (respcierre.NumeroComprobante) + ']');

    Writeln(' - Páginas                                := [' +
      (respcierre.CantidadDePaginas) + ']');
    Writeln('');
  Writeln('TIQUE NOTA DE DEBITO " M " IMPRESO !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Impresión de un Tique Recibo 'A'.
// ====================================================================================================================

procedure CommandTRA_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    Writeln('');

    Writeln('IMPRIMIENDO - TIQUE RECIBO " A " /  A CON LEYENDA :');
  Writeln('');

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      ResponsableInscripto, TipoCUIT, 'Domicilio Cliente...',
      'Domicilio extensión 1...', 'Domicilio extensión 2...',
      'Domicilio extensión 3....');
    respabrir := HASARNG.AbrirDocumento(ReciboA);
    Writeln('');

    Writeln(' - (abrir); Tique Recibo " A " Nro.  := [' +
      (respabrir.NumeroComprobante) + ']');
    Writeln('');

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, '', '');
    Writeln('');

    Writeln('Pagando... Cambio                 := [' + (resppago.Saldo) + ']');
  Writeln('');

    respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  Writeln('');
    Writeln(' - (cerrar); Tique Recibo " A " Nro. := [' +
      (respcierre.NumeroComprobante) + ']');
    Writeln(' - Páginas                        := [' +
      (respcierre.CantidadDePaginas) + ']');
    Writeln('');
  Writeln('TIQUE RECIBO " A " IMPRESO !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Impresión de un Tique Recibo 'B'.
// ====================================================================================================================

procedure CommandTRB_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    Writeln('');
  Writeln('IMPRIMIENDO - TIQUE RECIBO " B ":');
  Writeln('');

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
      'Domicilio extensión 2...', 'Domicilio extensión 3....');
    respabrir := HASARNG.AbrirDocumento(ReciboB);
    Writeln('');

    Writeln(' - (abrir); Tique Recibo " B " Nro.  := [' +
      (respabrir.NumeroComprobante) + ']');
    Writeln('');

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, '', '');
    Writeln('');

    Writeln(' - Pagando... Cambio              := [' + (resppago.Saldo) + ']');
  Writeln('');

    respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  Writeln('');
    Writeln(' - (cerrar); Tique Recibo " B " Nro. := [' +
      (respcierre.NumeroComprobante) + ']');
    Writeln(' - Páginas                        := [' +
      (respcierre.CantidadDePaginas) + ']');
    Writeln('');
  Writeln('TIQUE RECIBO " B " IMPRESO !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Impresión de un Tique Recibo 'C'.
// ====================================================================================================================

procedure CommandTRC_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    Writeln('');
  Writeln('IMPRIMIENDO - TIQUE RECIBO " C ":');
  Writeln('');

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
      'Domicilio extensión 2...', 'Domicilio extensión 3....');
    respabrir := HASARNG.AbrirDocumento(ReciboC);
    Writeln(' - (abrir); Tique Recibo " C " Nro.  := [' +
      (respabrir.NumeroComprobante) + ']');

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, '', '');
    Writeln('');

    Writeln(' - Pagando... Cambio              := [' + (resppago.Saldo) + ']');
  Writeln('');

    respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  Writeln('');
    Writeln(' - (cerrar); Tique Recibo " C " Nro. := [' +
      (respcierre.NumeroComprobante) + ']');
    Writeln(' - Páginas                        := [' +
      (respcierre.CantidadDePaginas) + ']');
    Writeln('');
  Writeln('TIQUE RECIBO " C " IMPRESO !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Impresión de un Tique Recibo 'M'.
// ====================================================================================================================

procedure CommandTRM_Click;

var
  respabrir: RespuestaAbrirDocumento;

  resppago: RespuestaImprimirPago;

  estilo: AtributosDeTexto;

  respcierre: RespuestaCerrarDocumento;

begin
  Try
    Writeln('');
  Writeln('IMPRIMIENDO - TIQUE RECIBO " M ":');
  Writeln('');

    HASARNG.CargarDatosCliente('Razón Social Cliente...', '99999999995',
      Monotributo, TipoCUIT, 'Domicilio Cliente...', 'Domicilio extensión 1...',
      'Domicilio extensión 2...', 'Domicilio extensión 3....');
    respabrir := HASARNG.AbrirDocumento(ReciboM);
    Writeln('');

    Writeln(' - (abrir); Tique Recibo " M " Nro.  := [' +
      (respabrir.NumeroComprobante) + ']');
    Writeln('');

    estilo.Negrita := True;
    HASARNG.ImprimirTextoFiscal(estilo, 'Hasta agotar stock...', DisplayNo);
    HASARNG.ImprimirItem('Item a la venta...', 1, 100, Gravado, 21,
      ModoSumaMonto, IIVariablePorcentual, 0, DisplayNo, ModoPrecioTotal, 1,
      '779123456789', '', Unidad);
    HASARNG.ImprimirDescuentoItem('Oferta 10%...', 10, DisplayNo,
      ModoPrecioTotal);
    resppago := HASARNG.ImprimirPago('Efectivo...', 90, Pagar, DisplayNo, '',
      Efectivo, '', '');
    Writeln('');

    Writeln(' - Pagando... Cambio              := [' + (resppago.Saldo) + ']');
  Writeln('');

    respcierre := HASARNG.CerrarDocumento('', 'hasarventas@hasar.com');

  Writeln('');
    Writeln(' - (cerrar); Tique Recibo " M " Nro. := [' +
      (respcierre.NumeroComprobante) + ']');
    Writeln(' - Páginas                        := [' +
      (respcierre.CantidadDePaginas) + ']');
    Writeln('');
  Writeln('TIQUE RECIBO " M " IMPRESO !...');
  Writeln('');



     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
  end;


end;

// ====================================================================================================================
// Se consulta el número de la 'Z' establecida como límite para el borrado de la CTD (Cinta testigo Digital); .
// ====================================================================================================================

procedure CommandZBorr_Click;

var
  resp: RespuestaConsultarZetaBorrable;
begin
Writeln('');
  Writeln('CONSULTA LIMITE BORRADO CIERRES " Z ":');
  Writeln('');

 Try
    resp := HASARNG.ConsultarZetaBorrable;
  Writeln('');

    Writeln('Límite Cierre " Z " Nro. := [' + (resp.NumeroZeta) + ']');
  Writeln('');
  Writeln('FIN DE LA CONSULTA !...');
  Writeln('');

     except
    on E: Exception do
    Writeln('Error := ' +( E.ClassName + ' : ' +( E.Message)));
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
    Writeln('Comando en proceso...');
    // proc := True;

  end;


end;

// ====================================================================================================================
// Fin de procesamiento del comando enviado.
// ====================================================================================================================

procedure HASARNG_ComandoProcesado;
begin

Writeln('Comando procesado !');
   //proc := False;

end;

// ====================================================================================================================
// Procesamiento del evento impresora.
// ====================================================================================================================

procedure HASARNG_EventoImpresora(Estado: HasarArgentina_TLB.EstadoImpresora);
begin

 Writeln('Evento impresora...');
 Writeln('Estado := [' + (Estado) + ']');

end;

end.

