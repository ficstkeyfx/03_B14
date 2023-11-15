#!/bin/bash

if [[ $# -eq 0 ]]; then
    echo "usage: $0 dataname datafile kmin kmax kinc <alg> [c plusplus]"
    echo "delete results files if necessary"
    exit
fi

dataname=$1
datafile=$2
kmin=$3
kmax=$4
kinc=$5
algChar=$6
echo dataname: $dataname
data="$datafile"
echo "datafile: $data"

bin='../../maxcut'
gen_k='../../gen_k_vals'

#params
e='0.1'
c='1'
N='1'
d='0.1'

if [[ "$algChar" = "G" ]]; then
    alg=SG
    output="./maxcutresults-${dataname}-SG.txt"
else
    if [[ "$algChar" = "M" ]]; then
	alg='MPL'
    else
	if [[ "$algChar" = "A" ]]; then
	    alg='AEFNS'
	    N='1'
	else
	    if [[ "$algChar" = "F" ]]; then
		alg='FKK'
		N='40'
	    else
		if [[ "$algChar" = "L" ]]; then
		    alg='LRVZ'
		    N='40'
		else
		    c=$7
		    pp=$8
		    if (( $pp == 1 )); then
			alg='LS+'
		    else
			alg='LS'
			d='1'
			c='1'
		    fi
		fi
	    fi
	fi
    fi
fi

if [[ "$output" = "" ]]; then
    output="./maxcutresults-${dataname}-${alg}.txt"
fi

echo $alg
echo "kmin=$kmin"
echo "kmax=$kmax"
echo "kinc=$kinc"
echo "c=$c"
echo "d=$d"
echo "e=$e"
echo "N=$N"
sleep 1

kvals=`$gen_k $data`
for k in ${kvals};
do
    if [[ "$alg" = "LS+" ]]; then
	###compute d
	d=`echo "$c * 0.5" | bc`
    fi
    cmd="$bin -g $data --alg=${alg} -k $k -N $N -o $output -c $c -d $d -e $e --lazy --nthreads=40"
    echo $cmd
    timeout 4h $cmd
    retVal=$?
    if [ $retVal -eq 124 ]; then
       echo "Timed out."
       exit
    fi
done


