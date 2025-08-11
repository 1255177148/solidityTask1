// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract MergeArr {

    function merge(uint256[] memory arrA, uint256[] memory arrB)
        external
        pure 
        returns (uint256[] memory)
    {
        uint256 indexA;
        uint256 indexB;
        uint256 lengthA = arrA.length;
        uint256 lengthB = arrB.length;
        uint256[] memory arr = new uint256[](lengthA + lengthB);
        uint256 index;
        while (indexA < lengthA && indexB < lengthB) {
            if (arrA[indexA] < arrB[indexB]) {
                arr[index] = arrA[indexA];
                indexA++;
            } else {
                arr[index] = arrB[indexB];
                indexB++;
            }
            index++;
        }
        if (indexA < lengthA) {
            for (uint256 i = indexA; i < lengthA; i++) {
                arr[index] = arrA[i];
                index++;
            }
        }
        if (indexB < lengthB) {
            for (uint256 i = indexB; i < lengthB; i++) {
                arr[index] = arrB[i];
                index++;
            }
        }
        return arr;
    }
}
