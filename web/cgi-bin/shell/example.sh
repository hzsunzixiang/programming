#!/bin/bash

echo "Content-type: text/html"
echo ""



# http://192.168.1.102//cgi-bin/shell/example.sh?username=hello&whatToDo=create&subbtn=Submit

# QUERY_STRING="username=hello&whatToDo=create&subbtn=Submit"

# echo $QUERY_STRING

USERNAME=`echo "$QUERY_STRING" | sed -n 's/^.*username=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"`

#echo $USERNAME
WHATTODO=`echo "$QUERY_STRING" | sed -n 's/^.*whatToDo=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"`
SUBBTN=`echo "$QUERY_STRING" | sed -n 's/^.*subbtn=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"`

echo "<html><head><title>What You Said</title></head>"

echo "<body>Here's what you said:"
echo "You entered \"$USERNAME\" for username and wanted the action to be \"$WHATTODO\", the button is $SUBBTN"
echo "</body></html>" 
