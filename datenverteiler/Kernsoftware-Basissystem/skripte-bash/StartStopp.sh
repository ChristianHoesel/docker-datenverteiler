#!/bin/bash

# In das Verzeichnis des Skripts wechseln, damit relative Pfade funktionieren
cd `dirname $0`

. einstellungen.sh

java $jvmargs -cp ../distributionspakete/de.bsvrz.sys.startstopp/de.bsvrz.sys.startstopp-runtime.jar  de.bsvrz.sys.startstopp.skriptvew.StartStoppApp \
	-startStoppKonfiguration=startStopp \
 	-reset=true \
 	-port=2323 \
 	-rechner=localhost \
 	-debugFilePath=../debug \
	-debugLevelStdErrText=NONE \
	-debugLevelFileText=FINEST \
	-debugSetLoggerAndLevel=:FINEST & 

