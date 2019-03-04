pragma solidity ^0.5.4;


contract AdTract{
    
    // optional: uint private funds;
    mapping(address => address payable) private referrals;
    address private owner;
    //change to dynamic value not hardcoded
    uint percentageReward = 2;
    
    constructor() public payable{
        owner = msg.sender;
    }
   
    function refer(address customer) public{
        referrals[customer] = msg.sender;
    }
    
    function() payable external{
        
        //look at referrals, match customer to advertiser
        address payable advertiser = referrals[msg.sender];
        
        //calculate reward
        uint reward = msg.value*percentageReward/100;
                
        //pay advertiser  
        advertiser.transfer(reward);
        
        //transfer remaining transaction to business
        
    }   
}