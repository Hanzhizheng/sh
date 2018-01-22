t=`date +%Y-%m-%d`
query=$1
file=$2
echo 'Query:' $query
echo 'File:' $file
lines=`grep -n ${query} ${file}`
echo '------'
echo 'Line:' ${lines%%:*}
first=${lines%%:*}
echo 'First:' ${first}
last=`cat ${file} | wc -l`
echo 'Last:' ${last}
`awk "NR==${first},NR==${last}" ${file} > ${t}.log`
if [ -f ${t}.log ]
then
    `mv ${t}.log /var/www/html`
fi
