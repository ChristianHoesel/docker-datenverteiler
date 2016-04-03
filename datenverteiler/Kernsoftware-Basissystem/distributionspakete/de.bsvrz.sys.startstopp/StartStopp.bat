rem @echo off
call einstellungen.bat

title StartStopp

java -cp ^
../distributionspakete/de.bsvrz.sys.startstopp/de.bsvrz.sys.startstopp.jar;^
../distributionspakete/de.bsvrz.sys.startstopp/lib/jdom.jar;^
../distributionspakete/de.bsvrz.sys.startstopp/lib/xercesImpl.jar;^
../distributionspakete/de.bsvrz.sys.funclib.operatingMessage/de.bsvrz.sys.funclib.operatingMessage.jar;^
../distributionspakete/de.bsvrz.dav.daf/de.bsvrz.dav.daf.jar;^
../distributionspakete/de.bsvrz.sys.funclib.application/de.bsvrz.sys.funclib.application.jar;^
../distributionspakete/de.bsvrz.sys.funclib.asyncReceiver/de.bsvrz.sys.funclib.asyncReceiver.jar;^
../distributionspakete/de.bsvrz.sys.funclib.commandLineArgs/de.bsvrz.sys.funclib.commandLineArgs.jar;^
../distributionspakete/de.bsvrz.sys.funclib.debug/de.bsvrz.sys.funclib.debug.jar;^
../distributionspakete/de.bsvrz.sys.funclib.crypt/de.bsvrz.sys.funclib.crypt.jar;^
../distributionspakete/de.bsvrz.sys.funclib.concurrent/de.bsvrz.sys.funclib.concurrent.jar;^
../distributionspakete/de.bsvrz.sys.funclib.dataSerializer/de.bsvrz.sys.funclib.dataSerializer.jar;^
../distributionspakete/de.bsvrz.sys.funclib.timeout/de.bsvrz.sys.funclib.timeout.jar;^
 de.bsvrz.sys.startstopp.skriptvew.StartStoppApp  ^
 %dav1% ^
 -debugLevelStdErrText=WARNING ^
 -debugLevelFileText=CONFIG ^
 -startStoppKonfiguration=C:\kernsoftware-startstopp-r1\StartStopp ^
 -reset=true ^
 -port=6500

rem Fenster nicht wieder schlieﬂen, damit eventuelle Fehler noch lesbar sind.
pause

rem -versionieren=C:\kernsoftware-startstopp-r1\StartStopp\startStoppNeu.xml ^
