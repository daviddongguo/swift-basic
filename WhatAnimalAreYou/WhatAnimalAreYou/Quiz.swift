//
//  Quiz.swift
//  WhatAnimalAreYou
//
//  Created by david on 2023-03-11.
//

import Foundation
protocol AddLikehoodable {
    func addLikehood(animals: AnimalEnum...)
}

struct Answer1: AddLikehoodable {
    let personality: Personality
    let id: Int
    let text: String?
    func addLikehood(animals: AnimalEnum...){
        self.personality.addLikehood(animals)
    }
}

struct Answer2: AddLikehoodable {
    let personality: Personality
    let id: Int
    let text: String?
    let numberVAlue: Int = 0
    func addLikehood(animals: AnimalEnum...){
        switch numberVAlue {
        case 0..<25:
            self.personality.addLikehood([AnimalEnum.lion])
        case 25..<50:
            self.personality.addLikehood([AnimalEnum.owl])
        default:
            break
        }
    }
}


struct Quiz {
    let personality: Personality
    let question: String
    let answers: Array<AddLikehoodable>
}
