//
//  BackEnd.swift
//  dongguo
//
//  Created by david on 2023-03-19.
//

import Foundation

let Pricese_Value = 0.0001

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
    
    @available(*, unavailable, message: "Subclasses must override this method")
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
    
    func enterUserAnswer(_ userAnswer: String) -> Void {
        self.userAnswer = userAnswer
    }

    func IsRightAnser() -> Bool {
        return self.IsRightAnser(self.userAnswer)
    }
    
    func IsRightAnser(_ userAnswer: String? ) -> Bool {
        guard let userAnswer = Double(userAnswer ?? "not a double string") else {
            return false
        }
        return abs(userAnswer - self.answer) < Pricese_Value
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
    
    var difficulty: Int = 1
    private static let operations: [OperationEnum] = [.addition, .subtraction, .multiplication, .division]
    
    init(id: Int, difficulty: Int? = nil) {
        self.difficulty = difficulty ?? self.difficulty
        let leftOperand = Int.random(in: -self.difficulty...self.difficulty)
        let operation = RandomMathQuiz.operations.randomElement()!
        let intArray = (-self.difficulty...self.difficulty).filter { operation != .division || $0 != 0 }
        let rightOperand = intArray.randomElement()!
        
        super.init(id: id, leftOperand: leftOperand,  rightOperand: rightOperand,  operation: operation)
    }
    
    override var description: String {
        return super.description + " =  \(self.userAnswer ?? "")"
    }
}



struct MathQuizServer {
    var userName: String?
    var difficulty: Int?
    var quizs: [MathQuiz] = []
    
    init(difficulty: Int? = nil){
        self.difficulty = difficulty ?? 1
    }
    
    mutating func updateDifficulty(_ difficulty: Int){
        self.difficulty = difficulty
    }

    mutating func addQuiz(_ quiz: MathQuiz) -> Void{
        self.quizs.append(quiz)
    }
    mutating func generateQuiz() -> MathQuiz {
        let quiz = RandomMathQuiz(id: self.quizs.count, difficulty: self.difficulty)
        self.addQuiz(quiz)
        return quiz
    }
    var score: Double {
        if(quizs.isEmpty){
            return 0
        }
        var numberOfRight = 0
        for quiz in quizs {
            if quiz.IsRightAnser() {
                numberOfRight += 1
            }
        }
        
        return Double(numberOfRight) / Double(quizs.count)
    }
    var scoreString: String {
        return String(format: "%d", Int(self.score * 100)) + "%"
    }
    
}
