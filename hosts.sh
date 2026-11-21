#!/bin/bash

verifica_ip() {
    local name="$1"
    local ip="$2"
    local dns_server="$3"

    if ! nslookup "$name" "$dns_server" | grep -q "Address: $ip"; then
        echo "Bogus IP for $name in /etc/hosts!"
    fi
}

cat /etc/hosts | while read ip name etc; do
    if [[ -z "$ip" || "$ip" == \#* ]]; then
        continue
    fi
    if [[ "$name" == "localhost" || "$name" == "teo-VirtualBox" || "$name" == ip6-* ]]; then
        continue
    fi

    verifica_ip "$name" "$ip" "8.8.8.8"
done

echo "Student A: Teo"
