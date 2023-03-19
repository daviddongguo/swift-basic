//
//  main.swift
//  LeetCode
//
//  Created by map07 on 2023-03-02.
//

import Foundation

let operandMax = 20

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

struct Quiz {
    let id: Int
    let title: String
}

struct MathQuiz : CustomStringConvertible{
    let leftOperand: Double
    let rightOperand: Double
    let operation: OperationEnum
    let answer: Double
    var userInput: String? = nil
    func IsRightAnswer(_ userAnser: String) -> Bool {
        guard let userAnser = Double(userAnser) else {
            return false
        }
        return (userAnser - self.answer) > -0.01 &&  (userAnser - self.answer) < 0.01
    }
    
    private static let operations: [OperationEnum] = [.addition, .subtraction, .multiplication, .division]
    
    init() {
        self.operation = MathQuiz.operations.randomElement()!
        if(self.operation == OperationEnum.division){
            self.rightOperand = Double(Int.random(in: 1...operandMax))
        }else {
            self.rightOperand = Double(Int.random(in: 0...operandMax))
            
        }
        self.leftOperand = Double(Int.random(in: 0...operandMax))
        
        switch self.operation {
        case .addition:
            self.answer = self.leftOperand + self.rightOperand
        case .subtraction:
            self.answer = self.leftOperand - self.rightOperand
        case .multiplication:
            self.answer = self.leftOperand * self.rightOperand
        case .division:
            self.answer = self.leftOperand / self.rightOperand
        }
    }
  
    var description: String {
        return String(format: "%.0f \(self.operation.rawValue) %.0f = %.2F", self.leftOperand,  self.rightOperand, self.answer)
    }
    
}

for _ in 1...5 {
    let quiz = MathQuiz()
    print(quiz.description)
    print(quiz.IsRightAnswer("0.0"))
}

