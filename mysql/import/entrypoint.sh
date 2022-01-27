#!/bin/bash

HOST=$1
USER=$2
PASS=$3
NAME=$4
FILE=$5

STATEMENT="SET foreign_key_checks = 0; "
STATEMENT="${STATEMENT} SET UNIQUE_CHECKS = 0; "
STATEMENT="${STATEMENT} SET AUTOCOMMIT = 0; "
STATEMENT="${STATEMENT} source ${FILE}; "
STATEMENT="${STATEMENT} SET foreign_key_checks = 1; "
STATEMENT="${STATEMENT} SET UNIQUE_CHECKS = 1; "
STATEMENT="${STATEMENT} SET AUTOCOMMIT = 1; "
STATEMENT="${STATEMENT} COMMIT; "

mysql --host="${HOST}" --user="${USER}" --password="${PASS}" "${NAME}" -e "${STATEMENT}"