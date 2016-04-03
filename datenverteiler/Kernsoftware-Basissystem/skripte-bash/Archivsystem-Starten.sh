#!/bin/bash

# In das Verzeichnis des Skripts wechseln, damit relative Pfade funktionieren.
cd `dirname $0`

# Allgemeine Einstellungen laden.
. einstellungen.sh


################################################################################
# Folgende Parameter müssen überprüft und evtl. angepasst werden.              #
################################################################################

# (1) Parameter für den Java-Interpreter, als Standard werden die Einstellungen
# aus einstellungen.sh verwendet. Kann verwendet werden, um eigene Parameter
# zu ergänzen.
jvmArgs="$jvmArgs -Xmx256m"

# (2) Das Persistenzverzeichnis ist das Verzeichnis in dem die archivierten
# Daten abgelegt werden.
persistenzVerzeichnis=../archiv/persistenz

# (3) Über die Telnetschnittstelle kann der aktuelle Status des Archivs erfragt
# werden. Wichtiger ist jedoch die Möglichkeit das Archivsystem per Telnet
# definiert zu beenden. Hier wird der zu verwendende Port für Telnet festgelegt.
kommandoPort=4242

# (4) Pfad zum Properties-File mit den für das Archivbackup notwendigen
# Einstellungen. Als Default ist ein Filesystem-Backup vorkonfiguriert.
backup=../properties/archiv.backup-filesystem.properties


################################################################################
# Ab hier muss nichts mehr angepasst werden.                                   #
################################################################################

# Klassenpfad für Kernsoftware
classpath=../distributionspakete/de.bsvrz.dav.daf/de.bsvrz.dav.daf-runtime.jar
classpath=$classpath:../distributionspakete/de.bsvrz.sys.funclib.commandLineArgs/de.bsvrz.sys.funclib.commandLineArgs-runtime.jar
classpath=$classpath:../distributionspakete/de.bsvrz.sys.funclib.communicationStreams/de.bsvrz.sys.funclib.communicationStreams-runtime.jar
classpath=$classpath:../distributionspakete/de.bsvrz.sys.funclib.dataIdentificationSettings/de.bsvrz.sys.funclib.dataIdentificationSettings-runtime.jar
classpath=$classpath:../distributionspakete/de.bsvrz.sys.funclib.dataSerializer/de.bsvrz.sys.funclib.dataSerializer-runtime.jar
classpath=$classpath:../distributionspakete/de.bsvrz.sys.funclib.debug/de.bsvrz.sys.funclib.debug-runtime.jar
classpath=$classpath:../distributionspakete/de.bsvrz.sys.funclib.operatingMessage/de.bsvrz.sys.funclib.operatingMessage-runtime.jar
classpath=$classpath:../distributionspakete/de.bsvrz.pat.onlprot/de.bsvrz.pat.onlprot-runtime.jar
classpath=$classpath:../distributionspakete/de.bsvrz.pat.sysbed/de.bsvrz.pat.sysbed-runtime.jar
classpath=$classpath:../distributionspakete/de.bsvrz.dav.dav/de.bsvrz.dav.dav-runtime.jar
classpath=$classpath:../distributionspakete/de.bsvrz.sys.funclib.concurrent/de.bsvrz.sys.funclib.concurrent-runtime.jar
classpath=$classpath:../distributionspakete/de.bsvrz.sys.funclib.hexdump/de.bsvrz.sys.funclib.hexdump-runtime.jar
#classpath=$classpath:../distributionspakete/de.bsvrz.puk.config/de.bsvrz.puk.config-runtime.jar
#classpath=$classpath:../distributionspakete/de.kappich.puk.param/de.kappich.puk.param-runtime.jar
#classpath=$classpath:../distributionspakete/de.kappich.vew.bmvew/de.kappich.vew.bmvew-runtime.jar

# Klassenpfad Archivsystem
classpath=$classpath:../distributionspakete/de.bsvrz.ars.ars/de.bsvrz.ars.ars.jar
classpath=$classpath:../distributionspakete/de.bsvrz.ars.ars/lib/Common.jar
classpath=$classpath:../distributionspakete/de.bsvrz.ars.ars/lib/keydox_complete.jar

# Applikation starten
$java $jvmArgs \
    -cp $classpath  \
    de.bsvrz.ars.ars.mgmt.ArchiveManager \
    $dav1 \
    -persistenzVerzeichnis=$persistenzVerzeichnis \
    -kommandoPort=$kommandoPort \
    -backup=$backup \
    -debugLevelStdErrText=NONE \
	-debugLevelFileText=CONFIG \
	&
