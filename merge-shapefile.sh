#!/usr/bin/env bash

FEATURE_TYPE="$1"
TARGET_FILE="maastokartta_100k/${FEATURE_TYPE}.shp"
SOURCE_FILES="$(find maastokartta_100k/work -iname *_${FEATURE_TYPE}.shp)"

export SHAPE_ENCODING="ISO-8859-1"

for i in ${SOURCE_FILES}
do
  if [ -f "${TARGET_FILE}" ]
  then
    echo "merging $i to $TARGET_FILE"
    ogr2ogr -f "ESRI Shapefile" -update -append "${TARGET_FILE}" $i -nln "${FEATURE_TYPE}"
  else
    echo "creating output file ${TARGET_FILE}"
    ogr2ogr -f "ESRI Shapefile" "${TARGET_FILE}" $i -lco ENCODING=UTF-8
  fi
done
