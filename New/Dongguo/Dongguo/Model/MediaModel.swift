//
//  MediaModel.swift
//  Dongguo
//
//  Created by david on 2023-03-22.
//

import Foundation

enum MediaTypeEnum: String, CaseIterable {
    case movies = "Movies"
    case music = "Music"
    case books = "Books"
    case none = "Not Known"
    
    var description: String {
            return self.rawValue
        }
}

struct Media: Comparable, Equatable {
    
    let id: Int = -1
    let name: String
    let imagePath: String
    let publicationYear: Int
    let type: MediaTypeEnum
    let author: String? = nil
    let director: String? = nil
    let singer: String? = nil
    let description: String? = nil
    let URL: String? = nil
    
    init(name: String, imagePath: String, publicationYear: Int, type: MediaTypeEnum? = nil ) {
        self.name = name
        self.imagePath = imagePath
        self.type = type ?? MediaTypeEnum.none
        self.publicationYear = publicationYear
    }
    
    static func < (lhs: Media, rhs: Media) -> Bool {
        return lhs.name < rhs.name
    }
    
    static func == (lhs: Media, rhs: Media) -> Bool {
        return lhs.name == rhs.name
    }
}


