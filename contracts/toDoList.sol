// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "hardhat/console.sol";


contract toDoList {
    string[] todoArray;

    function addItem(string memory _item) public {
        todoArray.push(_item);
    }

function removeItem(string memory _item) public {
        for (uint i = 0; i < todoArray.length; i++) {
            if (keccak256(abi.encodePacked(todoArray[i])) == keccak256(abi.encodePacked(_item))) {
                // Shift elements to the left to overwrite the item to be removed
                for (uint j = i; j < todoArray.length - 1; j++) {
                    todoArray[j] = todoArray[j + 1];
                }
                // Remove the last element
                todoArray.pop();
                return;
            }
        }
    }

    // function completed(string memory _item, bool ) public pure returns (bool) {
    //     if(true){
    //         console.log(_item, "is done");
    //     }
    //     return true;
    // }

    function getList() public view returns (string[] memory){
        return todoArray;
    }

}