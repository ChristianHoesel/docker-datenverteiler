@echo off
call ..\..\..\skripte-dosshell\einstellungen.bat

title KonfigBrowser

%java% ^
 -cp ..\..\..\distributionspakete\de.kappich.pat.configBrowser\de.kappich.pat.configBrowser-runtime.jar ^
 -Xmx200m ^
 %lookAndFeel% ^
 de.kappich.pat.configBrowser.main.ConfigConfigurationViewer ^
 -konfiguration=..\config\verwaltungsdaten.xml ^
 %debugDefaults% ^
 -debugLevelStdErrText=WARNING ^
 -debugLevelFileText=CONFIG


rem Fenster nicht sofort wieder schlieﬂen, damit eventuelle Fehler noch lesbar sind.
pause

