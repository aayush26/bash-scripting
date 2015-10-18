echo -n "Enter the required table of: ";
read num
i=1
while [ $i -le 10 ]
do
echo "$num x $i = `expr $num "*" $i`"
i=`expr $i + 1`
done
