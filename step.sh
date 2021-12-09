#!/bin/bash

echo "receiving keys from: ${gpg_keyserver_url}"

IFS=$'\n'
for i in $trusted_pk_signatures; do
    [[ $i = \#* ]] && echo "INFO: \"$(echo $i | cut -d'#' -f 2)\"" && continue
    gpg --keyserver ${gpg_keyserver_url} --recv-keys $i
done
exit 0
