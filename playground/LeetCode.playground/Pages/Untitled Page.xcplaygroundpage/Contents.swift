import UIKit

let nums = [1, 2, 3, 1]

class Solution {
    func rob(_ nums: [Int]) -> Int {
        var prevRobbed = 0
        var prevUnrobbed = 0
        for money in nums {
            let currRobbed = prevUnrobbed + money
            let currUnrobbed = max(prevUnrobbed, prevRobbed)

            prevRobbed = currRobbed
            prevUnrobbed = currUnrobbed
        }

        return max(prevRobbed, prevUnrobbed)
    }
}

let solution  = Solution()
solution.rob(nums)
