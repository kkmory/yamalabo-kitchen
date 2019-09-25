#!/bin/bash

set -euo pipefail

BITCOIN_DIR=/root/.bitcoin
BITCOIN_CONF=${BITCOIN_DIR}/bitcoin.conf

# If config doesn't exist, initialize with sane defaults for running a
# non-mining node.

if [ ! -e "${BITCOIN_CONF}" ]; then
  tee -a >${BITCOIN_CONF} <<EOF
testnet=3
txindex=1  
server=1   
rest=1      
rpcuser=${BITCOIN_RPCUSER}
rpcpassword=${BITCOIN_RPCPASSWORD}
rpcport=18332 
EOF
fi

if [ $# -eq 0 ]; then
  exec bitcoind -datadir=${BITCOIN_DIR} -conf=${BITCOIN_CONF}
else
  exec "$@"
fi
