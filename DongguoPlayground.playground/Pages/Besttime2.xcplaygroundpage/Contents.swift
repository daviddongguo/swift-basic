//: [Previous](@previous)


func maxProfit(_ prices: [Int]) -> Int {
    let c = prices.count
    var profits = [Int](repeating: 0, count: c), ma = c > 0 ? prices[c - 1] : 0
    for i in stride(from: c - 2, through: 0, by: -1) {
        profits[i] = max(profits[i + 1], ma - prices[i])
        ma = max(ma, prices[i])
    }
    var result = c > 0 ? profits[0] : 0, mi = Int.max
    for i in 0..<c {
        result = max(result, prices[i] - mi + (i < c - 1 ? profits[i + 1] : 0))
        mi = min(mi, prices[i])
    }
    return result
}
var pricesA = [3,3,5,0,0,3,1,4]
maxProfit(pricesA)


func maxProfit2(_ prices: [Int]) -> Int {
    let len = prices.count
    guard len > 1 else { return 0 }
    
    var profit = 0, maxVals: [Int] = []
    
    var maxVal = 0 {
        didSet { maxVals.append(maxVal) }
    }
    
    var first = prices.first!
    
    for price in prices {
        maxVal = max(price - first, maxVal)
        first = min(price, first)
    }
    
    maxVal = 0
    
    var last = prices.last!
    
    for i in (0..<len).reversed() {
        let price = prices[i]
        maxVal = max(last - price, maxVal)
        last = max(price, last)
        profit = max(profit, maxVal + maxVals[i])
    }
    return profit
}

pricesA = [7, 1, 4, 3, 5, 4]
maxProfit2(pricesA)

func maxProfit3(_ prices: [Int]) -> Int {
    var buy1 = Int.max
    var buy2 = Int.max
    var sell1 = 0
    var sell2 = 0
    for i in 0..<prices.count {
        buy1 = min(buy1, prices[i])
        sell1 = max(sell1, prices[i] - buy1)
        // totalProfit = prices[i] - buy2 + (sell1 - buy1)
        // totalProfit = prices[i] - (buy2 - sell1) - buy1
        // totalProfit = prices[i] - (buy2 - (? - buy1)) - buy1
        buy2 = min(buy2, prices[i] - sell1)
        sell2 = max(sell2, prices[i] - buy2)
    }
    return sell2
}
maxProfit3(pricesA)
//: [Next](@next)
