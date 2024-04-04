//SPDX-License-Identifier : MIT;

pragma solidity ^0.8.0;

//someone will be able to enter a number in the function.
//There will be a name associated with each of the insertion.
//There will be a array, which will then fetch all those people who have inserted anything in the function.

contract fund {

string[] public contributors;
uint[] public cash;

function insert_Amount(uint256 value,string memory name) public {
    cash.push(value);
    contributors.push(name);
}

function get_Data(uint index) public view returns(uint256,string memory) {
   require(index < contributors.length && index < cash.length,"Array Index is out of bound");
   return( cash[index] ,contributors[index]);
}

} 