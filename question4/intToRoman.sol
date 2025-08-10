// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract IntToRoman {
    uint256[] public number = [
        1000,
        900,
        500,
        400,
        100,
        90,
        50,
        40,
        10,
        9,
        5,
        4,
        1
    ];
    string[] public value = [
        "M",
        "CM",
        "D",
        "CD",
        "C",
        "XC",
        "L",
        "XL",
        "X",
        "IX",
        "V",
        "IV",
        "I"
    ];

    function toRoman(uint256 num) external view returns(string memory){
        bytes memory result;
        for (uint256 i = 0;i < number.length;i++){
            while  (num >= number[i]){
                result = abi.encodePacked(result, value[i]);
                num -= number[i];
            }
        }
        return string(result);
    }
}
