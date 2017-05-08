#!/bin/bash

. ~/.profile

find $AMIELOCAL/logs/ -type f | xargs -I {} rm {}
find $AMIELOCAL/xfer/ -type f | xargs -I {} rm {}
psql -h localhost -U amie_central tgcdb <$DEV_DIR/scripts/delete_data.sql
