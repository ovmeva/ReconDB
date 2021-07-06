for i in ls data/; do
inputfile=$i
cat data/$i | while read host; do
echo "INSERT INTO domains (domainname,src,timestamp) VALUES ('$host','$imputfile',now());"
done | sudo mysql -uroot -p'' recondb;
done
