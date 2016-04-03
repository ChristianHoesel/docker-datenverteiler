#!/bin/bash
. ../../../skripte-bash/einstellungen.sh

#Um alles zu exportieren, keinen Bereich angeben
#bereiche=
bereiche=kb.kv.dambach,kb.tmAnzeigenGlobal,kb.tmAnzeigenGlobalZwischenschicht,kb.tmAnzeigenGlobalZwischenschichtTls,kb.tmDarstellungAnzeigeQuerschnitt,kb.tmNbaGlobal,kb.tmRechner,kb.tmUsv,kb.tmVewEngstellenGlobal
$java \
 -cp ../../../distributionspakete/de.bsvrz.puk.config/de.bsvrz.puk.config-runtime.jar \
 -Xmx300m \
 de.bsvrz.puk.config.main.ConfigurationApp \
 -export=$bereiche \
 -verzeichnis=../xml \
 -verwaltung=../config/verwaltungsdaten.xml \
 $debugDefaults \
 -debugLevelStdErrText=INFO \
 -debugLevelFileText=CONFIG \

