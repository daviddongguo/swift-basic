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
        Media(name: "01 book", imagePath: "00.jpeg", publicationYear: 2022, type: .books, description: "the firest book"),
        Media(name: "02 book", imagePath: "00.jpeg", publicationYear: 2022, type: .books, description: "He is too lazy to leave anything"),
        Media(name: "03 book", imagePath: "00.jpeg", publicationYear: 2022, type: .books, description: "He is too lazy to leave anything"),
        Media(name: "04 book", imagePath: "00.jpeg", publicationYear: 2022, type: .books, description: "He is too lazy to leave anything"),
        Media(name: "01 movie", imagePath: "00.jpeg", publicationYear: 2022, type: .movies, description: "the firest move"),
        Media(name: "02 movie", imagePath: "00.jpeg", publicationYear: 2022, type: .movies, description: "He is too lazy to leave anything"),
        Media(name: "03 movie", imagePath: "00.jpeg", publicationYear: 2022, type: .movies, description: "He is too lazy to leave anything"),
        Media(name: "04 movie", imagePath: "00.jpeg", publicationYear: 2022, type: .movies, description: "He is too lazy to leave anything"),
        Media(name: "01 music", imagePath: "00.jpeg", publicationYear: 2022, type: .music, description: "He is too lazy to leave anything"),
        Media(name: "02 music", imagePath: "00.jpeg", publicationYear: 2022, type: .music)
    )
    return manager.list
}


