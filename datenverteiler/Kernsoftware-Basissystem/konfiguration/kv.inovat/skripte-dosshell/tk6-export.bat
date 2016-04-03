@echo off
call ..\..\..\skripte-dosshell\einstellungen.bat

title Export

rem Um alles zu exportieren, keinen Bereich angeben
rem set bereiche=
set bereiche=kb.kv.inovat,kb.tmEreignisKalenderGlobal,kb.tmGanglinienGlobal,kb.tmGeoReferenzierungGlobal,kb.tmKExTlsGlobal,kb.tmSystemKalenderGlobal,kb.tmTmcGlobal,kb.tmUmfeldDatenGlobal,kb.tmVerkehrGlobal

%java% ^
 -cp ..\..\..\distributionspakete\de.bsvrz.puk.config\de.bsvrz.puk.config-runtime.jar ^
 -Xmx300m ^
 de.bsvrz.puk.config.main.ConfigurationApp ^
 -export=%bereiche% ^
 -verzeichnis=..\xml ^
 -verwaltung=..\config\verwaltungsdaten.xml ^
 %debugDefaults% ^
 -debugLevelStdErrText=INFO ^
 -debugLevelFileText=CONFIG


rem Fenster nicht sofort wieder schlie�en, damit eventuelle Fehler noch lesbar sind.
pause