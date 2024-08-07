#!/bin/bash

# query a remote couchdb instance for a JSON payload,
# replace a field value of a document provided in a csv file
# and put it back on couchdb.
#
# expects a JSON format of:
# {
#    "_id": "39e62add-b651-4fa0-a06c-6ba8d63e9106",
#    "old_type": "health_center",
#    "contact_type": "c40_chw_area",
#    ...
#    "aire_de_sante": "Yirimadio"
# }

# Create a .csv file containing all the UUIDs of the Chw areas to be changed and call it "chw_areas.csv"
INPUT='contact_rename.csv'

# make URL variable for legibility
URL="http://admin:password@localhost:5984"
# URL="https://admin_username:password@app_URL"

# make sure INPUT is a valid file
{
if [ ! -f $INPUT ]; then
    echo "$INPUT not found!"
    exit 0
fi
}

# Assume the only colunm of you .csv is named contact_uuid
while IFS=, read -r contact_uuid 
do

curl $URL/medic/$contact_uuid -s | jq

   # Overwrite aire_de_sante of all the chw area with "Bakorobabougou"
   # curl $URL/medic/$contact_uuid -s | \
   #    jq ".aire_de_sante = \"Bakorobabougou\"" | \
   #     curl -H "content-type:application/json" -X PUT --data-binary @-  $URL/medic/$contact_uuid | \
   #     jq
   # echo " aire_de_sante sucessfully updated"
done < $INPUT