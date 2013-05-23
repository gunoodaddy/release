@ECHO OFF 

@SET RELEASE_DIR=..\..\TroublesomeRequester\Win32\Release
@SET TARGET_DIR=.\

@SET PATCH_FILE1=TroublesomeRequester.exe
@SET PATCH_FILE1_TEMP=%PATCH_FILE1%_
@SET PATCH_FILE2=TroublesomeRequesterCommand.exe

@SET OUTPUT_FILE=patch_win.zip

copy %RELEASE_DIR%\%PATCH_FILE1% %PATCH_FILE1_TEMP%
copy %RELEASE_DIR%\%PATCH_FILE2% %PATCH_FILE2%

del /s %TARGET_DIR%\%OUTPUT_FILE%
..\tools\7z a -tzip %TARGET_DIR%\%OUTPUT_FILE% %PATCH_FILE1_TEMP% %PATCH_FILE2%
del /F/Q/S %PATCH_FILE1_TEMP%
del /F/Q/S %PATCH_FILE2%

notepad %TARGET_DIR%\version_win.txt

