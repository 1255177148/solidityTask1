// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract Voting{
    mapping(uint256 => mapping(uint256 => uint256)) voteCount;
    uint256 public currentVersion;

    function vote(uint256 voteId) external {
        voteCount[voteId][currentVersion] += 1;
    }

    function getVotes(uint256 voteId) external view returns (uint256){
        return voteCount[voteId][currentVersion];
    }

    function resetVotes() external {
        currentVersion++;
    }
}