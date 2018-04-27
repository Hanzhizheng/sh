t=`date +%Y-%m-%d`
query=$1
file=$2
echo 'Query:' $query
echo 'File:' $file
lines=`grep -an ${query} ${file}`
echo '------'
echo 'Line:' ${lines%%:*}
first=${lines%%:*}
echo 'First:' ${first}
last=`cat ${file} | wc -l`
echo 'Last:' ${last}
log="${query}.log"
`sed -n "${first},${last}p" ${file} > $log`
if [ -f $log ]
then
    `mv $log ~/`
fi
echo 'Done'
