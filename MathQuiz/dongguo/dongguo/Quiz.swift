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
    let answer: String?
    var userAnswer: String? = nil
    let difficulty: Int
    
    
    init(id: Int, title: String, answer: String? = nil, difficulty: Int =  1) {
        self.id = id
        self.title = title
        self.answer = answer
        self.difficulty = difficulty
    }
    
    @available(*, unavailable, message: "Subclasses must override this method")
    func IsRightAnswer() -> Bool {
        return false
    }
   
    var description: String {
        return self.title
    }
}

class MathQuiz : Quiz{
    let leftOperand: Int
    let rightOperand: Int
    let operation: OperationEnum
    
    func enterUserAnswer(_ userAnswer: String) -> Void {
        self.userAnswer = userAnswer
    }

    func IsRightAnswer() -> Bool {
        return self.IsRightAnswer(self.userAnswer)
    }
    
    func IsRightAnswer(_ userAnswer: String? ) -> Bool {
        guard let answer = Double(self.answer ?? "not a double string"),
              let userAnswer = Double(userAnswer ?? "not a double string") else {
            return false
        }
        return abs(userAnswer - answer) < Pricese_Value
    }
    
    init(id: Int, leftOperand: Int, rightOperand: Int, operation: OperationEnum, difficulty: Int =  1) {
        self.leftOperand = leftOperand
        self.rightOperand = rightOperand
        self.operation = operation
        let title = String(format: "%d %@ %@", self.leftOperand, self.operation.rawValue, self.rightOperand < 0 && self.operation == .subtraction ? "(\(self.rightOperand))" : "\(self.rightOperand)")
        let answer = String(format: "%.2f", self.operation.apply(Double(self.leftOperand), Double(self.rightOperand)))
        super.init(id: id, title: title, answer: answer, difficulty: difficulty)
    }
}

class RandomMathQuiz : MathQuiz{
    
    private static let operations: [OperationEnum] = [.addition, .subtraction, .multiplication, .division]
    
    init(id: Int, difficulty: Int = 1){
        let leftOperand = Int.random(in: -difficulty...difficulty)
        let operation = RandomMathQuiz.operations.randomElement()!
        let intArray = (-difficulty...difficulty).filter { operation != .division || $0 != 0 }
        let rightOperand = intArray.randomElement()!
        
        super.init(id: id, leftOperand: leftOperand,  rightOperand: rightOperand,  operation: operation, difficulty: difficulty)
    }
    
    override var description: String {
        return super.description + " =  \(self.userAnswer ?? "?")"
    }
}



struct MathQuizServer {
    var userName: String?
    var difficulty: Int!
    var quizs: [MathQuiz] = []
    
    init(difficulty: Int? = nil){
        self.difficulty = difficulty ?? 1
    }
    
    mutating func updateDifficulty(_ difficulty: Int){
        self.difficulty = difficulty
    }

    mutating func addQuiz(_ quiz: MathQuiz) -> Void{
        self.quizs.append(quiz)
        if let q = quizs.last {
            print("\(q.id) : \(q.description); ")
        }
        
        
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
            if quiz.IsRightAnswer() {
                numberOfRight += 1
            }
        }
        
        return Double(numberOfRight) / Double(quizs.count)
    }
    
    var scoreString: String {
        return String(format: "%d", Int(self.score * 100)) + "%"
    }
    
    var deguInfo: String {
        var str = ""
        for quiz in self.quizs {
            str += "\(quiz.description) answer: \(quiz.answer ?? "?"), userAnswer: \(quiz.userAnswer ?? "?") , isRight: \(quiz.IsRightAnswer()), difficulty: \(quiz.difficulty)" + "\n"
        }
        return str
    }
    
}
