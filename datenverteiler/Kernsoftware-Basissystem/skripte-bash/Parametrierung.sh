#!/bin/bash

# In das Verzeichnis des Skripts wechseln, damit relative Pfade funktionieren
cd `dirname $0`

#########################################################################
#                                                                       #
#         Startskript für die SWE8.2 - Parametrierung                   #
#                                                                       #
#  Das Skript ist als Beispiel zu betrachten und muss eventuell an die  #
#  Gegebenheiten des lokalen Projektes angepasst werden.                #
#                                                                       #
#  Es wird angenommen, dass die Kernsoftware gemäß der allgmeinen       #
#  installiert wurde, insbesondere die Installation der SWE in einzel-  #
#  Unterverzeichnissen unter dem Verzeichnis "distributionspakete"      #
#  und die Existenz einer allgemeinen Einstellungsdatei                 #
#  "einstellungen.bat" im Verzeichnis "../../skripte-bash" relativ      #
#  zum Verzeichnis in dem dieses Skript residiert, in dem die allge-    #
#  meinen Parameter für die Datenverteilerkopplung festgelegt sind.     #
#                                                                       #
#########################################################################
#  Folgende Parameter die aus der Datei einstellungen.sh ermittelt      #
#  werden müssen überprüft und evtl. angepasst werden.                  #
#########################################################################
#  Parameter für den Java-Interpreter                                   #
#  jvmArgs="-Dfile.encoding=ISO-8859-1"                                 #
#                                                                       #
#  Parameter für den Datenverteiler                                     #
#  dav1="-datenverteiler=localhost:8083 -benutzer=Tester \              # 
#           -authentifizierung=passwd -debugFilePath=.."                #
#########################################################################

. einstellungen.sh

#########################################################################
#                                                                       #
#          Parameter für die Ausführung der Parametrierung              #
#                                                                       #
#########################################################################

#########################################################################
#                                                                       #
#  Das Persistenzmodul                                                  #
#                                                                       #
#  Standardmässig wird eine eingebette Datenbank verwendet, es stehen   #
#  jedoch auch andere alternative Persistenzmodule zur Verfügung        #
#  (siehe Betriebsinformationen), ausserdem kann das Persistenzmodul    #
#  auch ein von Anwender selbst erstelltes sein, das lediglich die      # 
#  erforderlichen Schnittstellen implementieren muss.                   #
#                                                                       #
#########################################################################

PERSISTENZMODUL=de.bsvrz.puk.param.param.DerbyPersistenz

#########################################################################
#                                                                       #
#  Das Wurzelverzeichnis, in dem das Persistenzmodul, die Parameter-    #
#  datensätze ablegt.                                                   #
#                                                                       #
#########################################################################

PERSISTENZ=../parameter

#########################################################################
#                                                                       #
#  Die PID des Systemobjekts innerhalb der Datenverteilerkonfiguration, #
#  das für die Speicherung der Parameter verwendet wird. Es muss vom    #
#  Typ "Parametrierung" sein. Wenn keine PID angegeben wird, wird die   #
#  AOE des Projekts verwendet, die den Typ "Parametrierung" erweitert.  #
#                                                                       #
#########################################################################

PARAMETRIERUNG=

#########################################################################
#                                                                       #
#  Die Anzahl der Einträge, für die das Persitenzmodul die Daten für    #
#  einen effektiveren Zugriff im RAM vorhält. Der Parameter wird momen- #
#  tan nur von der Derby-Persistenz verwendet.                          #
#                                                                       #
#########################################################################

CACHE=200000

#########################################################################
#                                                                       #
#  Verwendung von Standardparametern die unter dem Aspekt               #
#  "asp.parameterDefault" konfiguriert sind.                            #
#  Die Variante ist aus Kompatibilitätsgründen zu temporären Vorgänger- #
#  versionen möglich, wird aber normalerweise nicht verwendet.          #
#                                                                       #
#########################################################################

OLDDEFAULT=nein

#########################################################################
#                                                                       #
#  Zusätzliche Parameter für den Start der Java-VM                      #
#                                                                       #
#########################################################################

additionalJvmargs=-Xmx1500m

#########################################################################
#                                                                       #
#                  Ausführung der Softwareeinheit                       #
#                                                                       #
#  Ab hier darf in dem Skript keine Änderung mehr vorgenommen werden.   #
#                                                                       #
#########################################################################

java $jvmargs $additionalJvmargs -jar ../distributionspakete/de.bsvrz.puk.param/de.bsvrz.puk.param-runtime.jar $dav1 \
	-persistenzModul=$PERSISTENZMODUL \
	-persistenz=$PERSISTENZ \
	-parametrierung=$PARAMETRIERUNG \
	-cacheGroesse=$CACHE \
	-oldDefault=$OLDDEFAULT \
	-debugLevelStdErrText=INFO \
	-debugLevelFileText=CONFIG \
	-debugSetLoggerAndLevel=:CONFIG & 
