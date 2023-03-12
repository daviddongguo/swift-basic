//: [Previous](@previous)

import Foundation

class Solution {
    func concatenatedBinary(_ n: Int) -> Int {
        
        let mod = 1000000007
        var res = 0
        
        // to maintain 2^(n_binary_length)
        var power = 1
        for i in 1...n {
            if i >= power {
                power = power * 2
            }
            res = (((res * power) % mod) + i) % mod
        }
        return res
    }
}

let solution = Solution()
print(solution.concatenatedBinary(97947))
