pragma solidity ^0.5.4;


contract AdTract{
    
    uint private funds;
    address[] buyers;
    address payable[] advertisers;
    address payable[] advertisersToBePayed;
    address owner;
    
    /*
    constructor initiates the funds
    minimum funds: 1 ether
   */
    constructor() public payable{
        require(msg.value >= 1 ether);
        owner = msg.sender;
        funds =  msg.value;
    }
    
    //allows advertisers to check the funds 
    function getFunds() public view returns(uint){
        return funds;
    }
    
    struct ad{
        address[] potentialBuyers;
    }
    mapping(address => ad) ads;
    
    //storing potentialBuyers to specific advertisers
    function setAds(address _potentialBuyer) public{
        ad storage advertisement = ads[msg.sender];
        advertisement.potentialBuyers.push(_potentialBuyer);
    }
    
    //search for advertisers eligible for reward and add to an array
    function searchAdvertisersToPay() public returns(address[] memory){
        for(uint i = 0; i < buyers.length; i++){
            for(uint j = 0; j < advertisers.length; j++){
                address[] storage potentialCustomers = ads[advertisers[j]].potentialBuyers;
                for(uint x = 0; x < potentialCustomers.length; x++){
                    if(potentialCustomers[x] == buyers[i]){
                        advertisersToBePayed.push(advertisers[j]);
                    }
                }
            }
        }
    }
    
    function pay() public{
        require(owner == msg.sender, 'not possible');
        for(uint i = 0; i < advertisersToBePayed.length; i++){
            advertisersToBePayed[i].transfer(address(this).balance);
        }
    }
    
    
    //helper function to get visualization. To be deleted
    function viewer() public view returns(address payable[] memory){
        return advertisersToBePayed;
    }
    
    //advertisers sign up
    function setAdvertisers() public{
        advertisers.push(msg.sender);
    }
    
    //temporary, will replace it with companie's data
    function setBuyer(address _address) public{
        buyers.push(_address);
    }
}