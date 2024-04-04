//SPDX-License-Identifier : MIT;
pragma solidity ^0.8.0;
//someone will be able to enter a number in the function.
//There will be a name associated with each of the insertion.
//There will be a array, which will then fetch all those people who have inserted anything in the function.



contract fund {

string[] public contributors;
uint256[] public cash;
uint256 counter = 0;

function insert_Amount(uint256 value,string memory name) public {
    cash[counter] = value;
    contributors[counter] = name;
    counter++;
}

function get_Data(uint index) public view returns(uint256,string memory) {
   require(index < contributors.length && index < cash.length,"Array Index is out of bound");
   return( cash[index] ,contributors[index]);
}

function returnByte(uint256 _Value, string memory _name) public  pure returns (bytes memory) {
    return abi.encodeWithSignature("insert_Amount(uint256,string)", _Value, _name);
}


} 