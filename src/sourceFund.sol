//SPDX-License-Identifier : MIT;
pragma solidity ^0.8.0;
pragma solidity ^0.8.0;

contract Donate {

    address payable deployer;
    event Transaction(address sender, uint256 amount, string name);

    constructor(){
        deployer = payable(msg.sender);
    }

    function donate(string memory name, address value) public payable {
        require(msg.value >= 5 ether, "Please, Increase the Amount to Sufficient Limit");
        emit Transaction(value, msg.value, name);
    }  

    function collect(address value) external {
        require(value == deployer, "Amount is only collectable by the owner");
        require(address(this).balance > 0, "No amount to collect");
        deployer.transfer(address(this).balance);
    }

    function contractBalance(address value) external view returns (uint256){
        require(value == deployer, "Permission Denied!");
        return address(this).balance;
    }

    function balance(address value) external view returns (uint256) {
        require(value == deployer, "Permission Denied!");
        return deployer.balance;
    }
}















