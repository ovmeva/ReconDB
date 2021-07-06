#run crtsh
echo "running crtsh"
crtsh $1 |tee -a ~/reconscripts/data/crtsh
#run amass
echo "running amass"
amass enum --passive -d $1 -json $1.json
jq .name $1.json | sed "s/\"//g" | tee -a ~/reconscripts/data/amass

#run sublist3r
echo "running sublist3r"
python ~/tools/Sublist3r/sublist3r.py -d $1 -o ~/reconscripts/data/sublist3r -t 75

cat $src | while read host; do
   echo "INSERT INTO domains (domainname, src, timestamp) VALUES ('$host','');"
done | sudo mysql -uroot -p'' recondb;
