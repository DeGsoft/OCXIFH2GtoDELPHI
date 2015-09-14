unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, HasarUnit;

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
dm.CommandAbrirCaj_Click;
end;

procedure TForm1.AuditClick(Sender: TObject);
begin
dm.CommandAudit_Click;
end;

procedure TForm1.AvanzPapClick(Sender: TObject);
begin
dm.CommandAvanzPap_Click;
end;

procedure TForm1.BorrarLogoClick(Sender: TObject);
begin
 dm.CommandBorrarLogo_Click;
end;

procedure TForm1.CancelClick(Sender: TObject);
begin
 dm.CommandCancel_Click;
end;

procedure TForm1.CapacClick(Sender: TObject);
begin
 dm.CommandCapac_Click;
end;

procedure TForm1.CargaLogoClick(Sender: TObject);
begin
 dm.CommandCargaLogo_Click;
end;

procedure TForm1.CfgBaudiosClick(Sender: TObject);
begin
dm.CommandCfgBaudios_Click;
end;

procedure TForm1.CfgFyhClick(Sender: TObject);
begin
dm.CommandCfgFyh_Click;
end;

procedure TForm1.CfgImprFisClick(Sender: TObject);
begin
dm.CommandCfgImprFis_Click;
end;

procedure TForm1.CfgRedClick(Sender: TObject);
begin
dm.CommandCfgRed_Click;
end;

procedure TForm1.CfgServCorreoClick(Sender: TObject);
begin
dm.CommandCfgServCorreo_Click;
end;

procedure TForm1.CfgZBorrClick(Sender: TObject);
begin
dm.CommandCfgZBorr_Click;
end;

procedure TForm1.CFgZonaClick(Sender: TObject);
begin
dm.CommandCFgZona_Click;
end;

procedure TForm1.CierreZClick(Sender: TObject);
begin
dm.CommandCierreZ_Click;
end;

procedure TForm1.ConsAcumComprobClick(Sender: TObject);
begin
dm.CommandConsAcumComprob_Click;
end;

procedure TForm1.ConsAcumMemoriaClick(Sender: TObject);
begin
dm.CommandConsAcumMemoria_Click;
end;

procedure TForm1.ConsCfgRedClick(Sender: TObject);
begin
dm.CommandConsCfgRed_Click;
end;

procedure TForm1.ConsCierreZClick(Sender: TObject);
begin
dm.CommandConsCierreZ_Click;
end;

procedure TForm1.ConsCorreoClick(Sender: TObject);
begin
dm.CommandConsCorreo_Click;
end;

procedure TForm1.ConsDocAsocClick(Sender: TObject);
begin
dm.CommandConsDocAsoc_Click;
end;

procedure TForm1.ConsErrorClick(Sender: TObject);
begin
dm.CommandConsError_Click;
end;

procedure TForm1.ConsEstadoClick(Sender: TObject);
begin
dm.CommandConsEstado_Click;
end;

procedure TForm1.ConsModversClick(Sender: TObject);
begin
dm.CommandConsModvers_Click;
end;

procedure TForm1.ConsZetasClick(Sender: TObject);
begin
dm.CommandConsZetas_Click;
end;

procedure TForm1.ConsZonaClick(Sender: TObject);
begin
dm.CommandConsZona_Click;
end;

procedure TForm1.CopiarDocClick(Sender: TObject);
begin
dm.CommandCopiarDoc_Click;
end;

procedure TForm1.DatosIniClick(Sender: TObject);
begin
dm.CommandDatosIni_Click;
end;

procedure TForm1.DocxMailClick(Sender: TObject);
begin
dm.CommandDocxMail_Click;
end;

procedure TForm1.DONAClick(Sender: TObject);
begin
dm.CommandDONA_Click;
end;

procedure TForm1.EquisClick(Sender: TObject);
begin
 dm.CommandEquis_Click;
end;

procedure TForm1.FechaHoraClick(Sender: TObject);
begin
dm.CommandFechaHora_Click;
end;

procedure TForm1.GenericoClick(Sender: TObject);
begin
 dm.CommandGenerico_Click;
end;

procedure TForm1.ModifCategClick(Sender: TObject);
begin
dm.CommandModifCateg_Click;
end;

