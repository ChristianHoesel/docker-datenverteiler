@echo off
call ..\..\..\skripte-dosshell\einstellungen.bat

title Import

set bereiche=kb.kv.basissystem

%java% ^
 -cp ..\..\..\distributionspakete\de.bsvrz.puk.config\de.bsvrz.puk.config-runtime.jar ^
 -Xmx300m ^
 de.bsvrz.puk.config.main.ConfigurationApp ^
 -import=%bereiche% ^
 -verzeichnis=..\xml ^
 -verwaltung=..\config\verwaltungsdaten.xml ^
 %debugDefaults% ^
 -debugLevelStdErrText=INFO ^
 -debugLevelFileText=CONFIG


rem Fenster nicht sofort wieder schlie�en, damit eventuelle Fehler noch lesbar sind.
pause