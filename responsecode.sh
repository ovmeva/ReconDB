for d in $(sudo -i mysql -sN -e 'select domainname from recondb.domains where alive=1'); do
#get all the hosts with the flag alive=1

        if [ $(curl -o /dev/null --silent --head --write-out '%{http_code}\n' --max-time 5.5 $d) -eq 000 ]; then
        #if hit a domain on a closed 80 port -> 800
        #get response code from 443
                curl -o /dev/null --silent --head --write-out '%{http_code}\n' --max-time 5.5 -k https://$d
                #insert the response code from 443 into db
        else
                #insert the response code from 80 into the db
        fi
done
