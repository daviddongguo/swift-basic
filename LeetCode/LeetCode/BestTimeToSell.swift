//
//  BestTimeToSell.swift
//  LeetCode
//
//  Created by map07 on 2023-03-03.
//

import Foundation
class Concatenation {
    
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        var map: [Int : [Int]] = [:]
        for i in 0..<prices.count {
            if var array = map[prices[i]] {
                array.append(i)
                map[prices[i]] = array
            }else {
                map[prices[i]] = [i]
            }
        }
        
        let sortedMap = map.sorted{$0.key > $1.key}
        var j = k
        var indexOfMaxPrices: [Int] = []
        for (_, value) in sortedMap {
            
            for i in 0..<value.count {
                if( j >= 1)
                {
                    indexOfMaxPrices.append(value[i])
                    j -= 1
                }
            }
        }
        
        let sortedIndexOfMaxPrices = indexOfMaxPrices.sorted{$0 < $1}
        var start = 0
        var totalProfit = 0
        for i in sortedIndexOfMaxPrices {
            let currentProfit =  earn(prices, start: start, end: i)
            if(currentProfit > 0) {
                totalProfit += currentProfit
                start = i
            }
        }
        
        return totalProfit
    }
    
    func earn(_ prices: [Int], start: Int, end: Int) -> Int {
        if(end <= 0){
            return 0
        }
        var cost = Int.max
        for i in start..<end {
            cost = min(cost, prices[i])
        }
        return prices[end] - cost
    }
}


let prices = [3,2,6,5,0,3]
//let solution = Solution1680()

//print(solution.maxProfit(2, prices))
