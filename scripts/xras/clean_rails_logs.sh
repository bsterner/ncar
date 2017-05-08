#!/bin/bash

find . -name development.log -o -name test.log -o -name server.log | xargs -I {} rm {}
