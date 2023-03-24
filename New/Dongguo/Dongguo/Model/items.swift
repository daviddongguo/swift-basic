//
//  items.swift
//  Dongguo
//
//  Created by david on 2023-03-24.
//

import Foundation

let itemManage = MediaManager()

var items = initList(itemManage)

fileprivate func initList(_ manager: MediaManager) -> [Media] {
    manager.AddEdit(
        Media(name: "01 book", imagePath: "00.jpeg", publicationYear: 2022, type: .books),
        Media(name: "02 book", imagePath: "00.jpeg", publicationYear: 2022, type: .books),
        Media(name: "03 book", imagePath: "00.jpeg", publicationYear: 2022, type: .books),
        Media(name: "04 book", imagePath: "00.jpeg", publicationYear: 2022, type: .books),
        Media(name: "01 movie", imagePath: "00.jpeg", publicationYear: 2022, type: .movies),
        Media(name: "02 movie", imagePath: "00.jpeg", publicationYear: 2022, type: .movies),
        Media(name: "03 movie", imagePath: "00.jpeg", publicationYear: 2022, type: .movies),
        Media(name: "04 movie", imagePath: "00.jpeg", publicationYear: 2022, type: .movies),
        Media(name: "01 music", imagePath: "00.jpeg", publicationYear: 2022, type: .music),
        Media(name: "02 music", imagePath: "00.jpeg", publicationYear: 2022, type: .music)
    )
    return manager.list
}


