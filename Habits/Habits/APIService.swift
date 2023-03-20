//
//  APIService.swift
//  Habits
//
//  Created by map07 on 2023-03-20.
//

import Foundation

struct HabitRequest: APIRequest {
    typealias Response = [String: Habit]
    
    var habitName: String?
    
    var path: String { "/habits" }
}


