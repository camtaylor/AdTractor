pragma solidity ^0.5.4;

contract AdTract{
    
    //optional: uint private funds;
    mapping(address => address payable) private referrals;
    address payable private owner;
    address private AdTractor;
    uint percentageReward;
    
    constructor() public{
        AdTractor = msg.sender;
    }
    //refer customer 
    function refer(address customer) public{
        referrals[customer] = msg.sender;
    }
    
    //fallback function that handles payments to all involved parties
    function() payable external{
        
        //look at referrals, match customer to advertiser
        address payable advertiser = referrals[msg.sender];
        
        //can be set percentage or set value
        uint advertiserReward = msg.value*percentageReward/100;
                
        //pay advertiser  
        advertiser.transfer(advertiserReward);
        
        //transfer remaining transaction to business
        owner.transfer(msg.value - advertiserReward);
    }
    
    //will set owner of this contract in AdTractor contract
    function setOwner(address payable _owner) external{
        //only Adtractor can assign owner
        require(AdTractor == msg.sender);
        owner = _owner;
    }
    
    //set advertiser's reward percentage
    function setPercentageReward(uint value) external{
        require(AdTractor == msg.sender);
        percentageReward = value;
    }
}