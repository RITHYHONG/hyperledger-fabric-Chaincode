export FABRIC_CFG_PATH=${PWD}/config/
configtxgen -outputAnchorPeersUpdate ./artifact/Org1Anchor.tx -profile TwoOrgs -channelID channel -asOrg Org1MSP