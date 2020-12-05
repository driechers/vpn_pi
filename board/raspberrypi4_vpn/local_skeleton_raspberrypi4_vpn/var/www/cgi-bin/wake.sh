#!/bin/bash

echo "Content-type: text/html"
echo ""
echo "<html>"
echo "<head>"
echo "<title>Wake On LAN</title>"
echo "</head>"
echo "<body>"        
echo "<h1>Hosts</h1>"
      
host=0                 
while IFS= read -r line
do                               
    echo "$line" | sed 's/,.*$//'                            
    echo '<a href="/cgi-bin/wake.sh?host='"$host"'">Wake</a>'
    echo '<br>'
    ((host++))      
done < /etc/wake.csv
              
echo "</body>"
echo "</html>"
                         
if [ -n "$QUERY_STRING" ]
then                                                              
    lineno=$(echo "$QUERY_STRING" | sed 's/^host=\([0-9]+\)$/\1/')
    if [ -n "$lineno" ]
    then            
        ((lineno++))                                             
        MAC=$(sed -n "$lineno"p < /etc/wake.csv | sed 's/^.*,//')
        ether-wake "$MAC"
    fi
fi
