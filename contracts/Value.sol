/******************************************************************************\

file:   Value.sol
ver:    0.0.8
updated:28-Mar-2017
author: Darryl Morris (o0ragman0o)
email:  o0ragman0o AT gmail.com

This file is part of the SandalStraps framework

`Value` is a SandalStraps Registrar compliant ownable metric contract.
It can be set by the owner and `value()` read publically returning a `uint256`
value.
The `function value() returns (uint);` API is intended as a modualar parameter
or value source for other utilising contracts. 

This software is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
See MIT Licence for further details.
<https://opensource.org/licenses/MIT>.

\******************************************************************************/

pragma solidity ^0.4.10;

import "https://github.com/o0ragman0o/SandalStraps/contracts/RegBase.sol";
import "https://github.com/o0ragman0o/SandalStraps/contracts/Factory.sol";

contract Value is RegBase
{
    bytes32 constant public VERSION = "Value v0.0.8";
    uint public value;

    function Value(address _creator, bytes32 _regName, address _owner)
        RegBase(_creator, _regName, _owner)
    {
        // nothing to contruct
    }
    
    function set(uint _value)
    {
        require(msg.sender == owner);
        value = _value;
    }
}


contract ValueFactory is Factory
{
    bytes32 constant public regName = "Value";
    string constant public VERSION = "ValueFactory v0.0.8";

    function ValueFactory(address _creator, bytes32 _regName, address _owner)
        Factory(_creator, _regName, _owner)
    {
        
    }

    function createNew(bytes32 _regName, address _owner)
        payable
        feePaid
    {
        last = new Value(msg.sender, _regName, _owner);
        Created(msg.sender, _regName, last);
    }
}
