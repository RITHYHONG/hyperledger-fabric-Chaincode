export FABRIC_CFG_PATH=$PWD/../config/

export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="Org1MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PWD}/../crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
export CORE_PEER_ADDRESS=localhost:7051

export PEER0_ORG1_CA=/home/kakapo/testsin/crypto-config/peerOrganizations/org1.example.com/msp/tlscacerts/tlsca.org1.example.com-cert.pem
export PEER0_ORG2_CA=/home/kakapo/testsin/crypto-config/peerOrganizations/org2.example.com/msp/tlscacerts/tlsca.org2.example.com-cert.pem


peer lifecycle chaincode commit -o localhost:7050 \
--tls $CORE_PEER_TLS_ENABLED  --cafile /home/kakapo/testsin/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem \
--channelID channel --name mycc \
--peerAddresses localhost:7051 --tlsRootCertFiles $PEER0_ORG1_CA \
--peerAddresses localhost:9051 --tlsRootCertFiles $PEER0_ORG2_CA \
--version 1 --sequence 1 \
--init-required

echo "===================== Chaincode Defination commited on peer0-org 1 and peer0-org2 ===================== "