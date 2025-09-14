// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract mergeSortedArray {
    function sort(int[] memory nums1, int num1, int[] memory nums2, int num2) public pure returns(int[] memory) {

        int pointer1 = num1 - 1;
        int pointer2 = num2 - 1;
        int len = int(nums1.length - 1);

        while (pointer1 >= 0 && pointer2 >= 0) {
            if (nums1[uint(pointer1)] > nums2[uint(pointer2)]) {
                nums1[uint(len)] = nums1[uint(pointer1)];
                pointer1-=1;
            } else {
                nums1[uint(len)] = nums2[uint(pointer2)];
                pointer2-=1;
            }
            len -=1;
        }

        while (pointer2 >= 0) {
            nums1[uint(len)] = nums2[uint(pointer2)];
            pointer2 --;
            len --;
        }
        return nums1;
    }
}