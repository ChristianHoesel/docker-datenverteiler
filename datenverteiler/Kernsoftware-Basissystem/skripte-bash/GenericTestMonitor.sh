#!/bin/bash

# In das Verzeichnis des Skripts wechseln, damit relative Pfade funktionieren
cd `dirname $0`

. einstellungen.sh

# GTM im Hintergrund starten:
$java \
 -cp ../distributionspakete/de.bsvrz.pat.sysbed/de.bsvrz.pat.sysbed-runtime.jar \
 -Xmx300m \
 de.bsvrz.pat.sysbed.main.GenericTestMonitor \
 ${dav1} \
 -debugLevelStdErrText=WARNING \
 -debugLevelFileText=CONFIG \
 &

# Auf das Ende von allen im Hintergrund gestarteten Prozessen warten
wait
