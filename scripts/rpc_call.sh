# curl http://localhost:8545 \
#   -X POST \
#   -H "Content-Type: application/json" \
#   --data "{\"method\": \"$1\", \"params\": [$2], \"id\": 0, \"jsonrpc\": \"2.0\"}"

# curl http://localhost:8551 \
#   -X POST \
#   -H "Content-Type: application/json" \
#   -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3MjU4OTczMTgsImlkIjpudWxsLCJjbHYiOm51bGx9.UBBOWsdkXcfnrzSpAwhCRTDYoDW9h_B8zXISHnnQGck" \
#   --data "{\"method\": \"engine_exchangeTransitionConfigurationV1\", \"params\": [{\"terminalTotalDifficulty\": 0, \"terminalBlockHash\": \""0x0000000000000000000000000000000000000000000000000000000000000000"\", \"terminalBlockNumber\": \"0x1\"}], \"id\": 1, \"jsonrpc\": \"2.0\"}"

curl http://localhost:8546 \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"jsonrpc":"2.0","method":"admin_nodeInfo","params":[],"id":1}'