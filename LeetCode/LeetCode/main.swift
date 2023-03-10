//
//  main.swift
//  LeetCode
//
//  Created by map07 on 2023-03-02.
//

import Foundation

let string1: String = "aabbbcccdef"
print(sortedByFuequence(string1))


class Solution {
    func concatenatedBinary(_ n: Int) -> Int {
        
        var str = ""
        for i in 1...n {
            str.append(toBinaryString(i))
        }
        
        return Int(str, radix: 2) ?? 0
        
    }
    
    func toBinaryString(_ n: Int) -> String{
        return String(n, radix: 2)
    }
}

let solution = Solution()
print(solution.toBinaryString(3))
print(solution.concatenatedBinary(3))




