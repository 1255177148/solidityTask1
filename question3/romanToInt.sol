// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract RomanToInt{

    mapping(bytes1 => uint256) romanNumber;

    constructor() {
        romanNumber['I'] = 1;
        romanNumber['V'] = 5;
        romanNumber['X'] = 10;
        romanNumber['L'] = 50;
        romanNumber['C'] = 100;
        romanNumber['D'] = 500;
        romanNumber['M'] = 1000;
    }

    function toInt(string memory s) external view returns(uint256){
        bytes memory strBytes = bytes(s);
        uint256 length = strBytes.length;
        uint256 result;
        for (uint256 i = 1;i<= length;i++){
            bytes1 a = strBytes[i-1];
            if (i == length){
                result += getValue(a);
                return result;
            }
            bytes1 b = strBytes[i];
            if (getValue(a) < getValue(b)){
                result = result - getValue(a);
            } else {
                result = result + getValue(a);
            }
        }
        return result;
    }

    function getValue(bytes1 s) internal view returns(uint256){
        return romanNumber[s];
    }
}