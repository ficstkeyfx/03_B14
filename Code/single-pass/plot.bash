#!/bin/bash


alg[1]='SG'
alg[2]='AEFNS'
alg[3]='FKK'
alg[4]='LS'
alg[5]='LS+'

data[1]='ba'
data[2]='er'
data[3]='fb'
data[4]='pokec'
data[5]='slashdot'


for i in `seq 5 1 5`;
do
	python3 plot.py v 0 maxcutresults-${data[i]}-SG.txt maxcutresults-${data[i]}-AEFNS.txt maxcutresults-${data[i]}-FKK.txt maxcutresults-${data[i]}-LS.txt maxcutresults-${data[i]}-LS+.txt
	# python3 plot.py q 0 maxcutresults-${data[i]}-SG.txt maxcutresults-${data[i]}-AEFNS.txt maxcutresults-${data[i]}-FKK.txt maxcutresults-${data[i]}-LS.txt maxcutresults-${data[i]}-LS+.txt
	python3 plot.py m 1 maxcutresults-${data[i]}-SG.txt maxcutresults-${data[i]}-AEFNS.txt maxcutresults-${data[i]}-FKK.txt maxcutresults-${data[i]}-LS.txt maxcutresults-${data[i]}-LS+.txt

	# python3 revmax-plot.py v 0 revmaxresults-${data[i]}-SG.txt revmaxresults-${data[i]}-AEFNS.txt revmaxresults-${data[i]}-FKK.txt revmaxresults-${data[i]}-LS.txt revmaxresults-${data[i]}-LS+.txt
	# python3 revmax-plot.py q 0 revmaxresults-${data[i]}-SG.txt revmaxresults-${data[i]}-AEFNS.txt revmaxresults-${data[i]}-FKK.txt revmaxresults-${data[i]}-LS.txt revmaxresults-${data[i]}-LS+.txt
	# python3 revmax-plot.py m 0 revmaxresults-${data[i]}-SG.txt revmaxresults-${data[i]}-AEFNS.txt revmaxresults-${data[i]}-FKK.txt revmaxresults-${data[i]}-LS.txt revmaxresults-${data[i]}-LS+.txt
done