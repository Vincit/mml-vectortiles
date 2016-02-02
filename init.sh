#!/usr/bin/env bash

mkdir ~/mml/
cd ~/mml/

rsync -arPv tiedostot.kartat.kapsi.fi::mml/maastokartta_100k_jhs180 .
