#!/bin/bash

# In das Verzeichnis des Skripts wechseln, damit relative Pfade funktionieren
cd `dirname $0`

. einstellungen.sh

java $jvmargs -cp ../distributionspakete/de.bsvrz.sys.startstopp/de.bsvrz.sys.startstopp-runtime.jar  de.bsvrz.sys.startstopp.skriptvew.StartStoppApp \
 	-reset=true \
 	-port=2323 \
 	-startStoppKonfiguration=startStopp \
 	-versionieren=StartStopp.xml \
 	-debugFilePath=../debug \
	-debugLevelStdErrText=FINEST \
	-debugLevelFileText=FINEST \
	-debugSetLoggerAndLevel=FINEST & 

