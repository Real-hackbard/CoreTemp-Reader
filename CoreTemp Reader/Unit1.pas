unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  CoreTempInfo, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, WinApi.TlHelp32,
  System.Win.Registry, Winapi.ActiveX, System.Win.ComObj, Vcl.Buttons,
  System.ImageList, Vcl.ImgList, System.IniFiles, WinApi.ShellAPI,
  Winapi.ShlObj;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Panel9: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label32: TLabel;
    Label105: TLabel;
    ProgressBar1: TProgressBar;
    Panel1: TPanel;
    ProgressBar2: TProgressBar;
    Panel2: TPanel;
    ProgressBar3: TProgressBar;
    Panel3: TPanel;
    ProgressBar4: TProgressBar;
    ProgressBar5: TProgressBar;
    Panel4: TPanel;
    Panel5: TPanel;
    ProgressBar6: TProgressBar;
    Panel6: TPanel;
    ProgressBar7: TProgressBar;
    Panel7: TPanel;
    ProgressBar8: TProgressBar;
    Panel8: TPanel;
    StatusBar1: TStatusBar;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    ComboBox1: TComboBox;
    Label100: TLabel;
    ComboBox2: TComboBox;
    Label101: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label23: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label103: TLabel;
    ScrollBar1: TScrollBar;
    Label104: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    ComboBox3: TComboBox;
    Label102: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label51: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label26: TLabel;
    Label25: TLabel;
    Label24: TLabel;
    Label33: TLabel;
    BitBtn1: TBitBtn;
    ImageList1: TImageList;
    Label69: TLabel;
    CheckBox3: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    form : string;
    procedure WriteOptions;
    procedure ReadOptions;
  end;

var
  Form1: TForm1;
  Data: CORE_TEMP_SHARED_DATA;
  CPU, Core, Index: Cardinal;  // count cpu/core/index
  Degree: Char;   // temp art output
  Temp: Single;   // calculating celsius in fahrenheit
  CPUTempA, CPUTempB, CPUTempC, CPUTempD,
  CPUTempE, CPUTempF, CPUTempG, CPUTempH : string;  // core variables
  TIF : TIniFile;

const
  ID_BIT = $200000; // eFLAGS ID bit

type
  TCPUID = array[1..4] of Longint;

implementation

{$R *.dfm}
{$R-}  // Range Checking Off
{$V-}  // Var String Checking Off
{$I-}  // Switch off I/O error checking
{$Q-}  // Overflow Checking Off

function IsCPUID_Available: Boolean; register;
asm
  PUSHFD             {direct access to flags no possible, only via stack}
  POP     EAX        {flags to EAX}
  MOV     EDX,EAX    {save current flags}
  XOR     EAX,ID_BIT {not ID bit}
  PUSH    EAX        {onto stack}
  POPFD              {from stack to flags, with not ID bit}
  PUSHFD             {back to stack}
  POP     EAX        {get back to EAX}
  XOR     EAX,EDX    {check if ID bit affected}
  JZ      @exit      {no, CPUID not availavle}
  MOV     AL,True    {Result=True}
  @exit:
end;

function GetCPUID: TCPUID; assembler; register;
asm
  PUSH    EBX       {Save affected register}
  PUSH    EDI
  MOV     EDI,EAX   {@Resukt}
  MOV     EAX,1
  DW      $A20F     {CPUID Command}
  STOSD             {CPUID[1]}
  MOV     EAX,EBX
  STOSD             {CPUID[2]}
  MOV     EAX,ECX
  STOSD             {CPUID[3]}
  MOV     EAX,EDX
  STOSD             {CPUID[4]}
  POP     EDI       {Restore registers}
  POP     EBX
end;

// get application main directory
function MainDir : string;
begin
  Result := ExtractFilePath(ParamStr(0));
end;

procedure TForm1.WriteOptions;    // ################### Options Write
var
  OPT :string;
