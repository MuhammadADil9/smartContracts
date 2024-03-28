//SPDX-License-Identifier : MIT
pragma solidity >=0.8.0;

contract storage_Contract {
    uint storeData;

    function set(uint x) public {
        storeData = x;
    }

    function get() public view returns (uint) {
        return storeData;
    }
}
