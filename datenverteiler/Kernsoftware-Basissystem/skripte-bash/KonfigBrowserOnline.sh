#!/bin/bash

# In das Verzeichnis des Skripts wechseln, damit relative Pfade funktionieren
cd `dirname $0`

. einstellungen.sh

$java \
 -cp ../distributionspakete/de.kappich.pat.configBrowser/de.kappich.pat.configBrowser-runtime.jar \
 -Xmx100m \
 de.kappich.pat.configBrowser.main.OnlineConfigurationViewer \
 ${dav1} \
 -debugLevelStdErrText=WARNING \
 -debugLevelFileText=CONFIG \
 &

# Auf das Ende von allen im Hintergrund gestarteten Prozessen warten
wait