begin
   OPT := 'Options';

   if not DirectoryExists(MainDir + 'Data\Options\')
   then ForceDirectories(MainDir + 'Data\Options\');

   TIF := TIniFile.Create(MainDir + 'Data\Options\Options.ini');
   with TIF do
   begin
    WriteBool(OPT,'Monitoring',CheckBox1.Checked);
    WriteInteger(OPT,'TempScale',ComboBox1.ItemIndex);
    WriteInteger(OPT,'Measurement',ComboBox2.ItemIndex);
    WriteInteger(OPT,'Priotity',ComboBox3.ItemIndex);
    WriteBool(OPT,'MonitoringCPU',CheckBox2.Checked);
    WriteInteger(OPT,'MonitoringSpeed',ScrollBar1.Position);
    WriteString(OPT,'Form',form);
    WriteBool(OPT,'CloseCoreTemp',CheckBox3.Checked);
    Free;
   end;
end;

procedure TForm1.ReadOptions;    // ################### Options Read
var
  OPT:string;
begin
  OPT := 'Options';
  if FileExists(MainDir + 'Data\Options\Options.ini') then
  begin
    TIF:=TIniFile.Create(MainDir + 'Data\Options\Options.ini');
    with TIF do
    begin
      CheckBox1.Checked:=ReadBool(OPT,'Monitoring',CheckBox1.Checked);
      Combobox1.ItemIndex:=ReadInteger(OPT,'TempScale',ComboBox1.ItemIndex);
      Combobox2.ItemIndex:=ReadInteger(OPT,'Measurement',ComboBox2.ItemIndex);
      Combobox3.ItemIndex:=ReadInteger(OPT,'Priotity',ComboBox3.ItemIndex);
      CheckBox2.Checked:=ReadBool(OPT,'MonitoringCPU',CheckBox2.Checked);
      ScrollBar1.Position:=ReadInteger(OPT,'MonitoringSpeed',ScrollBar1.Position);
      form:=ReadString(OPT,'Form',form);
      CheckBox3.Checked:=ReadBool(OPT,'CloseCoreTemp',CheckBox3.Checked);
      Free;
    end;
  end;
end;

procedure RefreshTaskbar;
begin
  // update taskbar
  SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
end;

procedure BringToFrontEx(Form: TForm);
var
  // find the ID of your application's foreground or main thread
  ForegroundThreadID, AppThreadID: DWORD;
begin
  if IsIconic(Form.Handle) then
    ShowWindow(Form.Handle, SW_RESTORE);
  // Focus-Restriktionen von Windows umgehen
  ForegroundThreadID := GetWindowThreadProcessId(GetForegroundWindow, nil);
  AppThreadID := GetWindowThreadProcessId(Form.Handle, nil);

  // integer property that uniquely identifies a specific thread within the operating system.
  if ForegroundThreadID <> AppThreadID then
    AttachThreadInput(ForegroundThreadID, AppThreadID, True);

  // Place the form at the front once.
  SetForegroundWindow(Form.Handle);

  // moving the form to the back
  if ForegroundThreadID <> AppThreadID then
    AttachThreadInput(ForegroundThreadID, AppThreadID, False);
  Form.BringToFront;
end;

{ Process ID (PID) of a running application is done using Windows
  API functions such as CreateToolhelp32Snapshot combined with
  Process32First and Process32Next. }
function GetProcessID(Exename: string): DWORD;
var
   hProcSnap: THandle;
   pe32: TProcessEntry32; // predefined data record structure (record)
begin
   result := 0;
   // snapshot of the specified processes, as well as the heaps, modules,
   // and threads used by these processes.
   hProcSnap := CreateToolHelp32SnapShot(TH32CS_SNAPPROCESS, 0);
   if hProcSnap <> INVALID_HANDLE_VALUE then
      begin
         // get entry size
         pe32.dwSize := SizeOf(ProcessEntry32);
         if Process32First(hProcSnap, pe32) = true then
            begin
               while Process32Next(hProcSnap, pe32) = true do
                  begin
                     if pos(Exename, pe32.szExeFile) <> 0 then
                        result := pe32.th32ProcessID;
                   end;
               end;
      CloseHandle(hProcSnap); // close handle
   end;
end;

// Terminate a specific process using the Windows PID.
function KillProcess(PID: DWord): Bool;
var
   hProcess: THandle;
begin
  // enable access
  hProcess := OpenProcess(PROCESS_TERMINATE, False, PID);
  // terminate
  Result := TerminateProcess(hProcess, 0);
end;

// waiting for the entire program to execute
procedure ExecuteAndWait(const FileName, Parameters: string);
var
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  CmdLine: string;
begin
  // Assemble command line
  CmdLine := Format('"%s" %s', [FileName, Parameters]);
  // Initialize structures
  FillChar(StartupInfo, SizeOf(StartupInfo), 0);
  StartupInfo.cb := SizeOf(StartupInfo);
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := SW_NORMAL;
  // Create process
  if CreateProcess(
    nil,                    // ApplicationName
    PChar(CmdLine),         // Current Directory
    nil,                    // Process Attributes
    nil,                    // Thread Attributes
    False,                  // Security Attributes
    NORMAL_PRIORITY_CLASS,  // process priority
    nil,                    // Creation Flags
    nil,                    // Environment
    StartupInfo,            // Startup Info
    ProcessInfo) then       // Process Information
  begin
    // Wait until the called program has finished
    { WaitForSingleObject(ProcessInfo.hProcess, INFINITE); }

    // Close handles to avoid memory leaks.
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);
  end
  else
    RaiseLastOSError;
end;

// Processor ID detection
function GetID: string;
  // IntToPos is necessary because negative CPU IDs occur in extremely rare cases.
  function IntToPos(Value: Integer): integer; overload;
  begin
    if Value < 0 then
      Result := -Value
    else
      Result := Value;
  end;
  // 64 bit proccessors
  function IntToPos(Value: Int64): int64; overload;
  begin
    if Value < 0 then
      Result := -Value
    else
      Result := Value;
  end;

begin
  // access to flags
  if IsCPUID_Available then
    result := IntToStr(IntToPos(GetCPUID[1])) + IntToStr(IntToPos(GetCPUID[2]))
      + IntToStr(IntToPos(GetCPUID[3])) + IntToStr(IntToPos(GetCPUID[4]))
  else
    result := '09112001'; // Dummyvalue (didn't want to enter a zero)
end;

// Access to the registry
function GetProzessorName: string;
var
  reg: TRegistry;
begin
  result:='Unknown Prozessor';
  reg:=TRegistry.Create;
  try
    // main reg root key
    reg.RootKey := HKEY_LOCAL_MACHINE;
    // path to the proccessor name in reg
    reg.OpenKey('Hardware\Description\System\CentralProcessor\0', false);
    // entered text value
    result:=reg.ReadString('ProcessorNameString');
  finally
    // Let go of the registration.
    reg.free;
  end;
end;

// Determine the number of multi-cores in the processor.
function GetNumberOfProcessors: Integer;
var
  SystemInfo: TSystemInfo;
begin
  GetSystemInfo(SystemInfo);
  Result:=SystemInfo.dwNumberOfProcessors;
end;

// bios serial number
function GetBiosSerialNumber: string;
var
  Locator: OleVariant;
  Service: OleVariant;
  ObjectSet: OleVariant;
  Instance: OleVariant;
  Enum: IEnumVariant;
  Fetched: LongWord;
begin
  Result := '';
  // Initialize COM library
  CoInitialize(nil);
  try
    try
      // Create the WMI Locator object
      Locator := CreateOleObject('WbemScripting.SWbemLocator');
      // Connect to the local WMI service
      Service := Locator.ConnectServer('.', 'root\cimv2');
      // Query the Win32_BIOS table
      ObjectSet := Service.ExecQuery('SELECT SerialNumber FROM Win32_BIOS');
      // Get the enumerator to loop through results
      Enum := IUnknown(ObjectSet._NewEnum) as IEnumVariant;
      // Get the first available record
      if Enum.Next(1, Instance, Fetched) = 0 then
      begin
        if not VarIsNull(Instance.SerialNumber) then
          Result := Trim(StringToOleStr(Instance.SerialNumber));
      end;
    except
      on E: Exception do
        Result := 'Error: ' + E.Message;
    end;
  finally
    // Always clean up COM when finished
    CoUninitialize;
  end;
end;

// Find out whether the program "Core Temp.exe" is running.
function IsExeRunning(const AExeName: string): boolean;
var
  h: THandle;
  p: TProcessEntry32;
begin
  Result := False;

  p.dwSize := SizeOf(p);
  h := CreateToolHelp32Snapshot(TH32CS_SnapProcess, 0);
  try
    Process32First(h, p);
    repeat
      Result := AnsiUpperCase(AExeName) = AnsiUpperCase(p.szExeFile);
    until Result or (not Process32Next(h, p));
  finally
    CloseHandle(h);
  end;
end;

{ converts a string from the Windows character set (ANSI or Unicode) to the
  OEM-defined character set (DOS code page). }
function StringToOem(const Str: string): AnsiString;
begin
  Result := AnsiString(Str);
  if Length(Result) > 0 then
    CharToOemA(PAnsiChar(Result), PAnsiChar(Result));
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  i : integer;
begin
  if BitBtn1.ImageIndex = 0 then
  begin
    for i := 9 to 64 do
    begin
      // find all information labels
      TLabel(findcomponent('Label' + IntToStr(i))).Visible := false;
    end;

    GroupBox1.Height := 230;
    Form1.Height := 350;
    BitBtn1.ImageIndex := 1;
    BitBtn1.Hint := 'Open Information';
    form := 'close';    // options value to remember
  end else begin
    for i := 9 to 64 do
    begin
      // find all information labels
      TLabel(findcomponent('Label' + IntToStr(i))).Visible := true;
    end;

    GroupBox1.Height := 506;
    Form1.Height := 640;
    BitBtn1.ImageIndex := 0;
    BitBtn1.Hint := 'Close Information';
    form := 'open';     // options value to remember
  end;
  Panel1.SetFocus;
end;

// enable disable temp monitoring
procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked = true then
  begin
    Timer1.Enabled := true;
    StatusBar1.Panels[1].Text := 'on';
  end else begin
    Timer1.Enabled := false;
    StatusBar1.Panels[1].Text := 'off';
  end;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  Label19.Enabled := CheckBox2.Checked;
end;

// Switch from Celsius to Fahrenheit
procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
    0 : Degree := 'C';
    1 : begin
          Data.ucFahrenheit := true;;
          Degree := 'F';
        end;
  end;
end;

// set the process priority for the main program
procedure TForm1.ComboBox3Change(Sender: TObject);
var
  H : THandle;
begin
  H := GetCurrentProcess();
  case ComboBox3.ItemIndex of
    0 : SetPriorityClass(H,NORMAL_PRIORITY_CLASS);
    1 : SetPriorityClass(H,IDLE_PRIORITY_CLASS);
    2 : SetPriorityClass(H,HIGH_PRIORITY_CLASS);
    3 : SetPriorityClass(H,REALTIME_PRIORITY_CLASS);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i : integer;
  Reg: TRegistry;
  SysInfo: TSystemInfo;
begin
  Label17.Caption := '0';
  if not IsExeRunning('Core Temp.exe') then
  begin
    Beep;
    IF MessageDlg('"CoreTemp.exe" isn`t running...' + chr(10) + chr(10) +
               'Launch "Core Temp.exe" from the Data folder, or download the latest version.'+ chr(10) +
               'Link : www.alcpu.com/CoreTemp/' + chr(10) + chr(10) +
               'Do you want to start "Core Temp.exe" now?' ,
                mtConfirmation, [mbYes, mbNo], 0) = mrYes THEN
    BEGIN
      ExecuteAndWait(MainDir + 'Data\Core Temp\Core Temp.exe', '');
      Sleep(600);

      if fnGetCoreTempInfo(Data) then
      begin
        Label16.Caption := Data.sCPUName;
        Label17.Caption := IntToStr(Data.uiCoreCnt);
        Label18.Caption := IntToStr(Data.uiCPUCnt);
      end;

      for i := 1 to StrToInt(Label17.Caption) do
      begin
        TLabel(findcomponent('Label' + IntToStr(i))).Enabled := true;
        TPanel(findcomponent('Panel' + IntToStr(i))).Enabled := true;
        TPanel(findcomponent('Panel' + IntToStr(i))).Font.Color := clNavy;
      end;

      for i := 10 to StrToInt(Label17.Caption)+9 do
      begin
        TPanel(findcomponent('Panel' + IntToStr(i))).Enabled := true;
        TPanel(findcomponent('Panel' + IntToStr(i))).Font.Color := clNavy;
      end;
      BringToFrontEx(Form1);
    END;
  end;

  DoubleBuffered := true;
  GetSystemInfo(SysInfo);
  BitBtn1.ImageIndex := 0;
  Application.HintPause := 0;
  Application.HintHidePause := 50000;
  BitBtn1.Hint := 'Close Information';

  Reg := TRegistry.Create;
  try
    // root registry key
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    // open reg key
    Reg.OpenKey('\HARDWARE\DESCRIPTION\System\BIOS\',False); // Schlüssel öffnen
    Label23.Caption := Reg.ReadString('BaseBoardManufacturer'); // Wert lesen
    Label34.Caption := Reg.ReadString('BaseBoardProduct');
    Label37.Caption := Reg.ReadString('BIOSVendor');
    Label38.Caption := Reg.ReadString('BIOSVersion');
    Label44.Caption := Reg.ReadString('BIOSReleaseDate');
    Label46.Caption := Reg.ReadString('SystemFamily');
  finally
    Reg.Free; // Freigeben
  end;

  Reg := TRegistry.Create;
  try
    // root registry key
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    // open reg key
    Reg.OpenKey('\HARDWARE\DESCRIPTION\System\',False);
    // read value
    Label40.Caption := Reg.ReadString('Identifier');
    Label42.Caption := Reg.ReadString('SystemBiosDate');
  finally
    Reg.Free; // Freigeben
  end;

  Label54.Caption := IntToStr(GetNumberOfProcessors);  // multi-core
  Label49.Caption := GetBiosSerialNumber;              // bios serial
  Label53.Caption := GetProzessorName;                 // processor name
  Label57.Caption := GetID;                            // Processor identification number

  with SysInfo do
  begin
    Label28.Caption := FloatToStr(dwPageSize) + ' Kb'; // process page size
    Label48.Caption := Format('%p', [lpMinimumApplicationAddress]); // minimal address
    Label58.Caption := Format('%p', [lpMaximumApplicationAddress]); // maximal address
    Label60.Caption := IntToStr(dwOemId);                           // oemid
    Label62.Caption := IntToStr(dwActiveProcessorMask);             // process mask
    Label25.Caption := IntToStr(dwProcessorType);                   // process type
    Label64.Caption := FloatToStr(dwAllocationGranularity / 1024) + ' Kb'; // virtual memory
    Label33.Caption := IntToStr(wProcessorRevision) + ' Kb';        // process revision
  end;

  try
    if fnGetCoreTempInfo(Data) then
    begin
      Label16.Caption := Data.sCPUName;
      Label17.Caption := IntToStr(Data.uiCoreCnt);
      Label18.Caption := IntToStr(Data.uiCPUCnt);
      Label19.Caption := FloatToStrF(Data.fCPUSpeed, ffFixed, 7, 0) + ' MHz - Relative specification';
      Label20.Caption := FloatToStrF(Data.fFSBSpeed, ffFixed, 7, 0) + ' MHz';
      Label21.Caption := FloatToStrF(Data.fMultipier, ffFixed, 7, 1);
      Label22.Caption := FloatToStrF(Data.fVID, ffFixed, 7, 2) + ' V';

      // degree value vor measurement
      if Data.ucFahrenheit then
        Degree := 'F'   // fahrenheit
      else
        Degree := 'C';  // celsius

      for CPU := 0 to Data.uiCPUCnt - 1 do
      begin
        for Core := 0 to Data.uiCoreCnt - 1 do
        begin
          Index := (CPU * Data.uiCoreCnt) + Core;
          if Data.ucDeltaToTjMax then
            Temp := Data.uiTjMax[CPU] - Data.fTemp[Index]
          else
            Temp := Data.fTemp[Index];
        end;
      end;
    end
    else
    begin
      StatusBar1.Panels[3].Text := 'Core Temp.exe''s shared memory could not be read';
      StatusBar1.Panels[5].Text := StringToOem(SysErrorMessage(GetLastError));
    end;
  except
    on E: Exception do
      ShowMessage(': '+ E.Message);
  end;


  for i := 1 to StrToInt(Label17.Caption) do
  begin
    TLabel(findcomponent('Label' + IntToStr(i))).Enabled := true;
    TPanel(findcomponent('Panel' + IntToStr(i))).Enabled := true;
    TPanel(findcomponent('Panel' + IntToStr(i))).Font.Color := clNavy;
  end;

  for i := 10 to StrToInt(Label17.Caption)+9 do
  begin
    TPanel(findcomponent('Panel' + IntToStr(i))).Enabled := true;
    TPanel(findcomponent('Panel' + IntToStr(i))).Font.Color := clNavy;
  end;


 Label53.Hint := 'A group of microprocessors from the same manufacturer' +#13+
                 'that are based on the same architecture and technology.';
 Label20.Hint := 'Front-Side Bus (FSB) is the physical pathway connecting' +#13+
                 'your computer’s processor (CPU) to the motherboard`s chipset.';
 Label57.Hint := 'The serial number (SN or ATPO) of a CPU is a unique' +#13+
                 'identifier required for manufacturer support, warranty'  +#13+
                 'claims, and identification.';
 Label28.Hint := 'Determines the fixed blocks of memory a processor uses' +#13+
                 'to manage virtual and physical RAM.';
 Label48.Hint := 'Lowest possible memory address, regardless of its' +#13+
                 'architecture or memory size.';
 Label58.Hint := 'Highest memory address a CPU can access is determined' +#13+
                 'by the width of its address bus or the size of its'  +#13+
                 'internal registers.';
 Label37.Hint := 'The company that develops and manufactures your' +#13+
                 'computer`s central motherboard.';
 Label38.Hint := 'The UEFI version of your motherboard indicates the' +#13+
                 'software version installed on the small chip on the mainboard.';
 Label42.Hint := 'The BIOS date on a motherboard indicates when the' +#13+
                 'installed firmware version was created or compiled' +#13+
                 'by the manufacturer.';
 Label44.Hint := 'The BIOS release date on your motherboard indicates' +#13+
                 'when the specific version of the control software (firmware)' +#13+
                 'was released by your motherboard manufacturer.';
 Label46.Hint := 'A group of motherboards from the same manufacturer based on the chipset.'  +#13+
                 'When your motherboard details show "To Be Filled By O.E.M.",'  +#13+
                 'it means the manufacturer of your computer did not program'  +#13+
                 'the specific model and serial number into the system`s BIOS.';
 Label49.Hint := 'Motherboard BIOS serial number is a unique identification number.' +#13+
                 'When your motherboard BIOS displays "To Be Filled By O.E.M."' +#13+
                 'in place of a serial number, it simply means the hardware' +#13+
                 'manufacturer did not encode a serial number into the board`s firmware.';
 Label60.Hint := 'The OEMID on a motherboard is a unique identifier that' +#13+
                 'identifies the manufacturer of the complete system.' +#13+
                 'A "0" usually indicates that your motherboard comes from a pre-built' +#13+
                 'PC and does not correspond to the standard retail model.';
 Label33.Hint := 'The CPU revision (often referred to as "stepping")' +#13 +
                 'indicates the version in which the processor core was manufactured.';
 Label64.Hint := 'CPU virtual memory is a memory management technique' +#13+
                 'that gives software the illusion of a large, contiguous,' +#13+
                 'and isolated block of RAM.';

 BringToFrontEx(Form1);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Timer1.Enabled := false;
  WriteOptions;
  if CheckBox3.Checked then
  KillProcess(GetProcessID('Core Temp.exe'));
  FlashWindow(Handle, True);             // The current form
  FlashWindow(Application.Handle, True); // The app button on the taskbar
  RefreshTaskbar;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  ReadOptions;
  if form = 'close' then BitBtn1.Click;

  if not IsExeRunning('Core Temp.exe') then
  begin
    MessageDlg('Program is shutting down!',mtInformation, [mbOK], 0);
    Application.Terminate;
  end;
end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
  Timer1.Interval := ScrollBar1.Position;
  Label104.Caption := IntToStr(ScrollBar1.Position) + ' ms';
  if ScrollBar1.Position = 1000 then Label104.Caption := '1 min.';
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  try
    if fnGetCoreTempInfo(Data) then
    begin
      if CheckBox2.Checked = true then
        Label19.Caption := FloatToStrF(Data.fCPUSpeed, ffFixed, 7, 0) +
                                      ' MHz - Relative specification';

      case ComboBox1.ItemIndex of
        0 :  Degree := 'C';
        1 :  Degree := 'F';
      end;

      for CPU := 0 to Data.uiCPUCnt - 1 do
      begin
        for Core := 0 to Data.uiCoreCnt - 1 do
        begin
          Index := (CPU * Data.uiCoreCnt) + Core;
          if Data.ucDeltaToTjMax then
          begin
            Temp := Data.uiTjMax[CPU] - Data.fTemp[Index];
          end else begin
            Temp := Data.fTemp[Index];
          end;

            // Calculation of the temperature for the first CPU core
            if (Core = 0) and (Label1.Enabled = true) then
            begin
              Panel10.Caption := IntToStr(Data.uiLoad[Index]) + ' %';
              CPUTempA := FloatToStrF(Temp, ffFixed, 7, 0);

              // First CPU core temperature (Celsius)
              if ComboBox1.ItemIndex = 0 then
              begin
                case ComboBox2.ItemIndex of
                  0 : Panel1.Caption := FloatToStrF(Temp, ffGeneral, 7, 0) + ' °' + Degree;
                  1 : Panel1.Caption := FloatToStrF(Temp, ffExponent, 7, 0) + ' °' + Degree;
                  2 : Panel1.Caption := FloatToStrF(Temp, ffFixed, 7, 0) + ' °' + Degree;
                  3 : Panel1.Caption := FloatToStrF(Temp, ffNumber, 7, 0) + ' °'  + Degree;
                end;
              end;

              // First CPU core temperature (Fahrenheit)
              if ComboBox1.ItemIndex = 1 then
              begin
                case ComboBox2.ItemIndex of
                  0 : Panel1.Caption := FloatToStrF((Temp*1.8)+32, ffGeneral, 7, 0) + ' °' + Degree;
                  1 : Panel1.Caption := FloatToStrF((Temp*1.8)+32, ffExponent, 7, 0) + ' °' + Degree;
                  2 : Panel1.Caption := FloatToStrF((Temp*1.8)+32, ffFixed, 7, 0) + ' °' + Degree;
                  3 : Panel1.Caption := FloatToStrF((Temp*1.8)+32, ffNumber, 7, 0) + ' °'  + Degree;
                end;
              end;
              ProgressBar1.Position := StrToInt(CPUTempA);
            end;

            // Calculation of the temperature for the second CPU core
            if (Core = 1) and (Label2.Enabled = true) then
            begin
              Panel11.Caption := IntToStr(Data.uiLoad[Index]) + ' %';
              CPUTempB := FloatToStrF(Temp, ffFixed, 7, 0);

              // Second CPU core temperature (Celsius)
              if ComboBox1.ItemIndex = 0 then
              begin
                case ComboBox2.ItemIndex of
                  0 : Panel2.Caption := FloatToStrF(Temp, ffGeneral, 7, 0) + ' °' + Degree;
                  1 : Panel2.Caption := FloatToStrF(Temp, ffExponent, 7, 0) + ' °' + Degree;
                  2 : Panel2.Caption := FloatToStrF(Temp, ffFixed, 7, 0) + ' °' + Degree;
                  3 : Panel2.Caption := FloatToStrF(Temp, ffNumber, 7, 0) + ' °' + Degree;
                end;
                ProgressBar2.Position := StrToInt(CPUTempB);
              end;

              // Second CPU core temperature (Celsius)
              if ComboBox1.ItemIndex = 1 then
              begin
                case ComboBox2.ItemIndex of
                  0 : Panel2.Caption := FloatToStrF((Temp*1.8)+32, ffGeneral, 7, 0) + ' °' + Degree;
                  1 : Panel2.Caption := FloatToStrF((Temp*1.8)+32, ffExponent, 7, 0) + ' °' + Degree;
                  2 : Panel2.Caption := FloatToStrF((Temp*1.8)+32, ffFixed, 7, 0) + ' °' + Degree;
                  3 : Panel2.Caption := FloatToStrF((Temp*1.8)+32, ffNumber, 7, 0) + ' °' + Degree;
                end;
                ProgressBar2.Position := StrToInt(CPUTempB);
              end;
            end;

            // Calculation of the temperature for the third CPU core
            if (Core = 2) and (Label3.Enabled = true) then
            begin
              Panel12.Caption := IntToStr(Data.uiLoad[Index]) + ' %';
              CPUTempC := FloatToStrF(Temp, ffFixed, 7, 0);

              // Third CPU core temperature (Celsius)
              if ComboBox1.ItemIndex = 0 then
              begin
                case ComboBox2.ItemIndex of
                  0 : Panel3.Caption := FloatToStrF(Temp, ffGeneral, 7, 0) + ' °' + Degree;
                  1 : Panel3.Caption := FloatToStrF(Temp, ffExponent, 7, 0) + ' °' + Degree;
                  2 : Panel3.Caption := FloatToStrF(Temp, ffFixed, 7, 0) + ' °' + Degree;
                  3 : Panel3.Caption := FloatToStrF(Temp, ffNumber, 7, 0) + ' °' + Degree;
                end;
              end;

              // Third CPU core temperature (Fahrenheit)
              if ComboBox1.ItemIndex = 1 then
              begin
                case ComboBox2.ItemIndex of
                  0 : Panel3.Caption := FloatToStrF((Temp*1.8)+32, ffGeneral, 7, 0) + ' °' + Degree;
                  1 : Panel3.Caption := FloatToStrF((Temp*1.8)+32, ffExponent, 7, 0) + ' °' + Degree;
                  2 : Panel3.Caption := FloatToStrF((Temp*1.8)+32, ffFixed, 7, 0) + ' °' + Degree;
                  3 : Panel3.Caption := FloatToStrF((Temp*1.8)+32, ffNumber, 7, 0) + ' °' + Degree;
                end;
              end;

              ProgressBar3.Position := StrToInt(CPUTempC);
            end;

            // Calculation of the temperature for the fourth CPU core
            if (Core = 3) and (Label4.Enabled = true) then
            begin
              Panel13.Caption := IntToStr(Data.uiLoad[Index]) + ' %';
              CPUTempD := FloatToStrF(Temp, ffFixed, 7, 0);

              // fourth CPU core temperature (Celsius)
              if ComboBox1.ItemIndex = 0 then
              begin
                case ComboBox2.ItemIndex of
                  0 : Panel4.Caption := FloatToStrF(Temp, ffGeneral, 7, 0) + ' °' + Degree;
                  1 : Panel4.Caption := FloatToStrF(Temp, ffExponent, 7, 0) + ' °' + Degree;
                  2 : Panel4.Caption := FloatToStrF(Temp, ffFixed, 7, 0) + ' °' + Degree;
                  3 : Panel4.Caption := FloatToStrF(Temp, ffNumber, 7, 0) + ' °' + Degree;
                end;
              end;

              // fourth CPU core temperature (Fahrenheit)
              if ComboBox1.ItemIndex = 1 then
              begin
                case ComboBox2.ItemIndex of
                  0 : Panel4.Caption := FloatToStrF((Temp*1.8)+32, ffGeneral, 7, 0) + ' °' + Degree;
                  1 : Panel4.Caption := FloatToStrF((Temp*1.8)+32, ffExponent, 7, 0) + ' °' + Degree;
                  2 : Panel4.Caption := FloatToStrF((Temp*1.8)+32, ffFixed, 7, 0) + ' °' + Degree;
                  3 : Panel4.Caption := FloatToStrF((Temp*1.8)+32, ffNumber, 7, 0) + ' °' + Degree;
                end;
              end;
              ProgressBar4.Position := StrToInt(CPUTempD);
            end;

            // Calculation of the temperature for the fifth CPU core
            if (Core = 4) and (Label5.Enabled = true) then
            begin
              Panel14.Caption := IntToStr(Data.uiLoad[Index]) + ' %';
              CPUTempE := FloatToStrF(Temp, ffFixed, 7, 0);

              // fifth CPU core temperature (Celsius)
              if ComboBox1.ItemIndex = 0 then
              begin
                case ComboBox2.ItemIndex of
                  0 : Panel5.Caption := FloatToStrF(Temp, ffGeneral, 7, 0) + ' °' + Degree;
                  1 : Panel5.Caption := FloatToStrF(Temp, ffExponent, 7, 0) + ' °' + Degree;
                  2 : Panel5.Caption := FloatToStrF(Temp, ffFixed, 7, 0) + ' °' + Degree;
                  3 : Panel5.Caption := FloatToStrF(Temp, ffNumber, 7, 0) + ' °' + Degree;
                end;
              end;

              // fifth CPU core temperature (Fahrenheit)
              if ComboBox1.ItemIndex = 1 then
              begin
                case ComboBox2.ItemIndex of
                  0 : Panel5.Caption := FloatToStrF((Temp*1.8)+32, ffGeneral, 7, 0) + ' °' + Degree;
                  1 : Panel5.Caption := FloatToStrF((Temp*1.8)+32, ffExponent, 7, 0) + ' °' + Degree;
                  2 : Panel5.Caption := FloatToStrF((Temp*1.8)+32, ffFixed, 7, 0) + ' °' + Degree;
                  3 : Panel5.Caption := FloatToStrF((Temp*1.8)+32, ffNumber, 7, 0) + ' °' + Degree;
                end;
              end;
              ProgressBar5.Position := StrToInt(CPUTempE);
            end;

            // Calculation of the temperature for the sixth CPU core
            if (Core = 5) and (Label6.Enabled = true) then
            begin
              Panel15.Caption := IntToStr(Data.uiLoad[Index]) + ' %';
              CPUTempF := FloatToStrF(Temp, ffFixed, 7, 0);

              // sixth CPU core temperature (Celsius)
              if ComboBox1.ItemIndex = 0 then
              begin
                case ComboBox2.ItemIndex of
                  0 : Panel6.Caption := FloatToStrF(Temp, ffGeneral, 7, 0) + ' °' + Degree;
                  1 : Panel6.Caption := FloatToStrF(Temp, ffExponent, 7, 0) + ' °' + Degree;
                  2 : Panel6.Caption := FloatToStrF(Temp, ffFixed, 7, 0) + ' °' + Degree;
                  3 : Panel6.Caption := FloatToStrF(Temp, ffNumber, 7, 0) + ' °' + Degree;
                end;
              end;

              // sixth CPU core temperature (Fahrenheit)
              if ComboBox1.ItemIndex = 1 then
              begin
                case ComboBox2.ItemIndex of
                  0 : Panel6.Caption := FloatToStrF((Temp*1.8)+32, ffGeneral, 7, 0) + ' °' + Degree;
                  1 : Panel6.Caption := FloatToStrF((Temp*1.8)+32, ffExponent, 7, 0) + ' °' + Degree;
                  2 : Panel6.Caption := FloatToStrF((Temp*1.8)+32, ffFixed, 7, 0) + ' °' + Degree;
                  3 : Panel6.Caption := FloatToStrF((Temp*1.8)+32, ffNumber, 7, 0) + ' °' + Degree;
                end;
              end;
              ProgressBar6.Position := StrToInt(CPUTempF);
            end;

            // Calculation of the temperature for the seventh CPU core
            if (Core = 6) and (Label7.Enabled = true) then
            begin
              Panel16.Caption := IntToStr(Data.uiLoad[Index]) + ' %';
              CPUTempG := FloatToStrF(Temp, ffFixed, 7, 0);

              // seventh CPU core temperature (Celsius)
              if ComboBox1.ItemIndex = 0 then
              begin
                case ComboBox2.ItemIndex of
                  0 : Panel7.Caption := FloatToStrF(Temp, ffGeneral, 7, 0) + ' °' + Degree;
                  1 : Panel7.Caption := FloatToStrF(Temp, ffExponent, 7, 0) + ' °' + Degree;
                  2 : Panel7.Caption := FloatToStrF(Temp, ffFixed, 7, 0) + ' °' + Degree;
                  3 : Panel7.Caption := FloatToStrF(Temp, ffNumber, 7, 0) + ' °' + Degree;
                end;
              end;

              // seventh CPU core temperature (Fahrenheit)
              if ComboBox1.ItemIndex = 1 then
              begin
                case ComboBox2.ItemIndex of
                  0 : Panel7.Caption := FloatToStrF((Temp*1.8)+32, ffGeneral, 7, 0) + ' °' + Degree;
                  1 : Panel7.Caption := FloatToStrF((Temp*1.8)+32, ffExponent, 7, 0) + ' °' + Degree;
                  2 : Panel7.Caption := FloatToStrF((Temp*1.8)+32, ffFixed, 7, 0) + ' °' + Degree;
                  3 : Panel7.Caption := FloatToStrF((Temp*1.8)+32, ffNumber, 7, 0) + ' °' + Degree;
                end;
              end;
              ProgressBar7.Position := StrToInt(CPUTempG);
            end;

            // Calculation of the temperature for the eighth CPU core
            if (Core = 7) and (Label8.Enabled = true) then
            begin
              Panel17.Caption := IntToStr(Data.uiLoad[Index]) + ' %';
              CPUTempH := FloatToStrF(Temp, ffFixed, 7, 0);

              // eighth CPU core temperature (Celsius)
              if ComboBox1.ItemIndex = 0 then
              begin
                case ComboBox2.ItemIndex of
                  0 : Panel8.Caption := FloatToStrF(Temp, ffGeneral, 7, 0) + ' °' + Degree;
                  1 : Panel8.Caption := FloatToStrF(Temp, ffExponent, 7, 0) + ' °' + Degree;
                  2 : Panel8.Caption := FloatToStrF(Temp, ffFixed, 7, 0) + ' °' + Degree;
                  3 : Panel8.Caption := FloatToStrF(Temp, ffNumber, 7, 0) + ' °' + Degree;
                end;
              end;

              // eighth CPU core temperature (Fahrenheit)
              if ComboBox1.ItemIndex = 1 then
              begin
                case ComboBox2.ItemIndex of
                  0 : Panel8.Caption := FloatToStrF((Temp*1.8)+32, ffGeneral, 7, 0) + ' °' + Degree;
                  1 : Panel8.Caption := FloatToStrF((Temp*1.8)+32, ffExponent, 7, 0) + ' °' + Degree;
                  2 : Panel8.Caption := FloatToStrF((Temp*1.8)+32, ffFixed, 7, 0) + ' °' + Degree;
                  3 : Panel8.Caption := FloatToStrF((Temp*1.8)+32, ffNumber, 7, 0) + ' °' + Degree;
                end;
              end;
              ProgressBar8.Position := StrToInt(CPUTempH);
            end;

        end;
      end;
    end
    else
    begin
      StatusBar1.Panels[3].Text := 'Core Temp.exe''s shared memory could not be read';
      StatusBar1.Panels[5].Text := StringToOem(SysErrorMessage(GetLastError));
    end;
  except
    on E: Exception do
      ShowMessage(': '+ E.Message);
  end;

end;

end.
