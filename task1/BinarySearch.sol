// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BinarySearch {

    function search(int[] memory nums, int target) public pure returns (int) {
        uint start = 0;
        uint end = nums.length - 1;

        while (start <= end) {
            uint middle = start + (end - start) / 2;
            if (nums[middle] > target) {
                end = middle - 1;
            } else if (nums[middle] < target) {
                start = middle + 1;
            } else {
                return int(middle);
            }
        }
        return -1;
    }
}
