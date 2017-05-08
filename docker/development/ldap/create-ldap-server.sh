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
  --detach osixia/openldap:1.1.8

  # ldapsearch -x -H ldap://localhost -b dc=example,dc=org -D "cn=admin,dc=example,dc=org" -w admin
  # ldapsearch -H ldap://localhost -b dc=ucar,dc=edu
ldapadd -Y EXTERNAL -H ldapi:/// -f 
