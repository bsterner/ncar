docker exec -it scratch-openldap-container /bin/bash
# docker exec scratch-openldap-container ldapsearch -x -H ldap://localhost -b dc=example,dc=org -D "cn=admin,dc=example,dc=org" -w admin
