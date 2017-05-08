#!/bin/bash

. .env

# docker run -d \
#   --volume /Users/bsterner/shared:/usr/local/share/network \
#   --name $CONTAINER_NAME \
#     $IMAGE_NAME

# LDAP_ORGANISATION: Organisation name. Defaults to Example Inc.
# LDAP_DOMAIN: Ldap domain. Defaults to example.org
# LDAP_BASE_DN: Ldap base DN. If empty automatically set from LDAP_DOMAIN value. Defaults to (empty)
# LDAP_ADMIN_PASSWORD Ldap Admin password. Defaults to admin
# LDAP_CONFIG_PASSWORD Ldap Config password. Defaults to config
# LDAP_READONLY_USER Add a read only user. Defaults to false
# LDAP_READONLY_USER_USERNAME Read only user username. Defaults to readonly
# LDAP_READONLY_USER_PASSWORD Read only user password. Defaults to readonly

# LDAP_ORGANISATION=University Corporation for Atmospheric Research
# LDAP_DOMAIN: Ldap domain. Defaults to example.org
# LDAP_BASE_DN: Ldap base DN. If empty automatically set from LDAP_DOMAIN value.

. .env

docker run \
  --env LDAP_ORGANISATION="University Corporation for Atmospheric Research" \
  --env LDAP_DOMAIN="ucar.edu" \
  --env LDAP_ADMIN_PASSWORD="password" \
  --env LDAP_READONLY_USER=true \
  --env LDAP_BASE_DN=dc=ucar,dc=edu \
  --name $CONTAINER_NAME \
  --volume /Users/bsterner/shared:/tmp/shared \
  -p 389:389 \
  --detach osixia/openldap:1.1.8

# ldapsearch -H ldap://localhost -b dc=ucar,dc=edu
# ldapadd -Y EXTERNAL -H ldapi:/// -f ucar_ldap_schema.ldif

# Use these
# ldapsearch -x -H ldap://localhost -b dc=ucar,dc=edu -D "cn=admin,dc=ucar,dc=edu" -w password
# ldapadd -x -H ldap://localhost -D "cn=admin,dc=ucar,dc=edu" -w password -f ucar_ldap.dump
#
# ldapsearch -Wx -D "cn=admin,dc=ucar,dc=edu" -b "dc=ucar,dc=edu" -H ldap://localhost -LLL > ldap_dump-20100525-1.ldif
# ldapadd -Wx -D "cn=admin,dc=ucar,dc=edu" -H ldap://localhost -f ldap_dump-20100525-1.ldif
