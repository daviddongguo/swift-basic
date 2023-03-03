//
//  main.swift
//  LeetCode
//
//  Created by map07 on 2023-03-02.
//

import Foundation

print("Hello, World!")

import Foundation

let str = "abca"

func f1(_ str: String) -> Int {
    var ma = 0
    var left = 0
    var right = 1
    while right < str.count {
        let start = str.index(str.startIndex, offsetBy: left)
        let end = str.index(str.startIndex, offsetBy: right)
        let result = str[start..<end]
        if(right - left == Set(result).count){
            ma = max(right - left, ma)
            right += 1
        }else{
            left += 1
        }
    }
    return ma
}
//print(sortedByFuequence(str))

func sortedByFuequence(_ str: String) -> String {
    var map: [Character : Int] = [:]
    let arr = Array(str)
    for c in arr {
        map[c] = (map[c] ?? 0) + 1
    }
    let sortedMap = map.sorted{ $0.value > $1.value}
    
    var result = ""
    for (key, value) in sortedMap {
        result += String(repeating: key, count: value)
    }
    
    return result
}


let prices = [3,2,6,5,0,3]
let solution = Solution()

print(solution.maxProfit(2, prices))









