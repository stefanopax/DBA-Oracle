#! /bin/sh

AMBIENTE=""
SISTEMA=""
COUNTRY=""

while  [ "$AMBIENTE" != "TEST" -a "$AMBIENTE" != "PROD" -a "$AMBIENTE" != "prod"  -a "$AMBIENTE" != "test" ]; do
	echo "Ambiente: [TEST,PROD]: "; read AMBIENTE
done;

while [ "$SISTEMA" != "EPS" -a "$SISTEMA" != "FPS" -a "$SISTEMA" != "eps" -a "$SISTEMA" != "fps" ]; do
	echo "Sistema [EPS,FPS]: "; read SISTEMA
done

if [ "$SISTEMA" = "EPS" -o "$SISTEMA" = "eps" ]; then
	while [ "$COUNTRY" != "ITA" -a "$COUNTRY" != "ita" -a "$COUNTRY" != "UK" -a "$COUNTRY" != "uk" ]; do
		echo "Country [ITA,UK]: "; read COUNTRY
	done
fi


while [ "$APPLICAZIONE" != "GW" -a "$APPLICAZIONE" != "IGFS" -a "$APPLICAZIONE" != "MPI" -a "$APPLICAZIONE" != "ACS" -a "$APPLICAZIONE" != "FTFS" -a "$APPLICAZIONE" != "GT" -a "$APPLICAZIONE" != "gw" -a "$APPLICAZIONE" != "igfs" -a "$APPLICAZIONE" != "mpi" -a "$APPLICAZIONE" != "acs" -a "$APPLICAZIONE" != "ftfs" -a "$APPLICAZIONE" != "gt" -a "$APPLICAZIONE" != "ACFS" -a "$APPLICAZIONE" != "acfs" ]; do
	
	echo "Country [GW,IGFS,MPI,ACS,FTFS(GT)]: "; read APPLICAZIONE

done


AMBIENTE=$( echo $AMBIENTE | tr '[:lower:]' '[:upper:]')
ambiente=$( echo $AMBIENTE | tr '[:upper:]' '[:lower:]')
SISTEMA=$( echo $SISTEMA | tr '[:lower:]' '[:upper:]')
sistema=$( echo $SISTEMA | tr '[:upper:]' '[:lower:]')
COUNTRY=$( echo $COUNTRY | tr '[:lower:]' '[:upper:]')
country=$( echo $COUNTRY | tr '[:upper:]' '[:lower:]')
APPLICAZIONE=$( echo $APPLICAZIONE | tr '[:lower:]' '[:upper:]')
applicazione=$( echo $APPLICAZIONE | tr '[:upper:]' '[:lower:]')

if [ $SISTEMA = "EPS" ]; then
	VAR1=$(ls -1 | grep $AMBIENTE | grep $sistema | grep $country | grep $APPLICAZIONE | wc -l)
else
	VAR1=$(ls -1 | grep $AMBIENTE | grep $sistema | grep $APPLICAZIONE | wc -l)
fi

if [ $VAR1 -eq 0 ]; then
	echo "non ci sono TEMPLATE adeguati per la creazione dello schema" 
	exit;
elif [ $VAR1 -gt 1 ]; then 
	echo "verificare la configurazione dei template, i valori inseriti producono piu di un risultato"
	exit;
else
	if [ $SISTEMA = "EPS" ]; then
        	TEMPLATE=$( ls -1 | grep $AMBIENTE | grep $sistema | grep $country | grep $APPLICAZIONE )
	else
        	TEMPLATE=$( ls -1 | grep $AMBIENTE | grep $sistema | grep $APPLICAZIONE )
	fi

	./crea_script.sh $TEMPLATE

fi
