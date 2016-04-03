#!/bin/bash
. einstellungen.sh

# StartStopp starten:

$java \
-classpath ../../distributionspakete/de.bsvrz.sys.startstopp/de.bsvrz.sys.startstopp.jar:\
../../distributionspakete/de.bsvrz.sys.startstopp/lib/jdom.jar:\
../../distributionspakete/de.bsvrz.sys.startstopp/lib/xercesImpl.jar:\
../../distributionspakete/de.bsvrz.sys.funclib.operatingMessage/de.bsvrz.sys.funclib.operatingMessage.jar:\
../../distributionspakete/de.bsvrz.dav.daf/de.bsvrz.dav.daf.jar:\
../../distributionspakete/de.bsvrz.sys.funclib.application/de.bsvrz.sys.funclib.application.jar:\
../../distributionspakete/de.bsvrz.sys.funclib.asyncReceiver/de.bsvrz.sys.funclib.asyncReceiver.jar:\
../../distributionspakete/de.bsvrz.sys.funclib.commandLineArgs/de.bsvrz.sys.funclib.commandLineArgs.jar:\
../../distributionspakete/de.bsvrz.sys.funclib.debug/de.bsvrz.sys.funclib.debug.jar:\
../../distributionspakete/de.bsvrz.sys.funclib.crypt/de.bsvrz.sys.funclib.crypt.jar:\
../../distributionspakete/de.bsvrz.sys.funclib.concurrent/de.bsvrz.sys.funclib.concurrent.jar:\
../../distributionspakete/de.bsvrz.sys.funclib.dataSerializer/de.bsvrz.sys.funclib.dataSerializer.jar:\
../../distributionspakete/de.bsvrz.sys.funclib.timeout/de.bsvrz.sys.funclib.timeout.jar \
 -Xmx300m \
 de.bsvrz.sys.startstopp.skriptvew.StartStoppApp \
 ${dav1} \
 -debugLevelStdErrText=WARNING \
 -debugLevelFileText=CONFIG \
 -startStoppKonfiguration=../../startStopp \
 -reset=true \
 -port=4711

# Auf das Ende von allen im Hintergrund gestarteten Prozessen warten
wait
