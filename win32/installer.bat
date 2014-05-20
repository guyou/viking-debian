@echo OFF
:: License: CC0
::
:: TODO return an error code when not completed as expected
::
echo STARTING INSTALLER PROCESS...

:: For strip
set PATH=%PATH%;%SystemDrive%\MinGW\bin

echo Remove debugging symbols
pushd ..\src
strip.exe -g viking.exe
popd

set MYCOPY=copy /y
set DESTINATION=installer\bin
echo Copying locale files into layout required by NSIS
dir ..\po\*.gmo /B > gmolist.txt
:: Create directories like de\LC_MESSAGES
for /f %%i in (gmolist.txt) do mkdir %DESTINATION%\locale\%%~ni\LC_MESSAGES
for /f %%i in (gmolist.txt) do %MYCOPY% ..\po\%%i %DESTINATION%\locale\%%~ni\LC_MESSAGES\viking.mo
del gmolist.txt

echo Copying Viking
%MYCOPY% ..\src\viking.exe %DESTINATION%
%MYCOPY% installer\pixmaps\viking_icon.ico %DESTINATION%
%MYCOPY% ..\COPYING %DESTINATION%\COPYING_GPL.txt
%MYCOPY% ..\AUTHORS %DESTINATION%\AUTHORS.txt
%MYCOPY% ..\NEWS %DESTINATION%\NEWS.txt
%MYCOPY% ..\README %DESTINATION%\README.txt
:: ATM this relies on being generated by an external system
%MYCOPY% cache\ChangeLog.txt %DESTINATION%
:: ATM this relies on being generated by an external system
%MYCOPY% ..\help\C\viking.pdf %DESTINATION%


echo Copying Libraries
set MINGW=C:\MinGW
if not exist "%MINGW%" (
	echo Required %MINGW% does not exist
	goto Tidy
)

set MINGW_BIN=%MINGW%\Bin

set LIBCURL=%MINGW_BIN%\libcurl.dll
if exist "%LIBCURL%" (
	%MYCOPY% "%LIBCURL%" %DESTINATION%
	%MYCOPY% "%MINGW%\COPYING_curl.txt" %DESTINATION%

) else (
	echo %LIBCURL% does not exist
	goto Tidy
)
set LIBEXIF=%MINGW_BIN%\libexif-12.dll
if exist "%LIBEXIF%" (
	%MYCOPY% "%LIBEXIF%" %DESTINATION%
) else (
	echo Required %LIBEXIF% does not exist
	goto Tidy
)
set LIBBZ2=%MINGW_BIN%\libbz2-2.dll
if exist "%LIBBZ2%" (
	%MYCOPY% "%LIBBZ2%" %DESTINATION%
	%MYCOPY% "%MINGW_BIN%\libgcc_s_dw2-1.dll" %DESTINATION%
) else (
	echo Required %LIBBZ2% does not exist
	goto Tidy
)
set LIBMAGIC=%MINGW_BIN%\magic1.dll
if exist "%LIBMAGIC%" (
	%MYCOPY% "%LIBMAGIC%" %DESTINATION%
	%MYCOPY% "%MINGW_BIN%\regex2.dll" %DESTINATION%
	%MYCOPY% "%MINGW%\share\misc\magic.mgc" %DESTINATION%
) else (
	echo Required %LIBMAGIC% does not exist
	goto Tidy
)

:: TODO Maybe embed http://gtk-win.sourceforge.net/home/index.php/Main/EmbeddingGTK directly in NSIS?
:: Best to use the same GTK version as we built against in prepare.bat!!
echo =+=+=
echo Checking gtk runtime
echo =+=+=
set GTK_RUNTIME=gtk2-runtime-2.24.10-2012-10-10-ash.exe
pushd cache
if not exist %GTK_RUNTIME% (
	set PATH=%PATH%;%ProgramFiles%\GnuWin32\bin
	wget http://downloads.sourceforge.net/gtk-win/%GTK_RUNTIME%
)
if not exist %GTK_RUNTIME% (
	echo Required GTK Runtime does not exist
	goto Tidy
)
:: Install GTK into temporary location so we can repackage it
:: Destination path appears to have to be an absolute kind
popd
cd > tmp.tmp
set /p PWD=<tmp.tmp
del tmp.tmp
cache\%GTK_RUNTIME% /sideeffects=no /setpath=no /dllpath=root /translations=no /compatdlls=yes /S /D=%PWD%\%DESTINATION%

::
echo Copying Translations
%MYCOPY% installer\translations\*nsh %DESTINATION%

echo Copying GPSBabel
:: Install it from http://www.gpsbabel.org/download.html
::  Thus GPSBabel should be here
:: NB GPSBabel has standard GPL2 COPYING.txt file so don't need another copy
if exist "%ProgramFiles%\GPSBabel\gpsbabel.exe" (
	%MYCOPY% "%ProgramFiles%\GPSBabel\gpsbabel.exe" %DESTINATION%
	%MYCOPY% "%ProgramFiles%\GPSBabel\libexpat.dll" %DESTINATION%
) else (
	echo GPSBabel missing
	goto Tidy
)

echo Running NSIS (command line version)
pushd installer
if exist "%ProgramFiles%\NSIS" (
	"%ProgramFiles%\NSIS\makensis.exe" viking-installer.nsi
) else (
	echo NSIS Not installed in known location
)
popd

echo Tidy Up
:Tidy
rmdir /S /Q %DESTINATION%
