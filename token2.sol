//SPDX-License-Identifier:MIT
pragma solidity ^0.8.8;


//create a token that takes two admins; they can transfer tok
contract token {
    string name = "Ctoken";
    uint public totalToken = 500;
    address admin1;
    address admin2;

    constructor(address _admin1, address _admin2 ) {
        admin1 = _admin1;
        admin2 = _admin2;
    }

    modifier onlyAdmins() {
    require((msg.sender ==  admin1 || msg.sender == admin2), "Only an admin can assign");
    require(msg.value <= 30, "maximum amount exceeded");
    _;
    }
    mapping(address => bool) public isEligible;
    mapping(address => uint) public balance;

    function transfer(address _addr, uint _amount) public payable onlyAdmins {
        isEligible[_addr] = true;
        balance[_addr] = _amount;    
        totalToken -= _amount; 
    }
}


//0xdD870fA1b7C4700F2BD7f44238821C26f7392148 ==> admin1
//0x583031D1113aD414F02576BD6afaBfb302140225 ==> admin2

//0x0A098Eda01Ce92ff4A4CCb7A4fFFb5A43EBC70DC ==> recipient1
//0x4B0897b0513fdC7C541B6d9D7E929C4e5364D2dB ==> recipient2
