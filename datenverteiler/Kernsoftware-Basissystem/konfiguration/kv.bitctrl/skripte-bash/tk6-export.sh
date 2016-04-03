#!/bin/bash
. ../../../skripte-bash/einstellungen.sh

#Um alles zu exportieren, keinen Bereich angeben
#bereiche=
bereiche=kb.kv.bitctrl,kb.tmIsis,kb.tmKExEmailFaxGlobal,kb.tmKExLMStGlobal,kb.tmKExLMStTMCCodes,kb.tmVewUdaGlobal

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

