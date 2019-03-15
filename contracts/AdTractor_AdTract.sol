pragma solidity ^0.5.4;

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
        AdTract ad = new AdTract(percentageReward, msg.sender);
        _business storage b = businesses[msg.sender];
        b.contractsAddress.push(address(ad)); 
    }
    
    //get contracts that the business deployed    
    function getContracts() public view returns(address[] memory){
        return businesses[msg.sender].contractsAddress;
    }
}

contract AdTract{
    
    //optional: uint private funds;
    mapping(address => address payable[]) private referrals;
    address payable private owner;
    address private _AdTractor;
    uint private percentageReward;
    
    constructor(uint reward, address payable _owner) public{
        _AdTractor = msg.sender;
        percentageReward = reward;
        owner = _owner;
    }
    
    //refer customer 
    function refer(address customer) public{
        referrals[customer].push(msg.sender);
    }
    
    //fallback function that handles payments to all involved parties
    function() payable external{
        
        //look at referrals, match customer to advertiser
        address payable[] memory advertisers = referrals[msg.sender];
        
        //can be set percentage or set value
        uint advertiserReward = msg.value*percentageReward/100;
                
        //pay advertiser  
        for(uint i = 0; i < advertisers.length; i++){
            advertisers[i].transfer(advertiserReward/advertisers.length);
        }
        
        //transfer remaining transaction to business
        owner.transfer(msg.value - advertiserReward);
    }
}