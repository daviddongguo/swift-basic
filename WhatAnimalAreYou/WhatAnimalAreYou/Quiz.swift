//
//  Quiz.swift
//  WhatAnimalAreYou
//
//  Created by david on 2023-03-11.
//

import Foundation

class Answer {
    let personality: Personality
    let id: Int = 0
    let text: String? = nil
    init(personality: Personality) {
        self.personality = personality
    }
    func submit() -> Void {}
}


class AnswerTrueOfFalse: Answer {
    var animalLikehoods: [AnimalEnum] = []
    var selected: Bool = false
    override func submit() {
        if selected {
            self.personality.addLikehood(self.animalLikehoods)
        }
    }
    init(animalLikehoods: [AnimalEnum], selected: Bool = false) {
        self.animalLikehoods = animalLikehoods
        self.selected = selected
    }
    
}

class AnswerNumberValue: Answer {
    let numberValue: Int = 0
    let lionRange: ClosedRange<Int>
    let owlRange: ClosedRange<Int>
    let dophinRange: ClosedRange<Int>
    let butterflyRange: ClosedRange<Int>
    init(lionRange: ClosedRange<Int>, owlRange: ClosedRange<Int>, dophinRange: ClosedRange<Int>, butterflyRange: ClosedRange<Int>) {
        self.lionRange = lionRange
        self.owlRange = owlRange
        self.dophinRange = dophinRange
        self.butterflyRange = butterflyRange
    }
    override func submit() {
        switch self.numberValue {
        case lionRange:
            self.personality.addLikehood([.lion])
        default:
            break
        }
    }
    
}


struct Quiz {
    let personality: Personality
    let question: String
    let answers: Array<Answer>
}
