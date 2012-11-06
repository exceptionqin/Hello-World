#!/bin/bash

if [ $# -lt 1 ];then
	echo "Parameter error,at least one parameter for date(YYMMDD)"
	exit
fi

dt=$1
source /home/pplive/.bashrc
source $BIP_HOME/scripts/daily/env.sh
sh $BIP_HOME/scripts/warehouse/all.sh $dt

touch /home/pplive/data/datawarehouse/done

sh $BIP_HOME/scripts/warehouse_v2/startall.sh $dt

touch /home/pplive/data/newdatawarehouse/done

#global play data report which not depend on userpool
sh $BIP_HOME/scripts/reports-hiveapp/globalplaydata/globalplay_productline_run_daily.sh $dt

#uv pool calculate
sh $BIP_HOME/scripts/uv-pool/uvpoolbuild.sh $dt all

#vas uv pool calculate
sh $BIP_HOME/scripts/uv-pool/vaspoolbuild.sh $dt

#global play data report depend on userpool
sh $BIP_HOME/scripts/reports-hiveapp/globalplaydata/globalplay_productline_newadded_daily_run.sh $dt &

sleep 60

#copyright top200
sh $BIP_HOME/scripts/reports-hiveapp/vvtopn/vvtopn_daily.sh $dt &

sleep 60

#warehouse userpool dependent
#sh $BIP_HOME/scripts/warehouse/userpool_dependent.sh $dt &
sh $BIP_HOME/scripts/warehouse_v2/startuserpooldependent.sh $dt
touch /home/pplive/data/newdatawarehouse/done
sleep 60

#channles,cannot run parallel with fourchannels
sh $BIP_HOME/scripts/reports-hiveapp/channels/channels_daily.sh $dt 

#fourchannels
sh $BIP_HOME/scripts/reports-hiveapp/fourchannels/fourchannels_daily.sh $dt &

sleep 60

#channles instation,cannot run parallel with fourchannels intsation
sh $BIP_HOME/scripts/reports-hiveapp/channels/channels_daily_instation.sh $dt 

#fourchannels
sh $BIP_HOME/scripts/reports-hiveapp/fourchannels/fourchannels_daily_instation.sh $dt &

sleep 60


#frontchannels
sh $BIP_HOME/scripts/reports-hiveapp/frontchannels/frontchannels_daily.sh $dt &

sleep 60

#partner_channelcategory
sh $BIP_HOME/scripts/reports-hiveapp/partner_channelcategory/partner_channelcategory.sh $dt &

sleep 60

#channel traffic calculate
sh $BIP_HOME/scripts/aggregate-data/calc_pltb_channeltraffic.sh $dt


bip -datacalculate -dt $dt > ~/logs/scripts/datacalculate.$dt
bip reload -name adscalc

#calcaulte real user for finance
sh $BIP_HOME/scripts/reports-hiveapp/bppinfo_distrition/finance.sh

exit
