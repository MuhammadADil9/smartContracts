//SPDX-License-Identifier : MIT
pragma solidity ^0.8.0;
import {test} from "./tester.sol";

contract debug{

test public tester;

constructor(address value){
    tester = test(value);
}

function addr() public view returns(address){
    return tester.getAddress();
}

function callOriginal() public view returns(address){
    return tester.getOwner(msg.sender);
}

function sendEth(string memory name) public payable {
    tester.donate{value: msg.value}(name,msg.sender);
}

function retrieve() public view returns (uint256){
    return tester.balance(msg.sender);
}

}