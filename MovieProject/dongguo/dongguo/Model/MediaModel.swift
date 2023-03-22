//
//  MediaModel.swift
//  Dongguo
//
//  Created by david on 2023-03-22.
//

import Foundation

enum MediaTypeEnum: String {
    case movies = "Movies"
    case music = "Music"
    case books = "Books"
    case none = "Not Known"
}

struct Media: Comparable, Equatable {
    
    let id: Int = -1
    let name: String
    let imagePath: String
    let publicationYear: Int
    let type: MediaTypeEnum = MediaTypeEnum.none
    let author: Person?
    let director: Person?
    let singer: Person?
    let description: String?
    let URL: String?
    
    static func < (lhs: Media, rhs: Media) -> Bool {
        return lhs.name < rhs.name
    }
    
    static func == (lhs: Media, rhs: Media) -> Bool {
        return lhs.name == rhs.name
    }
}

struct Person {
    let id: Int = -1
    let name: String
}
//
//  MediaModel.swift
//  Dongguo
//
//  Created by david on 2023-03-22.
//

import Foundation
