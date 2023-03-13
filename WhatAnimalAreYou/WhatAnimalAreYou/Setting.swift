//
//  Setting.swift
//  WhatAnimalAreYou
//
//  Created by david on 2023-03-12.
//

import UIKit

enum AnimalEnum: Int{
    case lion = 0
    case owl = 1
    case dolphin = 2
    case butterfly = 3
}

let animalImages: [UIImage?] = [
    UIImage(named: "lion.png"),
    UIImage(named: "owl.png"),
    UIImage(named: "dolphin.png"),
    UIImage(named: "butterfly.png")
]

enum TemperatureOfRiverEnum: String {
    case colder = "very cold"
    case cold = "cold"
    case normal = "normal"
    case warmer = "warmer"
}
