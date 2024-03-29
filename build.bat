@ECHO OFF
CLS & TITLE Building ZSheet!...
CD %~dp0
ECHO:

SET WLA_6502="bin\wla-dx\wla-6502.exe"   -i -x -I "src"
SET WLA_LINK="bin\wla-dx\wlalink.exe"    -i -A -S

REM # combine the CPU assembler and system symbols for a C64
SET WLA_C64=%WLA_6502% -D SYSTEM_CBM=1 -D SYSTEM_C64=1
REM # packer for compressing programs
SET EXOMIZER="bin\exomizer\exomizer.exe"
REM # utility to pack C64 binaries onto a C64 disk-image
SET C1541="bin\vice\c1541.exe"
REM # C64 emulator
SET VICE="bin\vice\x64.exe"

ECHO ZSheet C64:
ECHO ========================================
%WLA_C64% -v ^
    -o "build\zsheet.o" ^
       "zsheet.wla"

IF ERRORLEVEL 1 EXIT /B 1

ECHO:

%WLA_LINK% -v -t CBMPRG ^
    -b "link_c64.ini" ^
       "build\zsheet_c64.prg"

IF ERRORLEVEL 1 EXIT /B 1

REM # compress the program
ECHO:
ECHO Exomizer...
%EXOMIZER% sfx $c000 -t64 -n -q ^
     -o "build\zsheet_c64-exo.prg" ^
     -- "build\zsheet_c64.prg" ^
        "font\zsheet_c64.bin@0x0800"

IF ERRORLEVEL 1 EXIT /B 1

REM # build a 1541 floppy disk image
ECHO:
%C1541% ^
    -format "zsheet,00" d64 "build/zsheet-c64.d64" ^
    -write  "build/zsheet_c64-exo.prg"  "zsheet"

IF ERRORLEVEL 1 EXIT /B 1

%VICE% --autostart "%~dp0build\zsheet-c64.d64"

ECHO:
ECHO OK.