procedure TForm1.ModifIIBBClick(Sender: TObject);
begin
dm.CommandModifIIBB_Click;
end;

procedure TForm1.ModifIniActivClick(Sender: TObject);
begin
dm.CommandModifIniActiv_Click;
end;

procedure TForm1.NCCClick(Sender: TObject);
begin
//dm.CommandNCC_Click;
end;

procedure TForm1.ObtRepAuditClick(Sender: TObject);
begin
dm.CommandObtRepAudit_Click;
end;

procedure TForm1.ObtRepDocClick(Sender: TObject);
begin
dm.CommandObtRepDoc_Click;
end;

procedure TForm1.ObtRepElectrClick(Sender: TObject);
begin
dm.CommandObtRepElectr_Click;
end;

procedure TForm1.ObtRepLogClick(Sender: TObject);
begin
dm.CommandObtRepLog_Click;
end;

procedure TForm1.ObtStFiscalClick(Sender: TObject);
begin
dm.CommandObtStFiscal_Click;
end;

procedure TForm1.ObtStImprClick(Sender: TObject);
begin
dm.CommandObtStImpr_Click;
end;

procedure TForm1.PatronClick(Sender: TObject);
begin
dm.CommandPatron_Click;
end;

procedure TForm1.PRESUPClick(Sender: TObject);
begin
dm.CommandPRESUP_Click;
end;

procedure TForm1.ProtocoloClick(Sender: TObject);
begin
dm.CommandProtocolo_Click;
end;

procedure TForm1.RangoZClick(Sender: TObject);
begin
dm.CommandRangoZ_Click;
end;

procedure TForm1.RBOXClick(Sender: TObject);
begin
dm.CommandRBOX_Click;
end;

procedure TForm1.ReimprClick(Sender: TObject);
begin
dm.CommandReimpr_Click;
end;

procedure TForm1.RTORClick(Sender: TObject);
begin
dm.CommandRTOR_Click;
end;

procedure TForm1.RTOXClick(Sender: TObject);
begin
dm.CommandRTOX_Click;
end;

procedure TForm1.SalirClick(Sender: TObject);
begin
dm.CommandSalir_Click;
end;

procedure TForm1.SubtotClick(Sender: TObject);
begin
dm.CommandSubtot_Click;
end;

procedure TForm1.TFAClick(Sender: TObject);
begin
dm.CommandTFA_Click;
end;

procedure TForm1.TFBClick(Sender: TObject);
begin
dm.CommandTFB_Click;
end;

procedure TForm1.TFCClick(Sender: TObject);
begin
dm.CommandTFC_Click;
end;

procedure TForm1.TFMClick(Sender: TObject);
begin
dm.CommandTFM_Click;
end;

procedure TForm1.TiqueClick(Sender: TObject);
begin
dm.CommandTique_Click;
end;

procedure TForm1.TiqueNCClick(Sender: TObject);
begin
dm.CommandTiqueNC_Click;
end;

procedure TForm1.TNCAClick(Sender: TObject);
begin
dm.CommandTNCA_Click;
end;

procedure TForm1.TNCBClick(Sender: TObject);
begin
dm.CommandTNCB_Click;
end;

procedure TForm1.TNCMClick(Sender: TObject);
begin
dm.CommandTNCM_Click;
end;

procedure TForm1.TNDAClick(Sender: TObject);
begin
dm.CommandTNDA_Click;
end;

procedure TForm1.TNDBClick(Sender: TObject);
begin
dm.CommandTNDB_Click;
end;

procedure TForm1.TNDCClick(Sender: TObject);
begin
dm.CommandTNDC_Click;
end;

procedure TForm1.TNDMClick(Sender: TObject);
begin
dm.CommandTNDM_Click;
end;

procedure TForm1.TRAClick(Sender: TObject);
begin
dm.CommandTRA_Click;
end;

procedure TForm1.TRBClick(Sender: TObject);
begin
dm.CommandTRB_Click;
end;

procedure TForm1.TRCClick(Sender: TObject);
begin
dm.CommandTRC_Click;
end;

procedure TForm1.TRMClick(Sender: TObject);
begin
dm.CommandTRM_Click;
end;

procedure TForm1.ZBorrClick(Sender: TObject);
begin
dm.CommandZBorr_Click;
end;

end.
