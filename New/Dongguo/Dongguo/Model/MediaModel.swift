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



class MediaManager {
    var list: [Media] = []
    
    var count: Int{
        return list.count
    }
    func AddEdit(_ medias: Media...) -> Void {
        for media in medias{
            if media.id == -1 {
                list.append(Media(id: self.count + 1, name: media.name, imagePath: media.imagePath, publicationYear: media.publicationYear, type: media.type, description: media.description))
            }else{
                for i in 0..<list.count {
                    if(list[i].id == media.id) {
                        list[i] = media
                    }
                }
            }
        }
    }
}

struct Media: Comparable, Equatable {
    
    let id: Int
    let name: String
    let imagePath: String
    let publicationYear: Int
    let type: MediaTypeEnum
    let description: String
    let author: String? = nil
    let director: String? = nil
    let singer: String? = nil
    let URL: String? = nil
    
    init(id: Int, name: String, imagePath: String, publicationYear: Int, type: MediaTypeEnum? = nil, description: String = "") {
        self.id = id
        self.name = name
        self.imagePath = imagePath
        self.type = type ?? MediaTypeEnum.none
        self.publicationYear = publicationYear
        self.description = description
    }
    
    init(name: String, imagePath: String, publicationYear: Int, type: MediaTypeEnum? = nil, description: String = "") {
        self.id = -1
        self.name = name
        self.imagePath = imagePath
        self.type = type ?? MediaTypeEnum.none
        self.publicationYear = publicationYear
        self.description = description
    }
    
    static func < (lhs: Media, rhs: Media) -> Bool {
        return lhs.name < rhs.name
    }
    
    static func == (lhs: Media, rhs: Media) -> Bool {
        return lhs.name == rhs.name
    }
}


