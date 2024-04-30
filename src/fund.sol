//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import {Donate} from "./sourceFund.sol";


contract Fund {
    Donate  public _donate;
    
    constructor(address _address){
        _donate = Donate(_address);
    }

    function donate(string memory _name) payable public {
      _donate.donate{value:msg.value}(_name,msg.sender);
    }

    function collect() public {
        _donate.collect(msg.sender);
    }

    function CBalance() public view returns (uint256){
     return _donate.contractBalance(msg.sender);
    }

    function OBalance() public view returns (uint256){
        return _donate.balance(msg.sender);
    }



}

