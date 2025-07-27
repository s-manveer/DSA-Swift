//
//  MergeSort.swift
//  DataStructuresAndAlgorithms
//
//  Created by Manveer Singh on 28/07/25.
//

import Foundation

func mergeSort(nums: inout [Int], low: Int, high: Int) {
    // if low is less than high else nothing
    if low < high {
        let mid = (low + high)/2
        
        mergeSort(nums: &nums, low: low, high:  mid)
        mergeSort(nums: &nums, low: mid+1, high: high)
        
        merge(nums: &nums, low: low, mid: mid, high: high)
    }
}

func merge(nums: inout [Int], low: Int, mid: Int, high: Int) {
    // size of first array and second array , low to mid and mid to high
    let n1 = mid - low + 1
    let n2 = high - mid
    
    // create temp array array1 and array2 of size n1 and n2
    var tempArray1: [Int] = []
    var tempArray2: [Int] = []
    
    for i in 0..<n1 {
        tempArray1.append(nums[low+i])
    }
    
    for i in 0..<n2 {
        tempArray2.append(nums[mid+1+i])
    }
    
    var i = 0
    var j = 0
    var k = low // we will start sorting from the low till the high n1+n2
    
    // we traverse through tempArrays do the comparison, increment i, j and k
    while i < n1 && j < n2 {
        if tempArray1[i] <= tempArray2[j] {
            nums[k] = tempArray1[i]
            i += 1
        } else {
            nums[k] = tempArray2[j]
            j += 1
        }
        
        k += 1
    }
    
    while i < n1 {
        nums[k] = tempArray1[i]
        i += 1
        k += 1
    }
    
    while j < n2 {
        nums[k] = tempArray2[j]
        j += 1
        k += 1
    }
}
