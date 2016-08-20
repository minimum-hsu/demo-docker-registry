#!/bin/bash

if [ -z "$DOMAIN" ] ; then
  export DOMAIN=localhost
fi
if [ -z "$SUBJECT" ] ; then
  export SUBJECT=/C=TW/ST=Taiwan/L=Taipei/O=Demo/OU=Demo
fi

echo Domain is $DOMAIN

# Generate server certificates
export certs=/certs
mkdir -p $certs
openssl genrsa -out $certs/domain.key 4096
openssl req -new -key $certs/domain.key -out $certs/domain.csr -subj "/CN=$DOMAIN$SUBJECT"
export ca_dir=./demoCA
mkdir -p $ca_dir
mkdir -p $ca_dir/newcerts
if [ ! -f $ca_dir/index.txt ] ; then
  touch $ca_dir/index.txt
fi
if [ ! -f $ca_dir/serial ] ; then
  echo 1000 > $ca_dir/serial
fi
openssl ca -days 3650 -in $certs/domain.csr -cert /ca/ca.crt -keyfile /ca/ca.key -out $certs/domain.crt -batch

