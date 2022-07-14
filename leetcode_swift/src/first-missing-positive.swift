//
//  first-missing-positive.swift
//  leetcode_swift
//
//  Created by jonny on 2022/7/14.
//

import Foundation

func firstMissingPositive(_ nums: [Int]) -> Int {
    let n = nums.count;
    let _nums:[Int] = nums.sorted();
    var res = Int.min
    
    if (n == 1 && _nums[0] <= 0) || _nums[0] > 1 || _nums[n-1] <= 0{
        res = 1;
        return res;
    }
    
    if (n == 1 && _nums[0] >= 1){
        res = nums[0] + 1;
        return res;
    }
    
    
    
    for j in 1...n-1 {
        let i = j - 1;
        if _nums[i] == _nums[j]{
            continue;
        }
        if _nums[i] < 0 && _nums[j] > 1{
            res = 1;
            break;
        }
        if _nums[i]+1 != _nums[j]{
            res = _nums[i] + 1;
        }
        if res > 0 {
            break;
        }
        res = Int.min;
    }
    
    if res == Int.min{
        res = _nums[n-1] + 1;
    }
   
    return res;
}
