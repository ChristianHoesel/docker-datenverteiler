#!/bin/bash
. ../../../skripte-bash/einstellungen.sh

$java \
 -cp ../../../distributionspakete/de.bsvrz.puk.config/de.bsvrz.puk.config-runtime.jar \
 -Xmx300m \
 de.bsvrz.puk.config.main.ConfigurationApp \
 -freigabeaktivierung \
 -verwaltung=../config/verwaltungsdaten.xml \
 $debugDefaults \
 -debugLevelStdErrText=INFO \
 -debugLevelFileText=CONFIG \

