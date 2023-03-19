

import Foundation

let operandMax = 1

enum OperationEnum: String {
    case addition = "+"
    case subtraction = "-"
    case multiplication = "*"
    case division = "/"
    
    func apply(_ leftOperand: Double, _ rightOperand: Double) -> Double {
        switch self {
        case .addition:
            return leftOperand + rightOperand
        case .subtraction:
            return leftOperand - rightOperand
        case .multiplication:
            return leftOperand * rightOperand
        case .division:
            return leftOperand / rightOperand
        }
    }
}

class Quiz: CustomStringConvertible {
    let id: Int
    let title: String
    func IsRightAnser(_ userAnswer: String) -> Bool {
        return false
    }
    init(id: Int, title: String) {
        self.id = id
        self.title = title
    }
    
    var description: String {
        return self.title
    }
}

class MathQuiz : Quiz{
    let leftOperand: Int
    let rightOperand: Int
    let operation: OperationEnum
    let answer: Double
    var userAnswer: String? = nil
    func IsRightAnswer(_ userAnswer: String) -> Bool {
        guard let userAnser = Double(userAnswer) else {
            return false
        }
        return (userAnser - self.answer) > -0.01 &&  (userAnser - self.answer) < 0.01
    }
    
    
    init(id: Int, leftOperand: Int, rightOperand: Int, operation: OperationEnum) {
        self.leftOperand = leftOperand
        self.rightOperand = rightOperand
        self.operation = operation
        self.answer = self.operation.apply(Double(self.leftOperand), Double(self.rightOperand))
        super.init(id: id, title: String(format: "%d %@ %@", self.leftOperand, self.operation.rawValue, self.rightOperand < 0 && self.operation == .subtraction ? "(\(self.rightOperand))" : "\(self.rightOperand)"))
    }
}

class RandomMathQuiz : MathQuiz{
    private static let operations: [OperationEnum] = [.addition, .subtraction, .multiplication, .division]
    
    init(id: Int) {
        let leftOperand = Int.random(in: -operandMax...operandMax)
        let operation = RandomMathQuiz.operations.randomElement()!
        let intArray = (-operandMax...operandMax).filter { operation != .division || $0 != 0 }
        let rightOperand = intArray.randomElement()!
        
        super.init(id: id, leftOperand: leftOperand,  rightOperand: rightOperand,  operation: operation)
    }
    
    override var description: String {
        return super.description + " =  \(self.answer)"
    }
  
}

for i in 1...50 {
    let quiz = RandomMathQuiz(id: i)
    print(quiz.description)
}

