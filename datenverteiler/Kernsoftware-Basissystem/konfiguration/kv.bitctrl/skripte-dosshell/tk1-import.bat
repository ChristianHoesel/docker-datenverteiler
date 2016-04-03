@echo off
call ..\..\..\skripte-dosshell\einstellungen.bat

title Import

rem set bereiche=kb.objekteBenutzerrechte
rem set bereiche=kb.bitctrlAllgemein,kb.bitctrlEclipse,kb.tmDarstellungsObjekteGlobal,kb.datenFlussUeberwachung,kb.streckenprofil,kb.simParamTestModell
rem set bereiche=kb.bitctrl.bmv
rem set bereiche=kb.datenFlussUeberwachung
rem set bereiche=kb.tmMultimedia,kb.tmVizConnect

rem set bereiche=kb.tmKExTlsSiemensSST4Symbole

rem set bereiche=kb.tmNbaHan
rem kb.bitctrlAllgemein,kb.bitctrlEclipse,kb.tmDarstellungsObjekteGlobal,kb.datenFlussUeberwachung,kb.simParamTestModell,kb.bitctrl.bmv,kb.tmMultimedia,kb.tmVizConnect

rem set bereiche=kb.tmExtEreig
rem set bereiche=kb.tmZykExp
set bereiche=kb.tmKExTlsLufft


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


rem Fenster nicht sofort wieder schlieﬂen, damit eventuelle Fehler noch lesbar sind.
pause