#!/bin/bash
. ../../../skripte-bash/einstellungen.sh

bereiche=kb.default.basissystem,kb.basissystem.objekteBenutzer,kb.basissystem.objekteDatenverteiler

$java \
 -cp ../../../distributionspakete/de.bsvrz.puk.config/de.bsvrz.puk.config-runtime.jar \
 -Xmx300m \
 de.bsvrz.puk.config.main.ConfigurationApp \
 -import=$bereiche \
 -verzeichnis=../xml \
 -verwaltung=../config/verwaltungsdaten.xml \
 $debugDefaults \
 -debugLevelStdErrText=INFO \
 -debugLevelFileText=CONFIG \

