#!/bin/bash

# In das Verzeichnis des Skripts wechseln, damit relative Pfade funktionieren
cd `dirname $0`

#########################################################################
#                                                                       #
#         Startskript f�r die SWE8.2 - Parametrierung                   #
#                                                                       #
#  Das Skript ist als Beispiel zu betrachten und muss eventuell an die  #
#  Gegebenheiten des lokalen Projektes angepasst werden.                #
#                                                                       #
#  Es wird angenommen, dass die Kernsoftware gem�� der allgmeinen       #
#  installiert wurde, insbesondere die Installation der SWE in einzel-  #
#  Unterverzeichnissen unter dem Verzeichnis "distributionspakete"      #
#  und die Existenz einer allgemeinen Einstellungsdatei                 #
#  "einstellungen.bat" im Verzeichnis "../../skripte-bash" relativ      #
#  zum Verzeichnis in dem dieses Skript residiert, in dem die allge-    #
#  meinen Parameter f�r die Datenverteilerkopplung festgelegt sind.     #
#                                                                       #
#########################################################################
#  Folgende Parameter die aus der Datei einstellungen.sh ermittelt      #
#  werden m�ssen �berpr�ft und evtl. angepasst werden.                  #
#########################################################################
#  Parameter f�r den Java-Interpreter                                   #
#  jvmArgs="-Dfile.encoding=ISO-8859-1"                                 #
#                                                                       #
#  Parameter f�r den Datenverteiler                                     #
#  dav1="-datenverteiler=localhost:8083 -benutzer=Tester \              # 
#           -authentifizierung=passwd -debugFilePath=.."                #
#########################################################################

. einstellungen.sh

#########################################################################
#                                                                       #
#          Parameter f�r die Ausf�hrung der Parametrierung              #
#                                                                       #
#########################################################################

#########################################################################
#                                                                       #
#  Das Persistenzmodul                                                  #
#                                                                       #
#  Standardm�ssig wird eine eingebette Datenbank verwendet, es stehen   #
#  jedoch auch andere alternative Persistenzmodule zur Verf�gung        #
#  (siehe Betriebsinformationen), ausserdem kann das Persistenzmodul    #
#  auch ein von Anwender selbst erstelltes sein, das lediglich die      # 
#  erforderlichen Schnittstellen implementieren muss.                   #
#                                                                       #
#########################################################################

PERSISTENZMODUL=de.bsvrz.puk.param.param.DerbyPersistenz

#########################################################################
#                                                                       #
#  Das Wurzelverzeichnis, in dem das Persistenzmodul, die Parameter-    #
#  datens�tze ablegt.                                                   #
#                                                                       #
#########################################################################

PERSISTENZ=../parameter

#########################################################################
#                                                                       #
#  Die PID des Systemobjekts innerhalb der Datenverteilerkonfiguration, #
#  das f�r die Speicherung der Parameter verwendet wird. Es muss vom    #
#  Typ "Parametrierung" sein. Wenn keine PID angegeben wird, wird die   #
#  AOE des Projekts verwendet, die den Typ "Parametrierung" erweitert.  #
#                                                                       #
#########################################################################

PARAMETRIERUNG=

#########################################################################
#                                                                       #
#  Die Anzahl der Eintr�ge, f�r die das Persitenzmodul die Daten f�r    #
#  einen effektiveren Zugriff im RAM vorh�lt. Der Parameter wird momen- #
#  tan nur von der Derby-Persistenz verwendet.                          #
#                                                                       #
#########################################################################

CACHE=200000

#########################################################################
#                                                                       #
#  Verwendung von Standardparametern die unter dem Aspekt               #
#  "asp.parameterDefault" konfiguriert sind.                            #
#  Die Variante ist aus Kompatibilit�tsgr�nden zu tempor�ren Vorg�nger- #
#  versionen m�glich, wird aber normalerweise nicht verwendet.          #
#                                                                       #
#########################################################################

OLDDEFAULT=nein

#########################################################################
#                                                                       #
#  Zus�tzliche Parameter f�r den Start der Java-VM                      #
#                                                                       #
#########################################################################

additionalJvmargs=-Xmx1500m

#########################################################################
#                                                                       #
#                  Ausf�hrung der Softwareeinheit                       #
#                                                                       #
#  Ab hier darf in dem Skript keine �nderung mehr vorgenommen werden.   #
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
