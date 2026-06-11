# CoreTemp-Reader

</br>

![Compiler](https://github.com/user-attachments/assets/a916143d-3f1b-4e1f-b1e0-1067ef9e0401) ![10 Seattle](https://github.com/user-attachments/assets/c70b7f21-688a-4239-87c9-9a03a8ff25ab) ![10 1 Berlin](https://github.com/user-attachments/assets/bdcd48fc-9f09-4830-b82e-d38c20492362) ![10 2 Tokyo](https://github.com/user-attachments/assets/5bdb9f86-7f44-4f7e-aed2-dd08de170bd5) ![10 3 Rio](https://github.com/user-attachments/assets/e7d09817-54b6-4d71-a373-22ee179cd49c)  ![10 4 Sydney](https://github.com/user-attachments/assets/e75342ca-1e24-4a7e-8fe3-ce22f307d881) ![11 Alexandria](https://github.com/user-attachments/assets/64f150d0-286a-4edd-acab-9f77f92d68ad) ![12 Athens](https://github.com/user-attachments/assets/59700807-6abf-4e6d-9439-5dc70fc0ceca)  
![Components](https://github.com/user-attachments/assets/d6a7a7a4-f10e-4df1-9c4f-b4a1a8db7f0e) ![None](https://github.com/user-attachments/assets/30ebe930-c928-4aaf-a8e1-5f68ec1ff349)  
![Description](https://github.com/user-attachments/assets/dbf330e0-633c-4b31-a0ef-b1edb9ed5aa7) <img src="https://github.com/user-attachments/assets/21cd0d81-fbf4-430b-bb3a-0293abef3f1d" />  
![Last Update](https://github.com/user-attachments/assets/e1d05f21-2a01-4ecf-94f3-b7bdff4d44dd) <img src="https://github.com/user-attachments/assets/aca4e5fb-a648-44fc-b641-1e3e0aa5977b" />  
![License](https://github.com/user-attachments/assets/ff71a38b-8813-4a79-8774-09a2f3893b48) ![Freeware](https://github.com/user-attachments/assets/1fea2bbf-b296-4152-badd-e1cdae115c43)  

</br>

Core Temp memory reader for Delphi is a shared memory interface library. This library provides an easy access to the Core Temp's shared memory and allows reading data from it. There is a sample demo project showing how to use the interface library.

</br>

<img src="https://github.com/user-attachments/assets/609d6e2f-8299-493d-aff8-0eac45321916" />

</br>
</br>

CoreTemp Reader requires the [CoreTemp](https://www.alcpu.com/CoreTemp/) program to capture and analyze data from system memory. The program can be started and stopped either manually or automatically.

Download Source : https://74.cz/download/GetCoreTempInfoDelphi.zip  
Download Console Project : https://74.cz/download/SMCoreTempDelphiReader.zip

### Code Example:
```pascal
// http://www.alcpu.com/CoreTemp

program SMCoreTempDelphiReader;

{$APPTYPE CONSOLE}

uses
  Windows,
  SysUtils,
  GetCoreTempInfoDelphi in 'GetCoreTempInfoDelphi.pas';

var
  Data: CORE_TEMP_SHARED_DATA;
  CPU, Core, Index: Cardinal;
  Degree: Char;
  Temp: Single;

function StringToOem(const Str: string): AnsiString;
begin
  Result := AnsiString(Str);
  if Length(Result) > 0 then
    CharToOemA(PAnsiChar(Result), PAnsiChar(Result));
end;

begin
  try
    Writeln('Core Temp shared memory reader');
    if fnGetCoreTempInfo(Data) then
    begin
      Writeln('Processor  : ' + Data.sCPUName);
      Writeln('Core(s)    : ' + IntToStr(Data.uiCoreCnt));
      Writeln('CPU(s)     : ' + IntToStr(Data.uiCPUCnt));
      Writeln('CPU speed  : ' + FloatToStrF(Data.fCPUSpeed, ffFixed, 7, 0)
        + ' MHz');
      Writeln('FSB speed  : ' + FloatToStrF(Data.fFSBSpeed, ffFixed, 7, 0)
        + ' MHz');
      Writeln('Multiplier : ' + FloatToStrF(Data.fMultipier, ffFixed, 7, 1));
      Writeln('VID        : ' + FloatToStrF(Data.fVID, ffFixed, 7, 2) + ' V');
      if Data.ucFahrenheit then
        Degree := 'F'
      else
        Degree := 'C';
      for CPU := 0 to Data.uiCPUCnt - 1 do
      begin
        for Core := 0 to Data.uiCoreCnt - 1 do
        begin
          Index := (CPU * Data.uiCoreCnt) + Core;
          if Data.ucDeltaToTjMax then
            Temp := Data.uiTjMax[CPU] - Data.fTemp[Index]
          else
            Temp := Data.fTemp[Index];
          Write('CPU #' + IntToStr(CPU) + ', Core #' + IntToStr(Core) + ':  ');
          Write('Temperature = ' + FloatToStrF(Temp, ffFixed, 7, 0) + ' ' +
            Degree + '  ');
          Writeln('Load = ' + IntToStr(Data.uiLoad[Index]) + ' %');
        end;
      end;
    end
    else
    begin
      Writeln('Error: Core Temp''s shared memory could not be read');
      Writeln('Reason: ' + StringToOem(SysErrorMessage(GetLastError)));
    end;
  except
    on E: Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;

end.
```

# CoreTemp
Core Temp is a compact, no fuss, small footprint, yet powerful program to monitor processor temperature and other vital information.

What makes Core Temp unique is the way it works. It is capable of displaying a temperature of each individual core of every processor in your system!

You can see temperature fluctuations in real time with varying workloads. Core Temp is also motherboard agnostic.

Download latest Version: https://www.alcpu.com/CoreTemp/Core-Temp-setup-v1.20.1.150.exe  

Core Temp makes it easy for you to monitor the temperature of any modern x86 based processor. The program supports processors from all three major manufacturers; Intel, AMD and VIA.

Intel processors starting with the "Core" series all the way up to the newest Core i7, including all the derivatives.
AMD processors starting with the first Athlon64 and Opteron processor series, all Phenom and AMD's new APU are supported.
VIA processors starting with the C7 generation of CPUs, including all the derivatives based on the C7 architecture. All of the Nano based processors are supported as well.

The temperature readings are very accurate as the data is collected directly from a Digital Thermal Sensor (or DTS) which is located in each individual processing core*, near the hottest part. This sensor is digital, which means it doesn't rely on an external circuit located on the motherboard to report temperature, its value is stored in a special register in the processor so that software can access and read it. This eliminates any inaccuracies that can be introduced by external motherboard circuits and sensors.

### This is how the program works:

Intel defines a certain Tjunction temperature for the processor. This value is usually in the range between 85°C and 105°C. In the later generation of processors, starting with Nehalem, the exact Tjunction Max value is available for software to read in an MSR (short for Model Specific Register).
A different MSR contains the temperature data. The data is represented as a Delta in °C between current temperature and Tjunction.

So the actual temperature is calculated like this 'Core Temp = Tjunction - Delta'

The size of the data field is 7 bits. This means a Delta of 0 - 127°C can be reported in theory. In fact the reported temperature can rarely go below 0°C and in some cases (Core 2 - 45nm series) temperatures below 30° or even 40°C are not reported.

# Supported Processors:
* AMD:
  * All Ryzen/Epyc series.
  * All FX series.
  * All APU series.
  * All Phenom / Phenom II series.
  * All Athlon II series.
  * All Turion II series.
  * All Athlon64 series.
  * All Athlon64 X2 series.
  * All Athlon64 FX series.
  * All Turion64 series.
  * All Turion64 X2 series.
  * All Sempron series. (K8 and up based)
  * All Opteron processors.
  * Single Core Opterons starting with SH-C0 revision and up. (K8 based)

* Intel:
  * All Core i3, i5, i7, i9 series.
  * All Atom processors.
  * All Core Solo series.
  * All Core Duo series.
  * All Core 2 Duo series.
  * All Core 2 Quad series.
  * All Core 2 Extreme series.
  * All Celeron-M 400 and 500 series.
  * All Celeron series.
  * All Pentium series.
  * All Xeon (Core based) processors

* VIA:
  * All Nano series.
  * C7 series and derivatives.







