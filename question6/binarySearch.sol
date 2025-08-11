// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract BinarySearch{

    function binarySearch(uint256[] memory arr, uint256 target) external pure returns(int256){
        uint256 left = 0;
        uint256 right = arr.length - 1;
        while (left <= right){
            uint256 mid = left + (right - left) / 2;
            if (target == arr[mid]){
                return int256(mid);
            }
            if (target > arr[mid]){
                left = mid + 1;
            } else {
                if (mid == 0){
                    break;
                }
                right = mid - 1;
            }
        }
        return -1;
    }
}