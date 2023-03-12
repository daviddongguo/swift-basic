//
//  Personality.swift
//  WhatAnimalAreYou
//
//  Created by david on 2023-03-11.
//

import Foundation
enum AnimalEnum {
    case lion
    case owl
    case dolphin
    case butterfly
}

class Personality {
    var lionLikelihood: Int = 0
    var owlLikelihood: Int = 0
    var dolphinLikelihood: Int = 0
    var butterflyLikelihood: Int = 0
    
    var like: AnimalEnum {
        var highestLikelihood = lionLikelihood
        var animal = AnimalEnum.lion
        
        if owlLikelihood > highestLikelihood {
            highestLikelihood = owlLikelihood
            animal = .owl
        }
        
        if dolphinLikelihood > highestLikelihood {
            highestLikelihood = dolphinLikelihood
            animal = .dolphin
        }
        
        if butterflyLikelihood > highestLikelihood {
            highestLikelihood = butterflyLikelihood
            animal = .butterfly
        }
        
        return animal
    }
    
    func addLikehood(_ animals: [AnimalEnum]) {
 
        for animal in animals {
            switch animal {
            case .lion:
                self.lionLikelihood += 10
            case .owl:
                self.owlLikelihood += 10
            case .dolphin:
                self.dolphinLikelihood += 10
            case .butterfly:
                self.butterflyLikelihood += 10
            }
        }
       
    }

}
