cargo build --release
target/release/ethereum_rust --network ./test_data/genesis.json --import ./test_data/chain.rlp --bootnodes="enode://7b1b6851e412150e84e00e01ecbf0264bd0979a89bf002f0828e8845de59b459e80e78a52dff495798bdfd268e43071381721336e8dade1adab9faac95cb7fe3@0.0.0.0:30303" \
--authrpc.port=8553 --http.port=8547 --p2p.port=30308 --discovery.port=30310