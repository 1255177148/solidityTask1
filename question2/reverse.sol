// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract Reverse{

    function reverseStr(string memory str) public pure returns(string memory){
        string[] memory strArr = parseString(str);
        uint256 length = strArr.length;
        bytes memory result;
        uint256 i = length;
        while (i > 0){
            i--;
            bytes memory strBytes = bytes(strArr[i]);
            result = abi.encodePacked(result, strBytes);
        }
        return string(result);
    }

    // 将字符串转为字符数组
    function parseString(string memory str) public pure returns (string[] memory){
        bytes memory strBytes = bytes(str);
        uint256 length = strBytes.length;
        string[] memory characters = new string[](length);
        uint256 charIndex = 0;

        for (uint256 i =0;i < length;i++){
            // 获取当前字节
            bytes1 currentByte = strBytes[i];
            if(uint8(currentByte) <= 0x7F){
                characters[charIndex] = string(abi.encodePacked(currentByte));
            } else {
                uint256 numBytes = getCharacterByteLength(uint8(currentByte));
                bytes memory charBytes = new bytes(numBytes);
                for (uint j = 0; j < numBytes; j++) {
                    charBytes[j] = strBytes[i + j];
                }
                characters[charIndex] = string(charBytes);
                i += numBytes - 1;
            }
            charIndex++;
        }
        return characters;
    }

    // 获取 UTF-8 字符的字节数（根据首字节判断）
    function getCharacterByteLength(uint8 firstByte) internal pure returns (uint256) {
        if (firstByte <= 0x7F) {
            return 1;
        } else if (firstByte <= 0xDF) {
            return 2;
        } else if (firstByte <= 0xEF) {
            return 3;
        } else if (firstByte <= 0xF7) {
            return 4;
        }
        return 0; // Invalid byte
    }
}