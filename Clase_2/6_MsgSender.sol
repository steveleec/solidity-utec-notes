// SPDX-License-Identifier: MIT
pragma solidity >=0.4.16 <0.9.0;

contract MsgSender {
    address public account;

    function whoIsTheCaller() public {
        account = msg.sender;
    }
}
