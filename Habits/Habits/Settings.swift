//
//  Settings.swift
//  Habits
//
//  Created by map07 on 2023-03-20.
//

import Foundation

struct Settings {
    static var shared = Settings()
    static let favoriteHabits = "favoriteHabits"
    
    private let defaults = UserDefaults.standard
    
    private func archeiveJSON<T: Encodable>(value: T, key: String) {
        let data = try! JSONEncoder().encode(value)
        let string = String(data: data, encoding: .utf8)
        defaults.set(string, forKey: key)
    }
    
    private func unarchieveJSON<T: Decodable>(key: String) -> T? {
        guard let string = defaults.string(forKey: key),
              let data = string.data(using: .utf8) else {
            return nil
        }
        return try! JSONDecoder().decode(T.self, from: data)
    }
    
    var favoriteHabits: [Habit] {
        get {
            return unarchieveJSON(key: Settings.favoriteHabits) ?? []
        }
        set {
            archeiveJSON(value: newValue, key: Settings.favoriteHabits)
        }
    }
}


