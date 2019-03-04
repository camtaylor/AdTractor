pragma solidity ^0.5.4;


contract AdTract{
    
    // optional: uint private funds;
    mapping(address => address payable) private referrals;
    address payable private owner;
    uint percentageReward;
    
    //refer customer 
    function refer(address customer) public{
        referrals[customer] = msg.sender;
    }
    
    //fallback function that handles payments to all involved parties
    function() payable external{
        
        //look at referrals, match customer to advertiser
        address payable advertiser = referrals[msg.sender];
        
        //calculate reward
        uint reward = msg.value*percentageReward/100;
                
        //pay advertiser  
        advertiser.transfer(reward);
        
        //pay AdTractor
        
        //transfer remaining transaction to business
        owner.transfer(msg.value - reward);
    }
    
    //will set owner of this contract in AdTractor contract
    function setOwner(address payable _owner) public{
        //only Adtractor can assign owner
        //require(AdTractor address == msg.sender);
        
        owner = _owner;
    }
    
    //set advertiser's reward percentage
    function setPercentageReward(uint value) private{
        require(owner == msg.sender);
        percentageReward = value;
    }
    
    
}