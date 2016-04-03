#!/bin/bash
. ../../../skripte-bash/einstellungen.sh

#Um alles zu exportieren, keinen Bereich angeben
#bereiche=
bereiche=kb.kv.kappich,kb.fachModellGlobal,kb.ilse,kb.metaModellGlobal,kb.objekteIntegrationsTestTools,kb.objekteTestSystem,kb.objekteTestUnterzentraleK2S_10_MessQuerschnitte,kb.objekteTestUnterzentraleK2S_100_MessQuerschnitte,kb.objekteZugriffsrechteBasis,kb.systemModellAoe,kb.systemModellGlobal,kb.tmBuVGlobal,kb.tmIlseTls,kb.tmVewBetriebGlobal,kb.tmVewSimulationGlobal

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

