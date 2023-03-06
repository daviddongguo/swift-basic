//
//  LongestPreString.swift
//  LeetCode
//
//  Created by david on 2023-03-06.
//

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
