export FABRIC_CFG_PATH=${PWD}/config/

configtxgen -outputAnchorPeersUpdate ./artifact/Org2Anchor.tx -profile TwoOrgs -channelID channel -asOrg Org2MSP



