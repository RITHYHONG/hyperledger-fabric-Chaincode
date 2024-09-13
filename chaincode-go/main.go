package main

import (
    "fmt"
    "github.com/hyperledger/fabric-contract-api-go/contractapi"
)

type SmartContract struct {
    contractapi.Contract
}

func (s *SmartContract) CreateAsset(ctx contractapi.TransactionContextInterface, id string, value string) error {
    exists, err := s.AssetExists(ctx, id)
    if err != nil {
        return fmt.Errorf("failed to check if asset exists: %s", err.Error())
    }
    if exists {
        return fmt.Errorf("asset %s already exists", id)
    }

    return ctx.GetStub().PutState(id, []byte(value))
}

func (s *SmartContract) AssetExists(ctx contractapi.TransactionContextInterface, id string) (bool, error) {
    assetBytes, err := ctx.GetStub().GetState(id)
    if err != nil {
        return false, fmt.Errorf("failed to read from world state: %s", err.Error())
    }
    return assetBytes != nil, nil
}

func main() {
    chaincode, err := contractapi.NewChaincode(new(SmartContract))
    if err != nil {
        fmt.Printf("Error creating chaincode: %s", err.Error())
        return
    }

    if err := chaincode.Start(); err != nil {
        fmt.Printf("Error starting chaincode: %s", err.Error())
    }
}
