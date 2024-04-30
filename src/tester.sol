//SPDX-License-Identifier : MIT
pragma solidity ^0.8.0;

contract test{

    address deployer;

    constructor(){
        deployer = msg.sender;
    }

    function getOwner(address value) public view returns(address){
        if(value != deployer){
            revert("Only owner can run the function");
        }
        return deployer;
    }

    function donate(string memory name, address value) payable public {
        if(msg.value < 4 ether){
            revert("Insufficient fund to transfer");
        }
    }
    
    function balance(address value) external view returns(uint256){
        if(value != deployer){
            revert("Only owner can check the balance");
        }
        return address(this).balance;
    }

    function getAddress() external view returns(address){
        return msg.sender;
    }

}
