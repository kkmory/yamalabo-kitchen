#!/bin/bash

set -euo pipefail

cat <<EOF > ${BITCOIN_CONF}
testnet=3
txindex=1  
server=1   
rest=1      
rpcuser=${BITCOIN_RPCUSER}
rpcpassword=${BITCOIN_RPCPASS}
rpcport=18332
EOF

if [ $# -eq 0 ]; then
  exec bitcoind -datadir=${BITCOIN_DIR} -conf=${BITCOIN_CONF}
else
  exec "$@"
fi
