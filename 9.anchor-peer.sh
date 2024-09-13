export FABRIC_CFG_PATH=${PWD}/config/
configtxgen -outputAnchorPeersUpdate ./artifact/Org1Anchor.tx -profile BasicChannel -channelID channel -asOrg Org1MSP