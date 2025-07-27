//
//  QuickSort.swift
//  DataStructuresAndAlgorithms
//
//  Created by Manveer Singh on 28/07/25.
//

import Foundation

func quickSort(nums: inout [Int], low: Int, high: Int) {
    if low < high {
        let pIndex = partition(nums: &nums, low: low, high: high)
        quickSort(nums: &nums, low: low, high: pIndex - 1)
        quickSort(nums: &nums, low: pIndex+1, high: high)
    }
}

func partition(nums: inout [Int], low: Int, high: Int) -> Int {
    let pivot = nums[low]
    var i = low
    var j = high
    
    while i < j {
        // Move i to right until we find nums[i] > pivot
        while nums[i] <= pivot && i <= high - 1 { 
            i += 1
        }
        
        // Move j to the left until we find nums[j] <= pivot
        while nums[j] > pivot && j >= low + 1 {
            j -= 1
        }
        
        if i < j {
            nums.swapAt(i, j)
        }
    }
    nums.swapAt(low, j)
    
    return j
}
