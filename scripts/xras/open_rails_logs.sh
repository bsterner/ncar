#!/bin/bash

is=xras_xsede_identity_service
rs=xras_rules
as=xras_xsede_accounting_service

XRAS_DIR=~/Development/ijworkspace/xsede

OPEN $XRAS_DIR/$is/log/*.log
OPEN $XRAS_DIR/$rs/log/*.log
OPEN $XRAS_DIR/$as/log/*.log
