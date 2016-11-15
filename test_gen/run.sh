#! /bin/bash

vertices=2000
idx=1
gcc graphGen.c -o ggen
g++ -std=c++11 gen.cpp -o gen
COUNTER=0
while [  $COUNTER -lt 5 ]; do
	x=$vertices
	let x=x*x*x
	calc=$(echo "sqrt ( $x )" | bc -l)
	edges=${calc%.*}
#echo $calc
#echo $edges
#edges=`shuf -i $vertices-$x -n 1`
	echo -e '2\n'$vertices'\n'$edges'\n1\n1\nvertex_cnt_in'$idx'\n0' > tmp
	./ggen < tmp
	y='vertex_cnt_in'$idx
	./gen < $y > tmp
	mv tmp $y
	let COUNTER=COUNTER+1
	let idx=idx+1
	let vertices=vertices+2000
	done

