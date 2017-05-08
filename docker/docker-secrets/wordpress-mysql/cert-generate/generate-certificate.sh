openssl genrsa -out "root-ca.key" 4096
openssl req \
          -new -key "root-ca.key" \
          -out "root-ca.csr" -sha256 \
          -subj '/C=US/ST=CA/L=San Francisco/O=Docker/CN=Swarm Secret Example CA'

# Configure the root CA. Edit a new file called root-ca.cnf and paste the following contents into it. This constrains the root CA to only be able to sign leaf certificates and not intermediate CAs.
#
# [root_ca]
# basicConstraints = critical,CA:TRUE,pathlen:1
# keyUsage = critical, nonRepudiation, cRLSign, keyCertSign
# subjectKeyIdentifier=hash

# Sign the certificate.
openssl x509 -req  -days 3650  -in "root-ca.csr" \
               -signkey "root-ca.key" -sha256 -out "root-ca.crt" \
               -extfile "root-ca.cnf" -extensions \
               root_ca

# Generate the site certificate and sign it with the site key.
openssl genrsa -out "site.key" 4096
