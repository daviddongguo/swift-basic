//
//  Habit.swift
//  Habits
//
//  Created by map07 on 2023-03-20.
//

import Foundation

struct Habit: Hashable {
    func hash(into hasher: inout Hasher){
        hasher.combine(name)
    }
    
    static func == (lhs: Habit, rhs: Habit) -> Bool {
        return lhs.name == rhs.name
    }
    
    
    let name: String
    let category: Category
    let info: String
}

struct Category {
    let name: String
    let color: Color
}

extension Category: Hashable {
    static func == (lhs: Category, rhs: Category) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
}

struct Color {
    let hue: Double
    let saturation: Double
    let brightness: Double
}

extension Color: Codable {
    enum CodingKeys: String, CodingKey {
        case hue = "h"
        case saturation = "s"
        case brightness = "b"
    }
}

extension Category: Codable { }

extension Habit: Codable { }
