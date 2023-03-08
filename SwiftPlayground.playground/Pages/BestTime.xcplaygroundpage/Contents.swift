//: [Previous](@previous)
struct Profit{
    let amount: Int
    let buyAt: Int
    let sellAt: Int
}

func maxProfit(_ prices: [Int]) -> Int {
    var currentProfit = Profit(amount: Int.max, buyAt: 0, sellAt: 0)
    var profits: [Profit] = []
    var buyAt = 0
    var sellAt = 0
    while currentProfit.amount > 0 {
        currentProfit = maxOne(prices, profits: profits)
        profits.append(currentProfit)
        for i in profits {
            print("\(i.buyAt) : \(i.sellAt)")
        }
        print("one time")
    }
    
    return 0
}


func maxOne(_ prices: [Int], profits: [Profit]) -> Profit {
    var max = 0
    var minPrice = Int.max
    var buyIndex = 0
    var sellIndex = 0
    for i in 0..<prices.count {
        if(prices[i] < minPrice) {
            minPrice = prices[i]
            buyIndex = i
            print("minPrice at \(i)")
            continue
        }
        
        if((prices[i] - minPrice > max) && (!IsExistedProfie(buyAt: buyIndex, sellAt: i, profits: profits))){
            max = prices[i] - minPrice
            sellIndex = i
            print("max profit at \(i)")
        }
    }
    if(buyIndex > sellIndex) {
    return  Profit(amount: 0, buyAt: 0, sellAt: 0)
    }
    var result = Profit(amount: max, buyAt: buyIndex, sellAt: sellIndex)
//    print(result)
    return result
}

func IsExistedProfie(buyAt: Int, sellAt: Int, profits: [Profit]) -> Bool {
    for profit in profits {
        if(profit.buyAt == buyAt && profit.sellAt == sellAt){
            return true
        }
    }
    return false
}

var pricesA = [3,3,5,0,0,3,1,4]
maxProfit(pricesA)
//maxOne(pricesA).amount
//maxOne(pricesA, buy: 3, sell: 7).amount

//: [Next](@next)
