unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, HasarUnit, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    LeftPanel: TPanel;
    Descargas: TGroupBox;
    ObtRepLog: TButton;
    ObtRepDoc: TButton;
    ObtRepAudit: TButton;
    ObtRepElectr: TButton;
    Miscel: TGroupBox;
    Reimpr: TButton;
    DocxMail: TButton;
    BorrarLogo: TButton;
    CopiarDoc: TButton;
    CargaLogo: TButton;
    AvanzPap: TButton;
    AbrirCaj: TButton;
    Emisor: TGroupBox;
    ModifIIBB: TButton;
    ModifIniActiv: TButton;
    ModifCateg: TButton;
    CFG: TGroupBox;
    CfgBaudios: TButton;
    CFgZona: TButton;
    CfgZBorr: TButton;
    CfgServCorreo: TButton;
    CfgRed: TButton;
    CfgImprFis: TButton;
    CfgFyh: TButton;
    RightPanel: TPanel;
    CenterPanel: TPanel;
    DNFH: TGroupBox;
    Generico: TButton;
    PRESUP: TButton;
    DONA: TButton;
    RBOX: TButton;
    RTOX: TButton;
    RTOR: TButton;
    DF: TGroupBox;
    Patron: TButton;
    TiqueNC: TButton;
    Tique: TButton;
    TRM: TButton;
    TRC: TButton;
    TRB: TButton;
    TRA: TButton;
    TNCM: TButton;
    NCC: TButton;
    TNCB: TButton;
    TNCA: TButton;
    TNDM: TButton;
    TNDC: TButton;
    TNDB: TButton;
    TNDA: TButton;
    TFM: TButton;
    TFC: TButton;
    TFB: TButton;
    TFA: TButton;
    AcumCierres: TGroupBox;
    Audit: TButton;
    CierreZ: TButton;
    Equis: TButton;
    ConsCierreZ: TButton;
    ConsAcumMemoria: TButton;
    ConsAcumComprob: TButton;
    Consultas: TGroupBox;
    RangoZ: TButton;
    ObtStImpr: TButton;
    ObtStFiscal: TButton;
    ConsZona: TButton;
    ZBorr: TButton;
    ConsModvers: TButton;
    ConsError: TButton;
    Subtot: TButton;
    FechaHora: TButton;
    ConsEstado: TButton;
    ConsDocAsoc: TButton;
    ConsCorreo: TButton;
    ConsZetas: TButton;
    Capac: TButton;
    DatosIni: TButton;
    ConsCfgRed: TButton;
    Protocolos: TGroupBox;
    Salir: TButton;
    Protocolo: TButton;
    Cancel: TButton;
    Label1: TLabel;
    procedure CargaLogoClick(Sender: TObject);
    procedure AvanzPapClick(Sender: TObject);
    procedure CopiarDocClick(Sender: TObject);
    procedure AbrirCajClick(Sender: TObject);
    procedure BorrarLogoClick(Sender: TObject);
    procedure DocxMailClick(Sender: TObject);
    procedure ReimprClick(Sender: TObject);
    procedure ModifIniActivClick(Sender: TObject);
    procedure ModifCategClick(Sender: TObject);
    procedure ModifIIBBClick(Sender: TObject);
    procedure CfgRedClick(Sender: TObject);
    procedure CfgServCorreoClick(Sender: TObject);
    procedure CfgImprFisClick(Sender: TObject);
    procedure CfgZBorrClick(Sender: TObject);
    procedure CfgFyhClick(Sender: TObject);
    procedure CFgZonaClick(Sender: TObject);
    procedure CfgBaudiosClick(Sender: TObject);
    procedure ObtRepAuditClick(Sender: TObject);
    procedure ObtRepElectrClick(Sender: TObject);
    procedure ObtRepDocClick(Sender: TObject);
    procedure ObtRepLogClick(Sender: TObject);
    procedure RBOXClick(Sender: TObject);
    procedure DONAClick(Sender: TObject);
    procedure RTOXClick(Sender: TObject);
    procedure PRESUPClick(Sender: TObject);
    procedure RTORClick(Sender: TObject);
    procedure GenericoClick(Sender: TObject);
    procedure TNCAClick(Sender: TObject);
    procedure TNCBClick(Sender: TObject);
    procedure TNDMClick(Sender: TObject);
    procedure NCCClick(Sender: TObject);
    procedure TNDCClick(Sender: TObject);
    procedure TNCMClick(Sender: TObject);
    procedure TNDBClick(Sender: TObject);
    procedure TRAClick(Sender: TObject);
    procedure TRBClick(Sender: TObject);
    procedure TNDAClick(Sender: TObject);
    procedure TRCClick(Sender: TObject);
    procedure TFMClick(Sender: TObject);
    procedure TRMClick(Sender: TObject);
    procedure TFCClick(Sender: TObject);
    procedure TiqueClick(Sender: TObject);
    procedure TFBClick(Sender: TObject);
    procedure TiqueNCClick(Sender: TObject);
    procedure TFAClick(Sender: TObject);
    procedure PatronClick(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure RangoZClick(Sender: TObject);
    procedure FechaHoraClick(Sender: TObject);
    procedure EquisClick(Sender: TObject);
    procedure SalirClick(Sender: TObject);
    procedure ProtocoloClick(Sender: TObject);
    procedure ConsAcumMemoriaClick(Sender: TObject);
    procedure ConsCierreZClick(Sender: TObject);
    procedure ConsAcumComprobClick(Sender: TObject);
    procedure CierreZClick(Sender: TObject);
    procedure AuditClick(Sender: TObject);
    procedure SubtotClick(Sender: TObject);
    procedure ConsEstadoClick(Sender: TObject);
    procedure ConsErrorClick(Sender: TObject);
    procedure ConsDocAsocClick(Sender: TObject);
    procedure ConsModversClick(Sender: TObject);
    procedure ConsCorreoClick(Sender: TObject);
    procedure ZBorrClick(Sender: TObject);
    procedure ConsZetasClick(Sender: TObject);
    procedure ConsZonaClick(Sender: TObject);
    procedure CapacClick(Sender: TObject);
    procedure ObtStFiscalClick(Sender: TObject);
    procedure DatosIniClick(Sender: TObject);
    procedure ObtStImprClick(Sender: TObject);
    procedure ConsCfgRedClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.AbrirCajClick(Sender: TObject);
begin
CommandAbrirCaj_Click;
end;

procedure TForm1.AuditClick(Sender: TObject);
begin
CommandAudit_Click;
end;

procedure TForm1.AvanzPapClick(Sender: TObject);
begin
CommandAvanzPap_Click;
end;

procedure TForm1.BorrarLogoClick(Sender: TObject);
begin
 CommandBorrarLogo_Click;
end;

procedure TForm1.CancelClick(Sender: TObject);
begin
 CommandCancel_Click;
end;

procedure TForm1.CapacClick(Sender: TObject);
begin
 CommandCapac_Click;
end;

procedure TForm1.CargaLogoClick(Sender: TObject);
begin
 CommandCargaLogo_Click;
end;

procedure TForm1.CfgBaudiosClick(Sender: TObject);
begin
CommandCfgBaudios_Click;
end;

procedure TForm1.CfgFyhClick(Sender: TObject);
begin
CommandCfgFyh_Click;
end;

procedure TForm1.CfgImprFisClick(Sender: TObject);
begin
CommandCfgImprFis_Click;
end;

procedure TForm1.CfgRedClick(Sender: TObject);
begin
CommandCfgRed_Click;
end;

procedure TForm1.CfgServCorreoClick(Sender: TObject);
begin
CommandCfgServCorreo_Click;
end;

procedure TForm1.CfgZBorrClick(Sender: TObject);
begin
CommandCfgZBorr_Click;
end;

procedure TForm1.CFgZonaClick(Sender: TObject);
begin
CommandCFgZona_Click;
end;

procedure TForm1.CierreZClick(Sender: TObject);
begin
CommandCierreZ_Click;
end;

procedure TForm1.ConsAcumComprobClick(Sender: TObject);
begin
CommandConsAcumComprob_Click;
end;

procedure TForm1.ConsAcumMemoriaClick(Sender: TObject);
begin
CommandConsAcumMemoria_Click;
end;

procedure TForm1.ConsCfgRedClick(Sender: TObject);
begin
CommandConsCfgRed_Click;
end;

procedure TForm1.ConsCierreZClick(Sender: TObject);
begin
CommandConsCierreZ_Click;
end;

procedure TForm1.ConsCorreoClick(Sender: TObject);
begin
CommandConsCorreo_Click;
end;

procedure TForm1.ConsDocAsocClick(Sender: TObject);
begin
CommandConsDocAsoc_Click;
end;

procedure TForm1.ConsErrorClick(Sender: TObject);
begin
CommandConsError_Click;
end;

procedure TForm1.ConsEstadoClick(Sender: TObject);
begin
CommandConsEstado_Click;
end;

procedure TForm1.ConsModversClick(Sender: TObject);
begin
CommandConsModvers_Click;
end;

procedure TForm1.ConsZetasClick(Sender: TObject);
begin
CommandConsZetas_Click;
end;

procedure TForm1.ConsZonaClick(Sender: TObject);
begin
CommandConsZona_Click;
end;

procedure TForm1.CopiarDocClick(Sender: TObject);
begin
CommandCopiarDoc_Click;
end;

procedure TForm1.DatosIniClick(Sender: TObject);
begin
CommandDatosIni_Click;
end;

procedure TForm1.DocxMailClick(Sender: TObject);
begin
CommandDocxMail_Click;
end;

procedure TForm1.DONAClick(Sender: TObject);
begin
CommandDONA_Click;
end;

procedure TForm1.EquisClick(Sender: TObject);
begin
 CommandEquis_Click;
end;

procedure TForm1.FechaHoraClick(Sender: TObject);
begin
 CommandFechaHora_Click;
end;

procedure TForm1.GenericoClick(Sender: TObject);
begin
 CommandGenerico_Click;
end;

procedure TForm1.ModifCategClick(Sender: TObject);
begin
CommandModifCateg_Click;
end;

procedure TForm1.ModifIIBBClick(Sender: TObject);
begin
CommandModifIIBB_Click;
end;

procedure TForm1.ModifIniActivClick(Sender: TObject);
begin
CommandModifIniActiv_Click;
end;

procedure TForm1.NCCClick(Sender: TObject);
begin
//CommandNCC_Click;
end;

procedure TForm1.ObtRepAuditClick(Sender: TObject);
begin
CommandObtRepAudit_Click;
end;

procedure TForm1.ObtRepDocClick(Sender: TObject);
begin
CommandObtRepDoc_Click;
end;

procedure TForm1.ObtRepElectrClick(Sender: TObject);
begin
CommandObtRepElectr_Click;
end;

procedure TForm1.ObtRepLogClick(Sender: TObject);
begin
CommandObtRepLog_Click;
end;

procedure TForm1.ObtStFiscalClick(Sender: TObject);
begin
CommandObtStFiscal_Click;
end;

procedure TForm1.ObtStImprClick(Sender: TObject);
begin
CommandObtStImpr_Click;
end;

procedure TForm1.PatronClick(Sender: TObject);
begin
CommandPatron_Click;
end;

procedure TForm1.PRESUPClick(Sender: TObject);
begin
CommandPRESUP_Click;
end;

procedure TForm1.ProtocoloClick(Sender: TObject);
begin
CommandProtocolo_Click;
end;

procedure TForm1.RangoZClick(Sender: TObject);
begin
CommandRangoZ_Click;
end;

procedure TForm1.RBOXClick(Sender: TObject);
begin
CommandRBOX_Click;
end;

procedure TForm1.ReimprClick(Sender: TObject);
begin
CommandReimpr_Click;
end;

procedure TForm1.RTORClick(Sender: TObject);
begin
CommandRTOR_Click;
end;

procedure TForm1.RTOXClick(Sender: TObject);
begin
CommandRTOX_Click;
end;

procedure TForm1.SalirClick(Sender: TObject);
begin
CommandSalir_Click;
end;

procedure TForm1.SubtotClick(Sender: TObject);
begin
CommandSubtot_Click;
end;

procedure TForm1.TFAClick(Sender: TObject);
begin
CommandTFA_Click;
end;

procedure TForm1.TFBClick(Sender: TObject);
begin
CommandTFB_Click;
end;

procedure TForm1.TFCClick(Sender: TObject);
begin
CommandTFC_Click;
end;

procedure TForm1.TFMClick(Sender: TObject);
begin
CommandTFM_Click;
end;

procedure TForm1.TiqueClick(Sender: TObject);
begin
CommandTique_Click;
end;

procedure TForm1.TiqueNCClick(Sender: TObject);
begin
CommandTiqueNC_Click;
end;

procedure TForm1.TNCAClick(Sender: TObject);
begin
CommandTNCA_Click;
end;

procedure TForm1.TNCBClick(Sender: TObject);
begin
CommandTNCB_Click;
end;

procedure TForm1.TNCMClick(Sender: TObject);
begin
CommandTNCM_Click;
end;

procedure TForm1.TNDAClick(Sender: TObject);
begin
CommandTNDA_Click;
end;

procedure TForm1.TNDBClick(Sender: TObject);
begin
CommandTNDB_Click;
end;

procedure TForm1.TNDCClick(Sender: TObject);
begin
CommandTNDC_Click;
end;

procedure TForm1.TNDMClick(Sender: TObject);
begin
CommandTNDM_Click;
end;

procedure TForm1.TRAClick(Sender: TObject);
begin
CommandTRA_Click;
end;

procedure TForm1.TRBClick(Sender: TObject);
begin
CommandTRB_Click;
end;

procedure TForm1.TRCClick(Sender: TObject);
begin
CommandTRC_Click;
end;

procedure TForm1.TRMClick(Sender: TObject);
begin
CommandTRM_Click;
end;

procedure TForm1.ZBorrClick(Sender: TObject);
begin
CommandZBorr_Click;
end;

end.
