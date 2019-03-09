pragma solidity ^0.5.4;

import "./AdTract.sol"; 

contract AdTractor{
    //mapping of contracts
    mapping(address => _business) private businesses;
    //keep track of businesses that deploy AdTract
    address[] business;
    
    struct _business{
        address[] contractsAddress;
    }
    
    //deploy new AdTrac, track business and contracts
    function newAdTract(uint percentageReward) public{
        business.push(msg.sender);
        AdTract ad = new AdTract();
        ad.setOwner(msg.sender);
        ad.setPercentageReward(percentageReward);
        _business storage b = businesses[msg.sender];
        b.contractsAddress.push(address(ad)); 
    }
    
    //get contracts that the business deployed    
    function getContracts() public view returns(address[] memory){
        return businesses[msg.sender].contractsAddress;
    }
    
    
    
}