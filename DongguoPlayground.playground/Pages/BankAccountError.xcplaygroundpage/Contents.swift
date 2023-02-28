//: [Previous](@previous)

enum BankAccount: Error {
    case insufficientFunds
    case invalidTransaction
    case duplicateTransaction
    case unknown
}

func withdrawCash (amount: Int) throws {
    var funds = 10000
    if funds - amount < 0 {
        throw BankAccount.insufficientFunds
    }
    else {
        funds -= amount
    }
}


//: [Next](@next)
