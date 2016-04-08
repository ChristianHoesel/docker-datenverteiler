#!/bin/bash

# In das Verzeichnis des Skripts wechseln, damit relative Pfade funktionieren
cd `dirname $0`

. einstellungen.sh

# Datenverteiler im Hintergrund starten
$java \
 -cp ../distributionspakete/de.bsvrz.dav.dav/de.bsvrz.dav.dav-runtime.jar \
 -Xmx200m \
 de.bsvrz.dav.dav.main.Transmitter \
 ${dav1einstellungen} \
 -datenverteilerId=1575978394602962963 \
 -rechtePruefung=nein \
 -debugLevelStdErrText=NONE \
 -debugLevelFileText=CONFIG \
 -warteAufParametrierung=nein \
 &

# Zwei Sekunden warten bis der Datenverteiler Verbindungen akzeptiert
sleep 2

# Konfiguration im Hintergrund starten
$java \
 -cp ../distributionspakete/de.bsvrz.puk.config/de.bsvrz.puk.config-runtime.jar \
 -Xmx300m \
 de.bsvrz.puk.config.main.ConfigurationApp \
 ${dav1OhneAuthentifizierung} \
 -benutzer=configuration \
 -authentifizierung=../properties/passwd \
 -verwaltung=../konfiguration/verwaltungsdaten.xml \
 -benutzerverwaltung=../konfiguration/benutzerverwaltung.xml \
 -debugLevelStdErrText=NONE \
 -debugLevelFileText=CONFIG \
 &

# Parametrierung im Hintergrund starten
$java -Xmx1500m -jar ../distributionspakete/de.bsvrz.puk.param/de.bsvrz.puk.param-runtime.jar $dav1 \
	-persistenzModul=de.bsvrz.puk.param.param.DerbyPersistenz \
	-persistenz=../parameter \
	-parametrierung= \
	-cacheGroesse=200000 \
	-oldDefault=nein \
	-debugLevelStdErrText=INFO \
	-debugLevelFileText=CONFIG \
	-debugSetLoggerAndLevel=:CONFIG & 

# Betriebsmeldungsverwaltung im Hintergrund starten
$java \
 -cp ../distributionspakete/de.kappich.vew.bmvew/de.kappich.vew.bmvew-runtime.jar \
 de.kappich.vew.bmvew.main.SimpleMessageManager \
 ${dav1} \
 -debugLevelStdErrText=NONE \
 -debugLevelFileText=CONFIG

