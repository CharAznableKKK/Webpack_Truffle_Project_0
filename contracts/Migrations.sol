// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <0.7.0;

contract Migrations {
    // address public owner;
    address public owner = msg.sender;
    uint public last_completed_migration;

    // constructor() public {
    //     owner = msg.sender;
    // }

    // modifier restricted() {
    //     if (msg.sender == owner) _;
    // }
    modifier restricted() {
        require(
            msg.sender == owner,
            "This function is restricted to the contract's onwner"
        );
        _;
    }

    function setCompleted(uint completed) public restricted {
        last_completed_migration = completed;
    }
}
