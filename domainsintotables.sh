inputfile=$1
cat $inputfile | while read host; do
   echo "INSERT INTO domains (domainname,src, timestamp) VALUES ('$host','$inputfile', now());"
done | sudo mysql -uroot -p'' recondb;
