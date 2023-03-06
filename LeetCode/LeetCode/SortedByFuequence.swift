//
//  SortedByFuequence.swift
//  LeetCode
//
//  Created by david on 2023-03-06.
//

import Foundation



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
