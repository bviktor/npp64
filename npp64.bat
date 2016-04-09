set DESTDIR=c:\npp64
rmdir /q /s %DESTDIR%
mkdir %DESTDIR%

::set CONF="Unicode Debug"
set CONF="Unicode Release"

pushd "..\notepad-plus-plus\scintilla\win32"
nmake NOBOOST=1 -f scintilla.mak clean
nmake NOBOOST=1 -f scintilla.mak
popd
xcopy /i "..\notepad-plus-plus\scintilla\bin\SciLexer.dll" %DESTDIR%

pushd "..\notepad-plus-plus\PowerEditor\visual.net"
msbuild notepadPlus.vs2015.vcxproj /target:clean /p:configuration=%CONF% /p:platform=x64
msbuild notepadPlus.vs2015.vcxproj /p:configuration=%CONF% /p:platform=x64
popd

xcopy /i "..\notepad-plus-plus\PowerEditor\bin\NppShell.dll" %DESTDIR%
xcopy /i "..\notepad-plus-plus\PowerEditor\bin\NppShell64.dll" %DESTDIR%
xcopy /i "..\notepad-plus-plus\PowerEditor\bin\change.log" %DESTDIR%
xcopy /i "..\notepad-plus-plus\PowerEditor\bin\license.txt" %DESTDIR%
xcopy /i "..\notepad-plus-plus\PowerEditor\bin\readme.txt" %DESTDIR%

xcopy /i "..\notepad-plus-plus\PowerEditor\bin64\notepad++.exe" %DESTDIR%
xcopy /i "..\notepad-plus-plus\PowerEditor\bin64\config.model.xml" %DESTDIR%
xcopy /i "..\notepad-plus-plus\PowerEditor\bin64\contextMenu.xml" %DESTDIR%
xcopy /i "..\notepad-plus-plus\PowerEditor\bin64\functionList.xml" %DESTDIR%
xcopy /i "..\notepad-plus-plus\PowerEditor\bin64\langs.model.xml" %DESTDIR%
xcopy /i "..\notepad-plus-plus\PowerEditor\bin64\shortcuts.xml" %DESTDIR%
xcopy /i "..\notepad-plus-plus\PowerEditor\bin64\stylers.model.xml" %DESTDIR%

pause
