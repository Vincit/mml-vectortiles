#!/usr/bin/env bash

MERGE="$(pwd)/merge-shapefile.sh"

mkdir ~/mml/
cd ~/mml/

# Download
rsync -arPv tiedostot.kartat.kapsi.fi::mml/maastokartta_100k .

# Extract and reorganize
find ./maastokartta_100k/kaikki/etrs89/shp -iname *.zip -print0 | xargs -0 -n1 sh -c 'DIR="maastokartta_100k/work/$(basename -s .zip $0)"; mkdir -p $DIR; unzip -j $0 -d $DIR'

# Collect feature categories
FEATURE_TYPES="$(find maastokartta_100k/work/ -iname "*.shp" -print0 | xargs -0 basename -a -s .shp | cut -c 5- | sort | uniq -i | tr '\n' ' ')"

#rm -f maastokartta_100k/*.{shp,prj,shx,index,dbf,cpg}

# Merge shapes by category
for type in ${FEATURE_TYPES}
do
    "${MERGE}" $type
done

# Create index
find ./maastokartta_100k/ -maxdepth 1 -iname "*.shp" -print0 | xargs -n1 -0 shapeindex